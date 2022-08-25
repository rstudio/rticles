#' Oxford University Press.
#'
#' Format for creating submissions to many Oxford University Press journals.
#' Adapted from
#' <https://academic.oup.com/pages/authoring/journals/preparing_your_manuscript>
#' and <https://academic.oup.com/icesjms/pages/General_Instructions>. and the
#' `oup-authoring-template` available on CTAN at
#' <https://www.ctan.org/pkg/oup-authoring-template>.
#'
#' Note that for
#'
#' * `oup_version=0`, `citation_package="default"` by default,
#' * `oup_version=1`, `citation_package="natbib"` by default and
#' `citation_package="biblatex"` is not supported.
#'
#' # Pandoc requirement
#'
#' `oup_version = 1` requires a minimum version of 2.10.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param oup_version set to 0 (default) to use the 2009 OUP `ouparticle.cls`
#'   included or set to 1 to use the newer 2020 OUP package
#'   `oup-authoring-template` available on CTAN.
#' @param journal journal Title. *(Only useful for `oup_version > 0`)*.
#' @param number_sections It will be passed to [rmarkdown::pdf_document()]. Set to
#'   TRUE by default when `oup_version = 1` is used.
#' @param document_style one of "contemporary" (default), "modern", or
#'   "traditional" setting overall style of document. *(Only useful for `oup_version > 0`)*
#' @param papersize one of "large" (default), "medium", or "small" setting
#'   output page size. *(Only useful for `oup_version > 0`)*
#' @param namedate a logical variable
#'   indicating if natbib citations should be in name-date format. Defaults to
#'   `FALSE`. *(Only useful for `oup_version > 0`)*
#' @param onecolumn a logical variable indicating if one column formatting
#'   should be used. Defaults to `FALSE`. *(Only useful for `oup_version > 0`)*
#' @param number_lines,number_lines_options Control the usage of CTAN package
#'   `lineno` in the template. Use `number_lines =TRUE` to activate and set
#'   `number_lines_options` to change options. *(Only useful for `oup_version > 0`)*
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#'
#' @export
#' @examples \dontrun{
#' # Use old template based on `ouparticle.cls`
#' rmarkdown::draft("MyArticle.Rmd", template = "oup_v0", package = "rticles")
#' # Use new template based on `oup-authoring-template` CTAN package
#' rmarkdown::draft("MyArticle.Rmd", template = "oup_v1", package = "rticles")
#' }
#' @importFrom rmarkdown pandoc_variable_arg
oup_article <- function( # Controls template to use. 1 for newer template.
                        oup_version = 0,
                        journal = NULL,
                        number_sections = FALSE,
                        citation_package = ifelse(oup_version == 0, "default", "natbib"),
                        papersize = c("large", "medium", "small"),
                        document_style = c("contemporary", "modern", "traditional"),
                        namedate = FALSE,
                        onecolumn = FALSE,
                        number_lines = FALSE,
                        number_lines_options = NULL,
                        keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris"),
                        pandoc_args = NULL,
                        ...) {
  # Only two version available for now
  oup_version <- match.arg(as.character(oup_version), c("0", "1"))

  # Use old template
  if (oup_version == "0") {
    return(
      pdf_document_format("oup_v0",
        keep_tex = keep_tex,
        md_extensions = md_extensions,
        pandoc_args = pandoc_args,
        number_sections = number_sections,
        citation_package = citation_package,
        ...
      )
    )
  }

  # oup_version == "1" - new template --------------

  if (!rmarkdown::pandoc_available("2.10")) {
    stop("oup_article with oup_version > 0 requires a minimum of pandoc 2.10.")
  }

  # change of defaults
  if (missing(number_sections)) number_sections <- TRUE

  if (!citation_package %in% c("natbib", "default")) {
    stop("Only `natbib` or `default` is supported for `oup_version = 1`")
  }
  papersize <- match.arg(papersize)
  document_style <- match.arg(document_style)

  args <- c(
    journal = journal,
    papersize = papersize,
    document_style = document_style
  )

  # Convert to pandoc arguments
  args <- vec_to_pandoc_variable_args(args)

  # namedate
  if (namedate) {
    args <- c(args, rmarkdown::pandoc_variable_arg("namedate"))
  }

  # onecolumn
  if (onecolumn) {
    args <- c(args, rmarkdown::pandoc_variable_arg("onecolumn"))
  }

  # line numbers
  if (number_lines) {
    args <- c(args, rmarkdown::pandoc_variable_arg("numberlines"))
    if (!is.null(number_lines_options)) {
      args <- c(
        args,
        rmarkdown::pandoc_variable_arg(
          "numberlines-options",
          paste(number_lines_options, collapse = ",")
        )
      )
    }
  }

  pdf_document_format(
    "oup_v1",
    keep_tex = keep_tex,
    md_extensions = md_extensions,
    citation_package = citation_package,
    pandoc_args = c(args, pandoc_args),
    number_sections = number_sections,
    ...
  )
}
