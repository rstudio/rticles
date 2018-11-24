#' ACM CHI Proceedings (Conference on Human Factors in Computing Systems) format.
#' This version uses v. 1.55 of the ACM Master LaTeX template.
#'
#' CHI has two main submission formats, 'proceedings' and 'extended abstracts';
#' This template is for CHI Proceedings.
#' Format strictly follows the ACM Master LaTeX template.
#' ACM's notes here: https://www.acm.org/publications/proceedings-template
#' Devevelopment version of the ACM template: https://github.com/borisveytsman/acmart
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
acm_chi_proc_article <- function(..., keep_tex = TRUE, citation_package = 'natbib'){
  template <- find_resource("acm_chi_proc_article", "template.tex")
  fmt <- inherit_pdf_document(template = template,
                              keep_tex = keep_tex,
                              citation_package = citation_package,
                              ...)
}
