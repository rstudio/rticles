#' Sage Journals format.
#'
#' Format for creating submissions to Sage Journals. Based on the official Sage Journals
#' \href{https://uk.sagepub.com/sites/default/files/sage_latex_template_4.zip}{class}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @details Possible arguments for the YAML header are:
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
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "sage_article", package = "rticles")
#' }
#'
#' @export
sage_article <- function(..., highlight = NULL, citation_package = "natbib") {
  inherit_pdf_document(...,
                       template = find_resource("sage_article", "template.tex"),
                       highlight = highlight,
                       citation_package = citation_package)
}
