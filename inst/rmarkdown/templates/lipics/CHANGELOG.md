LIPICS Style - CHANGELOG

* 19/07/2019 LIPIcs-v2019 v2.2
    * New Feature
        * explicitly defined/named colors used in style to ease reusing them (requires load of package xcolor instead of color)
        * added document option "authorcolumns" to activate displaying author details in two columns (only allowed for more than 6 authors)
        * revised style of algorithm environments provided by algorithm or algorithm2e packages 
        * added qed-like symbol to mark end of e.g. definitions (command \lipicsEnd)
    * Bugfix
        * fixed problem caused by "\\" in title macro

* 06/06/2019 LIPIcs-v2019 v2.1
    * New Feature
        * added document option "anonymous" to make author related information anonymous (e.g. for double-blind review)
    * Bugfix
        * fixed problems with using thm-restate (added new documentclass option thm-restate)
        * fixed bug when using algorithm2e package and cleveref package
        * fixed problems with texorpdfstring in author macro
        * fixed spacing variation between author name and orcid symbol
        * capitalised labels when using autoref (e.g. section -> Section)


* 10/12/2018 LIPIcs-v2019 v2.0
    * New Features
        * support of metadata in PDF file (e.g. author, title, keywords) 
        * revised displaying of author-related funding acknowledgements (now displayed as part of the funding block instead of footnotes)
        * added support for cleveref package (new document option 'cleveref')
        * added support for using autoref for theorem-like environments (new document option 'autoref')
        * added new environment claim and claimproof to realize sub-proofs
        * added new environment proposition
    * Bugfixes
        * fixed problems with theorem-like environments when using cleveref and autoref (see new features above)
        * switched several URL from http to https
        * fixed problems with using of ACM 2012 classification (deactivated subjclass and revised support of ccsdesc macro)
    * Minor changes
        * moved ORCID symbol behind author name (according https://orcid.org/content/journal-display-guidelines)
        * added separator \and to split several affiliations
        * added warnings when package 'enumitem' or 'paralist' are loaded; they manipulate the pre-defined enumeration styles and are partly incompatible
        * preloaded package 'microtype' in style
        * revised spacings/font sizes for top matter

* 09/04/2018 LIPIcs-v2018 v1.5
    * Bugfixes
        * Fixed problem with page style in case of many authors
        * Fixed aggregation of authors for ToC file

* 15/03/2018 LIPIcs-v2018 v1.4
    * Bugfixes
        * Fixed enumerations
        * Fixed aggregation of authors for ToC file

* 26/02/2018 LIPIcs-v2018 v1.3
    * Bugfixes
        * Fixed \hideLIPIcs
        * Fixed enumerations
        * Fixed typo
        * Revised display of ORCIDs following recommendation by ORCID

* 06/02/2018 LIPIcs-v2018 v1.2
    * Release of LIPIcs-v2018
        * revised author macro \author{name}{affil}{email}{orcid}{funding} 
        * added support for ORCIDs
        * switched to ACM 2012 classification system
        * added new macros for extended metadata \category, \relatedversion, \supplement, \funding, \acknowledgements
        * added warnings for missing mandatory metadata
        * added preconfigured enumeration styles based on the enumerate package
        * added option \hideLIPIcs to hide all LIPIcs related information
        * added support for line numbers
    * Bugfixes
        * fixed copyright line
        * added warning when using outdated subfig package due to incompatibilities in preloaded subcaption package
        * fixed bug when using MnSymbol package
        * fixed bug in numbering in theorem-like environments used in appendix
        * fixed problems in ToC file
