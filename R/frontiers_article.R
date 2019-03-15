#' Frontiers open access journal format.
#'
#' Format for creating Frontiers journal articles. Adapted from
#' \href{http://home.frontiersin.org/about/author-guidelines}{http://home.frontiersin.org/about/author-guidelines}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @param documentclass The document class for the Frontiers In Article:
#' \describe{
#' \item{\code{frontiersSCNS}}{Science, Engineering and Humanities and
#' Social Sciences articles}
#' \item{\code{frontiersHLTH}}{Health articles}
#' \item{\code{frontiersFPHY}}{Physics and Applied Mathematics
#' and Statistics articles}
#' }
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @export
frontiers_article <- function(
  ...,
  keep_tex = TRUE,
  documentclass = c("frontiersSCNS", "frontiersHLTH", "frontiersFPHY")) {

  x = inherit_pdf_document(...,
                           template = find_resource("frontiers_article", "template.tex"),
                           keep_tex = keep_tex)
  documentclass = match.arg(documentclass)
  x$pandoc$args = c(x$pandoc$args,
                    c("--variable", paste0("documentclass=", documentclass)))
  x
}
