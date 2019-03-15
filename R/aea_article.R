#' American Economic Association journal submissions.
#'
#' Format for creating submissions to the American Economic Association (AER, AEJ, JEL, PP).
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document()}.
#' @export
aea_article <- function(..., keep_tex = TRUE, md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "aea_article", keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}
