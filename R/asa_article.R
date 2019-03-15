#' American Statistical Association (ASA) Journal format.
#'
#' This format was adapted from The American Statistican format, but it
#' should be fairly consistent across ASA journals
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @export
asa_article <- function(..., keep_tex = TRUE, citation_package = 'natbib') {
  pdf_document_format(
    "asa_article", keep_tex = keep_tex, citation_package = citation_package, ...
  )
}
