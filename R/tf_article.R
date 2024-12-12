#' Taylor & Francis journals format
#'
#' Format for creating submissions to many Taylor & Francis journals.
#' Adapted from:
#' * <https://www.tandf.co.uk/journals/authors/InteractAPALaTeX.zip>
#' * <https://www.tandf.co.uk/journals/authors/InteractCADLaTeX.zip>
#' * <https://www.tandf.co.uk/journals/authors/InteractNLMLaTeX.zip>
#' * <https://www.tandf.co.uk/journals/authors/InteractTFPLaTeX.zip>
#' * <https://www.tandf.co.uk/journals/authors/InteractTFQLaTeX.zip>
#' * <https://www.tandf.co.uk/journals/authors/InteractTFSLaTeX.zip>
#'
#' @inheritParams rmarkdown::pdf_document
#' @param biblio_style should be set according to the specific Taylor & Francis
#'   journal. Possibles values: "APA" (American Psychological Association
#'   reference style), "CAD" (Chicago Author-Date reference style), "NLM"
#'   (National Library of Medicine reference style), "TFP" (Reference
#'   Style-P), "TFQ" (Reference Style-Q), and "TFS" (Reference Style-S).
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#'
#' @examples \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "tf", package = "rticles", biblio_style = "APA")
#' rmarkdown::render("MyArticle.Rmd")
#' }
#' @importFrom rmarkdown pandoc_variable_arg
#' @export
tf_article <- function(..., keep_tex = TRUE, citation_package = "natbib",
                       biblio_style = c("CAD", "APA", "NLM", "TFP", "TFQ", "TFS"),
                       pandoc_args = NULL) {
  styles <- list(
    APA = list(
      bst = "apacite",
      cmd = "\\usepackage[natbibapa]{apacite}
\\setlength\\bibhang{12pt}
\\renewcommand\\bibliographytypesize{\\fontsize{10}{12}\\selectfont}"
    ),
    CAD = list(
      bst = "tfcad",
      cmd = "\\usepackage{natbib}
\\bibpunct[, ]{(}{)}{;}{a}{}{,}"
    ),
    NLM = list(
      bst = "tfnlm",
      cmd = "\\usepackage[numbers,sort&compress]{natbib}
\\makeatletter
\\def\\NAT@def@citea{\\def\\@citea{\\NAT@separator}}
\\makeatother
\\bibpunct[, ]{[}{]}{,}{n}{,}{,}
\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}"
    ),
    TFP = list(
      bst = "tfp",
      cmd = "\\usepackage[numbers,sort&compress,merge]{natbib}
\\bibpunct[, ]{(}{)}{,}{n}{,}{,}
\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}
\\renewcommand\\citenumfont[1]{\\textit{#1}}
\\renewcommand\\bibnumfmt[1]{(#1)}"
    ),
    TFQ = list(
      bst = "tfq",
      cmd = "\\usepackage[numbers,sort&compress]{natbib}
\\bibpunct[, ]{[}{]}{,}{n}{,}{,}
\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}"
    ),
    TFS = list(
      bst = "tfs",
      cmd = "\\usepackage[numbers,sort&compress]{natbib}
\\bibpunct[, ]{[}{]}{,}{n}{,}{,}
\\renewcommand\\bibfont{\\fontsize{10}{12}\\selectfont}"
    )
  )
  biblio_style <- match.arg(biblio_style)
  if (! biblio_style %in% names(styles))
    stop(
      paste(
        "Invalid biblio_style in Taylor and Francis article. Allowed values are:",
        paste(names(styles), collapse = ", ")
      )
    )
  sty <- styles[[biblio_style]]
  pandoc_args <- c(
    pandoc_args,
    rmarkdown::pandoc_variable_arg("bst-name", sty$bst),
    rmarkdown::pandoc_variable_arg("biblio-commands", sty$cmd)
  )
  pdf_document_format(
    "tf",
    keep_tex = keep_tex,
    citation_package = citation_package,
    pandoc_args = pandoc_args,
    ...
  )
}

