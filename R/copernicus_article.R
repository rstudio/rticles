#' Copernicus journals format.
#'
#' Format for creating submissions to Copernicus journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to \code{base_format}
#' @param base_format The function to use for the base format of the article.
#'   By default, this is \code{rmarkdown::pdf_document}, but to use bookdown's
#'   cross-referencing feature, this can be set to \code{bookdown::pdf_document2}
#' @param journal_name A regular expression to filter the by the journal name, see \code{pattern} in \code{\link[base]{grep}}; defaults to \code{*}.
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @details This was adapted from
#' \href{https://publications.copernicus.org/for_authors/manuscript_preparation.html}{https://publications.copernicus.org/for_authors/manuscript_preparation.html}.
#'
#' An number of required and optional manuscript sections, e.g. \code{acknowledgements}, \code{competinginterests}, or \code{authorcontribution}, must be declared using the respective properties of the R Markdown header - see skeleton file.
#'
#' \strong{Version:} Based on copernicus_package.zip in the version 5.0, 21 March 2018, using \code{copernicus.cls} in version 8.67, 30 January 2018
#'
#' \strong{Copernicus journal abbreviations:} You can use the function \code{copernicus_journal_abbreviations()} to get the journal abbreviation for all journals supported by the copernicus article template.
#'
#' \strong{Important note:} The online guidelines by Copernicus are the official resource.
#' Copernicus is not responsible for the community contributions made to support the template in this package.
#' Copenicus converts all typeset TeX files into XML, the expressions and markups have to be highly standardized.
#' Therefore, please keep the following in mind:
#'
#' \itemize{
#'   \item Please provide only one figure file for figures with several panels, and please do not use \code{\\subfloat} or similar commands.
#'   \item Please use only commands in which words, numbers, etc. are within braces (e.g. \code{\\textrm{TEXT}} instead of \code{{\\rm TEXT}}).
#'   \item For algorithms, please use the syntax given in template.tex or provide your algorithm as a figure.
#'   \item Please do not define new commands.
#'   \item The most commonly used packages (\code{\\usepackage{}}) are integrated in the copernicus.cls. Some other packages often used by the community are defined in template.tex. Please do not insert additional ones in your *.tex file.
#'   \item Spaces in labels (\code{\\label{}}) are not allowed; please make sure that no label name is assigned more than once.
#'   \item Please do not use \code{\\paragraph{}}; only \code{\\subsubsection{}} is allowed.
#'   \item It is not possible to add tables in colour.
#' }
#'
#' @note If you use \code{rmarkdown::pdf_document()}, all internal references (i.e. tables and figures) must use \code{\\ref\{\}} whereas with \code{bookdown::pdf_document2()}, you can additionally use \code{\\@@ref()}.
#'
#' @references
#' Manuscript preparation guidelines for authors.
#' \url{https://publications.copernicus.org/for_authors/manuscript_preparation.html}
#'
#' @examples
#' names(copernicus_journal_abbreviations())
#' copernicus_journal_abbreviations(journal_name = "Science Data")
#' \dontrun{
#' library("rmarkdown")
#' draft("MyArticle.Rmd", template = "copernicus_article", package = "rticles")
#' render("MyArticle/MyArticle.Rmd")
#' }
#'
#' @export
copernicus_article <- function(...,
                         keep_tex         = TRUE,
                         citation_package = "natbib",
                         base_format = rmarkdown::pdf_document,
                         md_extensions = c(
                           "-autolink_bare_uris", # disables automatic links, needed for plain email in \correspondence
                           "-auto_identifiers"    # disables \hypertarget commands
                           )) {
  if (is.character(base_format)) {
    FMT <- eval(parse(text = base_format))
  } else {
    FMT <- match.fun(base_format)
  }
  FMT(...,
      citation_package = citation_package,
      keep_tex = keep_tex,
      md_extensions = md_extensions,
      template = find_resource("copernicus_article", "template.tex"))
}

# quick dev shortcut for Ubuntu: click "Install and restart" then run:
# unlink("MyArticle/", recursive = TRUE); draft("MyArticle.Rmd", template = "copernicus_article", package = "rticles", edit = FALSE); render("MyArticle/MyArticle.Rmd"); system(paste0("gnome-open ", here::here("MyArticle", "MyArticle.pdf")))

copernicus_journals <- list(
  "Advances in Geosciences" = "adgeo",
  "Advances in Radio Science" = "ars",
  "Advances in Science and Research" = "asr",
  "Advances in Statistical Climatology, Meteorology and Oceanography" = "ascmo",
  "Annales Geophysicae" = "angeo",
  "Archives Animal Breeding" = "aab",
  "ASTRA Proceedings" = "ap",
  "Atmospheric Chemistry and Physics" = "acp",
  "Atmospheric Measurement Techniques" = "amt",
  "Biogeosciences" = "bg",
  "Climate of the Past" = "cp",
  "Drinking Water Engineering and Science" = "dwes",
  "Earth Surface Dynamics" = "esurf",
  "Earth System Dynamics" = "esd",
  "Earth System Science Data" = "essd",
  "E&G Quaternary Science Journal" = "egqsj",
  "Fossil Record" = "fr",
  "Geographica Helvetica" = "gh",
  "Geoscience Communication" = "gc",
  "Geoscientific Instrumentation, Methods and Data Systems" = "gi",
  "Geoscientific Model Development" = "gmd",
  "History of Geo- and Space Sciences" = "hgss",
  "Hydrology and Earth System Sciences" = "hess",
  "Journal of Micropalaeontology" = "jm",
  "Journal of Sensors and Sensor Systems" = "jsss",
  "Mechanical Sciences" = "ms",
  "Natural Hazards and Earth System Sciences" = "nhess",
  "Nonlinear Processes in Geophysics" = "npg",
  "Ocean Science" = "os",
  "Primate Biology" = "pb",
  "Proceedings of the International Association of Hydrological Sciences" = "piahs",
  "Scientific Drilling" = "sd",
  "SOIL" = "soil",
  "Solid Earth" = "se",
  "The Cryosphere" = "tc",
  "Web Ecology" = "we",
  "Wind Energy Science" = "wes"
)

#' @rdname copernicus_article
#' @export
copernicus_journal_abbreviations <- function(journal_name = "*") {
  journal <- copernicus_journals[grepl(pattern = journal_name, x = names(copernicus_journals), ignore.case = TRUE)]
  return(unlist(journal))
}
