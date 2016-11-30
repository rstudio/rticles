#' IEEE Transactions journal format.
#'
#' Format for creating submissions to IEEE Transaction journals. Adapted from
#' \href{http://www.ieee.org/publications_standards/publications/authors/author_templates.html}{http://www.ieee.org/publications_standards/publications/authors/author_templates.html}.
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
#' draft("MyArticle.Rmd", template = "ieee_article", package = "rticles")
#' }
#'
#' @export
ieee_article <- function(...,
                             keep_tex = TRUE,
                             md_extensions = c("-autolink_bare_uris")) {
  inherit_pdf_document(...,
                       template = find_resource("ieee_article", "template.tex"),
                       keep_tex = keep_tex,
                       md_extensions = md_extensions)
}
