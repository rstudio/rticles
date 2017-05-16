#' Statistics in Medicine format.
#'
#' Format for creating submissions to Statistics in Medicine. Adapted from
#' \href{http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1097-0258/homepage/la_tex_class_file.htm}{http://onlinelibrary.wiley.com/journal/10.1002/(ISSN)1097-0258/homepage/la_tex_class_file.htm}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "sim_article", package = "rticles")
#' }
#'
#' @export
sim_article <- function(..., highlight = NULL, citation_package = "natbib") {
  inherit_pdf_document(...,
                       template = find_resource("sim_article", "template.tex"),
                       highlight = highlight,
                       citation_package = citation_package)
}
