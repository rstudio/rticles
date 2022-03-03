#' IEEE Transactions journal format.
#'
#' Format for creating submissions to IEEE Transaction journals. Adapted from
#' <http://www.ieee.org/publications_standards/publications/authors/author_templates.html>.
#'
#' Presently, only the `"conference"` paper mode offered by the
#' `IEEEtran.cls` is supported.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param draftmode Specify the draft mode to control spacing and whether images
#' should be rendered. Valid options are: `"final"` (default), `"draft"`,
#' `"draftcls"`, or `"draftclsnofoot"`.
#' @param hyphenfixes A `character` value that provides the correct
#' hyphenations for ambiguous words. Separate new words with spaces.
#' @param IEEEspecialpaper  A `character` value containing the publication's
#' special paper designation.
#' @param with_ifpdf A `logical` value turning on (`TRUE`) or off
#' (`FALSE`) the `ifpdf` LaTeX package.
#' @param with_cite A `logical` value turning on (`TRUE`) or off
#' (`FALSE`) the `cite` LaTeX package.
#' @param with_amsmath A `logical` value turning on (`TRUE`) or off
#'  (`FALSE`) the `amsmath` LaTeX package.
#' @param with_algorithmic A `logical` value turning on (`TRUE`) or
#'  off (`FALSE`) the `algorithmic` LaTeX package.
#' @param with_subfig A `logical` value turning on (`TRUE`) or off
#' (`FALSE`) the `subfig` LaTeX package.
#' @param with_array A `logical` value turning on (`TRUE`) or off
#' (`FALSE`) the `array` LaTeX package.
#' @param with_dblfloatfix A `logical` value turning on (`TRUE`) or
#' off (`FALSE`) the `dblfloatfix` LaTeX package.
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#'
#' @references
#' Shell, Michael. "How to use the IEEEtran LATEX class." Journal of LATEX Class
#'  Files 1.11 (2002): 10-20.
#' <http://mirrors.rit.edu/CTAN/macros/latex/contrib/IEEEtran/IEEEtran_HOWTO.pdf>
#' @importFrom rmarkdown pandoc_variable_arg
#' @export
ieee_article <- function(draftmode = c("final", "draft", "draftcls", "draftclsnofoot"),
                         hyphenfixes = "op-tical net-works semi-conduc-tor",
                         IEEEspecialpaper = "",
                         with_ifpdf = FALSE,
                         with_cite = FALSE,
                         with_amsmath = FALSE,
                         with_algorithmic = FALSE,
                         with_subfig = FALSE,
                         with_array = FALSE,
                         with_dblfloatfix = FALSE,
                         keep_tex = TRUE,
                         pandoc_args = NULL,
                         md_extensions = c("-autolink_bare_uris"),
                         ...) {
  args <- c()

  draftmode <- match.arg(draftmode)
  args <- c(args, "draftmode" = draftmode)

  args <- c(args, "hyphenfixes" = hyphenfixes)

  # Avoid declaration of pandoc variable if field is empty
  if (nchar(IEEEspecialpaper) > 1) {
    args <- c(args, "IEEEspecialpaper" = IEEEspecialpaper)
  }

  plist <- c(
    "with_ifpdf" = with_ifpdf,
    "with_cite" = with_cite,
    "with_amsmath" = with_amsmath,
    "with_algorithmic" = with_algorithmic,
    "with_subfig" = with_subfig,
    "with_array" = with_array,
    "with_dblfloatfix" = with_dblfloatfix
  )

  args <- c(args, plist[plist])

  # Convert to pandoc arguments
  pandoc_arg_list <- vec_to_pandoc_variable_args(args)

  pdf_document_format(
    "ieee",
    pandoc_args = c(pandoc_arg_list, pandoc_args),
    keep_tex = keep_tex, md_extensions = md_extensions,
    ...
  )
}
