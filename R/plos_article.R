#' PLOS journal format.
#'
#' Format for creating submissions to PLOS journals. Adapted from
#' \url{http://journals.plos.org/ploscompbiol/s/latex}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @export
plos_article <- function(
  ..., keep_tex = TRUE, md_extensions = c("-autolink_bare_uris")
) {
  pdf_document_format(
    "plos_article", keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}
