#' Format pour Bulletin de l'AMQ.
#'
#' Ce format a été adapté du format du bulletin de l'AMQ
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "amq_article", package = "rticles")
#' }
#'
#' @export
amq_article <- function(...,
                        latex_engine = 'xelatex',
                        keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris"),
                        fig_caption = TRUE){
  pdf_document_format(...,
                      latex_engine = latex_engine,
                      highlight = NULL,
                      keep_tex = keep_tex,
                      md_extensions = md_extensions,
                      format = "amq_article",
                      template = "template.tex",
                      csl = "",
                      fig_caption = fig_caption)
}
