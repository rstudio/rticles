#' Format pour Bulletin de l'AMQ.
#'
#' Ce format a été adapté du format du bulletin de l'AMQ
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document()}.
#' @export
amq_article <- function(
  ..., latex_engine = 'xelatex', keep_tex = TRUE, fig_caption = TRUE,
  md_extensions = c("-autolink_bare_uris")
) {
  pdf_document_format(
    "amq_article", latex_engine = latex_engine, highlight = NULL, keep_tex = keep_tex,
    md_extensions = md_extensions, fig_caption = fig_caption, ...
  )
}
