% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tf_article.R
\name{tf_article}
\alias{tf_article}
\title{Taylor & Francis journals format}
\usage{
tf_article(
  ...,
  keep_tex = TRUE,
  citation_package = "natbib",
  reference_style = c("CAD", "APA", "NLM", "TFP", "TFQ", "TFS"),
  pandoc_args = NULL
)
}
\arguments{
\item{...}{Additional arguments to \code{\link[rmarkdown:pdf_document]{rmarkdown::pdf_document()}}}

\item{keep_tex}{Keep the intermediate tex file used in the conversion to PDF.
Note that this argument does not control whether to keep the auxiliary
files (e.g., \file{.aux}) generated by LaTeX when compiling \file{.tex} to
\file{.pdf}. To keep these files, you may set \code{options(tinytex.clean =
FALSE)}.}

\item{citation_package}{The LaTeX package to process citations, \code{natbib}
or \code{biblatex}. Use \code{default} if neither package is to be used,
which means citations will be processed via the command
\command{pandoc-citeproc}.}

\item{reference_style}{should be set according to the specific Taylor & Francis
journal. Possibles values: "APA" (American Psychological Association
reference style), "CAD" (Chicago Author-Date reference style), "NLM"
(National Library of Medicine reference style), "TFP" (Reference
Style-P), "TFQ" (Reference Style-Q), and "TFS" (Reference Style-S).}

\item{pandoc_args}{Additional command line options to pass to pandoc}
}
\description{
Format for creating submissions to many Taylor & Francis journals.
Adapted from:
\itemize{
\item \url{https://files.taylorandfrancis.com/InteractAPALaTeX.zip}
\item \url{https://files.taylorandfrancis.com/InteractCADLaTeX.zip}
\item \url{https://files.taylorandfrancis.com/InteractNLMLaTeX.zip}
\item \url{https://files.taylorandfrancis.com/InteractTFPLaTeX.zip}
\item \url{https://files.taylorandfrancis.com/InteractTFQLaTeX.zip}
\item \url{https://files.taylorandfrancis.com/InteractTFSLaTeX.zip}
}
}
\examples{
\dontrun{
rmarkdown::draft("MyArticle.Rmd", template = "tf", package = "rticles")
setwd("MyArticle")
rmarkdown::render("MyArticle.Rmd")
}
}
