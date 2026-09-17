agu_pre_processor_args <- function(format, input_file, metadata = list()) {
  format$pre_processor(
    metadata = metadata,
    input_file = input_file,
    runtime = "static",
    knit_meta = list(),
    files_dir = NULL,
    output_dir = dirname(input_file)
  )
}

test_that("agu_article() uses citeproc by default", {
  expect_identical(formals(agu_article)$citation_package, "default")
})

test_that("agu_article() supports natbib with a legacy local class", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_agu_2018 = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "agujournal2018.cls"))
  format <- agu_article(citation_package = "natbib")

  expect_warning(
    args <- agu_pre_processor_args(
      format,
      file.path(article_dir, "article.Rmd")
    ),
    regexp = "agujournal2018[.]cls.*backward compatibility"
  )
  expect_no_warning(
    agu_pre_processor_args(format, file.path(article_dir, "article.Rmd"))
  )
  expect_false("rticles-agu-2019" %in% args)
  expect_false("--csl" %in% args)
})

test_that("agu_article() warns once for citeproc with a legacy class", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_agu_2018_citations = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "agujournal2018.cls"))
  format <- agu_article()

  expect_warning(
    args <- agu_pre_processor_args(
      format,
      file.path(article_dir, "article.Rmd")
    ),
    regexp = "agujournal2018[.]cls.*expects.*natbib.*default.*unsupported"
  )
  expect_no_warning(
    agu_pre_processor_args(format, file.path(article_dir, "article.Rmd"))
  )
  expect_false("rticles-agu-2019" %in% args)
  expect_true("--csl" %in% args)
})

test_that("agu_article() warns once for natbib with the current class", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_agu_2019_citations = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "agujournal2019.cls"))
  format <- agu_article(citation_package = "natbib")

  expect_warning(
    args <- agu_pre_processor_args(
      format,
      file.path(article_dir, "article.Rmd")
    ),
    regexp = "2019 AGU class.*default.*natbib.*unsupported"
  )
  expect_no_warning(
    agu_pre_processor_args(format, file.path(article_dir, "article.Rmd"))
  )
  expect_true("rticles-agu-2019" %in% args)
  expect_false("--csl" %in% args)
})

test_that("agu_article() selects the current class when both are present", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_agu_both_classes = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "agujournal2018.cls"))
  xfun::write_utf8("", file.path(article_dir, "agujournal2019.cls"))
  format <- agu_article()

  expect_warning(
    args <- agu_pre_processor_args(
      format,
      file.path(article_dir, "article.Rmd")
    ),
    regexp = "both.*will use 'agujournal2019[.]cls'.*remove"
  )
  expect_no_warning(
    agu_pre_processor_args(format, file.path(article_dir, "article.Rmd"))
  )
  expect_true("rticles-agu-2019" %in% args)
  expect_true("--csl" %in% args)
})

test_that("agu_article() supplies the AGU CSL unless metadata overrides it", {
  skip_if_not_pandoc("2.8")
  article_dir <- withr::local_tempdir()
  input <- file.path(article_dir, "article.Rmd")
  format <- agu_article()

  expect_no_warning(args <- agu_pre_processor_args(format, input))
  csl_arg <- match("--csl", args)
  expect_false(is.na(csl_arg))
  expect_match(args[csl_arg + 1], "american-geophysical-union[.]csl$")

  expect_no_warning(
    args <- agu_pre_processor_args(
      format,
      input,
      metadata = list(csl = "custom.csl")
    )
  )
  expect_false("--csl" %in% args)
})

test_that("AGU template selects classes without a natbib bridge", {
  template <- xfun::read_utf8(find_resource("agu"))
  template <- paste(template, collapse = "\n")

  expect_match(
    template,
    "(?s)\\$if\\(rticles-agu-2019\\)\\$.*agujournal2019.*\\$else\\$.*agujournal2018.*\\$endif\\$",
    perl = TRUE
  )
  expect_no_match(
    template,
    "\\\\IfFileExists\\{agujournal2019[.]cls\\}|agujournalTwentyNineteen"
  )
  expect_no_match(template, "PassOptionsToPackage\\{natbibapa\\}\\{apacite\\}")
  expect_no_match(template, "agu@@@cite|agu@@@citeA")
  expect_match(template, "usepackage\\[inline\\]\\{trackchanges\\}")
  expect_match(template, "\\$if\\(natbib\\)\\$\\$if\\(bibliography\\)\\$")
})

test_that("AGU citeproc style is bundled", {
  csl <- xfun::read_utf8(
    pkg_file_template("agu", "skeleton", "american-geophysical-union.csl")
  )
  csl <- paste(csl, collapse = "\n")

  expect_match(csl, "<title>American Geophysical Union</title>", fixed = TRUE)
  expect_match(csl, "citation-format=\"author-date\"", fixed = TRUE)
  expect_match(csl, "creativecommons.org/licenses/by-sa/3.0", fixed = TRUE)
})

test_that("vendored AGU class is official 2019 with the table guard", {
  class <- xfun::read_utf8(
    pkg_file_template("agu", "skeleton", "agujournal2019.cls")
  )
  class <- paste(class, collapse = "\n")

  expect_match(class, "\\\\def\\\\currversion\\{April 16, 2019\\}")
  expect_match(class, "\\\\ProvidesClass\\{agujournal2019\\}")
  expect_match(
    class,
    "\\\\ifdefined\\\\vcenter@text\\\\vcenter@text\\\\else\\\\vcenter\\\\fi"
  )
  expect_no_match(class, "agujournal2018")
})
