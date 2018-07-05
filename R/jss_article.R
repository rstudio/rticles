#' Journal of Statistical Software (JSS) format.
#'
#' Format for creating a Journal of Statistical Software (JSS) articles. Adapted
#' from
#' \href{http://www.jstatsoft.org/about/submissions}{http://www.jstatsoft.org/about/submissions}.
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
#' draft("MyArticle.Rmd", template = "jss_article", package = "rticles")
#' }
#'
#' @export
jss_article <- function(..., keep_tex = TRUE, citation_package = 'natbib') {

  rmarkdown::pandoc_available('2.2', TRUE)

  template <- find_resource("jss_article", "template.tex")

  base <- inherit_pdf_document(
    ..., template = template, keep_tex = keep_tex, citation_package = citation_package
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_knit$out.format <- "sweave"

  base$knitr$opts_chunk <- merge_list(base$knitr$opts_chunk, list(
    prompt = TRUE, comment = NA, highlight = FALSE, tidy = FALSE,
    dev.args = list(pointsize = 11), fig.align = "center",
    fig.width = 4.9,  # 6.125" * 0.8, as in template
    fig.height = 3.675  # 4.9 * 3:4
  ))

  base$pandoc$ext <- '.tex'
  post <- base$post_processor
  # a hack for https://github.com/rstudio/rticles/issues/100 to add \AND to the author list
  base$post_processor <- function(metadata, input, output, clean, verbose) {
    if (is.function(post)) output = post(metadata, input, output, clean, verbose)
    f <- xfun::with_ext(output, '.tex')
    x <- xfun::read_utf8(f)
    x <- gsub('( \\\\AND )\\\\And ', '\\1', x)
    x <- gsub(' \\\\AND(\\\\\\\\)$', '\\1', x)
    xfun::write_utf8(x, f)
    tinytex::latexmk(
      f, base$pandoc$latex_engine,
      if ('--biblatex' %in% base$pandoc$args) 'biber' else 'bibtex'
    )
  }

  hook_chunk <- function(x, options) {
    if (output_asis(x, options)) return(x)
    paste0('```{=latex}\n\\begin{CodeChunk}\n', x, '\\end{CodeChunk}\n```')
  }
  hook_input <- function(x, options) {
    if (options$prompt && length(x)) {
      x <- gsub("\\n", paste0("\n", "R+ "), x)
      x <- paste0("R> ", x)
    }
    paste0(c('\n\\begin{CodeInput}', x, '\\end{CodeInput}', ''),
      collapse = '\n')
  }
  hook_output <- function(x, options) {
    paste0('\n\\begin{CodeOutput}\n', x, '\\end{CodeOutput}\n')
  }

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

