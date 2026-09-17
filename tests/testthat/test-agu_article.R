agu_pre_processor_args <- function(format, input_file) {
  format$pre_processor(
    metadata = list(),
    input_file = input_file,
    runtime = "static",
    knit_meta = list(),
    files_dir = NULL,
    output_dir = dirname(input_file)
  )
}

test_that("agu_article() keeps its citation default", {
  expect_identical(formals(agu_article)$citation_package, "natbib")
})

test_that("agu_article() warns once for a legacy local class", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_agu_2018 = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "agujournal2018.cls"))
  format <- agu_article()

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
})

test_that("agu_article() does not warn without an ambiguous legacy class", {
  skip_if_not_pandoc("2.8")
  article_dir <- withr::local_tempdir()
  format <- agu_article()

  expect_no_warning(
    args <- agu_pre_processor_args(
      format,
      file.path(article_dir, "article.Rmd")
    )
  )
  expect_true("rticles-agu-2019" %in% args)

  xfun::write_utf8("", file.path(article_dir, "agujournal2019.cls"))
  expect_no_warning(
    args <- agu_pre_processor_args(
      format,
      file.path(article_dir, "article.Rmd")
    )
  )
  expect_true("rticles-agu-2019" %in% args)
})

test_that("AGU template selects and configures classes conditionally", {
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
  expect_match(template, "PassOptionsToPackage\\{natbibapa\\}\\{apacite\\}")
  expect_match(template, "usepackage\\[inline\\]\\{trackchanges\\}")
  expect_match(template, "def\\\\agu@@@cite.*\\\\citep", perl = TRUE)
  expect_match(template, "def\\\\agu@@@citeA.*\\\\citet", perl = TRUE)
  expect_match(
    template,
    "\\$if\\(natbib\\)\\$\\$if\\(bibliography\\)\\$"
  )
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
