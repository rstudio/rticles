test_that("oup_article(oup_version = 1) warns when `authormark` is set in YAML", {
  skip_if_not_pandoc("2.10")
  fmt <- oup_article(oup_version = 1)
  expect_warning(
    fmt$pre_knit(input = "", metadata = list(authormark = "Anonymous et al.")),
    regexp = "authormark"
  )
})

test_that("oup_article(oup_version = 1) does not warn for unrelated metadata", {
  skip_if_not_pandoc("2.10")
  fmt <- oup_article(oup_version = 1)
  expect_no_warning(
    fmt$pre_knit(input = "", metadata = list(title = "A title"))
  )
})

test_that("rmarkdown::render() actually invokes the pre_knit hook", {
  # Guards against regressions where pre_knit stops being wired into the
  # format returned by oup_article(): asserts the warning surfaces from a
  # real (knit-only, no LaTeX) render of an Rmd whose YAML sets `authormark`.
  skip_if_not_pandoc("2.10")
  rmd <- withr::local_tempfile(fileext = ".Rmd")
  xfun::write_utf8(
    c(
      "---",
      "title: t",
      "authormark: \"X et al.\"",
      "output:",
      "  rticles::oup_article:",
      "    oup_version: 1",
      "---",
      "",
      "Body."
    ),
    rmd
  )
  expect_warning(
    rmarkdown::render(rmd, quiet = TRUE, run_pandoc = FALSE),
    regexp = "authormark"
  )
})

test_that("oup_v1 template no longer emits \\authormark", {
  tex <- xfun::read_utf8(
    pkg_file_template("oup_v1", "resources", "template.tex")
  )
  expect_false(any(grepl("\\authormark", tex, fixed = TRUE)))
})
