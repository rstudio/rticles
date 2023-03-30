test_format <- function(name, output_options = NULL, skip = NULL) {

  # don't run on CRAN due to complicated dependencies (Pandoc/LaTeX packages)
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) return()
  # skip if requested
  if (!is.null(skip) && isTRUE(skip)) return()

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  oldwd <- setwd(dir)
  on.exit(setwd(oldwd), add = TRUE)

  # create a draft of the format
  testdoc <- paste0(name, "_article", ".Rmd")
  rmarkdown::draft(
    testdoc, pkg_file_template(name),
    create_dir = FALSE, edit = FALSE
  )

  message(
    "Rendering the ", name, " format...",
    if (!is.null(output_options)) " (with output options)"
  )
  output_file <- rmarkdown::render(testdoc, output_options = output_options, quiet = TRUE)
  assert(paste(name, "format works"), {
    file.exists(output_file)
  })
}

#--- NOTE to contributors ------------------------------------------------------
# Please order these tests by formats alphabetically.
#-------------------------------------------------------------------------------

test_format("acm")
test_format("acs")
test_format("aea")
test_format("agu")
test_format("ajs", skip = !rmarkdown::pandoc_available("2.7"))
test_format("amq")
test_format("ams")
test_format("arxiv")
test_format("asa")
test_format("bioinformatics")
test_format("biometrics")
test_format("copernicus")
test_format("ctex", skip = !xfun::is_linux()) # only on linux due to fonts requirements
test_format("elsevier", skip = !rmarkdown::pandoc_available("2.10"))
test_format("frontiers")
test_format("glossa")
test_format("ieee")
test_format("ims")
test_format("ims", output_options = list(journal = "aap"))
test_format("informs", skip = !rmarkdown::pandoc_available("2.10"))
test_format("isba", skip = !rmarkdown::pandoc_available("2.10"))
test_format("iop")
test_format("jasa")
test_format("joss")
test_format("joss", output_options = list(journal = "JOSE"))
test_format("jss", skip = !rmarkdown::pandoc_available("2.7"))
test_format("lncs")
test_format("lncs", output_options = list(citation_package = "natbib"))
test_format("lipics")
test_format("mdpi")
test_format("mnras")
test_format("oup_v0")
test_format("oup_v1", skip = !rmarkdown::pandoc_available("2.10"))
test_format("peerj")
test_format("pihph")
test_format("plos")
test_format("pnas")
test_format("rjournal")
test_format("rsos")
test_format("rss")
test_format("sage")
test_format("sim")
test_format("springer")
test_format("tf")
test_format("trb")
# Deactivate because of https://github.com/rstudio/rticles/issues/523
# test_format("wellcomeor")
