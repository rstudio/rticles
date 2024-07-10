#' Science Journal Format
#'
#' Format for creating submissions to Science. Based on the Science
#' [class](https://www.sciencemag.org/site/feature/contribinfo/prep/TeX_help/#downloads).
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Additional arguments to [rmarkdown::pdf_document()]
#' @param move_figures set to `TRUE` to move figures to end. Default is `TRUE`. Only
#' works when `draft == TRUE`.
#' @param move_tables set to `TRUE` to move tables to end. Default is `TRUE`. Only
#' works when `draft == TRUE`.
#' @param draft set to `TRUE` for the draft version or `FALSE` for a
#' final submission version. `TRUE` moves the supplemental
#' materials to its own file.
#' @md
#' @export
science_article <- function(..., keep_tex = TRUE, move_figures = TRUE,
                            move_tables = TRUE, number_sections = FALSE,
                            draft = TRUE) {
  base <- pdf_document_format(
    "science", keep_tex = keep_tex, number_sections = number_sections, ...
  )

  # Build from the rjournal_article post processing
  base$pandoc$to <- "latex"
  base$pandoc$ext <- ".tex"

  # Process authors;
  # if version == 'draft' move figures/tables to the end; Remove Section Numbers
  # if version == 'final', save each figure/table in a separate PDF &
  # Also the Supplementary materials must be in a separate PDF
  base$post_processor <- function(metadata, utf8_input, output_file, clean, verbose) {
    filename <- basename(output_file)
    # underscores in the filename will be problematic in \input{filename};
    # pandoc will escape underscores but it should not, i.e., should be
    # \input{foo_bar} instead of \input{foo\_bar}
    if (filename != (filename2 <- gsub('_', '-', filename))) {
      file.rename(filename, filename2); filename <- filename2
    }

    # post process TEX file
    temp_tex <- xfun::read_utf8(filename)
    temp_tex <- post_process_authors_and(temp_tex)
    if (isTRUE(draft)) {
      if (move_figures) {
        temp_tex <- relocate_figures(temp_tex)
      }
      if (move_tables) {
        temp_tex <- relocate_tables(temp_tex)
      }
    } else {
      temp_tex <- separate_appendix(output_file, temp_tex, number_sections)

      # Build Supplement
      if (file.exists(paste0('supplement_', output_file))){
        tinytex::latexmk(paste0('supplement_', filename),
                         base$pandoc$latex_engine, clean = clean)
      }
    }

    if (!number_sections) {
      temp_tex <- unnumber_sections(temp_tex)
    }

    xfun::write_utf8(temp_tex, filename)

    tinytex::latexmk(filename, base$pandoc$latex_engine, clean = clean)
  }

  base
}

