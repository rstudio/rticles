#' A PDF format for documents based on the LaTeX package \pkg{ctex}
#'
#' \code{ctex()} is a wrapper function for \code{rmarkdown::pdf_document()} and
#' changed the default values of two arguments \code{template} and
#' \code{latex_engine} so it works better with the \pkg{ctex} package.
#' @param ...,template,latex_engine Passed to
#'   \code{markdown::\link[rmarkdown]{pdf_document}()}
#' @return \code{ctex()} returns a format that can be passed to
#'   \code{rmarkdown::render()}; \code{ctex_template()} returns the path to a
#'   LaTeX template in \pkg{rticles} for Chinese documents using the \pkg{ctex}
#'   package.
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "ctex", package = "rticles")
#' }
#'
#' @export
ctex <- function(..., template = ctex_template(), latex_engine = 'xelatex') {
  inherit_pdf_document(..., template = template, latex_engine = latex_engine)
}


#' @rdname ctex
#' @export
ctex_template <- function() find_resource('ctex', 'default.latex')
