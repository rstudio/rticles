# Run only on CI
skip_on_cran()

temp_file <- list.files(pkg_file_template(), recursive = TRUE, pattern = "template.tex$", full.names = TRUE)

expect_contains <- function(file, pattern, nb = 1, at_least = NULL, ...) {
  content <- xfun::read_utf8(file)
  matched <- grepl(pattern, content, ...)
  if (any(matched)) {
    nb_match <- sum(matched)
    if (is.null(at_least) && nb_match == nb) {
      succeed()
      return(invisible(file))
    } else if (!is.null(at_least) && nb_match >= at_least) {
      succeed()
      return(invisible(file))
    }
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
      if (is.null(at_least)) nb_match else sprintf("at least %s", at_least),
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
    # including change from pandoc 3.8.2.1 about new counter
    expect_contains(f, "if(pandoc3821)", fixed = TRUE)
    expect_contains(f, "$\\newcounter{none}", fixed = TRUE)
  }
})

test_that("part for Pandoc's \\pandocbounded command is defined in all templates", {
  for (f in temp_file) {
    expect_contains(f, "if(graphics)", fixed = TRUE)
    expect_contains(f, "graphicx", fixed = TRUE, at_least = 1)
    expect_contains(f, "if(pandoc321)", fixed = TRUE)
    expect_contains(f, "\\pandocbounded", fixed = TRUE)
  }
})

test_that("CSL-ref part for Pandoc's citeproc are in all templates", {
  for (f in temp_file) {
    expect_contains(f, "if(csl-refs)", fixed = TRUE)
    expect_contains(f, "if(pandoc318)", fixed = TRUE)
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
