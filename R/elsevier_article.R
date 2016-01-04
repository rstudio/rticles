#' Elsevier journal format.
#'
#' Format for creating submissions to Elsevier journals. Adapted from
#' \href{https://www.elsevier.com/authors/author-schemas/latex-instructions}{https://www.elsevier.com/authors/author-schemas/latex-instructions}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @export
elsevier_article <- function(...,
                             keep_tex = TRUE,
                             md_extensions = c("-autolink_bare_uris")) {
  rmarkdown::pdf_document(...,
                          template = find_resource("elsevier_article", "template.tex"),
                          keep_tex = keep_tex,
                          md_extensions = md_extensions)
}

# mark the format as inheriting from pdf_document
attr(elsevier_article, "base_format") <- "pdf_document"

