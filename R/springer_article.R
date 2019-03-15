#' Springer Journal format.
#'
#' This format was adapted from the Springer Macro package for Springer
#' Journals.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @export
springer_article <- function(..., keep_tex = TRUE, citation_package = 'none'){
  pdf_document_format(
    "springer_article", keep_tex = keep_tex, citation_package = citation_package, ...
  )
}
