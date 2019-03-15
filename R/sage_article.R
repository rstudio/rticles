#' Sage Journals format.
#'
#' Format for creating submissions to Sage Journals. Based on the official Sage Journals
#' \href{https://uk.sagepub.com/sites/default/files/sage_latex_template_4.zip}{class}.
#'
#' Possible arguments for the YAML header are:
#' \itemize{
#'   \item \code{title} title of the manuscript
#'   \item \code{runninghead} short author list for header
#'   \item \code{author} list of authors, containing \code{name} and \code{num}
#'   \item \code{address} list containing \code{num} and \code{org} for defining \code{author} affiliations
#'   \item \code{corrauth} corresponding author name and address
#'   \item \code{email} correspondence email
#'   \item \code{abstract} abstract, limited to 200 words
#'   \item \code{keywords} keywords for the artucle
#'   \item \code{bibliography} BibTeX \code{.bib} file name
#'   \item \code{classoption} options of the \code{sagej} class
#'  \item \code{header-includes}: custom additions to the header, before the \code{\\begin\{document\}} statement
#'  \item \code{include-after}: for including additional LaTeX code before the \code{\\end\{document\}} statement}
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#' @export
sage_article <- function(..., highlight = NULL, citation_package = "natbib") {
  pdf_document_format(
    "sage_article", highlight = highlight, citation_package = citation_package, ...
  )
}