# Science Specific Helpers ----
relocate_figures <- function(text) {
  # locate where the figures are; check count
  starts <- grep('\\\\begin\\{figure\\}', text)
  ends <- grep('\\\\end\\{figure\\}', text)
  if (length(starts) != length(ends)) {
    warning("It appears that you have a figure that doesn't start and/or end properly",
            "Moving figures to end is cancelled.", call. = FALSE)
    return(text)
  }

  # exit if no figures to move
  if (length(starts) == 0) {
    return(text)
  }

  # check for appendix; subset; recheck count
  appendix <- c(grep('\\\\appendix', text), grep('\052\\{\\(APPENDIX\\) Appendix\\}\\\\', text))
  if (length(appendix) > 0){
    appendix <- min(appendix)
    starts <- starts[starts < appendix]
    ends <- ends[ends < appendix]
    if (length(starts) != length(ends)) {
      warning("It appears there is a call to \\appendix within a figure environment.",
              "Moving figures to end is cancelled.", call. = FALSE)
      return(text)
    }
  }

  # Add notes to where things go.
  for (i in seq_along(starts)) {
    fig_marker <- paste('(Figure', i, 'goes about here.)')
    text <- append(text, values = fig_marker, after = starts[i] - 1)
    starts[seq_along(starts) >= i] <- starts[seq_along(starts) >= i] + 1L
  }

  # update indices
  starts <- grep('\\\\begin\\{figure\\}', text)
  ends <- grep('\\\\end\\{figure\\}', text)
  appendix <- c(grep('\\\\appendix', text), grep('\052\\{\\(APPENDIX\\) Appendix\\}\\\\', text))
  if (length(appendix) > 0){
    appendix <- min(appendix)
    starts <- starts[starts < appendix]
    ends <- ends[ends < appendix]
  }

  # extract figures from tex; add guide to start
  fig_index <- lapply(seq_along(starts), function(x){starts[x]:ends[x]})
  fig_tex <- lapply(fig_index, function(x){text[x]})

  # Add a blank line after to use for injecting:
  fig_tex <- lapply(fig_tex, function(x){c(x, '')})

  # subset
  text <- text[-unlist(fig_index)]

  # locate where the figures should go; check distance
  start_enter <- grep('%%%begfigs---', text)
  end_enter <- grep('%%%endfigs---', text)
  if (end_enter - start_enter != 2) {
    warning("Text may not contain `%%%begfigs---` or `%%%endfigs---`.",
            "Moving figures to end is cancelled.", call. = FALSE)
    return(text)
  }

  # template requires LaTeX placeins for this:
  # ensures figures start on a new page and can't jump up in space
  text <- append(text, '\\FloatBarrier', after = start_enter - 1)
  text <- append(text, '\\newpage', after = start_enter)
  start_enter <- start_enter + 2L

  # inject
  for (i in seq_along(fig_tex)) {
    text <- append(text, fig_tex[[i]], after = start_enter)
    start_enter <- start_enter + length(fig_tex[[i]])
  }

  # now process appendix ----
  main_enter <- grep('%%%begfigs---', text)
  start_enter <- grep('%%%begappxfigs---', text)
  end_enter <- grep('%%%endappxfigs---', text)
  if (end_enter - start_enter != 2) {
   warning("Text may not contain `%%%begappxfigs---` or `%%%endappxfigs---`.",
           "Moving figures to end is cancelled.", call. = FALSE)
   return(text)
  }

  starts <- grep('\\\\begin\\{figure\\}', text)
  ends <- grep('\\\\end\\{figure\\}', text)

  if (length(appendix) > 0) {
    starts <- starts[starts < main_enter]
    ends <- ends[ends < main_enter]
  }

  # extract figures from tex; add guide to start
  fig_index <- lapply(seq_along(starts), function(x){starts[x]:ends[x]})
  fig_tex <- lapply(fig_index, function(x){text[x]})

  # Add a blank line after to use for injecting:
  fig_tex <- lapply(fig_tex, function(x){c(x, '')})

  # subset
  text <- text[-unlist(fig_index)]

  # relocate reference
  start_enter <- grep('%%%begappxfigs---', text)

  # ensures figures start on a new page and can't jump up in space
  text <- append(text, '\\FloatBarrier', after = start_enter - 1)
  text <- append(text, '\\newpage', after = start_enter)
  start_enter <- start_enter + 2L

  # inject
  for (i in seq_along(fig_tex)) {
    text <- append(text, fig_tex[[i]], after = start_enter)
    start_enter <- start_enter + length(fig_tex[[i]])
  }

  text
}

