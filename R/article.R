#--- NOTE to contributors ------------------------------------------------------
# Please order these format functions alphabetically.
#-------------------------------------------------------------------------------

#' R Markdown output formats for (journal) articles
#'
#' Most article formats are based on [rmarkdown::pdf_document()], with a
#' custom Pandoc LaTeX template and different default values for other arguments
#' (e.g., `keep_tex = TRUE`).
#'
#' @param
#' ...,number_sections,keep_tex,latex_engine,citation_package,highlight,fig_caption,md_extensions,template,pandoc_args
#' Arguments passed to [rmarkdown::pdf_document()].
#' @section Details: You can find more details about each output format below.
#' @name acm_article
#' @rdname article
NULL

#' @section `acm_article`: Format for creating an Association for Computing
#'   Machinery (ACM) articles. Adapted from
#'   <https://www.acm.org/publications/proceedings-template>.

#' @return An R Markdown output format.
#' @examples \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "acm", package = "rticles")
#' rmarkdown::draft("MyArticle.Rmd", template = "asa", package = "rticles")
#' }
#' @export
#' @rdname article
acm_article <- function(...) {
  pdf_document_format("acm", ...)
}

#' @section `acs_article`: Format for creating an American Chemical Society
#'   (ACS) Journal articles. Adapted from
#'   `https://pubs.acs.org/page/4authors/submission/tex.html`
#' @export
#' @rdname article
acs_article <- function(..., keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris"),
                        fig_caption = TRUE) {
  pdf_document_format(
    "acs",
    keep_tex = keep_tex, md_extensions = md_extensions,
    fig_caption = fig_caption, ...
  )
}

#' @section `aea_article`: Format for creating submissions to the American
#'   Economic Association (AER, AEJ, JEL, PP).
#' @export
#' @rdname article
aea_article <- function(..., keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "aea",
    keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}

#' @section `agu_article`: Format for creating a American Geophysical Union
#'   (AGU) article. Adapted from
#'   <https://www.agu.org/Publish-with-AGU/Publish/#1>.
#' @export
#' @rdname article
agu_article <- function(..., keep_tex = TRUE,
                        citation_package = "natbib", highlight = NULL,
                        md_extensions = c("-autolink_bare_uris", "-auto_identifiers")) {
  pdf_document_format(
    "agu",
    keep_tex = keep_tex, highlight = highlight,
    citation_package = citation_package, md_extensions = md_extensions, ...
  )
}

#' @section `amq_article`: Ce format a été adapté du format du bulletin de
#'   l'AMQ.
#' @export
#' @rdname article
amq_article <- function(..., latex_engine = "xelatex", keep_tex = TRUE,
                        fig_caption = TRUE, md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "amq",
    latex_engine = latex_engine, highlight = NULL, keep_tex = keep_tex,
    md_extensions = md_extensions, fig_caption = fig_caption, ...
  )
}

#' @section `ams_article`: Format for creating an American Meteorological
#'   Society (AMS) Journal articles. Adapted from
#'   <https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/author-resources/latex-author-info/>.
#' @export
#' @rdname article
ams_article <- function(..., keep_tex = TRUE,
                        md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "ams",
    keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}

#' @section `asa_article`: This format was adapted from The American
#'   Statistician (TAS) format, but it should be fairly consistent across
#'   American Statistical Association (ASA) journals.
#' @export
#' @rdname article
asa_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  if (citation_package == "biblatex") {
    stop("ASA template does not support `biblatex` for citation processing.")
  }
  pdf_document_format(
    "asa",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section `arxiv_article`: Adapted from the George Kour's format for
#'   arXiv and bio-arXiv preprints. So far as I'm aware, entirely
#'   unofficial but still a staple.
#' @export
#' @rdname article
arxiv_article <- function(..., keep_tex = TRUE) {
  pdf_document_format(
    "arxiv",
    keep_tex = keep_tex, ...
  )
}

#' @section `bioinformatics_article`: Format for creating submissions to a Bioinformatics journal. Adapted from
#' <https://academic.oup.com/bioinformatics/pages/submission_online>.
#' @export
#' @rdname article
bioinformatics_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  pdf_document_format(
    "bioinformatics",
    keep_tex = keep_tex, citation_package = citation_package,
    md_extensions = "-auto_identifiers", ...
  )
}

