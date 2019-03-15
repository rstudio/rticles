#' PeerJ journal format.
#'
#' Format for creating submissions to The PeerJ.
#'
#' This was adapted from the
#' \href{https://www.overleaf.com/latex/templates/latex-template-for-peerj-journal-and-pre-print-submissions/ptdwfrqxqzbn}{PeerJ Overleaf Template}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document()}.
#' @export
peerj_article <- function(..., keep_tex = TRUE) {
  pdf_document_format("peerj_article",  keep_tex = keep_tex, ...)
}
