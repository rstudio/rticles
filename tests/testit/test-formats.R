test_format <- function(
  name,
  output_options = NULL,
  skip = NULL,
  transform = NULL
) {
  withr::local_options(lifecycle_verbosity = "quiet")

  # don't run on CRAN due to complicated dependencies (Pandoc/LaTeX packages)
  if (!identical(Sys.getenv("NOT_CRAN"), "true")) {
    return()
  }
  # skip if requested
  if (!is.null(skip) && isTRUE(skip)) {
    return()
  }

  # work in a temp directory
  dir <- tempfile()
  dir.create(dir)
  withr::local_dir(dir)

  # create a draft of the format
  testdoc <- paste0(name, "_article", ".Rmd")
  rmarkdown::draft(
    testdoc,
    pkg_file_template(name),
    create_dir = FALSE,
    edit = FALSE
  )
  if (is.function(transform)) {
    transform(testdoc)
  }

  message(
    "Rendering the ",
    name,
    " format...",
    if (!is.null(output_options)) " (with output options)"
  )
  output_file <- rmarkdown::render(
    testdoc,
    output_options = output_options,
    quiet = !interactive()
  )
  assert(paste(name, "format works"), {
    file.exists(output_file)
  })
}

prepare_lipics_restatement <- function(path) {
  rmd <- xfun::read_utf8(path)
  option <- grepl("^thm-restate: false", rmd)
  stopifnot(sum(option) == 1)
  rmd[option] <- "thm-restate: true # legacy metadata"
  xfun::write_utf8(
    c(
      rmd,
      "",
      "\\begin{restatable}{theorem}{legacytheorem}",
      "This theorem can be restated.",
      "\\end{restatable}",
      "",
      "\\legacytheorem*"
    ),
    path
  )
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
test_format("ams", skip = !rmarkdown::pandoc_available("2.10"))
test_format("arxiv")
test_format("asa")
test_format("bioinformatics")
test_format("biometrics")
test_format("copernicus")
test_format("ctex", skip = !xfun::is_linux()) # only on linux due to fonts requirements
test_format("elsevier", skip = !rmarkdown::pandoc_available("2.10"))
test_format("frontiers")
test_format(
  "frontiers",
  output_options = list(citation_package = "default"),
  skip = rmarkdown::pandoc_available("3.1.7")
)
test_format("glossa")
test_format("ieee")
test_format("ims")
test_format("ims", output_options = list(journal = "aap"))
test_format("informs", skip = !rmarkdown::pandoc_available("2.10"))
test_format("isba", skip = !rmarkdown::pandoc_available("2.10"))
test_format("iop")
test_format("jasa")
test_format("jedm")
test_format("joss")
test_format("joss", output_options = list(journal = "JOSE"))
test_format("jss", skip = !rmarkdown::pandoc_available("2.7"))
test_format("lncs")
test_format("lncs", output_options = list(citation_package = "natbib"))
test_format("lipics")
test_format("lipics", transform = prepare_lipics_restatement)
test_format("mdpi")
test_format("mnras")
test_format("oup_v0")
test_format("oup_v1", skip = !rmarkdown::pandoc_available("2.10"))
test_format("peerj")
test_format("pihph")
test_format("plos")
test_format("pnas")
test_format("rsos")
test_format("rss")
test_format("sage")
test_format("sim")
test_format("springer", skip = !rmarkdown::pandoc_available("2.11.4"))
test_format("tf", output_options = list(reference_style = "CAD"))
test_format("tf", output_options = list(reference_style = "APA"))
test_format("tf", output_options = list(reference_style = "NLM"))
test_format("tf", output_options = list(reference_style = "TFP"))
test_format("tf", output_options = list(reference_style = "TFQ"))
test_format("tf", output_options = list(reference_style = "TFS"))
test_format("trb")
test_format("wellcomeor")
