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
      "An additional source is included [@Additional2026]."
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
      "output:",
      "  rticles::agu_article:",
      "    citation_package: natbib",
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
  assert("citeproc renders Markdown citations without natbib commands", {
    all(c(
      any(grepl("Levitus", tex, fixed = TRUE)),
      any(grepl("Nuncio", tex, fixed = TRUE)),
      !any(grepl("\\citep", tex, fixed = TRUE)),
      !any(grepl("\\citet", tex, fixed = TRUE))
    ))
  })
  assert("citeproc emits one reference list without BibTeX", {
    sum(grepl("\\begin{CSLReferences}", tex, fixed = TRUE)) == 1 &&
      !any(grepl("\\bibliography{", tex, fixed = TRUE))
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

validate_agu_multiple_bibliographies <- function(output_file, path) {
  retain_agu_latex_artifacts(output_file)
  tex <- read_agu_artifact(output_file, ".tex")

  assert("citeproc includes references from multiple bibliography files", {
    sum(grepl("\\begin{CSLReferences}", tex, fixed = TRUE)) == 1 &&
      any(grepl("An Additional Bibliography", tex, fixed = TRUE)) &&
      !any(grepl("\\bibliography{", tex, fixed = TRUE))
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
  assert("legacy draft explicitly selects natbib", {
    any(grepl(
      "citation_package: natbib",
      xfun::read_utf8(path),
      fixed = TRUE
    ))
  })
}
