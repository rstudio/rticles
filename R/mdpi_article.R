#' MDPI Journal
#' 
#' Format for creating submissions to Multidisciplinary Digital Publishing Institute (MDPI) journals. 
#' Adapted from <https://www.mdpi.com/authors/latex>.
#'
#' Possible arguments for the YAML header are:
#' * `title` title of the manuscript
#' * `author` list of authors, containing `name`, `affil`, and `orcid` (optional)
#' * `affiliation` list containing `num`, `address`, and `email` for defining `author` affiliations
#' * `authorcitation` string with last name and first intial of authors as expected to be shown in a reference
#' * `firstnote` can include `firstnote` through `eightnote` that correspond to footnote marks in `affil`
#' * `correspondence` contact information of the corresponding author
#' * `journal` short name (case sensitive) of the journal (see list in template or with `mdpi_journals()`).
#' * `type` usually "article" but see template for options
#' * `status` usually "submit"
#' * `simplesummary` optional, may depend on specific journal
#' * `abstract` abstract, limited to 200 words
#' * `keywords` 3 to 10 keywords seperated with a semicolon
#' * `acknowledgement` acknowledgement backmatter (optional)
#' * `authorcontributions` report authorship contributions (optional)
#' * `funding` research funding statement
#' * `institutionalreview` IRB statements (optional)
#' * `informedconsent` Informed consent statements for human research (optional)
#' * `dataavailability` Links to datasets or archives (optional)
#' * `conflictsofinterest` Conflict of interest statement (see journal  instructions)
#' * `sampleavailability` Sample availability statement (optional)
#' * `supplementary` Supplementary data statement, see template for example (optional)
#' * `abbreviations` list of abbreviations containing `short` and `long`
#' * `bibliography` BibTeX `.bib` file
#' * `appendix` name of appendix tex file
#' * `endnote` boolean, if `TRUE` will print list of endnotes if included in text (optional)
#' * `header-includes`: custom additions to the header, before the `\begin{document}` statement
#' * `include-after`: for including additional LaTeX code before the `\end{document}` statement
#' @name mdpi
#' @export
mdpi_article <- function(..., keep_tex = TRUE, latex_engine = "pdflatex", pandoc_args = NULL, citation_package = "natbib") {

  # check all arguments for format's default
  if (citation_package != "natbib") {
      stop("MDPI template only supports 'natbib' for citation processing.")
  }

  ## check if latex engine is pdflatex or xelatex
  if(!latex_engine %in% c("pdflatex", "xelatex")) {
    stop("`latex_engine` must be one of 'pdflatex' or 'xelatex' when using the MDPI template.")
  }

  ## check location of mdpi.cls file (new versions are in subfolder)
  ## to ensure compatibility with old versions
  cls_loc <- if(file.exists("mdpi.cls")) "mdpi" else "Definitions/mdpi"
  pandoc_args <- c(pandoc_args, rmarkdown::pandoc_variable_arg("cls", cls_loc))

  ## if latex engine is pdflatex, mdpi class argument must be pdftex
  if(latex_engine == "pdflatex") {
    pandoc_args <- c(pandoc_args, rmarkdown::pandoc_variable_arg("pdftex", "pdftex"))
  }

  base <- pdf_document_format(
    "mdpi",
    keep_tex = keep_tex,
    citation_package = "natbib",
    latex_engine = latex_engine,
    pandoc_args = pandoc_args,
    ...
  )

  base_pre_processor <- base$pre_processor

  ## pre_processor checks if author metadata > 1 and uses moreauthors mdpi class
  ## argument
  mdpi_pre_processor <- function(metadata,
                            input_file,
                            runtime,
                            knit_meta,
                            files_dir,
                            output_dir) {
    args <- c(
      # run the base prepocessor of the format
      if (is.function(base_pre_processor)) {
        base_pre_processor(
          metadata, input_file, runtime, knit_meta, files_dir, output_dir
        )
      },
      # Set a variable based on metadata field
      if (!is.null(metadata$author)) {
        if (length(metadata$author) > 1) {
          rmarkdown::pandoc_variable_arg("multipleauthors", "moreauthors")
        } else {
          rmarkdown::pandoc_variable_arg("multipleauthors", "oneauthor")
        }
      }
    )
    args
  }

  base$pre_processor <- mdpi_pre_processor
  base
}

