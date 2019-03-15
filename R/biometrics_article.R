#' Biometrics Journal format.
#'
#' This format was adapted from the Biometrics Macro package.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @export
biometrics_article <- function(..., keep_tex = TRUE, citation_package = 'natbib') {
  pdf_document_format(
    'biometrics_article', keep_tex = keep_tex, citation_package = citation_package, ...
  )
}
