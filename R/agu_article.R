#' American Geophysical Union (AGU) format
#'
#' Format for creating a American Geophysical Union (AGU) article.
#' Adapted from
#' \href{https://publications.agu.org/author-resource-center/checklists-and-templates/}{https://publications.agu.org/author-resource-center/checklists-and-templates/}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "agu_article", package = "rticles")
#' }
#'
#' @export
agu_article <- function(...) {
  pdf_document_format(...,
                      highlight = NULL,
                      citation_package = "natbib",
                      format = "agu_article",
                      template = "template.tex",
                      md_extensions = c("-autolink_bare_uris",
                                        "-auto_identifiers"),
                      csl = "")
}
