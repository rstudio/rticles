% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ieee_article.R
\name{ieee_article}
\alias{ieee_article}
\title{IEEE Transactions journal format.}
\usage{
ieee_article(
  draftmode = c("final", "draft", "draftcls", "draftclsnofoot"),
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
  ...
)
}
\arguments{
\item{draftmode}{Specify the draft mode to control spacing and whether images
should be rendered. Valid options are: \code{"final"} (default), \code{"draft"},
\code{"draftcls"}, or \code{"draftclsnofoot"}.}

\item{hyphenfixes}{A \code{character} value that provides the correct
hyphenations for ambiguous words. Separate new words with spaces.}

\item{IEEEspecialpaper}{A \code{character} value containing the publication's
special paper designation.}

\item{with_ifpdf}{A \code{logical} value turning on (\code{TRUE}) or off
(\code{FALSE}) the \code{ifpdf} LaTeX package.}

\item{with_cite}{A \code{logical} value turning on (\code{TRUE}) or off
(\code{FALSE}) the \code{cite} LaTeX package.}

\item{with_amsmath}{A \code{logical} value turning on (\code{TRUE}) or off
(\code{FALSE}) the \code{amsmath} LaTeX package.}

\item{with_algorithmic}{A \code{logical} value turning on (\code{TRUE}) or
off (\code{FALSE}) the \code{algorithmic} LaTeX package.}

\item{with_subfig}{A \code{logical} value turning on (\code{TRUE}) or off
(\code{FALSE}) the \code{subfig} LaTeX package.}

\item{with_array}{A \code{logical} value turning on (\code{TRUE}) or off
(\code{FALSE}) the \code{array} LaTeX package.}

\item{with_dblfloatfix}{A \code{logical} value turning on (\code{TRUE}) or
off (\code{FALSE}) the \code{dblfloatfix} LaTeX package.}

\item{keep_tex}{Keep the intermediate tex file used in the conversion to PDF.
Note that this argument does not control whether to keep the auxiliary
files (e.g., \file{.aux}) generated by LaTeX when compiling \file{.tex} to
\file{.pdf}. To keep these files, you may set \code{options(tinytex.clean =
FALSE)}.}

\item{pandoc_args}{Additional command line options to pass to pandoc}

\item{md_extensions}{Markdown extensions to be added or removed from the
default definition of R Markdown. See the \code{\link[rmarkdown]{rmarkdown_format}} for
additional details.}

\item{...}{Additional arguments to \code{\link[rmarkdown:pdf_document]{rmarkdown::pdf_document()}}}
}
\description{
Format for creating submissions to IEEE Transaction journals. Adapted from
\url{https://www.ieee.org/publications_standards/publications/authors/author_templates.html}
}
\details{
Presently, only the \code{"conference"} paper mode offered by the
\code{IEEEtran.cls} is supported.
}
\references{
Shell, Michael. "How to use the IEEEtran LATEX class." Journal of LATEX Class
Files 1.11 (2002): 10-20.
\url{http://mirrors.rit.edu/CTAN/macros/latex/contrib/IEEEtran/IEEEtran_HOWTO.pdf}
}
