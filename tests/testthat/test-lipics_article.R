test_that("lipics_article() warns once for a legacy local class", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_lipics_v2019 = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "lipics-v2019.cls"))
  format <- lipics_article()

  expect_warning(
    format$pre_knit(
      input = file.path(article_dir, "article.Rmd"),
      metadata = list()
    ),
    regexp = "lipics-v2019[.]cls.*backward compatibility"
  )
  expect_no_warning(
    format$pre_knit(
      input = file.path(article_dir, "article.Rmd"),
      metadata = list()
    )
  )
})

test_that("lipics_article() proposes removing the unused legacy class once", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_lipics_both_classes = NULL)
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "lipics-v2019.cls"))
  xfun::write_utf8("", file.path(article_dir, "lipics-v2021.cls"))
  format <- lipics_article()

  expect_warning(
    format$pre_knit(
      input = file.path(article_dir, "article.Rmd"),
      metadata = list()
    ),
    regexp = "both.*will use 'lipics-v2021[.]cls'.*remove"
  )
  expect_no_warning(
    format$pre_knit(
      input = file.path(article_dir, "article.Rmd"),
      metadata = list()
    )
  )
})

test_that("lipics_article() does not warn for only the current class", {
  skip_if_not_pandoc("2.8")
  article_dir <- withr::local_tempdir()
  xfun::write_utf8("", file.path(article_dir, "lipics-v2021.cls"))
  format <- lipics_article()

  expect_no_warning(
    format$pre_knit(
      input = file.path(article_dir, "article.Rmd"),
      metadata = list()
    )
  )
})

test_that("lipics_article() does not warn when no local class is present", {
  skip_if_not_pandoc("2.8")
  article_dir <- withr::local_tempdir()
  format <- lipics_article()

  expect_no_warning(
    format$pre_knit(
      input = file.path(article_dir, "article.Rmd"),
      metadata = list()
    )
  )
})

test_that("rmarkdown::render() emits the legacy LIPIcs class warning", {
  skip_if_not_pandoc("2.8")
  withr::local_options(rticles.warn_lipics_v2019 = NULL)
  article_dir <- withr::local_tempdir()
  rmd <- file.path(article_dir, "article.Rmd")
  xfun::write_utf8(
    c(
      "---",
      "title: Legacy LIPIcs draft",
      "output: rticles::lipics_article",
      "---",
      "",
      "Body."
    ),
    rmd
  )
  xfun::write_utf8("", file.path(article_dir, "lipics-v2019.cls"))

  expect_warning(
    rmarkdown::render(rmd, quiet = TRUE, run_pandoc = FALSE),
    regexp = "lipics-v2019[.]cls.*backward compatibility"
  )
})
