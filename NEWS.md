rticles 0.17
---------------------------------------------------------------------

- Fixes `arxiv_article()` template when adding graphics from code chunks (thanks, @Athanasiamo, #332).

- Fixes `ams_article()` template regarding authors insertion (thanks, @ConorIA, #340).

- Update Copernicus Publications template to version 6.0 and sanitize and issue that caused `pdftex` from hanging (thanks, @RLumSK, #331).

- Add `CSLReferences` environment to support new Pandoc 2.11 citation processing (#335).

- Add article template `lipics_article()` for *Leibniz International Proceedings in Informatics* (LIPIcs) (thanks, @nuest, #288).

rticles 0.16
---------------------------------------------------------------------

- Fixed `ctex_article()` to correctly use the default Pandoc template as intended in the PR #307, which introduced the bug #322 (thanks, @baketbek @cderv #323).

- The minimal version of **knitr** required is 1.30 now.

rticles 0.15
---------------------------------------------------------------------

- Added a new `journals()` function to list all available journal names in this package (#318).

- Template directory in package's `rmarkdown/templates` directory has been renamed from _journalname_article_ to _journalname_. To create a new document using `rmarkdown::draft`, only the _journalname_  should be provided, i.e., `rmarkdown::draft("MyArticle.Rmd", template = "rjournal", package = "rticles")` (#316).

- Improved the `rjournal_article()` format : `.tex`, `.R`, and PDF files with correct names are generated to match the author's guidelines, two affiliations is now supported for authors, the last author is separated by `and` when multiple authors are present, and the documentation has been improved on the help page `?rticles::rjournal_article` and in the skeleton document (thanks, @RLumSK, #286).

- Added a `author.affiliation2` field in `jss_article()` template to provide another affiliation to be used in the adress field in place of `author.affiliation`. This allow differently formatted affiliation for example (thanks, @aldomann, #291).

- Improved the `jss_article()` format: Short titles can now be provided to headers to escape code/math in section titles, the continuation prompt has been corrected (from `R+` to `+`), and the skeleton document has been updated accordingly (thanks, @statibk #254, @Freguglia #294).

- Fixed `elsevier_article()` template so that chunk option `out.width` can be set (thanks, @EddieItelman, #300).

- Fixed `pnas_journal()` skeleton to show how correctly add `corresponding_author` and `equal_author` (thanks, @EddieItelman, #299).

- Added article template for journal *Bioinformatics* (thanks, @ShixiangWang, #297).

- Update Copernicus Publications template to version 5.8 (thanks, @nuest, #274).

- Fixed issue with multi-line authors on JSS template when using `\AND`, which was firstly implemented in b740b19b90cd6f7afe2cd7d66456c9efa0bb4cdf (thanks, @aldomann, #292).

- Added the missing support for `header-includes` to the Biometrics template (thanks, @haozhu233, #296).

- Added support for George Kour's arXiv preprint format (thanks, @alexpghayes, #236).

- Update to OUP format for `knitr::kable` table generation and optionally placing floats at end of document (thanks, @dmkaplan2000, #279).

- Update to OUP format to use `pandoc-citeproc` by default for citations (thanks, @dmkaplan2000, #289).

- Deleted the LaTeX template of the `rticles::ctex` format. This format will use Pandoc's built-in template instead, which works well with the LaTeX package **ctex** (thanks, @XiangyunHuang, #307).

- Added the output format `rticles::ctex_article` as an alias to `rticles::ctex`, to be consistent with the names of other `*_article` formats.

rticles 0.14
---------------------------------------------------------------------

- Added custom author ordering for the IEEE template (thanks, @DunLug, #263).

- Added a multi-line authoring option in the IEEE template (thanks, @DunLug, #264).

- Added the `citation_sorting` YAML option to change the biblatex's sorting option in `ieee_article()` output (thanks, @DunLug, #265).

- `mnras.cls` was removed from this package because it exists on CTAN.

- Added Oxford University Press (OUP) template (thanks, @dmkaplan2000, #271).

rticles 0.13
---------------------------------------------------------------------

- Added the `cslreferences` environment to all templates (thanks, @bbauzile, #260).

- Updated the template for `elsevier_article()` to allow for two authors to share the same footnote (e.g. "these authors made equal contributions") and updated the corresponding skeleton to demonstrate how to use a shared footnote (thanks, @salauer, #255).

- Fixed header includes for `rjournal_article()` (thanks, @agila5 #257, @rcannood #261).

- Add support for bibliography styles on the Springer template (thanks, @swhaat, #262).

rticles 0.12
---------------------------------------------------------------------

- Updated the `pnas_article()` document class from the PNAS website https://www.pnas.org/page/authors/latex (#21).

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

- Use csl file for citations in output format `elsevier_article()` (@nuest, #233).

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
