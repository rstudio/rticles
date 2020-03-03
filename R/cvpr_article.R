#' CVPR conference format.
#' @inheritParams rmarkdown::pdf_document
#' @param draftmode Specify the draft mode to control spacing and whether images
#' should be rendered. Valid options are: \code{"final"} (default), \code{"draft"},
#' \code{"draftcls"}, or \code{"draftclsnofoot"}.
#' @param hyphenfixes A \code{character} value that provides the correct
#' hyphenations for ambiguous words. Separate new words with spaces.
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @references
#' \url{cvpr2020.thecvf.com/sites/default/files/2019-09/cvpr2020AuthorKit.tar}
#' @export
cvpr_article <- function(
  draftmode   = c("final", "draft", "draftcls", "draftclsnofoot"),
  hyphenfixes      = "op-tical net-works semi-conduc-tor",
  keep_tex         = TRUE,
  pandoc_args = NULL,
  md_extensions    = c("-autolink_bare_uris"),
  ...
) {

  args <- c()

  draftmode <- match.arg(draftmode)
  args <- c(args, "draftmode" = draftmode)
  args <- c(args, "hyphenfixes" = hyphenfixes)

  # pandoc_variable_arg not exported from rmarkdown
  pandoc_arg_variable <- function(var_name, value) {
    c("-V", paste0(var_name, "=", value))
  }

  # Convert to pandoc arguments
  pandoc_arg_list <- mapply(pandoc_arg_variable, names(args), args)

  pdf_document_format(
    "cvpr_article", pandoc_args = c(pandoc_arg_list, pandoc_args),
    keep_tex = keep_tex, md_extensions = md_extensions,
    ...
  )
}
