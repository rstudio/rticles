#' American Geophysical Union (AGU) format
#'
#' Format for creating a American Geophysical Union (AGU) article. Adapted from
#' \url{https://publications.agu.org/author-resource-center/checklists-and-templates/}.
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document()}.
#' @return An R Markdown output format.
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "agu_article", package = "rticles")
#' }
#' @export
agu_article <- function(
  ..., keep_tex = TRUE, citation_package = 'natbib',
  highlight = NULL, md_extensions = c("-autolink_bare_uris", "-auto_identifiers")
) {
  inherit_pdf_document(
    template = find_resource("agu_article", "template.tex"), keep_tex = keep_tex,
    citation_package = citation_package, md_extensions = md_extensions,
    highlight = highlight, ...
  )
}
