#' Oxford University Press.
#'
#' Format for creating submissions to many Oxford University Press journals.
#' Adapted from
#' <https://academic.oup.com/journals/pages/authors/preparing_your_manuscript>
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
#' @inheritParams rmarkdown::pdf_document
#' @param oup_version For `oup_article`, set to 0 to use the 2009 OUP CLS style for document formatting or set to 1 to use the newer 2020 OUP CLS style package available on CTAN. Defaults to 0.
#' @param document_style For `oup_article`, `oup_version=1`, one of "contemporary", "modern", or "traditional" setting overall style of document. Defaults to "contemporary".
#' @param papersize For `oup_article`, `oup_version=1`, one of "large", "medium", or "small" setting output page size. Defaults to "large".
#' @param namedate For `oup_article`, `oup_version=1`, a logical variable indicating if natbib citations should be in name-date format. Defaults to `FALSE`.
#' @param onecolumn For `oup_article`, `oup_version=1`, a logical variable indicating if one column formatting should be used. Defaults to `FALSE`.
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @export
#' @importFrom rmarkdown pandoc_variable_arg
oup_article <- function(
    # Controls template to use. 1 for newer template.
    oup_version = 0,
    journal = NULL,
    number_sections = FALSE,
    number_lines = FALSE,
    number_lines_options = NULL,
    citation_package = ifelse(oup_version == 0, "default", "natbib"),
    papersize = c("large", "medium", "small"),
    document_style = c("contemporary", "modern", "traditional"),
    namedate = FALSE,
    onecolumn = FALSE,
    keep_tex = TRUE,
    md_extensions = c("-autolink_bare_uris"),
    pandoc_args = NULL,
    ...
) {
  # Only two version available for now
  oup_version <- as.character(match.arg(oup_version, c(0, 1)))

  # Use old template
  if (oup_version == "0") {
    return(pdf_document_format("oup_v0",
                               keep_tex = keep_tex,
                               md_extensions = md_extensions,
                               pandoc_args = pandoc_args,
                               number_sections = number_sections,
                               ...))
  }

  # oup_version == "1" - new template --------------

  if (!rmarkdown::pandoc_available("2.10"))
    stop("oup_article with oup_version > 0 requires a minimum of pandoc 2.10.")

  # change of defaults
  if (missing(number_sections)) number_sections <- TRUE

  citation_package <-
    match.arg(citation_package, c("natbib", "default"))
  papersize <- match.arg(papersize)
  document_style <- match.arg(document_style)

  args <- c(
    journal = journal,
    papersize = papersize,
    document_style = document_style
  )

  # Convert to pandoc arguments
  pandoc_arg_list <- mapply(
    rmarkdown::pandoc_variable_arg,
    names(args),
    args,
    SIMPLIFY = FALSE,
    USE.NAMES = FALSE
  )

  # namedate
  if (namedate)
    pandoc_arg_list = c(pandoc_arg_list,
                        rmarkdown::pandoc_variable_arg("namedate"))

  # onecolumn
  if (onecolumn)
    pandoc_arg_list = c(pandoc_arg_list,
                        rmarkdown::pandoc_variable_arg("onecolumn"))

  # line numbers
  if (number_lines) {
    pandoc_arg_list = c(pandoc_arg_list,
                        rmarkdown::pandoc_variable_arg("numberlines"))

    if (!is.null(number_lines_options))
      pandoc_arg_list =
        c(
          pandoc_arg_list,
          rmarkdown::pandoc_variable_arg(
            "numberlines-options",
            paste(number_lines_options, collapse =
                    ",")
          )
        )
  }

  pandoc_arg_list <- unlist(pandoc_arg_list)

  pdf_document_format(
    "oup_v1",
    keep_tex = keep_tex,
    md_extensions = md_extensions,
    citation_package = citation_package,
    pandoc_args = c(pandoc_arg_list, pandoc_args),
    number_sections = number_sections,
    ...
  )
}
