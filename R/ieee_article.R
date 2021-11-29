#' IEEE Transactions journal format.
#'
#' Format for creating submissions to IEEE Transaction journals. Adapted from
#' <http://www.ieee.org/publications_standards/publications/authors/author_templates.html>.
#'
#' Presently, only the `"conference"` paper mode offered by the
#' `IEEEtran.cls` is supported, with experimental support for the
#' `"journal"` mode.
#'
#' @inheritParams rmarkdown::pdf_document
#' @param draftmode Specify the draft mode to control spacing and whether images
#' should be rendered. Valid options are: `"final"` (default), `"draft"`,
#' `"draftcls"`, or `"draftclsnofoot"`.
#' @param hyphenfixes A `character` value that provides the correct
#' hyphenations for ambiguous words. Separate new words with spaces.
#' @param journal Running Header to use for a journal paper. When set,
#'   classoption `journal` will be used instead of `conference`.
#'   `number_sections` will also default to `TRUE` in this case.
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
ieee_article <- function(
  draftmode   = c("final", "draft", "draftcls", "draftclsnofoot"),
  hyphenfixes      = "op-tical net-works semi-conduc-tor",
  journal = NULL,
  IEEEspecialpaper = "",
  with_ifpdf       = FALSE,
  with_cite        = FALSE,
  with_amsmath     = FALSE,
  with_algorithmic = FALSE,
  with_subfig      = FALSE,
  with_array       = FALSE,
  with_dblfloatfix = FALSE,
  keep_tex         = TRUE,
  pandoc_args = NULL,
  citation_package = "default",
  md_extensions    = c("-autolink_bare_uris"),
  number_sections = FALSE,
  ...
) {

  args <- c()

  draftmode <- match.arg(draftmode)
  args <- c(args, "draftmode" = draftmode)

  args <- c(args, "hyphenfixes" = hyphenfixes)


  # Some check when journal mode is set
  if (!is.null(journal)) {
    # Add as Pandoc's variable
    args <- c(args, "journal" = journal)
    # activate number_section by default
    if(missing(number_sections)) number_sections <- TRUE
    # New author syntax needs to be used which requires a recent pandoc
    if (rmarkdown::pandoc_available("2.10")) {
      stop("Using `journal` mode for `ieee_article()` requires Pandoc >= 2.10", call. = FALSE)
    }
  }

  # Avoid declaration of pandoc variable if field is empty
  if (nchar(IEEEspecialpaper) > 1) {
    args <- c(args, "IEEEspecialpaper" = IEEEspecialpaper)
  }

  plist <- c("with_ifpdf"       = with_ifpdf,
             "with_cite"        = with_cite,
             "with_amsmath"     = with_amsmath,
             "with_algorithmic" = with_algorithmic,
             "with_subfig"      = with_subfig,
             "with_array"       = with_array,
             "with_dblfloatfix" = with_dblfloatfix)

  args <- c(args, plist[plist])

  # Convert to pandoc arguments
  pandoc_arg_list <- mapply(rmarkdown::pandoc_variable_arg, names(args), args,
                            USE.NAMES = FALSE, SIMPLIFY = FALSE)
  pandoc_arg_list <- unlist(pandoc_arg_list)

  pdf_document_format(
    "ieee", pandoc_args = c(pandoc_arg_list, pandoc_args),
    keep_tex = keep_tex, md_extensions = md_extensions,
    number_sections = number_sections, citation_package = citation_package,
    ...
  )
}