#' @section `biometrics_article`: This format was adapted from the
#'   Biometrics journal.
#' @export
#' @rdname article
biometrics_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  pdf_document_format(
    "biometrics",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section `ctex_article`: A wrapper function for
#'   [rmarkdown::pdf_document()] and the default value of
#'   `latex_engine` is changed to \command{xelatex}, so it works better for
#'   typesetting Chinese documents with the LaTeX package \pkg{ctex}. The
#'   function `ctex` is an alias of `ctex_article`.
#' @export
#' @rdname article
ctex_article <- function(..., template = "default", latex_engine = "xelatex") {
  pdf_document_format(
    "ctex",
    latex_engine = latex_engine, template = template, ...
  )
}

#' @export
#' @rdname article
ctex <- ctex_article

#' @section `elsevier_article`: Format for creating submissions to Elsevier
#'   journals. Adapted from
#'   <https://www.elsevier.com/authors/policies-and-guidelines/latex-instructions>.
#'
#' It requires a minimum version of 2.10 for Pandoc.
#' @export
#' @rdname article
elsevier_article <- function(..., keep_tex = TRUE,
                             md_extensions = c("-autolink_bare_uris"),
                             citation_package = "natbib") {
  if (citation_package == "biblatex") {
    stop("Elsevier template does not support `biblatex` for citation processing.")
  }
  if (!rmarkdown::pandoc_available("2.10")) {
    stop("`elsevier_article()` now requires a minimum of pandoc 2.10.")
  }
  pdf_document_format(
    "elsevier",
    keep_tex = keep_tex, md_extensions = md_extensions,
    citation_package = citation_package, ...
  )
}

#' @section `frontiers_article`: Format for creating Frontiers journal
#'   articles. Adapted from
#'   <https://www.frontiersin.org/about/author-guidelines>.
#' @export
#' @rdname article
frontiers_article <- function(..., keep_tex = TRUE) {
  pdf_document_format("frontiers", keep_tex = keep_tex, ...)
}


#' @section `glossa_article`: Format for creating submissions to Glossa: a
#'   journal of general linguistics. Author Guidelines are available on
#'   [www.glossa-journal.org](https://www.glossa-journal.org/site/author-guidelines/).
#'    Template is adapted from <https://github.com/guidovw/Glossalatex>.
#' @export
#' @rdname article
glossa_article <- function(..., keep_tex = TRUE, latex_engine = "xelatex") {
  format <- pdf_document_format(
    "glossa",
    keep_tex = keep_tex, latex_engine = latex_engine, ...
  )
  if (tinytex::is_tinytex() && tinytex::check_installed("microtype")) {
    # TODO: known conflict - remove when fixed
    tinytex::tlmgr_remove("microtype")
    fun <- format$on_exit
    format$on_exit <- function() {
      if (is.function(fun)) fun()
      if (!tinytex::check_installed("microtype")) tinytex::tlmgr_install("microtype")
    }
  }
  format
}

#' @param journal one of `"aoas"`, `"aap"`, `"aop"`, `"aos"`, `"sts"` for `ims_article`
#' @section `ims_article`: Format for creating submissions to the Institute of Mathematical Statistics
#' [IMS](https://imstat.org/) journals and publications. Adapted from
#' <https://github.com/vtex-soft/texsupport.ims-aoas>.
#'
#' The argument `journal` accepts the acronym of any of the
#' [journals](https://www.e-publications.org/ims/support/ims-instructions.html) in IMS:
#' * `aap`: The Annals of Applied Probability
#' * `aoas`: The Annals of Applied Statistics
#' * `aop`: The Annals of Probability
#' * `aos`: The Annals of Statistics
#' * `sts`: Statistical Science
#' @export
#' @rdname article
ims_article <- function(journal = c("aoas", "aap", "aop", "aos", "sts"),
                        keep_tex = TRUE, citation_package = "natbib",
                        md_extensions = c(
                          "-autolink_bare_uris" # disables automatic links
                        ), pandoc_args = NULL, ...) {
  journal <- match.arg(journal)

  with_kwsc <- journal %in% c("aap", "aop", "aos") # with keyword_subclass

  args <- c(
    "journal" = journal,
    if (with_kwsc) c("with_kwsc" = with_kwsc)
  )

  # Convert to pandoc arguments
  pandoc_arg_list <- vec_to_pandoc_variable_args(args)

  pdf_document_format(
    "ims",
    keep_tex = keep_tex, citation_package = citation_package,
    md_extensions = md_extensions, pandoc_args = c(pandoc_arg_list, pandoc_args),
    ...
  )
}

#' @section `informs_article`: Format for creating submissions to
#' INFORMS journals. Adapted from \samp{https://pubsonline.informs.org/authorportal/latex-style-files}.
#'
#' It requires a minimum version of 2.10 for Pandoc.
#' @export
#' @rdname article
informs_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  if (citation_package != "natbib") {
    stop("INFORMS template only supports `natbib` for citation processing.")
  }
  if (!rmarkdown::pandoc_available("2.10")) {
    stop("informs_article requires a minimum of pandoc 2.10.")
  }
  pdf_document_format(
    "informs",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section `iop_article`: Format for creating submissions to
#'   IOP journals. Adapted from \samp{https://publishingsupport.iopscience.iop.org/questions/latex-template/}.
#'   Please read the guidelines at this link when preparing your article.
#' @export
#' @rdname article
iop_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  pdf_document_format(
    "iop",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section `jasa_article`: Format for creating submissions to the
#'   Journal of the Acoustical Society of America. Adapted from
#'   <https://acousticalsociety.org/preparing-latex-manuscripts/>.
#' @export
#' @rdname article
jasa_article <- function(..., keep_tex = TRUE, latex_engine = "xelatex",
                         citation_package = "natbib") {
  pdf_document_format(
    "jasa",
    keep_tex = keep_tex, latex_engine = latex_engine,
    citation_package = citation_package, ...
  )
}

#' @section `lipics_article`: Format for creating submissions to
#'   LIPIcs - Leibniz International Proceedings Informatics - articles.
#'   Adapted from the official Instructions for Authors at
#'   <https://submission.dagstuhl.de/documentation/authors> and the
#'   template from the archive `authors-lipics-v2019.zip` downloaded
#'   with version tag v2019.2. The template is provided under The LaTeX
#'   Project Public License (LPPL), Version 1.3c.
#' @export
#' @rdname article
lipics_article <- function(..., latex_engine = "xelatex", # xelatex used for 'thin space' Unicode
                           # character, see YAML field 'authorrunning'
                           keep_tex = TRUE, citation_package = "natbib",
                           md_extensions = c(
                             "-autolink_bare_uris", # disables automatic links
                             "-auto_identifiers" # disables \hypertarget commands
                           )) {
  # quick dev shortcut for Ubuntu: click "Install and restart" then run:
  # unlink("MyArticle/", recursive = TRUE); rmarkdown::draft("MyArticle.Rmd", template = "lipics", package = "rticles", edit = FALSE); rmarkdown::render("MyArticle/MyArticle.Rmd"); system(paste0("xdg-open ", here::here("MyArticle", "MyArticle.pdf")))
  pdf_document_format(
    "lipics",
    latex_engine = latex_engine,
    citation_package = citation_package, keep_tex = keep_tex,
    md_extensions = md_extensions, ...
  )
}


#' @section `lncs_article`: Format for creating submissions to
#'   LNCS - Lecture Notes in Computer Science - articles.
#'   Adapted from the official Instructions for Authors at
#'   <https://www.springer.com/gp/computer-science/lncs/conference-proceedings-guidelines>
#'   and the  template from the archive `LaTeX2e+Proceedings+Templates+download.zip` downloaded
#'   with version tag 2.21.
#' @export
#' @rdname article
lncs_article <- function(..., keep_tex = TRUE, citation_package = c("default", "natbib")) {
  citation_package <- match.arg(citation_package)
  pdf_document_format("lncs", keep_tex = keep_tex, citation_package = citation_package, ...)
}


#' @section `jedm_article`: Format for creating Journal of Educational
#'   Data Mining (JEDM) articles. Adapted from
#'   <https://jedm.educationaldatamining.org/index.php/JEDM/information/authors>.
#' @export
#' @rdname article
jedm_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  pdf_document_format("jedm",
    keep_tex = keep_tex,
    citation_package = citation_package,
    ...
  )
}

#' @section `mdpi_article`: Format for creating submissions to
#'   Multidisciplinary Digital Publishing Institute (MDPI) journals. Adapted
#'   from <https://www.mdpi.com/authors/latex>.
#' @export
#' @rdname article
mdpi_article <- function(..., keep_tex = TRUE) {
  pdf_document_format(
    "mdpi",
    keep_tex = keep_tex, citation_package = "natbib", ...
  )
}

#' @section `mnras_article`: Format for creating an Monthly Notices of
#'   Royal Astronomical Society (MNRAS) Journal articles. Adapted from
#'   <https://ras.ac.uk>.
#' @export
#' @rdname article
mnras_article <- function(..., keep_tex = TRUE, fig_caption = TRUE) {
  pdf_document_format(
    "mnras",
    keep_tex = keep_tex, fig_caption = fig_caption, ...
  )
}

#' @section `peerj_article`: Format for creating submissions to The PeerJ
#'   Journal. This was adapted from the
#'   [PeerJ
#'    Overleaf Template](https://www.overleaf.com/latex/templates/latex-template-for-peerj-journal-and-pre-print-submissions/ptdwfrqxqzbn).
#' @export
#' @rdname article
peerj_article <- function(..., keep_tex = TRUE) {
  pdf_document_format("peerj", keep_tex = keep_tex, ...)
}

#' @section `pihph_article`: Format for creating submissions to the Papers
#'   in Historical Phonology
#'   (<http://journals.ed.ac.uk/pihph/about/submissions>). Adapted from
#'   <https://github.com/pihph/templates>. This format works well with
#'   `latex_engine = "xelatex"` and `citation_package="biblatex"`,
#'   which are the default. It may not work correctly if you change these value.
#'   In that case, please open an issue and, a PR to contribute a change in the
#'   template.
#' @export
#' @rdname article
pihph_article <- function(..., keep_tex = TRUE, latex_engine = "xelatex",
                          citation_package = "biblatex") {
  pdf_document_format(
    "pihph",
    keep_tex = keep_tex, latex_engine = latex_engine,
    citation_package = citation_package, ...
  )
}

#' @section `plos_article`: Format for creating submissions to PLOS
#'   journals. Adapted from <https://journals.plos.org/ploscompbiol/s/latex>.
#' @export
#' @rdname article
plos_article <- function(..., keep_tex = TRUE,
                         md_extensions = c("-autolink_bare_uris")) {
  pdf_document_format(
    "plos",
    keep_tex = keep_tex, md_extensions = md_extensions, ...
  )
}

#' @section `pnas_article`: Format for creating submissions to PNAS
#'   journals.
#' @export
#' @rdname article
pnas_article <- function(..., keep_tex = TRUE) {
  pdf_document_format("pnas", keep_tex = keep_tex, ...)
}

#' @section `sage_article`: Format for creating submissions to Sage
#'   Journals. Based on the official Sage Journals
#'   \verb{https://uk.sagepub.com/sites/default/files/sage_latex_template_4.zip}{class}.
#'
#' Possible arguments for the YAML header are:
#' * `title` title of the manuscript
#' * `runninghead` short author list for header
#' * `author` list of authors, containing `name` and `num`
#' * `address` list containing `num` and `org` for defining `author` affiliations
#' * `corrauth` corresponding author name and address
#' * `email` correspondence email
#' * `abstract` abstract, limited to 200 words
#' * `keywords` keywords for the article
#' * `bibliography` BibTeX `.bib` file name
#' * `classoption` options of the `sagej` class
#' * `header-includes`: custom additions to the header, before the `\begin{document}` statement
#' * `include-after`: for including additional LaTeX code before the `\end\{document}` statement
#' @export
#' @rdname article
sage_article <- function(..., highlight = NULL, citation_package = "natbib") {
  pdf_document_format(
    "sage",
    highlight = highlight, citation_package = citation_package, ...
  )
}

#' @section `sim_article`: Format for creating submissions to Statistics in
#'   Medicine. Based on the official Statistics in Medicine
#'   at `https://onlinelibrary.wiley.com/page/journal/10970258/homepage/la_tex_class_file.htm`.
#'
#' Possible arguments for the YAML header are:
#' * `title` title of the manuscript
#' * `author` list of authors, containing `name` and `num`
#' * `address` list containing `num` and `org` for defining `author` affiliations
#' * `presentaddress` not sure what they mean with this
#' * `corres` author and address for correspondence
#' * `authormark` short author list for header
#' * `received`, `revised`, `accepted` dates of submission, revision, and acceptance of the manuscript
#' * `abstract` abstract, limited to 250 words
#' * `keywords` up to 6 keywords
#' * `bibliography` BibTeX `.bib` file
#' * `classoption` options of the `WileyNJD-v2` class
#' * `longtable` set to `true` to include the `longtable` package, used by default from `pandoc` to convert markdown to LaTeX code
#' * `header-includes`: custom additions to the header, before the `\begin{document}` statement
#' * `include-after`: for including additional LaTeX code before the `\end{document}` statement
#' @export
#' @rdname article
sim_article <- function(..., highlight = NULL, citation_package = "natbib") {
  pdf_document_format(
    "sim",
    highlight = highlight, citation_package = citation_package, ...
  )
}

#' @section `springer_article`: This format was adapted from the Springer
#'   Macro package for Springer Journals.
#' @export
#' @rdname article
springer_article <- function(..., keep_tex = TRUE,
                             citation_package = "default") {
  pdf_document_format(
    "springer",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section `tf_article`: Format for creating submissions to a Taylor & Francis journal. Adapted from
#' \samp{https://www.tandf.co.uk/journals/authors/InteractCADLaTeX.zip}.
#' @export
#' @rdname article
tf_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  pdf_document_format(
    "tf",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section \code{trb_article}: Format for creating submissions to the Transportation
#'   Research Board Annual Meeting. Adapted from
#'   \samp{https://www.overleaf.com/latex/templates/transportation-research-board-trb-latex-template/jkfndnnkkksw},
#'   which in turn is hosted at \samp{https://github.com/chiehrosswang/TRB_LaTeX_tex}
#' @export
#' @rdname article
trb_article <- function(..., keep_tex = TRUE, citation_package = "natbib") {
  pdf_document_format(
    "trb",
    keep_tex = keep_tex, citation_package = citation_package, ...
  )
}

#' @section `wellcomeor_article`: Format for creating submissions to
#' Wellcome Open Research. Adapted from <overleaf.com/latex/templates/wellcome-open-research-article-template/hsmhhbpxvvbj>.
#' @export
#' @rdname article
wellcomeor_article <- function(..., number_sections = FALSE, keep_tex = TRUE,
                               citation_package = "natbib") {
  pdf_document_format(
    "wellcomeor",
    keep_tex = keep_tex, number_sections = number_sections,
    citation_package = citation_package, ...
  )
}

#' @section `isba_article`: Format for creating submissions to Bayesian analysis.
#' Based on the official Bayesian analysis [class](https://www.e-publications.org/isba/support/).
#' Template shows how to use this format as a base format for `bookdown::pdf_book`, but it can very well be used on its own (with limitations that figure referencing will not work).
#' Note that the template sets `md_extensions` to exclude `-autolink_bare_uris` because otherwise author emails produce error
#'
#' Possible arguments for the YAML header are:
#' * `title` title of the manuscript. Shorter version of the title can be provided as `runtitle`.
#' * `classoption` should equal `ba` or `ba,preprint` for supplementary article.``
#' * `author` list of authors, containing `firstname`, `lastname`, `email`, `url`, `affiliationref` (as code) and `footnoterefs` (as list of codes)
#' * `affiliations` list containing `ref` (code for defining `author` affiliations), institution `name` and `address` itself
#' * `footnotes` a list of two-element entries: `ref` and `text`
#' * `abstract` abstract, limited to 250 words
#' * `MSC2020primary`, `MSC2020primary` lists of codes from [MCS2020 database](https://mathscinet.ams.org/mathscinet/msc/msc2020.html)
#' * `keywords` a list of keywords
#' * `supplements` a list of entries with two elements `title` and `description`
#' * `doi` DOI of the article
#' * `arxiv` Arxiv id
#' * `acknowledgements` acknowledgement text, limited to 250 words
#' * `bibliography` BibTeX `.bib` file
#' * `longtable` set to `true` to include the `longtable` package, used by default from `pandoc` to convert markdown to LaTeX code
#' * `header-includes`: custom additions to the header, before the `\begin{document}` statement
#' * `include-after`: for including additional LaTeX code before the `\end{document}` statement
#' @export
#' @rdname article
isba_article <- function(..., keep_tex = TRUE, highlight = NULL, citation_package = "natbib") {
  if (citation_package != "natbib") {
    stop("ISBA template only supports `natbib` for citation processing.")
  }
  # from https://github.com/rstudio/rmarkdown/issues/372
  # md_extensions <- c("+ascii_identifiers", "+tex_math_single_backslash", "-autolink_bare_uris")
  if (!rmarkdown::pandoc_available("2.10")) {
    stop("`isba_article()` requires a minimum of pandoc 2.10.")
  }
  pdf_document_format(
    "isba",
    keep_tex = keep_tex, highlight = highlight, citation_package = citation_package, ...
  )
}
