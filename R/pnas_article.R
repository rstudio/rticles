#' PNAS journal format.
#'
#' Format for creating submissions to PNAS journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @export
pnas_article <- function(..., keep_tex = TRUE) {
  pdf_document_format("pnas_article", keep_tex = keep_tex, ...)
}
