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

  template <- find_resource("jss_article", "template.tex")

  base <- inherit_pdf_document(
    ..., template = template, keep_tex = keep_tex, citation_package = citation_package
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_knit$out.format <- "sweave"

  base$knitr$opts_chunk$prompt <- TRUE
  base$knitr$opts_chunk$comment <- NA
  base$knitr$opts_chunk$highlight <- FALSE

  base$knitr$opts_chunk$dev.args <- list(pointsize = 11)
  base$knitr$opts_chunk$fig.width <- 4.9 # 6.125" * 0.8, as in template
  base$knitr$opts_chunk$fig.height <- 3.675 # 4.9 * 3:4
  base$knitr$opts_chunk$fig.align <- "center"
  hook_chunk <- function(x, options) {
    if (output_asis(x, options)) return(x)
    paste0('\\begin{CodeChunk}\n', x, '\\end{CodeChunk}')
  }
  save <- options(prompt = "R> ", continue = "R+ ")
  hook_input <- function(x, options) {
    if (options$prompt && length(x)) {
      x <- gsub("\\n", paste0("\n", getOption("continue")), x)
      x <- paste0(getOption("prompt"), x)
    }
    paste0(c('\n\\begin{CodeInput}', x, '\\end{CodeInput}', ''),
      collapse = '\n')
  }
  hook_output <- function(x, options) {
    paste0('\n\\begin{CodeOutput}\n', x, '\\end{CodeOutput}\n')
  }
  old_hook <- base$knitr$knit_hooks$document
  hook_document <- function(x) {
    options(save)
    if (is.function(old_hook))
      old_hook(x)
    else
      base::identity(x)
  }
  base$knitr$knit_hooks$chunk   <- hook_chunk
  base$knitr$knit_hooks$source  <- hook_input
  base$knitr$knit_hooks$output  <- hook_output
  base$knitr$knit_hooks$message <- hook_output
  base$knitr$knit_hooks$warning <- hook_output
  base$knitr$knit_hooks$plot <- knitr::hook_plot_tex
  base$knitr$knit_hooks$document <- hook_document

  base
}

