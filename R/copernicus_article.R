#' Copernicus journals format.
#'
#' Format for creating submissions to Copernicus journals.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to [rmarkdown::pdf_document()]. **Note**: `extra_dependencies` are not
#' allowed as Copernicus does not support additional packages included via \code{\\usepackage{}}.
#' @param journal_name A regular expression to filter the by the journal name, see `pattern` in [base::grep()]; defaults to `*`.
#'
#' @return An R Markdown output format.
#' @details This was adapted from
#' <https://publications.copernicus.org/for_authors/manuscript_preparation.html>.
#'
#' An number of required and optional manuscript sections, e.g. `acknowledgements`, `competinginterests`, or `authorcontribution`, must be declared using the respective properties of the R Markdown header - see skeleton file.
#'
#' **Version:** Based on `copernicus_package.zip` in the version 7.3, 15 March 2023, using `copernicus.cls` in version 10.1.4, 5 December 2022.
#'
#' **Copernicus journal abbreviations:** You can use the function `copernicus_journal_abbreviations()` to get the journal abbreviation for all journals supported by the Copernicus article template.
#'
#' **Important note:** The online guidelines by Copernicus are the official resource.
#' Copernicus is not responsible for the community contributions made to support the template in this package.
#' Copernicus converts all typeset TeX files into XML, the expressions and markups have to be highly standardized.
#' Therefore, please keep the following in mind:
#'
#' * Please provide only one figure file for figures with several panels, and please do not use `\subfloat` or similar commands.
#' * Please use only commands in which words, numbers, etc. are within braces (e.g. `\textrm{TEXT}` instead of `\rm TEXT`).
#' * For algorithms, please use the syntax given in template.tex or provide your algorithm as a figure.
#' * Please do not define new commands.
#' * Supported packages (`\usepackage{}`) are already integrated in the `copernicus.cls`.  Please do not insert additional ones in your `.tex` file.
#' * If you opt for syntax highlighting for your preprint or other reasons, please do not forget to use
#'   `highlight = NULL` for your final file upload once your manuscript was accepted for publication.
#' * Spaces in labels (`\label{}`) are not allowed; please make sure that no label name is assigned more than once.
#' * Please do not use `\paragraph{}`; only `\subsubsection{}` is allowed.
#' * It is not possible to add tables in colour.
#'
#' @note If you use [rmarkdown::pdf_document()], all internal references (i.e. tables and figures) must use `\ref{}` whereas with [bookdown::pdf_document2()], you can additionally use `\@ref()`.
#'
#' @references
#' Manuscript preparation guidelines for authors.
#' <https://publications.copernicus.org/for_authors/manuscript_preparation.html>
#'
#' @examples
#' names(copernicus_journal_abbreviations())
#' copernicus_journal_abbreviations(journal_name = "Science Data")
#' \dontrun{
#' library("rmarkdown")
#' draft("MyArticle.Rmd", template = "copernicus", package = "rticles")
#' render("MyArticle/MyArticle.Rmd")
#' }
#' @export
copernicus_article <- function(..., keep_tex = TRUE, highlight = NULL,
                               citation_package = "natbib",
                               md_extensions = c(
                                 "-autolink_bare_uris", # disables automatic links, needed for plain email in \correspondence
                                 "-auto_identifiers" # disables \hypertarget commands
                               )) {
  if ("extra_dependencies" %in% names(list(...))) {
    warning(
      "Copernicus does not support additional LaTeX packages and options!
          >> Please remove 'extra_dependencies' from your YAML header!",
      call. = FALSE
    )
  }

  pdf_document_format(
    "copernicus",
    citation_package = citation_package,
    keep_tex = keep_tex, highlight = highlight, md_extensions = md_extensions, ...
  )
}

# quick dev shortcut for Ubuntu: click "Install and restart" then run:
# unlink("MyArticle/", recursive = TRUE); rmarkdown::draft("MyArticle.Rmd", template = "copernicus", package = "rticles", edit = FALSE); rmarkdown::render("MyArticle/MyArticle.Rmd"); system(paste0("xdg-open ", here::here("MyArticle", "MyArticle.pdf")))

copernicus_journals <- list(
  "Advances in Geosciences" = "adgeo",
  "Advances in Radio Science" = "ars",
  "Advances in Science and Research" = "asr",
  "Advances in Statistical Climatology, Meteorology and Oceanography" = "ascmo",
  "Aerosol Research" = "ar",
  "Annales Geophysicae" = "angeo",
  "Archives Animal Breeding" = "aab",
  "Atmospheric Chemistry and Physics" = "acp",
  "Atmospheric Measurement Techniques" = "amt",
  "Biogeosciences" = "bg",
  "Climate of the Past" = "cp",
  "DEUQUA Special Publications" = "deuquasp",
  "Earth Surface Dynamics" = "esurf",
  "Earth System Dynamics" = "esd",
  "Earth System Science Data" = "essd",
  "E&G Quaternary Science Journal" = "egqsj",
  "EGUsphere" = "egusphere",
  "European Journal of Mineralogy" = "ejm",
  "Fossil Record" = "fr",
  "Geochronology" = "gchron",
  "Geographica Helvetica" = "gh",
  "Geoscience Communication" = "gc",
  "Geoscientific Instrumentation, Methods and Data Systems" = "gi",
  "Geoscientific Model Development" = "gmd",
  "History of Geo- and Space Sciences" = "hgss",
  "Hydrology and Earth System Sciences" = "hess",
  "Journal of Bone and Joint Infection" = "jbji",
  "Journal of Micropalaeontology" = "jm",
  "Journal of Sensors and Sensor Systems" = "jsss",
  "Magnetic Resonance" = "mr",
  "Mechanical Sciences" = "ms",
  "Natural Hazards and Earth System Sciences" = "nhess",
  "Nonlinear Processes in Geophysics" = "npg",
  "Ocean Science" = "os",
  "Primate Biology" = "pb",
  "Proceedings of the International Association of Hydrological Sciences" = "piahs",
  "Safety of Nuclear Waste Disposal" = "sand",
  "Scientific Drilling" = "sd",
  "SOIL" = "soil",
  "Solid Earth" = "se",
  "State of the Planet" = "sp",
  "The Cryosphere" = "tc",
  "Web Ecology" = "we",
  "Weather and Climate Dynamics" = "wcd",
  "Web Ecology" = "we",
  "Wind Energy Science" = "wes"
)

#' @rdname copernicus_article
#' @export
copernicus_journal_abbreviations <- function(journal_name = "*") {
  unlist(copernicus_journals[grep(
    journal_name, names(copernicus_journals),
    ignore.case = TRUE
  )])
}
