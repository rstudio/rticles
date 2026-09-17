agu_fixture <- function(...) {
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

prepare_agu_natbib <- function(path) {
  xfun::write_utf8(
    c(
      xfun::read_utf8(path),
      "",
      "```{=latex}",
      "\\citep{Levitus2012}",
      "\\citep[p.~3]{Levitus2012}",
      "\\citep[see][p.~3]{Levitus2012}",
      "\\citet{Nuncio2011}",
      "\\citet[p.~5]{Nuncio2011}",
      "\\citet[see][p.~5]{Nuncio2011}",
      "```"
    ),
    path
  )
}

prepare_agu_citeproc <- function(path) {
  rmd <- xfun::read_utf8(path)
  raw_citations <- grepl(
    "^(As shown by|Related work|Earlier examples)",
    rmd
  )
  stopifnot(sum(raw_citations) == 3)
  rmd[raw_citations] <- "Official raw citation example omitted for citeproc."
  xfun::write_utf8(rmd, path)
}

prepare_agu_multiple_bibliographies <- function(path) {
  rmd <- xfun::read_utf8(path)
  bibliography <- grepl("^bibliography: agutest[.]bib$", rmd)
  stopifnot(sum(bibliography) == 1)
  rmd <- append(
    rmd[-which(bibliography)],
    c(
      "bibliography:",
      "  - agutest.bib",
      "  - aguadditional.bib"
    ),
    after = which(bibliography) - 1
  )
  xfun::write_utf8(
    c(
      rmd,
      "",
      "```{=latex}",
      "An additional source is included \\cite{Additional2026}.",
      "```"
    ),
    path
  )
  xfun::write_utf8(
    c(
      "@article{Additional2026,",
      "  author = {Additional, Ada},",
      "  title = {An Additional Bibliography},",
      "  journal = {Journal of Tests},",
      "  year = {2026},",
      "  volume = {1},",
      "  pages = {1--2}",
      "}"
    ),
    "aguadditional.bib"
  )
}

prepare_agu_legacy <- function(path) {
  xfun::write_utf8(
    c(
      "---",
      'journal: "JGR: Atmospheres"',
      'classoption: "draft,linenumbers"',
      'title: "Legacy AGU Draft"',
      "authors:",
      "  - name: Legacy Author",
      "    affil: 1",
      "affiliations:",
      "  - number: 1",
      '    name: "Legacy University"',
      "corresponding_author:",
      "  - name: Legacy Author",
      "    email: legacy@example.org",
      "keypoints:",
      '  - "This draft retains its project-local 2018 class."',
      'abstract: "A genuine legacy-class compatibility render."',
      "output: rticles::agu_article",
      "bibliography: agutest.bib",
      "---",
      "",
      "# Introduction",
      "",
      "A legacy textual citation uses \\citet{Levitus2012}.",
      "A legacy parenthetical citation uses \\citep[see][p.~3]{Nuncio2011}.",
      "",
      "```{=latex}",
      "\\begin{table}",
      "\\caption{Legacy table compatibility}",
      "\\centering",
      "\\begin{tabular}{lc}",
      "Item & Value \\\\",
      "Legacy & 2018",
      "\\end{tabular}",
      "\\end{table}",
      "```"
    ),
    path
  )

  stopifnot(file.remove("agujournal2019.cls"))
  stopifnot(file.copy(
    agu_fixture("agujournal2018.cls"),
    "agujournal2018.cls"
  ))
}

retain_agu_latex_artifacts <- function(output_file) {
  tex <- sub("[.]pdf$", ".tex", output_file)
  tinytex::latexmk(tex, engine = "pdflatex", clean = FALSE)
}

read_agu_artifact <- function(output_file, extension) {
  path <- sub("[.]pdf$", extension, output_file)
  stopifnot(file.exists(path))
  xfun::read_utf8(path)
}

validate_agu_current <- function(output_file, path) {
  retain_agu_latex_artifacts(output_file)
  tex <- read_agu_artifact(output_file, ".tex")
  aux <- read_agu_artifact(output_file, ".aux")
  log <- read_agu_artifact(output_file, ".log")

  assert("current draft retains only the 2019 class branch", {
    class_lines <- grep("^\\\\documentclass", tex, value = TRUE)
    length(class_lines) == 1 &&
      grepl("{agujournal2019}", class_lines, fixed = TRUE) &&
      !grepl("{agujournal2018}", class_lines, fixed = TRUE)
  })
  assert("current draft loads agujournal2019", {
    any(grepl("Document Class: agujournal2019", log, fixed = TRUE))
  })
  assert("natbib zero-, one-, and two-note citations reach LaTeX", {
    all(c(
      any(grepl("\\citep{Levitus2012}", tex, fixed = TRUE)),
      any(grepl("\\citep[p.~3]{Levitus2012}", tex, fixed = TRUE)),
      any(grepl("\\citep[see][p.~3]{Levitus2012}", tex, fixed = TRUE)),
      any(grepl("\\citet{Nuncio2011}", tex, fixed = TRUE)),
      any(grepl("\\citet[p.~5]{Nuncio2011}", tex, fixed = TRUE)),
      any(grepl("\\citet[see][p.~5]{Nuncio2011}", tex, fixed = TRUE))
    ))
  })
  assert("Markdown citations preserve textual and parenthetical notes", {
    all(c(
      any(grepl("\\citet[p. 4]{Levitus2012}", tex, fixed = TRUE)),
      any(grepl("\\citep[e.g.,][p. 5]{Nuncio2011}", tex, fixed = TRUE))
    ))
  })
  assert("official AGU citations and notes reach LaTeX", {
    all(c(
      any(grepl("\\citeA{Levitus2012}", tex, fixed = TRUE)),
      any(grepl("\\cite<e.g.,>[p. 4]{Levitus2012}", tex, fixed = TRUE))
    ))
  })
  assert("track changes compile through the 2019 setup", {
    any(grepl("\\add{an example tracked addition}", tex, fixed = TRUE))
  })
  assert("appendix counters use AGU letter prefixes", {
    all(c(
      any(grepl("newlabel{eq:appendix}{{A1}", aux, fixed = TRUE)),
      any(grepl("newlabel{fig:appendix}{{A1}", aux, fixed = TRUE)),
      any(grepl("newlabel{tab:appendix}{{A1}", aux, fixed = TRUE))
    ))
  })
}

validate_agu_citeproc <- function(output_file, path) {
  retain_agu_latex_artifacts(output_file)
  tex <- read_agu_artifact(output_file, ".tex")
  log <- read_agu_artifact(output_file, ".log")

  assert("citeproc uses the current class", {
    any(grepl("Document Class: agujournal2019", log, fixed = TRUE))
  })
  assert("citeproc emits one reference list without BibTeX", {
    sum(grepl("\\begin{CSLReferences}", tex, fixed = TRUE)) == 1 &&
      !any(grepl("\\bibliography{", tex, fixed = TRUE))
  })
}

validate_agu_multiple_bibliographies <- function(output_file, path) {
  retain_agu_latex_artifacts(output_file)
  tex <- read_agu_artifact(output_file, ".tex")
  aux <- read_agu_artifact(output_file, ".aux")

  assert("multiple bibliography files are passed to BibTeX", {
    any(grepl(
      "\\bibliography{agutest,aguadditional}",
      tex,
      fixed = TRUE
    )) &&
      any(grepl("\\bibdata{agutest,aguadditional}", aux, fixed = TRUE))
  })
}

validate_agu_legacy <- function(output_file, path) {
  retain_agu_latex_artifacts(output_file)
  tex <- read_agu_artifact(output_file, ".tex")
  log <- read_agu_artifact(output_file, ".log")

  assert("legacy draft retains only the 2018 class branch", {
    class_lines <- grep("^\\\\documentclass", tex, value = TRUE)
    length(class_lines) == 1 &&
      grepl("{agujournal2018}", class_lines, fixed = TRUE) &&
      !grepl("{agujournal2019}", class_lines, fixed = TRUE)
  })
  assert("legacy draft loads its local agujournal2018 class", {
    any(grepl("Document Class: agujournal2018", log, fixed = TRUE))
  })
  assert("legacy natbib citations remain unchanged", {
    all(c(
      any(grepl("\\citet{Levitus2012}", tex, fixed = TRUE)),
      any(grepl("\\citep[see][p.~3]{Nuncio2011}", tex, fixed = TRUE))
    ))
  })
  assert("legacy output declaration remains unchanged", {
    any(grepl(
      "output: rticles::agu_article",
      xfun::read_utf8(path),
      fixed = TRUE
    ))
  })
}
