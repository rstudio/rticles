#' American Chemical Society (ACS) Journal format.
#'
#' Format for creating an American Chemical Society (ACS) Journal articles.
#' Adapted from
#' \href{http://pubs.acs.org/page/4authors/submission/tex.html}{http://pubs.acs.org/page/4authors/submission/tex.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "acs_article", package = "rticles")
#' }
#'
#' @export
acs_article <- function(...,
                        keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris"),
                        fig_caption = TRUE){
  pdf_document_format(...,
                      keep_tex = keep_tex,
                      md_extensions = md_extensions,
                      format = "acs_article",
                      template = "template.tex",
                      csl = "american-chemical-society.csl",
                      fig_caption = fig_caption)
}
