
#' @section \code{ams_article}: Format for creating an American Meteorological
#'   Society (AMS) Journal articles. Adapted from
#'   \url{https://www.ametsoc.org/ams/index.cfm/publications/authors/journal-and-bams-authors/author-resources/latex-author-info/}.
#' @export
#' @rdname article
ams_article <- function(..., md_extensions = c("-autolink_bare_uris", "-auto_identifiers")) {
  base <- pdf_document_format(
    "ams", keep_tex = TRUE, md_extensions = md_extensions, citation_package = 'natbib', ...
  )


  base$knitr$knit_hooks$plot <- hook_plot_tex_appendix
  base
}



hook_plot_tex_appendix <- function (x, options) {
  # internal functions from knitr
  `%n%` <- function(x, y) if (is.null(x)) y else x

  is_tikz_dev <- function(options) {
    'tikz' %in% options$dev && !options$external
  }

  create_label <- function(..., latex = FALSE) {
    if (isTRUE(knitr::opts_knit$get('bookdown.internal.label'))) {
      lab1 = '(\\#'; lab2 = ')'
    } else if (latex) {
      lab1 = '\\label{'; lab2 = '}'
    } else {
      return('')  # we don't want the label at all
    }
    paste(c(lab1, ..., lab2), collapse = '')
  }

  pandoc_to <- function(x) {
    fmt = knitr::opts_knit$get('rmarkdown.pandoc.to')
    if (missing(x)) fmt else !is.null(fmt) && (fmt %in% x)
  }



  rw = options$resize.width
  rh = options$resize.height
  resize1 = resize2 = ""
  if (!is.null(rw) || !is.null(rh)) {
    resize1 = sprintf("\\resizebox{%s}{%s}{", rw %n% "!",
                      rh %n% "!")
    resize2 = "} "
  }
  tikz = is_tikz_dev(options)
  a = options$fig.align
  fig.cur = options$fig.cur %n% 1L
  fig.num = options$fig.num %n% 1L
  animate = options$fig.show == "animate"
  fig.ncol = options$fig.ncol %n% fig.num
  if (is.null(fig.sep <- options$fig.sep)) {
    fig.sep = character(fig.num)
    if (fig.ncol < fig.num)
      fig.sep[seq(fig.ncol, fig.num - 1L, fig.ncol)] = "\\newline"
  }
  sep.cur = NULL
  if (!tikz && animate && fig.cur < fig.num)
    return("")
  usesub = length(subcap <- options$fig.subcap) && fig.num >
    1
  ai = options$fig.show != "hold"
  plot1 = ai || fig.cur <= 1L
  plot2 = ai || fig.cur == fig.num
  align1 = if (plot1)
    switch(a, left = "\n\n", center = "\n\n{\\centering ",
           right = "\n\n\\hfill{}", "\n")
  align2 = if (plot2)
    switch(a, left = "\\hfill{}\n\n", center = "\n\n}\n\n",
           right = "\n\n", "")
  cap = options$fig.cap
  appendix = !is.null(options$appendix)
  scap = options$fig.scap
  fig1 = fig2 = ""
  mcap = fig.num > 1L && options$fig.show == "asis" && !length(subcap)
  sub1 = sub2 = ""
  if (length(cap) && !is.na(cap)) {
    lab = paste0(options$fig.lp, options$label)
    if (plot1) {
      pos = options$fig.pos
      if (pos != "" && !grepl("^[[{]", pos))
        pos = sprintf("[%s]", pos)
      fig1 = sprintf("\\begin{%s}%s", options$fig.env,
                     pos)
    }
    if (usesub) {
      sub1 = sprintf("\\subfloat[%s%s]{", subcap, create_label(lab,
                                                                       fig.cur, latex = TRUE))
      sub2 = "}"
      sep.cur = fig.sep[fig.cur]
      if (is.na(sep.cur))
        sep.cur = NULL
    }
    if (plot2) {
      if (is.null(scap) && !grepl("[{].*?[:.;].*?[}]",
                                  cap)) {
        scap = strsplit(cap, "[:.;]( |\\\\|$)")[[1L]][1L]
      }
      scap = if (is.null(scap) || is.na(scap))
        ""
      else sprintf("[%s]", scap)
      if (cap == "") {
        cap = ""
      } else if (appendix == TRUE) {
        cap = sprintf("\\appendcaption{%s}{%s}%s\n", options$label, cap, create_label(lab,
                                                                                              if (mcap)
                                                                                                fig.cur, latex = TRUE))
      } else {
        cap = sprintf("\\caption%s{%s}%s\n", scap, cap, create_label(lab,
                                                                             if (mcap)
                                                                               fig.cur, latex = TRUE))
      }
      fig2 = sprintf("%s\\end{%s}\n", cap, options$fig.env)
    }
  }
  else if (pandoc_to(c("latex", "beamer"))) {
    align.env = switch(a, left = "flushleft", center = "center",
                       right = "flushright")
    align1 = if (plot1)
      if (a == "default")
        "\n"
    else sprintf("\n\n\\begin{%s}", align.env)
    align2 = if (plot2)
      if (a == "default")
        ""
    else sprintf("\\end{%s}\n\n", align.env)
  }
  ow = options$out.width
  if (animate && identical(ow, "\\maxwidth"))
    ow = NULL
  if (is.numeric(ow))
    ow = paste0(ow, "px")
  size = paste(c(sprintf("width=%s", ow), sprintf("height=%s",
                                                  options$out.height), options$out.extra), collapse = ",")
  paste0(fig1, align1, sub1, resize1, if (tikz) {
    sprintf("\\input{%s}", x)
  }
  else if (animate) {
    aniopts = options$aniopts
    aniopts = if (is.na(aniopts))
      NULL
    else gsub(";", ",", aniopts)
    size = paste(c(size, sprintf("%s", aniopts)), collapse = ",")
    if (nzchar(size))
      size = sprintf("[%s]", size)
    sprintf("\\animategraphics%s{%s}{%s}{%s}{%s}", size,
            1/options$interval, sub(sprintf("%d$", fig.num),
                                    "", xfun::sans_ext(x)), 1L, fig.num)
  }
  else {
    if (nzchar(size))
      size = sprintf("[%s]", size)
    res = sprintf("\\includegraphics%s{%s} ", size, if (getOption("knitr.include_graphics.ext",
                                                                  FALSE))
      x
      else xfun::sans_ext(x))
    lnk = options$fig.link
    if (is.null(lnk) || is.na(lnk))
      res
    else sprintf("\\href{%s}{%s}", lnk, res)
  }, resize2, sub2, sep.cur, align2, fig2)
}
