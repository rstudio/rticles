#' PNAS journal format.
#'
#' Format for creating submissions to PNAS journals. Adapted from
#' \href{https://www.overleaf.com/latex/templates/template-for-preparing-your-research-report-submission-to-pnas-using-overleaf/fzcbzjvpvnxn#.V1h6OGIrK_O}.
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
elsevier_article <- function(...) {
  inherit_pdf_document(...,
                       template = find_resource("pnas_article", "template.tex"))
}
