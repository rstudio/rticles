#' MDPI journal format.
#'
#' Format for creating submissions to Multidisciplinary Digital Publishing
#' Institute (MDPI) journals. Adapted from
#' \url{http://www.mdpi.com/authors/latex}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @export
mdpi_article <- function(..., keep_tex = TRUE) {
  pdf_document_format(
    "mdpi_article", keep_tex = keep_tex, citation_package = "natbib", ...
  )
}