relocate_tables <- function(text) {
  # locate where the tables are; check count
  starts <- grep('\\\\begin\\{table\\}', text)
  ends <- grep('\\\\end\\{table\\}', text)
  if (length(starts) != length(ends)) {
    warning("It appears that you have a table that doesn't start properly or end properly",
            "Moving tables to end is cancelled.", call. = FALSE)
    return(text)
  }

  # exit if no tables to move
  if (length(starts) == 0) {
    return(text)
  }

  # check for appendix; subset; recheck count
  appendix <- c(grep('\\\\appendix', text), grep('\052\\{\\(APPENDIX\\) Appendix\\}\\\\', text))
  if (length(appendix) > 0){
    appendix <- min(appendix)
    starts <- starts[starts < appendix]
    ends <- ends[ends < appendix]
    if (length(starts) != length(ends)) {
      warning("It appears there is a call to \\appendix within a table environment.",
              "Moving tables to end is cancelled.", call. = FALSE)
      return(text)
    }
  }

  # Add notes to where things go.
  for (i in seq_along(starts)) {
    tab_marker <- paste('(Table', i, 'goes about here.)')
    text <- append(text, values = tab_marker, after = starts[i] - 1)
    starts[seq_along(starts) >= i] <- starts[seq_along(starts) >= i] + 1L
  }

  # update indices
  starts <- grep('\\\\begin\\{table\\}', text)
  ends <- grep('\\\\end\\{table\\}', text)
  appendix <- c(grep('\\\\appendix', text), grep('\052\\{\\(APPENDIX\\) Appendix\\}\\\\', text))
  if (length(appendix) > 0){
    appendix <- min(appendix)
    starts <- starts[starts < appendix]
    ends <- ends[ends < appendix]
  }

  # extract tables from tex; add guide to start
  tab_index <- lapply(seq_along(starts), function(x){starts[x]:ends[x]})
  tab_tex <- lapply(tab_index, function(x){text[x]})

  # Add a blank line after to use for injecting:
  tab_tex <- lapply(tab_tex, function(x){c(x, '')})

  # subset
  text <- text[-unlist(tab_index)]

  # locate where the tables should go; check distance
  start_enter <- grep('%%%begtabs---', text)
  end_enter <- grep('%%%endtabs---', text)
  if (end_enter - start_enter != 2) {
    warning("Text may not contain `%%%begtabs---` or `%%%endtabs---`.",
            "Moving tables to end is cancelled.", call. = FALSE)
    return(text)
  }

  # template requires LaTeX placeins for this:
  # ensures tables start on a new page and can't jump up in space
  text <- append(text, '\\FloatBarrier', after = start_enter - 1)
  text <- append(text, '\\newpage', after = start_enter)
  start_enter <- start_enter + 2L

  # inject
  for (i in seq_along(tab_tex)) {
    text <- append(text, tab_tex[[i]], after = start_enter)
    start_enter <- start_enter + length(tab_tex[[i]])
  }

  # now process appendix ----
  main_enter <- grep('%%%begtabs---', text)
  start_enter <- grep('%%%begappxtabs---', text)
  end_enter <- grep('%%%endappxtabs---', text)
  if (end_enter - start_enter != 2) {
    warning("Text may not contain `%%%begappxtabs---` or `%%%endappxtabs---`.",
            "Moving tables to end is cancelled.", call. = FALSE)
    return(text)
  }

  starts <- grep('\\\\begin\\{table\\}', text)
  ends <- grep('\\\\end\\{table\\}', text)

  if (length(appendix) > 0) {
    starts <- starts[starts < main_enter]
    ends <- ends[ends < main_enter]
  }

  # extract tables from tex; add guide to start
  tab_index <- lapply(seq_along(starts), function(x){starts[x]:ends[x]})
  tab_tex <- lapply(tab_index, function(x){text[x]})

  # Add a blank line after to use for injecting:
  tab_tex <- lapply(tab_tex, function(x){c(x, '')})

  # subset
  text <- text[-unlist(tab_index)]

  # relocate reference
  start_enter <- grep('%%%begappxtabs---', text)

  # ensures tables start on a new page and can't jump up in space
  text <- append(text, '\\FloatBarrier', after = start_enter - 1)
  text <- append(text, '\\newpage', after = start_enter)
  start_enter <- start_enter + 2L

  # inject
  for (i in seq_along(tab_tex)) {
    text <- append(text, tab_tex[[i]], after = start_enter)
    start_enter <- start_enter + length(tab_tex[[i]])
  }

  text
}

