#' American Meteorological Society (AMS) Journal format.
#'
#' Format for creating an American Meteorological Society (AMS) Journal articles.
#' Adapted from
#' \href{https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/author-resources/latex-author-info/}{https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/author-resources/latex-author-info/}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "ams_article", package = "rticles")
#' }
#'
#' @export
ams_article <- function(...,
                        keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris")){
  pdf_document_format(...,
                      keep_tex = keep_tex,
                      md_extensions = md_extensions,
                      format = "ams_article",
                      template = "template.tex",
                      csl = "american-meteorological-society.csl")
}
