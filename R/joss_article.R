#' Journal of Open Source Software (JOSS) format.
#'
#' Format for creating a Journal of Open Source Software (JOSS) or Journal of
#' Open Source Education (JOSE) articles. Adapted
#' from \url{https://github.com/openjournals/whedon}. As these journals take
#' articles as markdown, this format can be used to generate markdown from
#' R Markdown and to locally preview how the article will appear as PDF.
#'
#' The following variables may be set in YAML metadata to populate fields in the
#' article PDF: \code{doi, year, volume, issue, page, submitted, published,
#' review_url, repository}, and \code{archive_doi}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param journal one of "JOSS" or"JOSE"
#' @param keep_md Whether to retain the intermediate markdown and images.
#'   Defaults to TRUE.
#' @param latex_engine,... Arguments passed to \code{rmarkdown::pdf_document}
#' @export
joss_article <- function(journal = "JOSS",
                         keep_md = TRUE,
                         latex_engine = "xelatex",
                         ...) {

  rmarkdown::pandoc_available('2.2', TRUE)

  logo_path <- find_resource("joss_article",
                             paste0(journal, "-logo.png"))
  journalname <- ifelse(journal == "JOSS",
                        "Journal of Open Source Software",
                        "Journal of Open Source Education")

  pandoc_args <- c(
    "-V", paste0("logo_path=", logo_path),
    "-V", paste0("journal_name=", journalname),
    "-V", "graphics=true",
    "--csl", find_resource("joss_article", "apa.csl")
  )

  base <- pdf_document_format(
    "joss_article",
    latex_engine = latex_engine,
    pandoc_args = pandoc_args,
    citation_package = "none",
    fig_width = 6, fig_height = 4.15,
    dev = "png"

  )
  base$keep_md <- keep_md
  base$clean_supporting <- !keep_md

  base$post_knit <- function(metadata, input_file, runtime, ...) {
    if (!is.null(metadata$authors)) {
      citation_author <- ifelse(
        length(metadata$authors) > 1,
        paste(metadata$authors[[1]]$name, "et. al."),
        metadata$authors[[1]]$name
      )
      return(c("-V", paste0("citation_author=", citation_author)))
    }
  }

  base
}

