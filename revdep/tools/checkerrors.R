# Set Job ID here:
id <- "revdepcheck::cloud_check()"

# or see id in utils.R

cloud_res <- revdepcheck::cloud_results(id)
saveRDS(cloud_res, "revdep/tools/cloud-res.rds")

revdepcheck::cloud_summary(id)
revdepcheck::cloud_report(id, results = cloud_res)

# Save file for run
folder <- glue::glue("revdep/{id}")
fs::dir_create(folder)
fs::file_copy(c("revdep/cran.md", "revdep/failures.md", "revdep/problems.md", "revdep/README.md"), folder)


# Install log -------------------------------------------------------------

files <- fs::dir_ls(glue::glue("revdep/cloud/{id}/"), glob = "*/dependency_install.log", recurse = TRUE)
files <- purrr::set_names(files, nm = basename(dirname(files)))

# Error 500
res <- purrr::map(files, ~ {
  content <- xfun::read_utf8(.x)
  error <- grep("ERROR 50\\d", content, value = TRUE)
  gsub("^.*(ERROR 50\\d.*)$", "\\1", error)
})

length(res)
res_issue <- purrr::compact(res)
if (length(res_issue)) range(purrr::map_int(res_issue, length))

# After retries - Download errors
res <- purrr::map(files, ~ {
  content <- xfun::read_utf8(.x)
  error <- grep("'wget' call had nonzero exit status", content, value = TRUE)
  stringr::str_trim(error)
})

length(res)
res_issue <- purrr::compact(res)
if (length(res_issue)) range(purrr::map_int(res_issue, length))
names(res_issue)

# Install Error - due to BIOC probably

pb <- cli::cli_progress_bar("Parsed files", total = length(files))
res <- purrr::map(files, ~ {
  cli::cli_progress_update(id = pb)
  content <- xfun::read_utf8(.x)
  error <- grep("ERROR: dependency .* is not available for package .*", content, value = TRUE)
  stringr::str_trim(error)
})

library(dplyr)

not_available <- tibble::enframe(purrr::compact(res))
not_available |> pull(name) |> sort() |> xfun::raw_string()

pb <- cli::cli_progress_bar("Parsed files", total = length(files))
res <- purrr::map(files, ~ {
  cli::cli_progress_update(id = pb)
  content <- xfun::read_utf8(.x)
  error <- grep("packages .* are not available for this version of R", content, value = TRUE)
  stringr::str_trim(error)
})

not_available2 <- tibble::enframe(purrr::compact(res))
not_available2 |> pull(name) |> sort() |> xfun::raw_string()


# Check log ---------------------------------------------------------------

# Save file for run
files <- fs::dir_ls(glue::glue("revdep/cloud/{id}/"), glob = "*/00check.log", recurse = TRUE)

pb <- cli::cli_progress_bar("Parsed files", total = length(files))
res <- purrr::map_lgl(files, ~ {
  cli::cli_progress_update(id = pb)
  content <- xfun::read_utf8(.x)
  error <- any(grepl("checking re-building of vignette outputs .* WARNING", content))
  error
})


tab <- tibble::tibble(
  package = purrr::map_chr(fs::path_split(files), 4),
  version = purrr::map_chr(fs::path_split(files), 5),
  file = files,
  vignette_error = res
)

tab %>%
  group_by(package, version) %>%
  summarise(sum_error = sum(vignette_error), .groups = "drop") %>%
  filter(sum_error > 0) %>%
  tidyr::pivot_wider(names_from = version, values_from = sum_error) %>%
  filter(new != old)

