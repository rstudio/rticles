#' PNAS journal format.
#'
#' Format for creating submissions to PNAS journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "pnas_article", package = "rticles")
#' }
#'
#' @export
pnas_article <- function(...) {
  inherit_pdf_document(...,
                       template = find_resource("pnas_article", "template.tex"))
}
