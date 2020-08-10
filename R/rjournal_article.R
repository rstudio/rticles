#' @title R Journal format.
#'
#' @description Format for creating R Journal articles. Adapted from
#' \url{https://journal.r-project.org/submissions.html}.
#'
#' @details
#'
#' **The `author` field in the YAML-header**
#'
#' \tabular{lll}{
#' FIELD \tab TYPE \tab DESCRIPTION\cr
#' `name` \tab *required* \tab name and surname of the author\cr
#' `affiliation` \tab *required* \tab name of the author's affiliation\cr
#' `address` \tab *required* \tab at least one address line for the affiliation\cr
#' `url` \tab *optional* \tab an additional url for the author or the main affiliation\cr
#' `orcid` \tab *optional* \tab the authors ORCID if available\cr
#' `email` \tab *required* \tab the author's e-mail address\cr
#' `affiliation2` \tab *optional* \tab name of the author's 2nd affiliation\cr
#' `address2` \tab *optional* \tab address lines belonging to the author's 2nd affiliation
#' }
#'
#' *Please note: Only one `url`, `orcid` and `email` can be provided per author.*
#'
#' @param ...,citation_package Arguments to \code{rmarkdown::pdf_document}.
#'
#' @md
#' @export
rjournal_article <- function(..., citation_package = 'natbib') {

  ## make sure that all files are correctly named according to the R journal
  ## requirements https://journal.r-project.org/submissions.html

  ## get name of Bib-file and Rmd-file
  Rmd_file_name <- list.files(
    path = ".", pattern = ".Rmd", include.dirs = FALSE)[1]
  bib_file_name <- list.files(
    path = ".", pattern = ".bib", include.dirs = FALSE)[1]

  ## correct bibliography entry in Rmd-file
  Rmd_file_text <- readLines(Rmd_file_name)
  pat <- regexpr("(?<=\\\\bibliography{).+[^}]", Rmd_file_text, perl = TRUE)
  regmatches(Rmd_file_text, pat) <- xfun::sans_ext(Rmd_file_name)
  writeLines(text = Rmd_file_text, con =  Rmd_file_name)

  ## correct bib-filename to match the name of the Rmd-file
  file.rename(from = bib_file_name, to = paste0(xfun::sans_ext(Rmd_file_name), ".bib"))

  ## create R file with executable R code as requested
  knitr::purl(Rmd_file_name, documentation = 1)

  ##remove objects
  suppressWarnings(rm(Rmd_file_name, Rmd_file_text, bib_file_name))

  rmarkdown::pandoc_available('2.2', TRUE)

  base <- pdf_document_format(
    "rjournal_article", highlight = NULL, citation_package = citation_package, ...
  )

  # Render will generate tex file, post-process hook generates appropriate
  # RJwrapper.tex and use pandoc to build pdf from that
  base$pandoc$to <- "latex"
  base$pandoc$ext <- ".tex"

  base$post_processor <- function(metadata, utf8_input, output_file, clean, verbose) {
    filename <- basename(output_file)
    # underscores in the filename will be problematic in \input{filename};
    # pandoc will escape underscores but it should not, i.e., should be
    # \input{foo_bar} instead of \input{foo\_bar}
    if (filename != (filename2 <- gsub('_', '-', filename))) {
      file.rename(filename, filename2); filename <- filename2
    }
    m <- list(filename = xfun::sans_ext(filename))
    h <- get_list_element(metadata, c('output', 'rticles::rjournal_article', 'includes', 'in_header'))
    h <- c(h, if (length(preamble <- unlist(metadata[c('preamble', 'header-includes')]))) {
      f <- tempfile(fileext = '.tex'); on.exit(unlink(f), add = TRUE)
      xfun::write_utf8(preamble, f)
      f
    })
    t <- find_resource("rjournal_article", "RJwrapper.tex")
    template_pandoc(m, t, "RJwrapper.tex", h, verbose)

    tinytex::latexmk("RJwrapper.tex", base$pandoc$latex_engine, clean = clean)
  }

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- "#>"

  hilight_source <- knitr_fun('hilight_source')
  hook_chunk = function(x, options) {
    if (output_asis(x, options)) return(x)
    paste0('```{=latex}\n\\begin{Schunk}\n', x, '\\end{Schunk}\n```')
  }
  hook_input <- function(x, options)
    paste(c('\\begin{Sinput}', hilight_source(x, 'sweave', options), '\\end{Sinput}', ''),
      collapse = '\n')
  hook_output <- function(x, options) paste('\\begin{Soutput}\n', x, '\\end{Soutput}\n', sep = '')

  base$knitr$knit_hooks <- merge_list(base$knitr$knit_hooks, list(
    chunk   = hook_chunk,
    source  = hook_input,
    output  = hook_output,
    message = hook_output,
    warning = hook_output,
    plot = knitr::hook_plot_tex
  ))

  base
}


