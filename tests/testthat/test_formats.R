
context("Formats")

test_format <- function(name, file_check = TRUE, os_skip = NULL) {

  test_that(paste(name, "format"), {

    # don't run on cran because pandoc is required
    skip_on_cran()

    # skip on os if requested
    if (!is.null(os_skip))
      skip_on_os(os_skip)

    # work in a temp directory
    dir <- tempfile()
    dir.create(dir)
    oldwd <- setwd(dir)
    on.exit(setwd(oldwd), add = TRUE)

    # create a draft of the format
    testdoc <- "testdoc.Rmd"
    rmarkdown::draft(testdoc,
                     system.file("rmarkdown", "templates", name,
                                 package = "rticles"),
                     create_dir = FALSE,
                     edit = FALSE)

    # render it
    capture.output({
      if (file_check) {
        output_file <- tempfile(fileext = ".pdf")
        rmarkdown::render(testdoc, output_file = output_file)
        expect_true(file.exists(output_file))
      } else {
        rmarkdown::render(testdoc)
      }
    })
  })
}

test_format("acm_article")
test_format("elsevier_article")
test_format("jss_article")
test_format("rjournal_article", file_check = FALSE)
test_format("acs_article", os_skip = "windows")





