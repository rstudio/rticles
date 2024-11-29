#' American Meteorological Society journals format.
#'
#' Format for creating submissions to American Meteorological Society journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param citation_package only natbib is supported with this template.
#' @param ... Additional arguments to [rmarkdown::pdf_document()]. **Note**: `extra_dependencies` are not
#' allowed as Copernicus does not support additional packages included via \code{\\usepackage{}}.
#'
#' @return An R Markdown output format.
#' @details This was adapted from
#' <https://www.ametsoc.org/index.cfm/ams/publications/author-information/latex-author-info/>.
#'
#' The template require some default knitr option to be change: 
#' 
#' * `echo = FALSE` as no R code should be shown
#' * `fig.path = ""` as all directory paths need to be removed from figure names
#' * `out.extra = ""` to force figure labels with knitr
#'
#' @examples
#' \dontrun{
#' library("rmarkdown")
#' draft("MyArticle.Rmd", template = "ams", package = "rticles")
#' render("MyArticle/MyArticle.Rmd")
#' }
#' @export
ams_article <- function(..., keep_tex = TRUE, citation_package = "natbib", md_extensions = c("-autolink_bare_uris", "-auto_identifiers"), pandoc_args = NULL) {
  
  rmarkdown::pandoc_available('2.10', TRUE)

  if (citation_package != "natbib") {
    stop("AMS template supports only `natbib` for citation processing.")
  }

  pandoc_args <- c(
    pandoc_args,
    "--lua-filter", find_resource("ams", "ams.lua")
  )

  base <- pdf_document_format(
    "ams", keep_tex = keep_tex, md_extensions = md_extensions, citation_package = 'natbib', 
    pandoc_args = pandoc_args, ...
  )
  pre_knit <- base$pre_knit
  base$pre_knit <- function(input, metadata, ...) {
    if (is.function(pre_knit)) pre_knit(input, metadata, ...)
    old_meta <- c("journal", "layout", "exauthors", "author1", "author2", "currentaddress", "affiliation")
    # check old arg
    metadata_used <- old_meta %in% names(metadata)
    if (any(metadata_used)) {
      warning("You are probably using an old version of the template - please update to new skeleton or keep using rticles 0.27.")
      warning("Some metadata are no more used in new AMS template: ", knitr::combine_words(old_meta[metadata_used]), ".")
    }
  }
  base$knitr$opts_chunk <- merge_list(base$knitr$opts_chunk, list(
    fig.path = "",     # AMS required
    out.extra = "",    # To force figure labels
    echo = FALSE       # Don't show R code
  ))
  return(base)
}