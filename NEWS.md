rticles 0.11
---------------------------------------------------------------------

- Added the Journal of Open Source Software (and Education) template (@noamross, #229).

- Tweaked the `tf_article` template to avoid using absolute full paths for figures in the "Figures" section (@jooyoungseo, #246).

rticles 0.10
---------------------------------------------------------------------

- Support syntax highlighting in the `peerj_article()` format (@zkamvar, #238).

rticles 0.9
---------------------------------------------------------------------

- Added support for Keywords in IEEE Trans template (@espinielli, #227).

- Updated Statistics in Medicine template to its latest version (@ellessenne, #231).

- Update Copernicus Publications template to version 5.3 (@nuest, #228).

- Use csl file for citations in output format `elsevier_article()` (@nuest, #233)

rticles 0.8
---------------------------------------------------------------------

- Added the Taylor & Francis journal template (@dleutnant, #218).

- The top-level option `biblio-files` in the YAML frontmatter was changed to `bibliography` in the `elsevier_article()` template (@JohannesFriedrich, #222).

- Added header option `correspongdingauthors` to configure multiple corresponding authors for Copernicus Publications (@nuest, #221).

- Updated the template for MDPI to 02/2019 (@dleutnant, #203).

rticles 0.7
---------------------------------------------------------------------

- Added the template for the Frontiers Journals (@muschellij2, @zkamvar, #209).

- Added the template for the AGU Journals (thanks, @eliocamp, #199).

- Updated the template for PLOS to version 3.5 (thanks, @uvesten, #196).

- No longer hardcode the LaTeX engine to `xelatex` in `rsos_article()` (thanks, @bensprung, #198).

- Added an argument `pandoc_args` to `ieee_article()` so that users can pass custom Pandoc arguments. This also makes it work with `bookdown::pdf_book()` (thanks, @espinielli, #206).

- The `base_format` argument has been removed from `peerj_article()` (#127) and `copernicus_article()` (#172). This argument was originally added mainly for supporting `bookdown::pdf_book()`, but you should really pass these formats to the `base_format` argument of `bookdown::pdf_book` instead of the other way around. See https://bookdown.org/yihui/rmarkdown/rticles-bookdown.html.

- For output formats `acm_article()`, `acs_article()`, `ams_article()`, `mnras_article()`, the csl file should be specified as a top-level option in the YAML header of the document (this has been done in the R Markdown templates). It is no longer specified automatically by the output format functions.

- The function `ctex_template()` was removed. If you need to use a custom LaTeX template for the `ctex` output format, just use the `template` option under `ctex`.

rticles 0.6
---------------------------------------------------------------------

- Added the template for the SAGE Journals (thanks, @oguzhanogreden, #181).

- Added the template for Biometrics (thanks, @daltonhance, #170).

- Added the template for Copernicus Publications journals (thanks, @nuest, #172).

- Supports syntax highlighting in the `ieee_article()` and `acm_article()` formats (thanks, @rainer-rq-koelle, #182).

- Disabled syntax highlighting for `rjournal_article()` (thanks, @eddelbuettel, #185).

rticles 0.5
---------------------------------------------------------------------

- Added the template for the IEEE Transaction Journals (thanks, @Emaasit, #97).

- Added the PeerJ format (thanks, @zkamvar, #127).

- Added a template for the Royal Society Open Science Journal (thanks, @ThierryO, #135).

- Added a template for Bulletin de l'AMQ (thanks, @desautm, #145).

- Added the MDPI journal template (thanks, @dleutnant, #147).

- Added the Springer Journal Article template (thanks, @strakaps, #164).

- Added the template for MNRAS (Monthly Notices of the Royal Astronomical Society) articles (thanks, @oleskiewicz, #175).

- Fixed #6, #10, #49, #132, and #149: dollar signs and other special LaTeX characters such as `^` can be used in code chunks in JSS and R Journal articles now, but Pandoc 2.x will be required (you can use the Preview version of RStudio if you do not want to install Pandoc separately).

- Fixed #9: special characters such as spaces and underscores can be used in Rmd filenames for R Journal articles now.

- Fixed #71: bibliography is supported for The R Journal articles now.

- Supports breaking the JSS author list into multiple lines; see #100 for details.

rticles 0.4.1
---------------------------------------------------------------------

- Add Royal Society Open Science journal template

rticles 0.2.0.9000
---------------------------------------------------------------------

- Add Institute of Electrical and Electronics Engineers (IEEE) IEEEtrans
  template for Conferences


rticles 0.2
---------------------------------------------------------------------

- Add American Chemical Society (ACS) template

- Allow changing of documentclass and classoption for JSS articles

- Support bibliography for JSS articles (#63)

- Add tightlist macro to Elsevier skeleton

- Add address and footnote examples to Elsevier skeleton

- Fix preamble variable name in R Journal template


rticles 0.1
---------------------------------------------------------------------

- Initial release to CRAN
