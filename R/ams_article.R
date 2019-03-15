#' American Meteorological Society (AMS) Journal format.
#'
#' Format for creating an American Meteorological Society (AMS) Journal articles.
#' Adapted from
#' \url{https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/author-resources/latex-author-info/}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document()}.
#' @export
ams_article <- function(..., keep_tex = TRUE, md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "ams_article", keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}
