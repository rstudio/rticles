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
  raw_citations <- grepl("\\\\cite\\{DBLP:", rmd)
  structured_citation <- grepl(
    '    cite: "DBLP:books/mk/GrayR93"',
    rmd,
    fixed = TRUE
  )
  stopifnot(
    sum(bibliography) == 1,
    any(raw_citations),
    sum(structured_citation) == 1
  )
  rmd[bibliography] <- "bibliography: bibliography.bib"
  rmd[raw_citations] <- gsub(
    "\\\\cite\\{([^}]+)\\}",
    "[@\\1]",
    rmd[raw_citations]
  )
  rmd[structured_citation] <- sub(
    "    cite:",
    "    # cite:",
    rmd[structured_citation],
    fixed = TRUE
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
      'subtitle: "Legacy subtitle"',
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
      'relatedversion: "Legacy related version"',
      "relatedversiondetails:",
      '  - classification: "Full Version"',
      '    url: "https://example.org/full-version"',
      '    linktext: "Full version"',
      "supplementdetails:",
      '  - classification: "Software"',
      '    url: "https://example.org/software"',
      '    linktext: "Source code"',
      '    swhid: "swh:1:dir:legacy"',
      '    swhlinktext: "Archived source"',
      "    swhdelimiter: '\\quad '",
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

validate_lipics_legacy <- function(output_file, path) {
  tex <- xfun::read_utf8(sub("[.]pdf$", ".tex", output_file))
  assert("legacy fallback flattens the subtitle", {
    any(grepl(
      "\\title{Legacy LIPIcs draft: Legacy subtitle}",
      tex,
      fixed = TRUE
    ))
  })
  assert("legacy fallback flattens related-version metadata", {
    any(grepl(
      paste0(
        "\\relatedversion{Legacy related version; ",
        "\\textit{Full Version}: ",
        "\\href{https://example.org/full-version}{Full version}}"
      ),
      tex,
      fixed = TRUE
    ))
  })
  assert("legacy fallback preserves supplement metadata", {
    all(c(
      any(grepl(
        "\\textit{Software}: ",
        tex,
        fixed = TRUE
      )),
      any(grepl(
        "\\href{https://example.org/software}{Source code}",
        tex,
        fixed = TRUE
      )),
      any(grepl("\\quad archived at", tex, fixed = TRUE)),
      any(grepl(
        "https://archive.softwareheritage.org/swh:1:dir:legacy",
        tex,
        fixed = TRUE
      )),
      any(grepl("\\nolinkurl{Archived source}", tex, fixed = TRUE))
    ))
  })
}

validate_lipics_citeproc <- function(output_file, path) {
  tex <- xfun::read_utf8(sub("[.]pdf$", ".tex", output_file))
  assert("citeproc emits exactly one reference list", {
    sum(grepl("\\begin{CSLReferences}", tex, fixed = TRUE)) == 1 &&
      !any(grepl("\\bibliography{", tex, fixed = TRUE))
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
