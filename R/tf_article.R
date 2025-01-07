#' Taylor & Francis journals format
#'
#' Format for creating submissions to many Taylor & Francis journals.
#' Adapted from:
#' * <https://files.taylorandfrancis.com/InteractAPALaTeX.zip>
#' * <https://files.taylorandfrancis.com/InteractCADLaTeX.zip>
#' * <https://files.taylorandfrancis.com/InteractNLMLaTeX.zip>
#' * <https://files.taylorandfrancis.com/InteractTFPLaTeX.zip>
#' * <https://files.taylorandfrancis.com/InteractTFQLaTeX.zip>
#' * <https://files.taylorandfrancis.com/InteractTFSLaTeX.zip>
#'
#' @inheritParams rmarkdown::pdf_document
#' @param reference_style should be set according to the specific Taylor & Francis
#'   journal. Possibles values: "APA" (American Psychological Association
#'   reference style), "CAD" (Chicago Author-Date reference style), "NLM"
#'   (National Library of Medicine reference style), "TFP" (Reference
#'   Style-P), "TFQ" (Reference Style-Q), and "TFS" (Reference Style-S).
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#'
#' @examples \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "tf", package = "rticles")
#' setwd("MyArticle")
#' rmarkdown::render("MyArticle.Rmd")
#' }
#' @importFrom rmarkdown pandoc_variable_arg
#' @export
tf_article <- function(..., keep_tex = TRUE, citation_package = "natbib",
                       reference_style = c("CAD", "APA", "NLM", "TFP", "TFQ", "TFS"),
                       pandoc_args = NULL) {
  styles <- list(
    APA = list(
      bst = "apacite",
      cmd = c(
        "\\usepackage[natbibapa]{apacite}",
        "\\setlength\\bibhang{12pt}",
        "\\renewcommand\\bibliographytypesize{\\fontsize{10}{12}\\selectfont}"
      )
    ),
    CAD = list(
      bst = "tfcad",
      cmd = c(
        "\\usepackage{natbib}",
        "\\bibpunct[, ]{(}{)}{;}{a}{}{,}"
      )
    ),
    NLM = list(
      bst = "tfnlm",
      cmd = c(
        "\\usepackage[numbers,sort&compress]{natbib}",
        "\\makeatletter",
        "\\def\\NAT@def@citea{\\def\\@citea{\\NAT@separator}}",
        "\\makeatother",
        "\\bibpunct[, ]{[}{]}{,}{n}{,}{,}",
        "\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}"
      )
    ),
    TFP = list(
      bst = "tfp",
      cmd = c(
        "\\usepackage[numbers,sort&compress,merge]{natbib}",
        "\\bibpunct[, ]{(}{)}{,}{n}{,}{,}",
        "\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}",
        "\\renewcommand\\citenumfont[1]{\\textit{#1}}",
        "\\renewcommand\\bibnumfmt[1]{(#1)}"
      )
    ),
    TFQ = list(
      bst = "tfq",
      cmd = c(
        "\\usepackage[numbers,sort&compress]{natbib}",
        "\\bibpunct[, ]{[}{]}{,}{n}{,}{,}",
        "\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}"
      )
    ),
    TFS = list(
      bst = "tfs",
      cmd = c(
        "\\usepackage[numbers,sort&compress]{natbib}",
        "\\bibpunct[, ]{[}{]}{,}{n}{,}{,}",
        "\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}"
      )
    )
  )
  reference_style <- match.arg(reference_style)
  if (! reference_style %in% names(styles))
    stop(
      paste(
        "Invalid reference_style in Taylor and Francis article. Allowed values are:",
        paste(names(styles), collapse = ", ")
      )
    )
  sty <- styles[[reference_style]]
  pandoc_args <- c(
    pandoc_args,
    rmarkdown::pandoc_variable_arg("biblio-style", sty$bst),
    rmarkdown::pandoc_variable_arg(
      "biblio-commands",
      paste(sty$cmd, collapse = "\n")
    )
  )

  base <- pdf_document_format(
    "tf",
    keep_tex = keep_tex,
    citation_package = citation_package,
    pandoc_args = pandoc_args,
    ...
  )
  pre_knit <- base$pre_knit

  # Alert the user about deprecation of the biblio_style field in the YAML header
  base$pre_knit <- function(input, metadata, ...) {
    if (is.function(pre_knit)) pre_knit(input, metadata, ...)
    if (!is.null(metadata$biblio_style))
      warning("`tf_article()` now ignores the 'biblio_style' field in YAML header. ",
              " Use the 'reference_style' option of 'output:tf_article', instead.",
              call. = FALSE)
  }

  base
}
