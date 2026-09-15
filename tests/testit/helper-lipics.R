prepare_lipics_features <- function(path) {
  rmd <- xfun::read_utf8(path)
  pdfa <- grepl("^pdfa: false", rmd)
  oldauthorstyle <- grepl("^oldauthorstyle: false", rmd)
  stopifnot(sum(pdfa) == 1, sum(oldauthorstyle) == 1)
  rmd[pdfa] <- "pdfa: true # v2021 feature smoke test"
  rmd[oldauthorstyle] <- "oldauthorstyle: true # v2021 feature smoke test"
  xfun::write_utf8(rmd, path)
}

prepare_lipics_citeproc <- function(path) {
  rmd <- xfun::read_utf8(path)
  bibliography <- grepl("^bibliography: bibliography$", rmd)
  citation <- grepl("^Lorem ipsum", rmd) &
    grepl(
      "\\\\cite\\{DBLP:journals/cacm/Knuth74\\}",
      rmd
    )
  stopifnot(sum(bibliography) == 1, sum(citation) == 1)
  rmd[bibliography] <- "bibliography: bibliography.bib"
  rmd[citation] <- sub(
    "\\\\cite\\{DBLP:journals/cacm/Knuth74\\}",
    "[@DBLP:journals/cacm/Knuth74]",
    rmd[citation]
  )
  xfun::write_utf8(rmd, path)
}

lipics_fixture <- function(...) {
  test_root <- getOption("testit.test_dir")
  stopifnot(length(test_root) == 1)

  paths <- file.path(
    test_root,
    c("testit/fixtures", "tests/testit/fixtures"),
    ...
  )
  path <- paths[file.exists(paths)]
  stopifnot(length(path) == 1)
  path
}

prepare_lipics_legacy <- function(path) {
  xfun::write_utf8(
    c(
      "---",
      'title: "Legacy LIPIcs draft"',
      'titlerunning: "Legacy LIPIcs draft"',
      'format: "a4paper"',
      'hyphenation: "UKenglish"',
      "author:",
      "  - name: John Q. Public",
      '    affiliation: "Dummy University, Country"',
      "    email: johnqpublic@example.org",
      '    orcid: ""',
      'authorrunning: "J.&thinsp;Q. Public"',
      'copyright: "John Q. Public"',
      "ccdesc:",
      '  concept_significance: "100"',
      '  concept_desc: "General and reference"',
      'keywords: "legacy, compatibility"',
      'abstract: "A legacy draft using the v2019 class."',
      "output:",
      "  rticles::lipics_article: default",
      "---",
      "",
      "# Legacy draft",
      "",
      "This draft retains its project-local `lipics-v2019.cls`."
    ),
    path
  )

  stopifnot(file.remove("lipics-v2021.cls"))
  stopifnot(file.copy(
    lipics_fixture("lipics-v2019.cls"),
    "lipics-v2019.cls"
  ))
}

validate_lipics_citeproc <- function(output_file, path) {
  tex <- xfun::read_utf8(sub("[.]pdf$", ".tex", output_file))
  assert("structured citation is included by citeproc", {
    any(grepl("ref-DBLP:books", tex, fixed = TRUE))
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
