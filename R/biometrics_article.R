#' Biometrics Journal format.
#'
#' This format was adapted from the Biometrics Macro package.
#'
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "biometrics_article", package = "rticles")
#' }
#'
#' @export
biometrics_article <- function(..., keep_tex = TRUE, citation_package = 'natbib'){
  template <- find_resource("biometrics_article", "template.tex")
  inherit_pdf_document(template = template,
                              keep_tex = keep_tex,
                              citation_package = citation_package,
                              ...)
}
