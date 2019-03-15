#' A PDF format for documents based on the LaTeX package \pkg{ctex}
#'
#' \code{ctex()} is a wrapper function for \code{rmarkdown::pdf_document()} and
#' changed the default values of two arguments \code{template} and
#' \code{latex_engine} so it works better with the \pkg{ctex} package.
#' @param ...,latex_engine Passed to
#'   \code{markdown::\link[rmarkdown]{pdf_document}()}.
#' @export
ctex <- function(..., latex_engine = 'xelatex') {
  pdf_document_format('ctex', latex_engine = latex_engine, ...)
}
