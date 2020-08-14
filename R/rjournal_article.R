#' R Journal format.
#'
#' Format for creating R Journal articles. Adapted from
#' \url{https://journal.r-project.org/submissions.html}. In order to ease the
#' manuscript preparation, the output is collected in a separate output directory,
#' which can be used for the submission. If needed file names are renamed automatically.
#'
#' @details
#'
#' **The `author` field in the YAML header**
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
#' **Other YAML fields**
#'
#' \tabular{lll}{
#' FIELD \tab TYPE \tab DESCRIPTION\cr
#' `bibliography` \tab *with default* \tab the BibTeX file with the reference entries\cr
#' `output_dir` \tab *with default* \tab output directory where all the files are stored ready for submission
#' }
#'
#' @param ...,citation_package Arguments to \code{rmarkdown::pdf_document}.
#'
#' @md
#' @export
rjournal_article <- function(..., citation_package = 'natbib') {

  rmarkdown::pandoc_available('2.2', TRUE)

  base <- pdf_document_format(
    "rjournal_article", highlight = NULL, citation_package = citation_package, ...
  )

  # Render will generate tex file, post-knit hook gerenates the R file,
  # post-process hook generates appropriate RJwrapper.tex and
  # use pandoc to build pdf from that
  base$pandoc$to <- "latex"
  base$pandoc$ext <- ".tex"

  # Generates R file expected as R journal requirement
  # we do that in the post-knit hook do access input file path
  pk <- base$post_knit
  output_R <- NULL
  base$post_knit <- function(metadata, input_file, runtime, ...) {
    # run post_knit it exists
    if (is.function(pk)) pk(metadata, input_file, runtime, ...)

    # purl the Rmd file to R code per requirement
    temp_R <- tempfile(fileext = ".R")
    output_R <<- knitr::purl(
      input = input_file, output = temp_R,
      documentation = 1, quiet = TRUE
    )

    NULL
  }

  base$post_processor <- function(
    metadata, utf8_input, output_file, clean, verbose
  ) {
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

    # Copy purl-ed R file with the correct name
    file.copy(output_R, xfun::with_ext(filename, "R"))
    unlink(output_R)

    # post process TEX file
    temp_tex <- xfun::read_utf8(output_file)
    temp_tex <- post_process_authors(temp_tex)
    xfun::write_utf8(text = temp_tex, con = output_file)

    ##compile TEX and return the output file path on exit
    file <- tinytex::latexmk("RJwrapper.tex", base$pandoc$latex_engine, clean = clean)
    on.exit(return(file))

    # check bibliography name
    bib_filename <- metadata$bibliography
    if(!is.null(metadata$bibliography) &&
       xfun::sans_ext(bib_filename) != xfun::sans_ext(filename)) {
      msg <- paste(
        "Per R journal requirement, bibliography file and tex file should",
        "have the same name.\nCurrently, you have a bib file {{bib_filename}} and",
        "a tex file {{filename}}.\nDon't forget to rename and change ",
        "the bibliography field in YAML header."
      )
      warning(knitr::knit_expand(text = msg), call. = FALSE)
    }

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




