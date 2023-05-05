# Run only on CI
skip_on_cran()

temp_file <- list.files(pkg_file_template(), recursive = TRUE, pattern = "template.tex$", full.names = TRUE)

# Rjournal template has another name
temp_file[grep("rjournal", temp_file)] <- pkg_file_template("rjournal", "resources", "RJwrapper.tex")

expect_contains <- function(file, pattern, nb = 1, ...) {
  content <- xfun::read_utf8(file)
  matched <- grepl(pattern, content, ...)
  if (any(matched) && sum(matched) == nb) {
    succeed()
    return(invisible(file))
  }
  msg <- if (!any(matched)) {
    sprintf(
      "%s template does not contains %s",
      sQuote(basename(dirname(dirname(file)))),
      dQuote(pattern)
    )
  } else {
    sprintf(
      "%s template contains %s instead of %s",
      sQuote(basename(dirname(dirname(file)))),
      sum(matched),
      nb
    )
  }
  fail(msg)
}


test_that("highlighting macros is in all templates", {
  for (f in temp_file) {
    expect_contains(f, "if(highlighting-macros)", fixed = TRUE)
  }
})


test_that("tightlist is defined in all templates", {
  for (f in temp_file) {
    expect_contains(f, "\\\\providecommand.\\\\tightlist..%")
  }
})

test_that("part for Pandoc's tables is defined in all templates", {
  for (f in temp_file) {
    expect_contains(f, "if(tables)", fixed = TRUE)
  }
})

test_that("CSL-ref part for Pandoc's citeproc are in all templates", {
  for (f in temp_file) {
    expect_contains(f, "if(csl-refs)", fixed = TRUE)
  }
})

test_that("header-includes is in all templates", {
  for (f in temp_file) {
    expect_contains(f, "for(header-includes)", fixed = TRUE)
  }
})

test_that("include-before is in all templates", {
  for (f in temp_file) {
    expect_contains(f, "for(include-before)", fixed = TRUE)
  }
})

test_that("include-after is in all templates", {
  for (f in temp_file) {
    expect_contains(f, "for(include-after)", fixed = TRUE)
  }
})
