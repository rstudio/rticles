#' Journal of Open Source Software (JOSS) format.
#'
#' Format for creating a Journal of Open Source Software (JOSS) or Journal of
#' Open Source Education (JOSE) articles. Adapted
#' from \url{https://github.com/openjournals/whedon}. As these journals take
#' articles as markdown, this format can be used to generate markdown from
#' R Markdown and to locally preview how the article will appear as PDF.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param journal one of "JOSS" or"JOSE"
#' @param keep_md Whether to retain the intermediate markdown and images.
#'   Defaults to TRUE.
#' @param doi,year,volume,issue,page,submitted,published,review_url,repository,archive_doi
#'   Article metadata, all optional for generating PDF preview, auto-generated
#'   on submission.
#' @param latex_engine,... Arguments passed to \code{rmarkdown::pdf_document}
#' @export
joss_article <- function(journal = "JOSS",
                         keep_md = TRUE,
                         doi = "",
                         year = "",
                         volume = "",
                         issue = "",
                         page = "",
                         submitted = "",
                         published = "",
                         review_url = "",
                         repository = "",
                         archive_doi = "",
                         latex_engine = "xelatex",
                         ...) {

  rmarkdown::pandoc_available('2.2', TRUE)

  logo_path <- find_resource("joss_article",
                             paste0(journal, "-logo.png"))
  journalname <- ifelse(journal == "JOSS",
                        "Journal of Open Source Software",
                        "Journal of Open Source Education")

  template_variables <- c(
      paste0("logo_path=", logo_path),
      paste0("year=", year),
      paste0("journal_name=", journalname),
      paste0("formatted_doi=", doi),
      paste0("archive_doi=https://doi.org/", archive_doi),
      paste0("review_issue_url=", review_url),
      paste0("repository=", repository),
      paste0("submitted=", submitted),
      paste0("published=", published),
      paste0("issue=", issue),
      paste0("volume=", volume),
      paste0("page=", page),
      "graphics=true"
    )

  template_variables <- c(rbind(rep("-V", length(template_variables)),
                                template_variables))

  pandoc_args <- c(
    template_variables,
    "--csl", find_resource("joss_article", "apa.csl")
  )

  base <- pdf_document_format(
    "joss_article",
    latex_engine = latex_engine,
    pandoc_args = pandoc_args,
    citation_package = "none"
  )

  base$knitr$opts_chunk$dev <- c("png")
  base$knitr$opts_chunk$dpi <- 300
  base$knitr$opts_chunk$fig.width <- 6
  base$knitr$opts_chunk$fig.height <- 4.15
  base$keep_md <- keep_md
  base$clean_supporting <- !keep_md

  base$post_knit <- function(metadata, imput_file, runtime, ...) {
    citation_author <- ifelse(
      length(metadata$authors) > 1,
      paste(metadata$authors[[1]]$name, "et. al."),
      metadata$authors[[1]]$name
    )

    c("-V", paste0("citation_author=", citation_author))
  }

  base
}

