#' American Statistical Association (ASA) Journal format.
#'
#' This format was adapted from The American Statistican format, but it
#' should be fairly consistent across ASA journals
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "asa_article", package = "rticles")
#' }
#'
#' @export
asa_article <- function(..., keep_tex = TRUE){
  template <- find_resource("asa_article", "template.tex")
  fmt <- inherit_pdf_document(template = template,
                              keep_tex = keep_tex,
                              citation_package = 'natbib',
                              ...)
}
