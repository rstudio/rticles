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
#' @param journal one of "JOSS" or"JOSE"
#' @param keep_md Whether to retain the intermediate markdown and images.
#'   Defaults to TRUE.
#' @param latex_engine,... Arguments passed to [rmarkdown::pdf_document()]
#' @export
joss_article <- function(journal = "JOSS",
                         keep_md = TRUE,
                         latex_engine = "xelatex",
                         ...) {
  rmarkdown::pandoc_available("2.2", TRUE)

  logo_path <- find_resource("joss", paste0(journal, "-logo.png"))
  journalname <- ifelse(journal == "JOSS",
    "Journal of Open Source Software",
    "Journal of Open Source Education"
  )

  pdf_document_format(
    "joss",
    latex_engine = latex_engine,
    citation_package = "default",
    keep_md = keep_md,
    pandoc_args = c(
      "-V", paste0("logo_path=", logo_path),
      "-V", paste0("journal_name=", journalname),
      "-V", "graphics=true"
    ),
    ...
  )
}
