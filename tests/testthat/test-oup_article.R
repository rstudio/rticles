test_that("oup_article(oup_version = 1) warns when `authormark` is set in YAML", {
  fmt <- oup_article(oup_version = 1)
  expect_warning(
    fmt$pre_knit(input = "", metadata = list(authormark = "Anonymous et al.")),
    regexp = "authormark"
  )
})

test_that("oup_article(oup_version = 1) does not warn for unrelated metadata", {
  fmt <- oup_article(oup_version = 1)
  expect_no_warning(
    fmt$pre_knit(input = "", metadata = list(title = "A title"))
  )
})

test_that("oup_v1 template no longer emits \\authormark", {
  tex <- xfun::read_utf8(
    pkg_file_template("oup_v1", "resources", "template.tex")
  )
  expect_false(any(grepl("\\authormark", tex, fixed = TRUE)))
})
