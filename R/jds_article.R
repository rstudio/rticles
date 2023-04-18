#' Journal of Data Science (JDS)
#'
#' Format for creating Journal of Data Science (JDS) articles. Adapted from
#'   <https://jds-online.org/journal/JDS/information/submit-your-article>.
#' @param review Use options for document classe associated to review status.
#' @inheritParams rmarkdown::pdf_document
#' @export
jds_article <- function(review = FALSE, keep_tex = TRUE, citation_package = "natbib", pandoc_args = NULL, ...) {
  default_meta <- list(
    classoption  = if (isTRUE(review)) {
      c("letterpaper", "inpress")
    } else {
      c("a4paper", "review")
    }
  )
  tmpyaml <- tempfile("meta", fileext = ".yml")
  yaml::write_yaml(default_meta, tmpyaml)
  args <- c(pandoc_args,
            c("--metadata-file", rmarkdown::pandoc_path_arg(tmpyaml))
  )
  format <- pdf_document_format("jds",
                      keep_tex = keep_tex,
                      citation_package = citation_package,
                      pandoc_args = args,
                      ...
  )
  # clean behind us
  on_exit_fun <- format$on_exit
  format$on_exit <- function() {
    if (is.function(on_exit_fun)) on_exit_fun()
    unlink(tmpyaml)
  }
  format
}