separate_appendix <- function(output_file, text, number_sections) {
  # locate key points
  begin_doc <- grep('\\\\begin\\{document\\}', text)
  biblio <- grep('\\\\bibliography\\{references.bib\\}', text)
  appendix <- c(grep('\\\\appendix', text), grep('\052\\{\\(APPENDIX\\) Appendix\\}\\\\', text))
  end_doc <- grep('\\\\end\\{document\\}', text)

  if (length(appendix) == 0) {
    return(text)
  }
  # separate
  main_text <- text[c(1:(appendix-2), biblio:end_doc)]
  appx_text <- text[c(1:(begin_doc), (appendix-1):(biblio - 1), end_doc)]

  fix_appx_title <- c(grep('\\\\appendix', appx_text),
                      grep('\052\\{\\(APPENDIX\\) Appendix\\}\\\\', appx_text))

  appx_text[(fix_appx_title-1):(fix_appx_title+1)] <- c(
    '\\maketitle', '\\section*{Supplementary Text}',
    '\\renewcommand{\\thesection}{S\\arabic{section}}'
    )

  appx_text <- remove_authors_affiliations(appx_text)

  if (!number_sections) {
    appx_text <- unnumber_sections(appx_text)
  }

  # write supplement
  xfun::write_utf8(appx_text, con = paste0('supplement_', output_file))

  # return main text for further processing
  main_text
}



post_process_authors_and <- function(text) {
  i1 <- grep("^\\\\author\\{", text)
  if (length(i1) == 0L)
    return(text)
  if (length(i1) > 1L) {
    warning("There should be only one instance of '\\author{}' in the tex file.",
            "Post-processing \\author{} is cancelled.", call. = FALSE)
    return(text)
  }

  i2 <- grep("\\\\\\\\$", text)
  i2 <- i2[i2 >= i1][1]
  i <- (i1+1):(i2-1)

  # locate commas
  text[i2 - 1] <- sub(pattern = ",", "",text[i2 - 1])

  # if multiple authors, add and
  if (length(i) > 1) {
    text[i2 - 1] <- paste("and", text[i2 - 1])
  }

  # if 3 or less, no need to break lines
  if (length(i) <= 3) {
    return(text)
  }

  # otherwise need to clean up spacing
  add_spaces <- i[seq(1, length(i), by = 3)[-1] - 1]
  for (i in seq_along(add_spaces)) {
    text[add_spaces[i]] <- paste0(text[add_spaces[i]], "\\\\")
  }

  text
}

remove_authors_affiliations <- function(text) {
  i1 <- grep("^\\\\author\\{", text)
  if (length(i1) == 0L)
    return(text)
  if (length(i1) > 1L) {
    warning("There should be only one instance of '\\author{}' in the tex file.",
            "Post-processing \\author{} is cancelled.", call. = FALSE)
    return(text)
  }

  i2 <- which(text == '}')
  i2 <- i2[i2 >= i1][1]

  corr_aut <- grep('\\\\textsuperscript\\{\\*\\}', text)

  text[i1:(corr_aut[2] - 1)] <- gsub('\\\\textsuperscript\\{(.*)\\}', '', text[i1:(corr_aut[2]-1)])
  text[i1:(corr_aut[2] - 1)] <- gsub('\\\\normalsize\\{.*', '', text[i1:(corr_aut[2]-1)])

  text[corr_aut[1]] <- paste0(text[corr_aut[1]], '\\textsuperscript{*}')

  text[i1:(corr_aut[2] - 1)] <- ifelse(text[i1:(corr_aut[2] - 1)] == '\\\\', '',
                                       text[i1:(corr_aut[2] - 1)])
  text[corr_aut[2]] <- paste0('\\\\', text[corr_aut[2]])

  # remove newly created empty lines
  empty_lines <- which(text == '')
  empty_lines <- empty_lines[empty_lines %in% i1:(corr_aut[2] - 1)]

  text <- text[-empty_lines]

  text
}
