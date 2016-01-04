#' Association for Computing Machinery (ACM) format.
#'
#' Format for creating an Association for Computing Machinery (ACM) articles.
#' Adapted from
#' \href{http://www.acm.org/publications/article-templates/proceedings-template.html}{http://www.acm.org/publications/article-templates/proceedings-template.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @export
acm_article <- function() {

  # ammend pandoc_args with csl
  csl <- find_resource("acm_article" ,"acm-sig-proceedings.csl")
  pandoc_args <- c(match.call()$pandoc_args,
                   "--csl", rmarkdown::pandoc_path_arg(csl))

  # return the format
  rmarkdown::pdf_document(
    ...,
    template = find_resource("acm", "template.tex"),
    pandoc_args = pandoc_args)
}

