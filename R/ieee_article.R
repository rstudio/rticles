#' IEEE Transactions journal format.
#'
#' Format for creating submissions to IEEE Transaction journals. Adapted from
#' \href{http://www.ieee.org/publications_standards/publications/authors/author_templates.html}{http://www.ieee.org/publications_standards/publications/authors/author_templates.html}.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param draftmode Specify the draft mode to control spacing and whether images
#' should be rendered. Valid options are: \code{"final"} (default), \code{"draft"},
#' \code{"draftcls"}, or \code{"draftclsnofoot"}.
#' @param hyphenfixes A \code{character} value that provides the correct
#' hyphenations for ambiguous words. Separate new words with spaces.
#' @param IEEEspecialpaper  A \code{character} value containing the publication's
#' special paper designation.
#' @param with_ifpdf A \code{logical} value turning on (\code{TRUE}) or off
#' (\code{FALSE}) the \code{ifpdf} LaTeX package.
#' @param with_cite A \code{logical} value turning on (\code{TRUE}) or off
#' (\code{FALSE}) the \code{cite} LaTeX package.
#' @param with_amsmath A \code{logical} value turning on (\code{TRUE}) or off
#'  (\code{FALSE}) the \code{amsmath} LaTeX package.
#' @param with_algorithmic A \code{logical} value turning on (\code{TRUE}) or
#'  off (\code{FALSE}) the \code{algorithmic} LaTeX package.
#' @param with_subfig A \code{logical} value turning on (\code{TRUE}) or off
#' (\code{FALSE}) the \code{subfig} LaTeX package.
#' @param with_array A \code{logical} value turning on (\code{TRUE}) or off
#' (\code{FALSE}) the \code{array} LaTeX package.
#' @param with_dblfloatfix A \code{logical} value turning on (\code{TRUE}) or
#' off (\code{FALSE}) the \code{dblfloatfix} LaTeX package.
#' @param ... Additional arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to
#'   \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "ieee_article", package = "rticles")
#' }
#'
#' @details
#' Presently, only the \code{"conference"} paper mode offered by the
#' \code{IEEEtran.cls} is supported.
#'
#' @references
#' Shell, Michael. "How to use the IEEEtran LATEX class." Journal of LATEX Class
#'  Files 1.11 (2002): 10-20.
#' \url{http://mirrors.rit.edu/CTAN/macros/latex/contrib/IEEEtran/IEEEtran_HOWTO.pdf}
#' @export
ieee_article <- function(...,
                         draftmode        = c("final", "draft", "draftcls",
                                              "draftclsnofoot"),
                         hyphenfixes      = "op-tical net-works semi-conduc-tor",
                         IEEEspecialpaper = "",
                         with_ifpdf       = FALSE,
                         with_cite        = FALSE,
                         with_amsmath     = FALSE,
                         with_algorithmic = FALSE,
                         with_subfig      = FALSE,
                         with_array       = FALSE,
                         with_dblfloatfix = FALSE,
                         keep_tex         = TRUE,
                         md_extensions    = c("-autolink_bare_uris")) {

  args <- c()

  draftmode <- match.arg(draftmode)
  args <- c(args, "draftmode" = draftmode)

  args <- c(args, "hyphenfixes" = hyphenfixes)

  # Avoid declaration of pandoc variable if field is empty
  if(nchar(IEEEspecialpaper) > 1){
    args <- c(args, "IEEEspecialpaper" = IEEEspecialpaper)
  }

  plist <- c("with_ifpdf"       = with_ifpdf,
             "with_cite"        = with_cite,
             "with_amsmath"     = with_amsmath,
             "with_algorithmic" = with_algorithmic,
             "with_subfig"      = with_subfig,
             "with_array"       = with_array,
             "with_dblfloatfix" = with_dblfloatfix)

  # Obtain only variables that should be turned on
  requested_withs <- sapply(plist, isTRUE)

  args <- c(args, plist[requested_withs])

  # pandoc_variable_arg not exported from rmarkdown
  pandoc_arg_variable = function(var_name, value){
    c("-V", paste0(var_name, "=", value))
  }

  # Convert to pandoc arguments
  pandoc_arg_list <- mapply(pandoc_arg_variable, names(args), args)

  inherit_pdf_document(...,
                       pandoc_args = pandoc_arg_list,
                       template = find_resource("ieee_article", "template.tex"),
                       keep_tex = keep_tex,
                       md_extensions = md_extensions)
}
