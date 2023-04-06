# rticles (development version)

## BREAKING CHANGES

- `ajs_article()` and `jss_article()` require Pandoc 2.7+ (possibly required by some changes in `jss.cls`)

## NEW FEATURES

- `ieee_article()` now supports several affiliations per `authors` when using the `wide: true` mode (thanks, @phamdn, #500)

## MINOR CHANGES

- Improve `elsevier_article()` affilliations for authors by supporting same fields as in official template. This also fix address with comma not showing (thanks, @gjpstrain, @mps9506, #509).

- Update `RJournal.sty` to latest version to support number sections (thanks, @zeileis, #517).

- Update to the `asa_article()` format (thanks, @ianmtaylor1 #506, @jepusto, #507):
    - Better support for `natbib` to tweak option and biblio-style using Pandoc's variables
    - Update to template following the guidelines
    - Better support for links in template to be closer to guidelines
    
## BUG FIXES

- Template internal change: `lineno` CTAN package is now loaded after `amsmath` in `peerj_article()`, `elsevier_article()` and `mdpi_article()` because of a conflict with last version of `lineno` (thanks, @bischrob, #513). 

- Update Copernicus Publications template to version 7.3 from 2023-03-17 (@RLumSK, #508, #514, #519)

# rticles 0.24

## NEW FEATURES

- New `lncs_article()` template for submissions to Lecture Notes in Computer Science (thanks, @eliocamp, #445).

## BUG FIXES

- Remove `\usepackage{utf8x}` usage by default in `plos_article()` TeX template as it conflicts with recent `latex2e`. As it is in the official PLS journal template, it is not removed completely but opt-out by default. Use `with_utf8x` pandoc variable in YAML to opt-in again if you want to deal with the conflict differently (thanks, @Sciurus365, #496).

- Update `glossa_article()` and path template to opt-out using `microtype` to prevent issues. Add it back using `extra_dependencies` in YAML with adding a preamble if needed (thanks, @stefanocoretta, #487).

- In `elsevier_article()`, corresponding author is correctly marked with a `*` even if no other footnote are set on the author.

- `ams_article()` bundles `ametsoc.cls` now as **ametsoc** package is not more available on CTAN.

- Nested code chunk in list are now correctly rendered in `jss_article()` (thanks, @nbenn, #476).

## MINOR CHANGES

- Update Copernicus Publications template to version 6.8 from 2022-03-28 (@RLumSK, #478, #479).

- Update `rjournal_article()` template to match current style file. Package and task view macros use secure links, and the footer includes the year (@mitchelloharawild)

- Updates to Pandoc's template following recent change with new Pandoc version in relevant templates.

# rticles 0.23

## BREAKING CHANGE

- Update Elsevier template and of `elsarticle.cls` to version 3.3 in `elsevier_article()`. This is a breaking change in the format that now **requires at least Pandoc 2.10** and uses the latest version of the `.cls` file, also provided in [elsarticle](https://ctan.org/pkg/elsarticle) on CTAN. See the included template for this format. Also, `natbib` is now used y default for citation processing. You can use [**renv**](https://pkgs.rstudio.com/renv/) to manage your project in locked environment of packages  (thanks, @robjhyndman, #467).

## NEW FEATURES

- Update `jss_article()` template to handle ORCID links for each author from  a new YAML field, and to use updated `jss.cls` class file (thanks, @remlapmot, #465).

- New `informs_article()` template for submissions to INFORMS journals (thanks, @robjhyndman, #460).

- New `iop_article()` template for submissions to IOP journals (thanks, @robjhyndman, #462).

- New `isba_article()` template for submissions to Bayesian Analysis journal (thanks, @dmi3kno, #461).

## MINOR CHANGES

- Update Copernicus Publications template to version 6.6 from 2022-01-18 (@RLumSK, #463, #464).

- `rss_article()` now supports more than two authors using usual YAML list syntax in the new `authors` field. Old `author` and `author2` are kept for backward compatibility, but we advice any user to use the new formats. See update Rmd skeleton template (thanks, @dmi3kno, #466).

## BUG FIXES

- `graphicx` LaTeX package has been added to `ieee_article()` format (thanks, Sachin Hebbar, [on RStudio Community](https://community.rstudio.com/t/inserting-figures-in-rticles-ieee-transaction-template/129325)).

# rticles 0.22

## BREAKING CHANGE

- `oup_article()` template has been updated to include the possibility of using the latest OUP authoring template now available on CTAN. It is still possible to use old `.cls` file as some journals still depend on it. `oup_version` will now control if the old version (`oup_version = 0`) or the new version is to be used (`oup_version = 1`). For this version, `oup_version = 0` is the default. See `?rticles::oup_article()` for links to resources. The bundled Rmd template has also evolved. Use `oup_v0` or `oup_v1` as template name - Easiest way to create the template still remains using the RStudio IDE. `oup_version = 1` comes with a requirement of Pandoc 2.10 minimum. (thanks, @dmkaplan2000, #431)

## NEW FEATURES

- New `trb_article()` for annual meeting submissions to the Transportation Research Board Annual Meeting (thanks, @gregmacfarlane, #427).

- New `wellcomeor_article()` for Wellcome Open Research articles (thanks, @arnold-c, #436).

## MAJOR CHANGES

- Update Copernicus Publications template to version 6.4 from 2021-08-16 (thanks, @RLumSK, #446).

- `glossa_article()` is incompatible with `microtype` CTAN package for now. When TinyTeX is used, it will be uninstalled before rendering.

- All template were updated to include parts required by some Pandoc feature when they are used: highlighting, CSL & citation processing, include before, after and in header, Pandoc's markdown tables. Checks are now included in CI test so that new template missing these parts are detected.

- Fixed an issue with `microtype` CTAN package in `amq_article()` by patching the template until upstream issue if 
fixed. 

## MINOR CHANGES

- `sage_article()` now correctly set cite style in template to use comma to match the Sage Havard style per Journal's guideline (thanks, @MalteHueckstaedt, #447).

- Add `copyrightyear` and `pubyear` variable in `bioinformatics_article()` (thanks, @stephenturner, #424). 

# rticles 0.21

## NEW FEATURES

- New `jedm_article()` for the Journal of Educational Data Mining template (thanks, @jooyoungseo, #251).

- New `ajs_article()` for *Austrian Journal of Statistics* (thanks, @matthias-da, #437).

- New `glossa_article()` for articles of [Glossa: a journal of general linguistics](https://www.glossa-journal.org/) (thanks, @stefanocoretta, #361).

## MAJOR CHANGES

- Since **rticles** 0.15, per requirement with R Journal, `rjournal_article()` uses `knitr::purl()` to produce a R file with the code from the Rmd file. Last version eagerly overwrites any existing R file with the same name as the purled file. From now on, if a `.R` already exists with the name of the output, it won't be overwritten anymore, and not purled file will be outputted. This prevent issue with users maintaining themselves their own R file to accompany the article. A warning is issued to remind of deleting the existing R file is one want to use the purled R file (thanks, @Enchufa2, #433).

- Update Copernicus Publications template to version 6.3 from 2021-07-08 (thanks, @RLumSK, #432).

## MINOR CHANGES

- All templates have now the `$highlighting-macros$` variables required for Pandoc highlighting (#435).

- Template for `tf_article()` gains a `classoption` variable (thanks, @statzhero, #434).

- Add the fenced div with id `#refs` in `frontiers_article()` skeleton to place the reference section in the correct expected place (thanks, @graysonwhite, #423).

- `bioinformatics_article()` now separates `manuscript_type` (e.g., Applications note, Original article) and `subject_section` (e.g. Genome analysis, Phylogenetics) in template and skeleton (thanks, @stephenturner, #415)

- For contributors to this package: Markdown syntax is now used with **roxygen2** to document R functions. Refer to formating rules on [**roxygen2** website](https://roxygen2.r-lib.org/articles/rd-formatting.html)

## BUG FIXES

- `bioinformatics_article()` has no more trailing comma after last author (thanks, @stephenturner, #413).

- Fix an issue with `elsevier_article()` and table produced by RStudio Visual Editor. The template gains some packages for allowing grid table in Markdown (thanks, @ccamara, #421)

# rticles 0.20

- `lipics_article()` skeleton now sets option `bookdown.theorem.preamble` to FALSE to work with `bookdown::pdf_book()` and avoid conflicts in theorem environment definition. This requires **bookdown** 0.23 or higher (#392).

- `oup_article()` template now largely compatible to that of `elsevier_article()` (thanks, @dmkaplan2000, #403)

- `elsevier_article()` now supports `biblio-style` Pandoc's variable to set the natbib bibliography style in YAML header (thanks, @gregmacfarlane, #402).

- Fix an issue with `rjournal_article()`. The `.R` file in output is now correctly overwritten on a new render if it existed from a previous render (thanks, @apreshill, #394).

- Update Copernicus Publications template to comply with editor's guidelines following a manuscript bounce back during the typesetting step. Copernicus does not allow to add any `\usepackage` command as they all are included in `copernicus.cls` for supported LaTeX packages. **This is leading to breaking changes with existing template - please follow the advice below**.
  - `algorithms: true` cannot be used anymore and as no more effect. `\usepackage{algorithmic}` and `\usepackage{algorithm}` has been removed from the template as the command are already done in `copernicus.cls`. Please, make sure `algorithms` and `algorithmcx` are installed.  
  - Additionally, the template gained support for the `highlight` parameter of [rmarkdown::pdf_document()] to enable or disable syntax highlighting with Pandoc. To comply with the above guideline by Copernicus, it is disabled by default (`highlight: NULL`) to prevent Pandoc adding any more packages required for its highlighting. Syntax highlighting can be reactivating by using `highlight: "default"` in the YAML header as this can be desirable before submitting for typesetting. (thanks, @RLumSK, @nuest, #391).

- Fix issue with Pandoc's citation processing by updating all templates with last relevant changes from Pandoc's default template (thanks, @BlackEdder, @dahrens, #390)

- remove warning in `joss_article()` about `citation_package` (thanks, @llrs, #389).

- fix an issue with `rjournal_article()` template to insert newline in author's block only if a field exist (thanks, @huizezhang-sherry, #387)

# rticles 0.19

- Update Copernicus Publications template to version 6.2 from 2021-01-15 (thanks, @RLumSK, #366).

- Add article template `pihph_article()` for the *Papers in Historical Phonology* (PiHPh) (thanks, @stefanocoretta, #362).

- Add article template `ims_article()` for *Institute of Mathematical Statistics* Journals, e.g., *Annals of Applied Statistics* (thanks, @auzaheta, #372)

# rticles 0.18

- `springer_article()` now uses the yaml variable biblio-style to set bibliography style
instead of bibstyle. (@eliocamp, #358)

- Fixes a bug when rendering `arxiv_article()` with recent version of TeX Live by adding `\usepackage{lmodern}` to the template. (#thanks, @slemonide, #343)

- `arxiv_article()` now supports `header-includes` and `biblio-style` to use in the YAML header in order to customize its template. Default bibliography style is still _unsrt_ if not set as before. (thanks, @eliocamp, #356).

- Update jss.cls to version 3.2 (#329).

- Options can now be passed to `hyperref` packages using `header-includes` and `\PassOptionsToPackage` in the AEA template (thanks, @nurfatimaj, #334)

- Update Copernicus Publications template to version 6.1. This is includes a final 
fix for the LaTeX problem sanitized with the last `rticles` update (thanks, @RLumSK, #331).

- Update all templates regarding CSLReference environment following changes in Pandoc's default template.

- Add article template `jasa_article()` for the *Journal of the Acoustical Society of America* (JASA) (thanks, @stefanocoretta, #364)

# rticles 0.17

- Fixes `arxiv_article()` template when adding graphics from code chunks (thanks, @Athanasiamo, #332).

- Fixes `ams_article()` template regarding authors insertion (thanks, @ConorIA, #340).

- Update Copernicus Publications template to version 6.0 and sanitize and issue that caused `pdftex` from hanging (thanks, @RLumSK, #331).

- Add `CSLReferences` environment to support new Pandoc 2.11 citation processing (#335).

- Add article template `lipics_article()` for *Leibniz International Proceedings in Informatics* (LIPIcs) (thanks, @nuest, #288).

# rticles 0.16

- Fixed `ctex_article()` to correctly use the default Pandoc template as intended in the PR #307, which introduced the bug #322 (thanks, @baketbek @cderv #323).

- The minimal version of **knitr** required is 1.30 now.

# rticles 0.15

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

# rticles 0.14

- Added custom author ordering for the IEEE template (thanks, @DunLug, #263).

- Added a multi-line authoring option in the IEEE template (thanks, @DunLug, #264).

- Added the `citation_sorting` YAML option to change the biblatex's sorting option in `ieee_article()` output (thanks, @DunLug, #265).

- `mnras.cls` was removed from this package because it exists on CTAN.

- Added Oxford University Press (OUP) template (thanks, @dmkaplan2000, #271).

# rticles 0.13

- Added the `cslreferences` environment to all templates (thanks, @bbauzile, #260).

- Updated the template for `elsevier_article()` to allow for two authors to share the same footnote (e.g. "these authors made equal contributions") and updated the corresponding skeleton to demonstrate how to use a shared footnote (thanks, @salauer, #255).

- Fixed header includes for `rjournal_article()` (thanks, @agila5 #257, @rcannood #261).

- Add support for bibliography styles on the Springer template (thanks, @swhaat, #262).

# rticles 0.12

- Updated the `pnas_article()` document class from the PNAS website https://www.pnas.org/page/authors/latex (#21).

# rticles 0.11

- Added the Journal of Open Source Software (and Education) template (@noamross, #229).

- Tweaked the `tf_article` template to avoid using absolute full paths for figures in the "Figures" section (@jooyoungseo, #246).

# rticles 0.10

- Support syntax highlighting in the `peerj_article()` format (@zkamvar, #238).

# rticles 0.9

- Added support for Keywords in IEEE Trans template (@espinielli, #227).

- Updated Statistics in Medicine template to its latest version (@ellessenne, #231).

- Update Copernicus Publications template to version 5.3 (@nuest, #228).

- Use csl file for citations in output format `elsevier_article()` (@nuest, #233).

# rticles 0.8

- Added the Taylor & Francis journal template (@dleutnant, #218).

- The top-level option `biblio-files` in the YAML frontmatter was changed to `bibliography` in the `elsevier_article()` template (@JohannesFriedrich, #222).

- Added header option `correspongdingauthors` to configure multiple corresponding authors for Copernicus Publications (@nuest, #221).

- Updated the template for MDPI to 02/2019 (@dleutnant, #203).

# rticles 0.7

- Added the template for the Frontiers Journals (@muschellij2, @zkamvar, #209).

- Added the template for the AGU Journals (thanks, @eliocamp, #199).

- Updated the template for PLOS to version 3.5 (thanks, @uvesten, #196).

- No longer hardcode the LaTeX engine to `xelatex` in `rsos_article()` (thanks, @bensprung, #198).

- Added an argument `pandoc_args` to `ieee_article()` so that users can pass custom Pandoc arguments. This also makes it work with `bookdown::pdf_book()` (thanks, @espinielli, #206).

- The `base_format` argument has been removed from `peerj_article()` (#127) and `copernicus_article()` (#172). This argument was originally added mainly for supporting `bookdown::pdf_book()`, but you should really pass these formats to the `base_format` argument of `bookdown::pdf_book` instead of the other way around. See https://bookdown.org/yihui/rmarkdown/rticles-bookdown.html.

- For output formats `acm_article()`, `acs_article()`, `ams_article()`, `mnras_article()`, the csl file should be specified as a top-level option in the YAML header of the document (this has been done in the R Markdown templates). It is no longer specified automatically by the output format functions.

- The function `ctex_template()` was removed. If you need to use a custom LaTeX template for the `ctex` output format, just use the `template` option under `ctex`.

# rticles 0.6

- Added the template for the SAGE Journals (thanks, @oguzhanogreden, #181).

- Added the template for Biometrics (thanks, @daltonhance, #170).

- Added the template for Copernicus Publications journals (thanks, @nuest, #172).

- Supports syntax highlighting in the `ieee_article()` and `acm_article()` formats (thanks, @rainer-rq-koelle, #182).

- Disabled syntax highlighting for `rjournal_article()` (thanks, @eddelbuettel, #185).

# rticles 0.5

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

# rticles 0.4.1

- Add Royal Society Open Science journal template

- Add Institute of Electrical and Electronics Engineers (IEEE) IEEEtrans
  template for Conferences

# rticles 0.2

- Add American Chemical Society (ACS) template

- Allow changing of documentclass and classoption for JSS articles

- Support bibliography for JSS articles (#63)

- Add tightlist macro to Elsevier skeleton

- Add address and footnote examples to Elsevier skeleton

- Fix preamble variable name in R Journal template

# rticles 0.1

- Initial release to CRAN
