#' MDPI journal format.
#'
#' Format for creating submissions to MDPI journals.
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
#' draft("MyArticle.Rmd", template = "mdpi_article", package = "rticles")
#' }
#'
#' @export
mdpi_article <- function(..., keep_tex = TRUE) {
  pdf_document_format(...,
                      keep_tex = keep_tex,
                      format = "mdpi_article",
                      template = "template.tex",
                      csl = "multidisciplinary-digital-publishing-institute.csl")
}
