#' Frontiers open access journal format.
#'
#' Format for creating Frontiers journal articles. Adapted from
#' \url{http://home.frontiersin.org/about/author-guidelines}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @export
frontiers_article <- function(..., keep_tex = TRUE) {
  pdf_document_format("frontiers_article", keep_tex = keep_tex, ...)
}
