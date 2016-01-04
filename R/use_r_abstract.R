#' useR conference abstract format.
#'
#' Format for useR conference abstracts. Adapted from
#' \href{http://user2016.org/}{http://user2016.org/}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @export
use_r_abstract <- function(...) {

  # ammend pandoc_args with csl
  csl <- find_resource("use_r_abstract" ,"chicago-author-date.csl")
  pandoc_args <- c(match.call()$pandoc_args,
                   "--csl", rmarkdown::pandoc_path_arg(csl))

  # return the format
  rmarkdown::pdf_document(
    template = find_resource("use_r_abstract", "template.tex"),
    pandoc_args = pandoc_args)
}

# mark the format as inheriting from pdf_document
attr(use_r_abstract, "base_format") <- "pdf_document"

