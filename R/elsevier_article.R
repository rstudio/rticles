#' Elsevier journal format.
#'
#' Format for creating submissions to Elsevier journals. Adapted from \href{https://www.elsevier.com/authors/author-schemas/latex-instructions}{https://www.elsevier.com/authors/author-schemas/latex-instructions}.
#'
#' @param ... additional arguments to \code{rmarkdown::pdf_document}
#'
#' @export
elsevier <- function(...) {
  template <- find_resource("elsevier", "template.tex")

  md_extensions <- c("+ascii_identifiers", "+tex_math_single_backslash", "-autolink_bare_uris")
  base <- rmarkdown::pdf_document(template = template, keep_tex = TRUE, md_extensions = md_extensions, ...)
  base
}
