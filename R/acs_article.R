#' American Chemical Society (ACS) Journal format.
#'
#' Format for creating an American Chemical Society (ACS) Journal articles.
#' Adapted from \url{http://pubs.acs.org/page/4authors/submission/tex.html}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @export
acs_article <- function(
  ..., keep_tex = TRUE, md_extensions = c("-autolink_bare_uris"), fig_caption = TRUE
) {
  pdf_document_format(
    "acs_article", keep_tex = keep_tex, md_extensions = md_extensions,
    csl = "american-chemical-society.csl", fig_caption = fig_caption, ...
  )
}