#' @rdname mdpi
mdpi_journals <- function() {
  # this list is from tex template
  c(
    "acoustics", "actuators", "addictions", "admsci", "adolescents", "aerobiology", "aerospace",
    "agriculture", "agriengineering", "agrochemicals", "agronomy", "ai", "air", "algorithms", "allergies",
    "alloys", "analytica", "analytics", "anatomia", "animals", "antibiotics", "antibodies", "antioxidants",
    "applbiosci", "appliedchem", "appliedmath", "applmech", "applmicrobiol", "applnano", "applsci", "aquacj",
    "architecture", "arm", "arthropoda", "arts", "asc", "asi", "astronomy", "atmosphere", "atoms", "audiolres", 
    "automation", "axioms", "bacteria", "batteries", "bdcc", "behavsci", "beverages", "biochem", "bioengineering", 
    "biologics", "biology", "biomass", "biomechanics", "biomed", "biomedicines", "biomedinformatics", "biomimetics", 
    "biomolecules", "biophysica", "biosensors", "biotech", "birds", "bloods", "blsf", "brainsci", "breath", 
    "buildings", "businesses", "cancers", "carbon", "cardiogenetics", "catalysts", "cells", "ceramics", 
    "challenges", "chemengineering", "chemistry", "chemosensors", "chemproc", "children", "chips", "cimb", 
    "civileng", "cleantechnol", "climate", "clinpract", "clockssleep", "cmd", "coasts", "coatings", 
    "colloids", "colorants", "commodities", "compounds", "computation", "computers", "condensedmatter", 
    "conservation", "constrmater", "cosmetics", "covid", "crops", "cryptography", "crystals", "csmf", 
    "ctn", "curroncol", "cyber", "dairy", "data", "ddc", "dentistry", "dermato", "dermatopathology", 
    "designs", "devices", "diabetology", "diagnostics", "dietetics", "digital", "disabilities", "diseases", 
    "diversity", "dna", "drones", "dynamics", "earth", "ebj", "ecologies", "econometrics", "economies", 
    "education", "ejihpe", "electricity", "electrochem", "electronicmat", "electronics", "encyclopedia", 
    "endocrines", "energies", "eng", "engproc", "entomology", "entropy", "environments", "environsciproc", 
    "epidemiologia", "epigenomes", "est", "fermentation", "fibers", "fintech", "fire", "fishes", "fluids", 
    "foods", "forecasting", "forensicsci", "forests", "foundations", "fractalfract", "fuels", "future", 
    "futureinternet", "futurepharmacol", "futurephys", "futuretransp", "galaxies", "games", "gases", 
    "gastroent", "gastrointestdisord", "gels", "genealogy", "genes", "geographies", "geohazards", 
    "geomatics", "geosciences", "geotechnics", "geriatrics", "grasses", "gucdd", "hazardousmatters", 
    "healthcare", "hearts", "hemato", "hematolrep", "heritage", "higheredu", "highthroughput", "histories", 
    "horticulturae", "hospitals", "humanities", "humans", "hydrobiology", "hydrogen", "hydrology", 
    "hygiene", "idr", "ijerph", "ijfs", "ijgi", "ijms", "ijn", "ijns", "ijpb", "ijtm", "ijtpp", "ime", 
    "immuno", "informatics", "information", "infrastructures", "inorganics", "insects", "instruments", 
    "inventions", "iot", "j", "jal", "jcdd", "jcm", "jcp", "jcs", "jcto", "jdb", "jeta", "jfb", "jfmk", 
    "jimaging", "jintelligence", "jlpea", "jmmp", "jmp", "jmse", "jne", "jnt", "jof", "joitmc", "jor", 
    "journalmedia", "jox", "jpm", "jrfm", "jsan", "jtaer", "jvd", "jzbg", "kidneydial", "kinasesphosphatases",
     "knowledge", "land", "languages", "laws", "life", "liquids", "literature", "livers", "logics", 
     "logistics", "lubricants", "lymphatics", "machines", "macromol", "magnetism", "magnetochemistry", 
     "make", "marinedrugs", "materials", "materproc", "mathematics", "mca", "measurements", "medicina", 
     "medicines", "medsci", "membranes", "merits", "metabolites", "metals", "meteorology", "methane", 
     "metrology", "micro", "microarrays", "microbiolres", "micromachines", "microorganisms", "microplastics", 
     "minerals", "mining", "modelling", "molbank", "molecules", "mps", "msf", "mti", "muscles", "nanoenergyadv", 
     "nanomanufacturing", "nanomaterials", "ncrna", "ndt", "network", "neuroglia", "neurolint", "neurosci", 
     "nitrogen", "notspecified", "%%nri", "nursrep", "nutraceuticals", "nutrients", "obesities", "oceans", 
     "ohbm", "onco", "%oncopathology", "optics", "oral", "organics", "organoids", "osteology", "oxygen", 
     "parasites", "parasitologia", "particles", "pathogens", "pathophysiology", "pediatrrep", 
     "pharmaceuticals", "pharmaceutics", "pharmacoepidemiology", "pharmacy", "philosophies", "photochem", 
     "photonics", "phycology", "physchem", "physics", "physiologia", "plants", "plasma", "platforms", 
     "pollutants", "polymers", "polysaccharides", "poultry", "powders", "preprints", "proceedings", 
     "processes", "prosthesis", "proteomes", "psf", "psych", "psychiatryint", "psychoactives", 
     "publications", "quantumrep", "quaternary", "qubs", "radiation", "reactions", "receptors", "recycling", 
     "regeneration", "religions", "remotesensing", "reports", "reprodmed", "resources", "rheumato", "risks", 
     "robotics", "ruminants", "safety", "sci", "scipharm", "sclerosis", "seeds", "sensors", "separations", 
     "sexes", "signals", "sinusitis", "skins", "smartcities", "sna", "societies", "socsci", "software", 
     "soilsystems", "solar", "solids", "spectroscj", "sports", "standards", "stats", "std", "stresses", 
     "surfaces", "surgeries", "suschem", "sustainability", "symmetry", "synbio", "systems", "targets", 
     "taxonomy", "technologies", "telecom", "test", "textiles", "thalassrep", "thermo", "tomography", 
     "tourismhosp", "toxics", "toxins", "transplantology", "transportation", "traumacare", "traumas", 
     "tropicalmed", "universe", "urbansci", "uro", "vaccines", "vehicles", "venereology", "vetsci", 
     "vibration", "virtualworlds", "viruses", "vision", "waste", "water", "wem", "wevj", "wind", 
     "women", "world", "youth", "zoonoticdis"
  )
}
