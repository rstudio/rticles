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
  testdoc <- paste0(name,"_article",".Rmd")
  rmarkdown::draft(
    testdoc, pkg_file("rmarkdown", "templates", name),
    create_dir = FALSE, edit = FALSE
  )

  message('Rendering the ', name, ' format...')
  output_file <- rmarkdown::render(testdoc, quiet = TRUE)
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
test_format("amq")
test_format("ams")
test_format("arxiv")
test_format("asa")
test_format("bioinformatics")
test_format("biometrics")
test_format("copernicus")
if (xfun::is_linux()) test_format("ctex") # only on linux due to fonts requirements
test_format("elsevier")
test_format("frontiers")
test_format("ieee")
test_format("joss")
test_format("jss")
test_format("lipics")
test_format("mdpi")
test_format("mnras")
test_format("oup")
test_format("peerj")
test_format("plos")
test_format("pnas")
test_format("rjournal")
test_format("rsos")
test_format("rss")
test_format("sage")
test_format("sim")
test_format("springer")
test_format("tf")
