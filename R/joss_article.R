#' Journal of Open Source Software (JOSS) format.
#'
#' Format for creating a Journal of Open Source Software (JOSS) or Journal of
#' Open Source Education (JOSE) articles. Adapted
#' from <https://github.com/openjournals/whedon>. As these journals take
#' articles as markdown, this format can be used to generate markdown from
#' R Markdown and to locally preview how the article will appear as PDF.
#'
#' The following variables may be set in YAML metadata to populate fields in the
#' article PDF, but are only necessary fo local preview:
#' `formatted_doi, citation_author, year, volume, issue, page, submitted, published,
#' review_url, repository`, and `archive_doi`.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param journal one of "JOSS" or"JOSE"
#' @param keep_md Whether to retain the intermediate markdown and images.
#'   Defaults to TRUE.
#' @param ... Arguments passed to [rmarkdown::pdf_document()]
#' @export
joss_article <- function(journal = "JOSS",
                         keep_md = TRUE,
                         latex_engine = "xelatex",
                         pandoc_args = NULL,
                         ...) {
  rmarkdown::pandoc_available("2.2", TRUE)

  args <- list(
    logo_path = find_resource("joss", paste0(journal, "-logo.png")),
    journal_name = ifelse(journal == "JOSS", "Journal of Open Source Software", "Journal of Open Source Education"),
    graphics = TRUE
  )

  pdf_document_format(
    "joss",
    latex_engine = latex_engine,
    citation_package = "default",
    keep_md = keep_md,
    pandoc_args = c(pandoc_args, list_to_pandoc_variable_args(args)),
    ...)
}
