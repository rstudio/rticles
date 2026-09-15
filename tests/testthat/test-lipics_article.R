test_that("LIPIcs bundles the tagged v2021 runtime resources", {
  skeleton <- pkg_file_template("lipics", "skeleton")
  files <- list.files(skeleton)

  expect_setequal(
    files,
    c(
      "bibliography.bib",
      "cc-by.pdf",
      "lipics-logo-bw.pdf",
      "lipics-v2021.cls",
      "orcid.pdf",
      "skeleton.Rmd"
    )
  )
  expect_false("lipics-v2019.cls" %in% files)
  expect_false(any(grepl("guidelines|sample.*[.]pdf$", files)))

  class <- xfun::read_utf8(file.path(skeleton, "lipics-v2021.cls"))
  expect_true(any(grepl(
    "[2023/05/12 v3.1.3 LIPIcs articles]",
    class,
    fixed = TRUE
  )))
  expect_true(any(grepl("LaTeX Project Public License", class, fixed = TRUE)))

  legacy_class <- pkg_file_template(
    "lipics",
    "legacy",
    "lipics-v2019.cls"
  )
  expect_true(file.exists(legacy_class))
  expect_true(any(grepl(
    "LaTeX Project Public License",
    xfun::read_utf8(legacy_class),
    fixed = TRUE
  )))
})

test_that("LIPIcs template preserves current and legacy class paths", {
  template <- xfun::read_utf8(
    pkg_file_template("lipics", "resources", "template.tex")
  )

  expect_true(any(grepl(
    "\\IfFileExists{lipics-v2021.cls}",
    template,
    fixed = TRUE
  )))
  expect_true(any(grepl("{lipics-v2021}", template, fixed = TRUE)))
  expect_true(any(grepl("{lipics-v2019}", template, fixed = TRUE)))
  expect_true(any(grepl("\\newif\\iflipicsvTwentyOne", template, fixed = TRUE)))
  expect_true(any(grepl(
    "\\DeclareUnicodeCharacter{2009}{\\,}",
    template,
    fixed = TRUE
  )))
  expect_identical(
    sum(grepl("\\bibliographystyle{plainurl}", template, fixed = TRUE)),
    1L
  )
  expect_false(any(grepl("\\usepackage{enumitem}", template, fixed = TRUE)))
  expect_true(any(grepl("if(pandoc317)", template, fixed = TRUE)))
  expect_true(any(grepl("if(pandoc318)", template, fixed = TRUE)))
  expect_true(any(grepl("if(pandoc321)", template, fixed = TRUE)))
  expect_true(any(grepl("if(pandoc3821)", template, fixed = TRUE)))
  expect_true(any(grepl(
    "AddToHook{package/thm-restate/after}",
    template,
    fixed = TRUE
  )))
})

test_that("LIPIcs exposes v2021 metadata interfaces", {
  template <- xfun::read_utf8(
    pkg_file_template("lipics", "resources", "template.tex")
  )

  for (field in c(
    "subtitle",
    "pdfa",
    "oldauthorstyle",
    "relatedversiondetails",
    "supplementdetails"
  )) {
    expect_true(any(grepl(field, template, fixed = TRUE)), info = field)
  }

  skeleton <- xfun::read_utf8(
    pkg_file_template("lipics", "skeleton", "skeleton.Rmd")
  )
  expect_true(any(grepl("^nocite:", skeleton)))
  expect_true(any(grepl("@DBLP:books/mk/GrayR93", skeleton, fixed = TRUE)))

  expect_identical(formals(lipics_article)$latex_engine, "pdflatex")
  expect_identical(formals(lipics_article)$citation_package, "natbib")
})
