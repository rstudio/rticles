#' Elsevier journal format.
#'
#' Format for creating submissions to Elsevier journals. Adapted from
#' \url{https://www.elsevier.com/authors/author-schemas/latex-instructions}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @export
elsevier_article <- function(
  ..., keep_tex = TRUE, md_extensions = c("-autolink_bare_uris")
) {
  pdf_document_format(
    "elsevier_article", keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}
