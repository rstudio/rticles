test_format <- function(name, os_skip = NULL) {

  # don't run on CRAN due to complicated dependencies (Pandoc/LaTeX packages)
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) return()
  # skip on OS if requested
  if (!is.null(os_skip)) return()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  # create a draft of the format
  testdoc <- paste0(name, ".Rmd")
  rmarkdown::draft(
    testdoc, system.file("rmarkdown", "templates", name, package = "rticles"),
    create_dir = FALSE, edit = FALSE
  )

  message('Rendering the ', name, ' format...')
  output_file <- rmarkdown::render(testdoc, quiet = TRUE)
  assert(paste(name, "format works"), {
    file.exists(output_file)
  })
}

test_format("acm_article")
test_format("acs_article")
test_format("aea_article")
test_format("ams_article")
test_format("asa_article")
test_format("biometrics_article")
test_format("elsevier_article")
test_format("jss_article")
test_format("rss_article")
test_format("pnas_article")
test_format("ieee_article")
test_format("rjournal_article")
test_format("sage_article")
test_format("sim_article")
test_format("peerj_article")
test_format("plos_article")
test_format("amq_article")
test_format("mdpi_article")
test_format("mnras_article")
test_format("copernicus_article")
