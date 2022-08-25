library(httr)

# Setup
cloud_url <- Sys.getenv("RSTUDIO_CLOUD_REVDEP_URL")
id <- "6f2ebcbb-1d90-47a9-a3ad-8dad0ccaa027"
cloud_url <- modify_url(cloud_url, path = glue::glue("staging/check/{id}"))
auth_header <- add_headers('x-api-key' = Sys.getenv("RSTUDIO_CLOUD_REVDEP_KEY"))

# Get time ----------------------------------------------------------------
res <- GET(cloud_url, auth_header)
res <- content(res, as = "text")
jqr::jq(res, ".r_version")
res_time <- jqr::jq(res, '. | with_entries(select(.key | endswith("stamp")))')
res_time <- jsonlite::parse_json(res_time)

library(lubridate)
# run duration
as.period(ymd_hms(res_time$finished_timestamp) - ymd_hms(res_time$started_timestamp))

# Total duration
as.period(ymd_hms(res_time$finished_timestamp) - ymd_hms(res_time$created_timestamp))

# Get packages in Job status

res <- GET(glue::glue("{cloud_url}/status"), auth_header)
res <- content(res, as = "text")
jqr::jq(res)

res <- GET(glue::glue("{cloud_url}/status/SUCCEEDED"), auth_header)
res <- content(res, as = "text")
res <- jqr::jq(res, '.packages')
res

res <- GET(glue::glue("{cloud_url}/status/FAILED"), auth_header)
res <- content(res, as = "text")
res <- jqr::jq(res, '.packages')
pkgs_failed <- jsonlite::parse_json(res, simplifyVector = TRUE)
pkgs_failed

dput(pkgs_failed)

saveRDS(pkgs_failed, "revdep/tools/pkgs-failed.Rds")

reasons <- purrr::map(purrr::set_names(pkgs_failed), ~ {
  res <- GET(glue::glue("{cloud_url}/packages/{.x}"), auth_header)
  res <- content(res, as = "text")
  res <- jqr::jq(res, ".attempts[].statusReason")
  jsonlite::stream_in(textConnection(res))
})


print(tidyr::unnest_auto(tibble::enframe(purrr::map(reasons, "out")), "value"), n = Inf)

library(dplyr)

tibble::enframe(purrr::simplify(reasons)) %>%
  mutate(value = gsub("(Host EC2).*( terminated)", "\\1\\2", value)) %>%
  count(value)

# List revdeps -----------------------------------------------------

res <- GET(glue::glue("{cloud_url}/packages"), auth_header)
res <- content(res, as = "text")
res <- jqr::jq(res, ".revdep_packages")
revdep_pkg <- jsonlite::fromJSON(res)

# Result of a package -----------------------------------------------------

pkg <- pkgs_failed[1]
pkg <- "CausalImpact"
res <- GET(glue::glue("{cloud_url}/packages/{pkg}"), auth_header)
res <- content(res, as = "text")
jqr::jq(res, ".container.reason") # Out Of Memory issue ?
res <- jqr::jq(res)
res

## Status log of all packages
pb <- cli::cli_progress_bar("Retrieving", total = length(revdep_pkg))
res <- purrr::map(purrr::set_names(revdep_pkg), ~ {
  pkg <- .x
  cli::cli_progress_update(id = pb)
  res <- GET(glue::glue("{cloud_url}/packages/{pkg}"), auth_header)
  res <- content(res, as = "text", encoding = "UTF-8")
  jqr::jq(res, ".container.reason")
})

res2 <- purrr::map(res, jsonlite::fromJSON)
OOM_pkg <- tibble::enframe(purrr::simplify(purrr::compact(res2)))

setdiff(pkgs_failed, OOM_pkg$name)
intersect(pkgs_failed, OOM_pkg$name)
# Download ----------------------------------------------------------------
out  <- paste0(pkg, ".tar.gz")
res <- GET(glue::glue("{cloud_url}/packages/{pkg}/results.tar.gz"), auth_header, write_disk(out))
archive::archive(out)
res <- jqr::jq(res)

# Build report ------------------------------------------------------------
rmarkdown::render("revdep/failures.md", rmarkdown::html_document(toc = TRUE, toc_depth = 1, toc_float = TRUE))

