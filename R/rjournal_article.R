#' R Journal format.
#'
#' Format for creating R Journal articles. Adapted from
#' \href{https://journal.r-project.org/submissions.html}{https://journal.r-project.org/submissions.html}.
#'
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "rjournal_article", package = "rticles")
#' }
#'
#' @export
rjournal_article <- function(...) {

  rmarkdown::pandoc_available('2.2', TRUE)

  template <- find_resource("rjournal_article", "template.tex")

  base <- inherit_pdf_document(..., template = template, highlight = NULL)

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
    wrapper_metadata <- list(preamble = metadata$preamble, filename = xfun::sans_ext(filename))
    wrapper_template <- find_resource("rjournal_article", "RJwrapper.tex")
    wrapper_output <- file.path(getwd(), "RJwrapper.tex")
    template_pandoc(wrapper_metadata, wrapper_template, wrapper_output, verbose)

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


