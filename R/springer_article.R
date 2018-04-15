#' Springer Journal format.
#'
#' This format was adapted from the Springer Macro package for Springer
#' Journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "springer_article", package = "rticles")
#' }
#'
#' @export
springer_article <- function(..., keep_tex = TRUE, citation_package = 'none'){
  template <- find_resource("springer_article", "template.tex")
  inherit_pdf_document(template = template,
                              keep_tex = keep_tex,
                              citation_package = citation_package,
                              ...)
}
