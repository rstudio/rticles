%%
%% This is file `copernicus.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% copernicus.dtx  (with options: `class')
%% 
%% -----------------------------------------------------------------
%% Author:     copernicus.org and le-tex publishing services
%% 
%% This file is part of the copernicus package for papers
%% published by Copernicus Publications (Copernicus GmbH).
%% 
%%       Copyright (C) 2020 by Copernicus Publications
%% -----------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{copernicus}
    [2021/07/07 9.32 Copernicus papers]
\frenchspacing
\clubpenalty10000
\widowpenalty10000
\protected@edef\CopernicusInfo#1{\protect\ClassInfo{copernicus}{#1}}
\protected@edef\CopernicusWarningNoLine#1{\protect\ClassWarningNoLine{copernicus}{#1}}
\protected@edef\CopernicusError#1#2{\protect\ClassError{copernicus}{#1}{#2}}
\let\@classfilename\@currname
\newcommand\UndefinedError[1]
 {\CopernicusError{You must define #1}{Add #1 to your document!}}
\newcommand\NoSectionWarning[1]
 {\CopernicusWarningNoLine{No section #1; proceeding without it}}
\newcommand\NoSectionError[2]
 {\CopernicusError{You forgot the section: #1}{Add #2 to your document!}}
\RequirePackage{fixltx2e}[2006/03/24]
\renewcommand*\and{\@centercr}
\AtEndOfClass{%
  \DeclareRobustCommand*{\vec}[1]
   {\ensuremath{%
     \mathchoice{\mbox{\boldmath$\displaystyle#1$}}
                {\mbox{\boldmath$\textstyle#1$}}
                {\mbox{\boldmath$\scriptstyle#1$}}
                {\mbox{\boldmath$\scriptscriptstyle#1$}}}}}
\thinmuskip=2mu
\medmuskip=3mu minus 3mu
\thickmuskip=4mu
\def\cop@opterrshort{Option  "\CurrentOption" not supported}
\def\cop@opterrlong{%
  The option "\CurrentOption" from article.cls is not supported by copernicus.cls.}
\DeclareOption{a4paper}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{a5paper}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{b5paper}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{letterpaper}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{legalpaper}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{executivepaper}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{landscape}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{10pt}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{11pt}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{12pt}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{oneside}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{twoside}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{titlepage}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{notitlepage}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{onecolumn}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{twocolumn}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\DeclareOption{fleqn}{\@latexerr{\cop@opterrshort}{\cop@opterrlong}}
\newif\if@stage@final  \@stage@finaltrue
\newif\if@sansserifface
\newif\if@sansserifheader
\newif\if@abstractcentered
\newif\if@abstractindented
\newif\if@noauthor       \DeclareOption{noauthor}{\@noauthortrue}
\newif\if@nolastpage     \DeclareOption{nolastpage}{\@nolastpagetrue}
\newif\if@noref          \DeclareOption{noref}{\@noreftrue}
\newif\if@nohyperref     \DeclareOption{nohyperref}{\@nohyperreftrue}
\newif\if@cop@home       \IfFileExists{copernicuslogo.pdf}{\@cop@hometrue}{\@cop@homefalse}
\newif\ifonline          \DeclareOption{online}{\onlinetrue}
\newif\if@twostagejnl
\newif\if@forHTML
\newif\if@manuscript     \DeclareOption{manuscript}{\@manuscripttrue}
\newif\if@noline         \DeclareOption{noline}{\@nolinetrue}%classical
\DeclareOption{corrigendum}  {\def\specialp@perstring{Corrigendum}}
\DeclareOption{editorialnote}{\def\specialp@perstring{Editorial note}}
\def\jurl@splitter#1.net\@nil{\def\jurl@first{#1}}
\DeclareOption{editorialnotediscussion}{%
                              \def\specialp@perstring{Editorial note}%
                              \@noreftrue
                              \AtEndOfClass{%
                                \edef\@journalnameabbreviation{\@journalnameabbreviation\space Discuss.}%
                                \expandafter\jurl@splitter\@journalurl\@nil
                                \edef\@journalurl{\jurl@first-discuss.net}}}
\newif\if@preface%ask Lupino
\DeclareOption{preface}  {\@prefacetrue}
\DeclareOption{forHTML}  {\@forHTMLtrue}
\newif\if@corrigendum%ask Jasch
\newif\if@editorialnotetwoc%ask Jasch
\newif\if@editorialnoted%ask Jasch
\newif\if@secline% Underlined Sections, lup 2017-11-06
\newif\if@dolinesec\@dolinesecfalse
\newif\if@bar            %only used under \if@stage@final and \@cop@hometrue; for modern layout as well as for the classically layouted sub-journal "angeocom"
\newif\if@hvmath         \DeclareOption{hvmath}{\@hvmathtrue}%only used for discussions and only under \@cop@hometrue
\InputIfFileExists{copernicus.cfg}%
  {\typeout{Additional configuration file copernicus.cfg used}}%
  {\CopernicusError{No additional configuration file copernicus.cfg}
                   {Please provide copernicus.cfg with the journal configurations.}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\if@stage@final\else\@twostagejnltrue\fi
\if@cop@home\else
  \if@stage@final\else\@stage@finaltrue\@manuscripttrue\fi
\fi
\if@manuscript
  \@sansseriffacefalse
  \@sansserifheaderfalse
  \@abstractcenteredfalse
  \@abstractindentedfalse
\fi
\AtEndOfClass{\ifcopyediting\let\@msnumber\relax\fi}
\LoadClass[fleqn]{article}
\AtBeginDocument{\mathindent\z@}
\if@stage@final
  \if@manuscript
    \oddsidemargin16.4mm
    \evensidemargin16.4mm
    \textwidth177mm
    \textheight\dimexpr660\p@-37mm+11.4mm\relax
    \headheight\z@
    \headsep\z@
    \topmargin10mm
    \footskip30pt
  \else
    \let\footnotesize\small
    \oddsidemargin16.4mm
    \evensidemargin16.4mm
    \textwidth177mm
    \headheight16.4mm
    \headsep5mm
    \topskip12pt
    \footskip30pt
    \textheight54\baselineskip
    \advance\textheight by\topskip
    \topmargin\z@
  \fi
\else
  \renewcommand\normalsize{%
    \@setfontsize\normalsize\@xipt{13.6}%
    \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\small{%
    \@setfontsize\small\@xpt\@xiipt
    \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
    \def\@listi{\leftmargin\leftmargini
                \topsep 6\p@ \@plus2\p@ \@minus2\p@
                \parsep 3\p@ \@plus2\p@ \@minus\p@
                \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip}
  \let\footnotesize\small
  \def\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
  \def\tiny{\@setfontsize\tiny\@vipt\@viipt}
  \headheight\z@
  \headsep\z@
  \topskip\z@
  \footskip5mm
  \textwidth146mm
  \textheight140mm
  \advance\textheight by\topskip
  \oddsidemargin-15.4mm
  \evensidemargin-15.4mm
  \topmargin-18.4mm
\fi
\parindent1em
\newdimen\bleed \bleed3mm\relax
\if@stage@final
  \hoffset\dimexpr-1in+\bleed\relax
  \voffset\dimexpr-1in+\bleed\relax
  \if@manuscript
    \paperheight\dimexpr240mm+2\bleed\relax%2015-12-14
  \else
    \paperheight\dimexpr277mm+2\bleed\relax
  \fi
  \paperwidth\dimexpr210mm+2\bleed\relax
  \@tempdima\dimexpr1in+\hoffset\relax
  \@tempdimb\dimexpr\@tempdima+\paperwidth-2\bleed\relax
  \@tempdima\dimexpr\@tempdima*7200/7227\relax\edef\l@offset{\strip@pt\@tempdima}
  \@tempdimb\dimexpr\@tempdimb*7200/7227\relax\edef\r@offset{\strip@pt\@tempdimb}
  \@tempdima\dimexpr1in+\voffset\relax
  \@tempdimb\dimexpr\@tempdima+\paperheight-2\bleed\relax
  \@tempdima\dimexpr\@tempdima*7200/7227\relax\edef\u@offset{\strip@pt\@tempdima}
  \@tempdimb\dimexpr\@tempdimb*7200/7227\relax\edef\o@offset{\strip@pt\@tempdimb}
  %and now for the bleed box:
  \@tempdima\dimexpr1in+\hoffset-\bleed\relax
  \@tempdimb\dimexpr\@tempdima+\paperwidth+2\bleed\relax
  \@tempdima\dimexpr\@tempdima*7200/7227\relax\edef\b@l@offset{\strip@pt\@tempdima}
  \@tempdimb\dimexpr\@tempdimb*7200/7227\relax\edef\b@r@offset{\strip@pt\@tempdimb}
  \@tempdima\dimexpr1in+\voffset-\bleed\relax
  \@tempdimb\dimexpr\@tempdima+\paperheight+2\bleed\relax
  \@tempdima\dimexpr\@tempdima*7200/7227\relax\edef\b@u@offset{\strip@pt\@tempdima}
  \@tempdimb\dimexpr\@tempdimb*7200/7227\relax\edef\b@o@offset{\strip@pt\@tempdimb}
  \ifnum\pdfoutput=\z@
    \newcommand{\@setPdfBoxes}{%
      \ifx\@processPdfBoxSpec\@empty\relax
      \else
        {%
        \special{!userdict begin
          /bop-hook {^^J
          \@processPdfBoxSpec} def
         end}}
      \fi}
    \let\@processPdfBoxSpec\@empty
    \newcommand\@setPdfBox[2]{%
      \xdef\@processPdfBoxSpec{%
        \@processPdfBoxSpec
        [ {ThisPage} << /#1 [#2] >> /PUT pdfmark} }
    \@setPdfBox{TrimBox}{\l@offset\space\u@offset\space\r@offset\space\o@offset}
    \@setPdfBox{CropBox}{\l@offset\space\u@offset\space\r@offset\space\o@offset}
    \@setPdfBox{BleedBox}{\b@l@offset\space\b@u@offset\space\b@r@offset\space\b@o@offset}
    \@setPdfBoxes
    \@onlypreamble\@setPdfBoxes
  \else
    \edef\@tempa{%
      /TrimBox [\l@offset\space\u@offset\space\r@offset\space\o@offset]
      /CropBox [\l@offset\space\u@offset\space\r@offset\space\o@offset]
      /BleedBox[\b@l@offset\space\b@u@offset\space\b@r@offset\space\b@o@offset]}
    \expandafter\pdfpageattr\expandafter{\@tempa}
  \fi
\else%discussions
  \paperheight159mm
  \paperwidth166mm
\fi
\parskip0pt% plus 1pt
\def\topfraction{1}%standard is .7
\def\textfraction{0}%standard is .2
\def\floatpagefraction{.7}%standard is .5
\def\dbltopfraction{1}%standard is .7
\def\dblfloatpagefraction{.7}%standard is .5
\if@stage@final
  \def\@ddsidemarginbar{%
    \rlap{%
      \@tempdima-6.5mm\kern-\@tempdima
      \@tempdima\dimexpr\@tempdima+\paperwidth-\textwidth-\oddsidemargin+\bleed\relax
      \@tempdimb\dimexpr\headheight+\topmargin\relax
      \@tempdimc\dimexpr\paperheight-\@tempdimb\relax
      \advance\@tempdimb\bleed
      \advance\@tempdimc\bleed
      \smash{\vrule\@width\@tempdima\@height\@tempdimb\@depth\@tempdimc}}}
  \def\@vensidemarginbar{%
    \llap{%
      \@tempdima\dimexpr1in+\evensidemargin+\bleed\relax
      \@tempdimb\dimexpr\headheight+\topmargin\relax
      \@tempdimc\dimexpr\paperheight-\@tempdimb\relax
      \advance\@tempdimb\bleed
      \advance\@tempdimc\bleed
      \smash{\vrule\@width\@tempdima\@height\@tempdimb\@depth\@tempdimc}%
      \kern6.5mm}}
  \def\@ddsidemarginrule{%
    \rlap{%
      \@tempdima0.8\p@
      \kern6.5mm\kern-0.5\@tempdima
      \@tempdimb\dimexpr\headheight+\topmargin\relax
      \@tempdimc\dimexpr\paperheight-\@tempdimb\relax
      \advance\@tempdimb\bleed
      \advance\@tempdimc\bleed
      \smash{\vrule\@width\@tempdima\@height\@tempdimb\@depth\@tempdimc}}}
  \def\@vensidemarginrule{%
    \llap{%
      \@tempdima0.8\p@
      \@tempdimb\dimexpr\headheight+\topmargin\relax
      \@tempdimc\dimexpr\paperheight-\@tempdimb\relax
      \advance\@tempdimb\bleed
      \advance\@tempdimc\bleed
      \smash{\vrule\@width\@tempdima\@height\@tempdimb\@depth\@tempdimc}%
      \kern6.5mm\kern-0.5\@tempdima}}
\fi
\def\check@journalnameabbreviation#1 Discuss.#2\@nil{#2}
\def\@journalInfo{%
  \ifx\specialp@perstring\@undefined\else
    {\specialp@perstring} to\space
    %check for configured line breaks:
    \def\1{Corrigendum}\ifx\specialp@perstring\1\if@corrigendum\hfil\break\fi\else
    \def\1{Editorial note}\ifx\specialp@perstring\1
      \edef\1{\expandafter\expandafter\expandafter\check@journalnameabbreviation\expandafter\@journalnameabbreviation\space Discuss.\@nil}%
      \ifx\1\@empty\if@editorialnotetwoc\hfil\break\fi\else
        \if@editorialnoted\hfil\break\fi\fi\fi
    \fi
  \fi
  \@journalnameabbreviation
  \ifcopyediting\else\if@noref,\space\@msnumber\else,\space\@pvol, \@fpage\if@nolastpage\else{--\@lpage}\fi\fi, \@pyear\fi}
\def\@journalurlInfo{%
  %% URL raus, DOI rein; 2020-05-15
  \if@preface
    %\@journalurl\ifcopyediting\else/\preface@abbrev.pdf\fi
    https://doi.org/10.5194/\preface@abbrev.pdf
  \else
    https://doi.org/10.5194/\if@noref\@msnumber\else\@journalnameshortlower-\@pvol-\@fpage-\@pyear\fi
    %\@journalurl\ifcopyediting\else/\if@noref\@msnumber\else\@pvol/\@fpage/\@pyear\fi/\fi
  \fi}
\def\runningheaderfont{%
  \if@stage@final%spec. obsolete ?
    \if@sansserifheader
      \reset@font\sffamily\mathversion{sans}\normalsize\color{textcol}%
    \else
      \bfseries
    \fi
  \fi}
\def\prefacetype#1{%
  \if@preface
  \def\@argi{#1}%
  \def\1{volume}\ifx\@argi\1
    \ifx\v@num\@undefined\CopernicusError{\string\prefacetype{} is "volume", but no {\string\vnumber} was given!}{\string\prefacetype{} is "volume", but no {\string\vnumber} was given!}\fi
    \gdef\preface@abbrev{\@journalnameshortlower-volume\v@num-preface}%
  \else
    \def\1{issue}\ifx\@argi\1
      \ifx\i@num\@undefined\CopernicusError{\string\prefacetype{} is "issue", but no {\string\inumber} was given!}{\string\prefacetype{} is "isue", but no {\string\inumber} was given!}\fi
      \ifx\v@num\@undefined\CopernicusError{\string\prefacetype{} is "issue", but no {\string\vnumber} was given!}{\string\prefacetype{} is "issue", but no {\string\vnumber} was given!}\fi
      \gdef\preface@abbrev{\@journalnameshortlower-volume\v@num-issue\i@num-preface}%
    \else
      \def\1{SI}\ifx\@argi\1
        \ifx\SI@num\@undefined\CopernicusError{\string\prefacetype{} is "SI", but no {\string\sinumber} was given!}{\string\prefacetype{} is "issue", but no {\string\sinumber} was given!}\fi
        \gdef\preface@abbrev{\@journalnameshortlower-special\_issue\SI@num-preface}%
      \else
        \CopernicusError{Empty \string\prefacetype{} not allowed!}
        {\string\prefacetype{} must be on of: "volume", "issue", or "SI"}
      \fi
    \fi
  \fi
  \else
    \CopernicusError{Found \string\prefacetype{#1} in an article without the preface class option!}{Please do not use \string\prefacetype\space unless you chose preface^^Jas class option to \string\documentclass{copernicus}}%
  \fi
}%
\def\vnumber#1{\if@preface\gdef\v@num{#1}\else\CopernicusError{\string\vnumber\space is only available in preface papers!}{Omit \string\vnumber\space and use \string\publvol\space or \string\origpublvol\space instread.}\fi}
\def\sinumber#1{\if@preface\gdef\SI@num{#1}\else\CopernicusError{\string\sinumber\space is only available in preface papers!}{Omit \string\sinumber\space when articly type is not preface.}\fi}
\def\inumber#1{\if@preface\gdef\i@num{#1}\else\CopernicusError{\string\inumber\space is only available in preface papers!}{Omit \string\inumber\space and use \string\articlenumber\space instread.}\fi}
\def\@manuscriptInfo{%
  % Manuscript prepared for \@journalnameabbreviation\\
  % with version \csname ver@\@classfilename.cls\endcsname\ %
  %   of the \LaTeX\ class \@classfilename.cls.\\
  % Date: \number\day~\ifcase\month\or January\or February\or
  %   March\or April\or May\or June\or July\or August\or September\or
  %   October\or November\or December\fi~\number\year
  %~\\[12pt]
  }
\if@stage@final
  \def\ps@plain{%only used for manuscript
     \let\@mkboth\@gobbletwo
     \let\@oddhead\@empty
     \let\@evenhead\@empty
     \def\@oddfoot{\reset@font\bfseries\hfil\thepage\hfil}%
     \let\@evenfoot\@oddfoot}
  \def\ps@headings{%
    \def\@oddhead{%
      \runningheaderfont
      \@runhd\hfil\llap{\thepage}%
      \if@cop@home\if@bar
          \textcolor{barcol}{\@ddsidemarginbar}%
          %\textcolor{textcol}{\@ddsidemarginrule}%
          \textcolor{rulecol}{\@ddsidemarginrule}%
      \fi\fi}
    \def\@evenhead{%
      \if@cop@home\if@bar
          \textcolor{barcol}{\@vensidemarginbar}%
          %\textcolor{textcol}{\@vensidemarginrule}%
          \textcolor{rulecol}{\@vensidemarginrule}%
      \fi\fi
      \runningheaderfont
      \rlap{\thepage}\hfil\@runhd}
    \if@cop@home
      \def\@oddfoot{\edit@rnotereminder\runningheaderfont\if@preface \@journalurlInfo\hfil Preface\else\@journalurlInfo\hfil\ifx\specialp@perstring\@undefined\@journalInfo\else\specialp@perstring\fi\fi}
      \def\@evenfoot{\edit@rnotereminder\runningheaderfont\if@preface Preface\hfil\@journalurlInfo\else\ifx\specialp@perstring\@undefined\@journalInfo\else\specialp@perstring\fi\hfil\@journalurlInfo\fi}
    \else
      \let\@oddfoot\@empty
      \let\@evenfoot\@empty
    \fi
    \let\@mkboth\@gobbletwo}
\else%discussions
  \def\ps@headings{%
    \def\@oddhead{%
      \hfil
      \rlap{%
        \kern5mm
        \@tempdimb\dimexpr\headheight+\topmargin+1in\relax
        \@tempdimc\dimexpr\paperheight-\@tempdimb\relax
        \advance\@tempdimb\bleed
        \advance\@tempdimc\bleed
        \color{discussion_bartext_background}\smash{\vrule\@width5mm\@height\@tempdimb\@depth\@tempdimc}}%
      \rlap{%
        \kern5.7mm
        \rotatebox{-90}{%
          \fontsize{10}{10}\usefont{T1}{ma1}{m}{n}%
          \textcolor{discussion_bartext}{\kern-0.5mm%
            Discussion Paper \quad | \quad Discussion Paper \quad | \quad Discussion Paper \quad | \quad Discussion Paper \quad |}}}}
    \let\@evenhead\@oddhead
    \def\@oddfoot{\if@cop@home\edit@rnotereminder\fi\hfil\thepage\hfil}
    \let\@evenfoot\@oddfoot}
\fi
\if@stage@final
  \if@bar
    \def\@titlebar{%
      \textcolor{barcol}{\@ddsidemarginbar}%
      %\textcolor{textcol}{\@ddsidemarginrule}%
      \textcolor{rulecol}{\@ddsidemarginrule}%
      \rlap{\kern7.5mm\smash{%
          \raise3mm\hbox{\rotatebox[origin=Bl]{-90}{\reset@font\sffamily\Large\textcolor{textcol}{\@btext\strut}}}}}}
  \fi
  \def\ps@titlepage{%
    \if@cop@home
      \ifcopyediting
        \def\@oddhead{%
          \parbox[t]
            {\textwidth}
            {{\runningheaderfont\@sentence}\\
             \color[gray]{0.55}\put(0.7,0){\rule[1mm]{\textwidth}{0.1mm}}\\
             \textcolor[gray]{0.55}{Your manuscript was typeset and received English language copy-editing.\\
             The resulting file is available for proof-reading in the final journal style.\\
             The present document is only to review the language changes.}}%
             \if@bar\@titlebar\fi}
      \else
        \def\@oddhead{%
          \parbox[t]
            {0.6\textwidth}
            {\if@sansserifheader\leavevmode\runningheaderfont\fi
             \if@preface
               doi:10.5194/\preface@abbrev%
             \else
               \@journalInfo\\
               %\@journalurlInfo\\ %raus laut Ticket 4529
               https://doi.org/10.5194/%
               \if@noref
                 \@msnumber
               \else
                 \@journalnameshortlower
                 -\@pvol-\@fpage-\@pyear
               \fi
             \fi
             \ifx\specialp@perstring\@undefined\else-\def\1{Corrigendum}\ifx\specialp@perstring\1corrigendum\else editorial-note\fi\fi
             \\
             \@journalcopyright
             %\includegraphics[width=1.5cm]{CreativeCommons_Attribution_License.png}%
           }%
          \hfill
          \setbox\z@\hbox{\@journallogo}%
          \@tempdima\ht\z@\advance\@tempdima-8\p@\lower\@tempdima\box\z@\\
          \ifangeocom
            \textcolor{barcol}{\@ddsidemarginbar}%
            %\textcolor{textcol}{\@ddsidemarginrule}%
            \textcolor{rulecol}{\@ddsidemarginrule}%
              \rlap{\kern9mm\smash{%
                \@tempdimc\headsep\advance\@tempdimc\textheight\advance\@tempdimc\footskip
                \lower\@tempdimc\hbox{\rotatebox[origin=lB]{90}{\fontsize{15}{15}\usefont{T1}{ma1}{m}{n}AnGeo Communicates}}}}%
          \else
            \if@bar\@titlebar\fi
          \fi}
      \fi
      \def\@oddfoot{\edit@rnotereminder\runningheaderfont\@sentence\hfil}
    \else
      \def\@oddhead{\parbox[t]{0.6\textwidth}{\@manuscriptInfo}}
      \let\@oddfoot\@empty
    \fi
    \let\@mkboth\@gobbletwo}
\fi
\AtEndDocument{%
  \clearpage
  \addtocounter{page}{-1}%
  \immediate\write\@auxout{\string\newlabel{LastPage}{{}{\thepage}{}{}{}}}%
  \addtocounter{page}{1}}
\if@stage@final
  \def\@lpage{\hypersetup{linkcolor=textcol}\pageref{LastPage}}
\else
  \def\@lpage{\pageref*{LastPage}}
\fi
\newcommand\sw@and{%
  \end{minipage}\\[1em]%
  \begin{minipage}[t]{\hsize}%
    \flushleft\baselineskip12pt}
\def\@runtest{%
  \if@noauthor\else\if!\@runauth!\UndefinedError{\string\runningauthor}\fi\fi
  \if!\@runtit!\UndefinedError{\string\runningtitle}\fi}
\def\maketitle{%
  \gdef\supplement##1{%
    \href{https://doi.org/10.5194/\@journalnameshortlower-\@pvol-\@fpage-\@pyear-supplement}%
         {https://doi.org/10.5194/\@journalnameshortlower-\@pvol-\@fpage-\@pyear-supplement}}%
  \ifnum\@fpage<0
    \CopernicusError{No article number given but citation by article number required}
                    {Please provide \string\articlenumber.}
  \fi
  \ifx\citati@nbyarticlenumber\@undefined
    \ifodd\@fpage\else
      \CopernicusError
      {Starting page must be odd!}{change the firstpage command}%
    \fi
    \ifx\specialp@perstring\@undefined
      \setcounter{page}{\@fpage}%
    \fi
  \fi
  \setcounter{footnote}{0}%
  \if@stage@final\if@manuscript\else\thispagestyle{titlepage}\fi\fi
  \begingroup
    \parindent=\z@
    \@maketitle
  \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@title\@empty
  \if@stage@final
    \if@manuscript\gdef\baselinestretch{1.4}\reset@font\normalsize\fi
  \fi
  \@runtest}
\if@stage@final
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% This is taken from `long2.sty'.
  %% Author: Tomas "tohecz" Hejda <tohecz@gmail.com>
  %% Licenced under LaTeX-Project Public License version 1.3 or newer.
  \newlength\longtwo@top
  \newlength\longtwo@bottom
  \newsavebox\longtwo@box
  \def\longtwo@repeat{%
      \longtwo@column[{\@twocolumnfalse
      \ifdim\ht\longtwo@box>1.00\textheight%1
        \begingroup
        \vbadness10000
        \setbox0\vsplit\longtwo@box to 1.00\textheight%1
        \setbox1\vbox{\unvbox\longtwo@box}
        \global\setbox\longtwo@box\vbox{\unvbox1}%
        \setbox2\vbox to \textheight{\unvbox0}%
        \ht2=0.9\textheight
        \box2
        \endgroup
      \else
        \ifdim\ht\longtwo@box>0.84\textheight
          \global\let\longtwo@repeat\clearpage
        \else
          \global\let\longtwo@repeat\relax
        \fi
        \unvbox\longtwo@box
        \vspace{15pt plus 15pt}%
      \fi
      }]%
    \longtwo@repeat}
  \long\def\longtwo@[#1]{%
    \begingroup
      \let\longtwo@column\twocolumn
      \let\longtwo@mkttl\maketitle
      \def\maketitle{%
        \begingroup
        \let\newpage\relax
        \longtwo@mkttl
        \endgroup}
      \longtwo@column[{\@twocolumnfalse
      \global\setbox\longtwo@box\vbox{#1}%
      \ifdim\ht\longtwo@box>\textheight
        \begingroup
        \vbadness10000
        \setbox0\vsplit\longtwo@box to 1.00\textheight%1
        \setbox1\vbox{\unvbox\longtwo@box}%
        \global\setbox\longtwo@box\vbox{\unvbox1}%
        \setbox2\vbox to \textheight{\unvbox0}%
        \ht2=0.9\textheight
        \box2
        \endgroup
      \else
        \ifdim\ht\longtwo@box>0.87\textheight
          \global\let\longtwo@repeat\clearpage
        \else
          \global\let\longtwo@repeat\relax
        \fi
        \unvbox\longtwo@box
      \fi
      }]%
      \longtwo@repeat
    \endgroup}
  \def\longtwocolumn{\@ifnextchar[\longtwo@\twocolumn}
  %% End of file `long2.sty'.
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \def\@maketitle{%
    \if@manuscript%layout for first page in one-column mode
      \@@maketitlemanuscript
    \else%layout for first page in two-column mode
      \if@twocolumn
        \longtwocolumn[\@@maketitlefinal]%
      \else%allows output of heads larger than one page
        \@@maketitlefinal
      \fi
    \fi}
  \def\@@maketitlemanuscript{%
    \global\@topnum\z@
    \begin{nolinenumbers}%
    \parbox[t]{\textwidth}{\@manuscriptInfo}\par
    \vskip\baselineskip
    \raggedright
    \let\footnotesize\normalsize
    \let\footnoterule\relax
    \def\thefootnote{\fnsymbol{footnote}}%
    \def\@mpfn{footnote}%
    \let\thempfn=\thefootnote
    \renewcommand\@makefntext[1]{\parindent1em\noindent\@makefnmark##1}%
    {\LARGE\bfseries\if@sansserifface\mathversion{sansbold}\else\mathversion{bold}\fi\@title\par}%
    \if@noauthor
    \else
      {\large
       \renewcommand\Authfont{\normalfont}%
       \renewcommand\Affilfont{\normalsize\normalfont}%
       \setlength\affilsep{4pt}%
       \let\and=\sw@and
       \flushleft
       \@author\\[4pt]
       \ifx\@corresp\@empty\else\textbf{{\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol} Correspondence:}} \@corresp\ifx\@howtocite\@empty\else\\[4pt]\fi\fi
       \ifx\@howtocite\@empty\else\textbf{{\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol} How to cite:}} \@howtocite\fi
       \par}%
    \fi
    \@thanks
    \vspace{\baselineskip}%
    \end{nolinenumbers}}
  \def\@maketitle@setup{%
    \let\footnotesize\normalsize
    \let\footnoterule\relax
    \def\thefootnote{\fnsymbol{footnote}}%
    \def\@mpfn{footnote}%
    \let\thempfn=\thefootnote
    \renewcommand\@makefntext[1]{\parindent1em\noindent\@makefnmark##1}}
  \if@abstractcentered%modern
    \def\@@maketitlefinal{%
          \vspace*{31mm}%
          {\list{}{\leftmargin10mm\rightmargin\leftmargin}%
             \item\relax
               \hsize\linewidth
               \@maketitle@setup
               \centering
               \center{\LARGE\bfseries\if@sansserifface\sffamily\mathversion{sansbold}\else\mathversion{bold}\fi\color{textcol}%
                       \ifx\specialp@perstring\@undefined\else\textit{{\specialp@perstring} to}\break``\fi
                       \@title
                       \ifx\specialp@perstring\@undefined
                       \else
                         ''\if@noref,\else\space published in\fi\space
                         \@journalnameabbreviation ,
                         \if@noref\@msnumber \else \@pvol, \@fpage\if@nolastpage\else{--\@lpage}\fi\fi, \@pyear
                       \fi
                       \par}%
               \vspace{10pt}%
               \if@noauthor
               \else
                 {\normalsize
                  \renewcommand\Authfont{\bfseries}%
                  \renewcommand\Affilfont{\reset@font}%
                  \setlength\affilsep{4pt}%
                  \let\and=\sw@and
                  \@author\par}%
                 \vskip-0.5\baselineskip
               \fi
               \ifx\@corresp\@empty\else\vskip\topsep\centering\textbf{{\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol} Correspondence:}}\space\@corresp\fi
               \ifx\@howtocite\@empty\else\vskip.5\topsep\centering\textbf{{\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol} How to cite:}}\space\@howtocite\fi
               \par\vskip0.33\baselineskip
               {\small
                \ifx\specialp@perstring\@undefined
                  \if!\@recvd!
                  \else
                    Received: \@recvd
                    \def\datesep{ -- }%
                    \if@twostagejnl\ifx\@pubdiscuss\@empty\else
                      \datesep Discussion started:\nobreakspace\@pubdiscuss\def\datesep{\break\def\datesep{ -- }}%
                    \fi\fi
                    \if!\@revsd!\else\datesep Revised:\nobreakspace\@revsd\fi
                    \if!\@accptd!\else\datesep Accepted:\nobreakspace\@accptd\fi
                    \ifx\@published\@undefined\else\datesep\fi
                  \fi
                \fi
                \ifx\@published\@undefined\else Published:\nobreakspace\@published\fi
               }%
               \ifx\abstractexists\@undefined
               \else
                 \par\vskip0.5\baselineskip
                 \bgroup
                 \advance\hsize-2\fboxsep\advance\hsize-2\fboxrule
                 \parskip\z@
                 \trivlist\item\relax
                   \textcolor{textcol}{\reset@font\normalsize\if@sansserifface\sffamily\fi\bfseries\abstractname.}%
                   \enspace\ignorespaces\@abstr
                   \ifx\second@bstract\@undefined\else\par\vspace{1.7mm}\noindent
                     \second@bstract
                   \fi
                   \if!\@keyw!\else
                     \par\vspace{1.7mm}\noindent
                     \textcolor{textcol}{\reset@font\normalsize\if@sansserifface\sffamily\fi\bfseries Keywords.}%
                     \enspace\ignorespaces\@keyw
                   \fi
                 \endtrivlist
                 \egroup
               \fi
           \endlist
           \par\vspace{1.5\baselineskip}}}
  \else%classical or indented
    \if@abstractindented%% indented
      \def\@@maketitlefinal{%
          \vspace*{36mm}%
          {\@maketitle@setup
           \raggedright
           {\LARGE\bfseries\if@sansserifface\sffamily\mathversion{sansbold}\else\mathversion{bold}\fi\color{textcol}%
            \ifx\specialp@perstring\@undefined\else\textit{{\specialp@perstring} to}\break``\fi
            \@title
            \ifx\specialp@perstring\@undefined
            \else
              ''\if@noref,\else\space published in\fi\space
              \@journalnameabbreviation,
              \if@noref\@msnumber \else \@pvol, \@fpage\if@nolastpage\else{--\@lpage}\fi\fi, \@pyear
            \fi
            \par}%
           \if@noauthor
           \else
             \vspace{\baselineskip}%
             {\normalsize
              \renewcommand\Authfont{\bfseries}%
              \renewcommand\Affilfont{\mdseries}%
              \setlength\affilsep{4pt}%
              \let\and=\sw@and
              \@author\par}%
              \vskip-0.25\baselineskip
           \fi
           \@thanks}
           %% NEU:
           \ifnum\ifx\@corresp\@empty\ifx\@howtocite\@empty\if!\@recvd!\ifx\abstractexists\@undefined\ifx\@published\@undefined0\else1\fi\else1\fi\else1\fi\else1\fi\else1\fi=1\relax
             \par\vskip1.5\baselineskip
             \def\labelfont{\bfseries\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol}}%
             \list{}{\labelwidth35mm%
                        \leftmargin\labelwidth
                        \itemsep4mm
                        \labelsep\z@
                        \xdef\@indescription{}%
                        \def\makelabel##1{\labelfont##1\hss}}%
               \ifx\@corresp\@empty\else\item[{Correspondence:}]\@corresp\fi
               \ifnum\ifx\@published\@undefined\ifx\specialp@perstring\@undefined\if!\@recvd!0\else1\fi\else0\fi\else1\fi=1\relax
                 \item[{Relevant dates:}]%
               \fi
               \bgroup\raggedright
               \ifx\specialp@perstring\@undefined
                 \if!\@recvd!
                 \else
                   \setbox\z@\hbox\bgroup
                     \strut\hbox{Received:\nobreakspace\@recvd}%
                     \def\datesep{ -- }%
                     \if@twostagejnl\ifx\@pubdiscuss\@empty\else
                         \datesep \hbox{Discussion started:\nobreakspace\@pubdiscuss}\def\datesep{\newline\def\datesep{ -- }}%
                       \fi
                     \fi
                     \if!\@revsd!\else\datesep \hbox{Revised:\nobreakspace\@revsd}\fi
                     \if!\@accptd!\else\datesep \hbox{Accepted:\nobreakspace\@accptd}\fi
                     \ifx\@published\@undefined\else\datesep\fi
                   \egroup
                   \unhcopy\z@
                   \ifdim\wd\z@>100mm\strut\newline\strut\fi
                 \fi
               \fi
               \ifx\@published\@undefined\else \strut\hbox{Published:\nobreakspace\@published}\fi
               \strut\par\egroup
               \ifx\@howtocite\@empty\else\item[{How to cite:}]\@howtocite\fi
               \ifx\abstractexists\@undefined
               \else
                 \item[\abstractname:]\@abstr%
                   \ifx\second@bstract\@undefined\else\item[\secabstractname:]\second@bstract\fi
                   \if!\@keyw!\else\item[Keywords:]\@keyw\fi
               \fi
             \endlist
           \fi
           \vspace{20pt}}
    \else%% classical
      \def\@@maketitlefinal{%
          \vspace*{36mm}%
          {\@maketitle@setup
           \raggedright
           {\LARGE\bfseries\if@sansserifface\if@sansserifface\sffamily\fi\mathversion{sansbold}\else\mathversion{bold}\fi\color{textcol}%
            \ifx\specialp@perstring\@undefined\else\textit{{\specialp@perstring} to}\break``\fi
            \@title
            \ifx\specialp@perstring\@undefined
            \else
              ''\if@noref,\else\space published in\fi\space
              \@journalnameabbreviation,
              \if@noref\@msnumber \else \@pvol, \@fpage\if@nolastpage\else{--\@lpage}\fi\fi, \@pyear
            \fi
            \par}%
           \if@noauthor
           \else
             \vspace{\baselineskip}%
             {\normalsize
              \renewcommand\Authfont{\bfseries}%
              \renewcommand\Affilfont{\mdseries}%
              \setlength\affilsep{4pt}%
              \let\and=\sw@and
              \@author\par}%
              \vskip-0.25\baselineskip
           \fi
           \@thanks
           \ifx\@corresp\@empty\else\vskip\baselineskip\textbf{{\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol} Correspondence:}}\space\@corresp\fi
           \ifx\@howtocite\@empty\else\vskip.75\baselineskip\textbf{{\if@sansserifface\sffamily\fi\upshape\noindent\color{textcol} How to cite:}}\space\@howtocite\fi
           \par\vspace{10pt}%
           \ifx\specialp@perstring\@undefined
             \if!\@recvd!
             \else
               Received: \@recvd
               \def\datesep{ -- }%
               \if@twostagejnl\ifx\@pubdiscuss\@empty\else
                 \datesep Discussion started:\nobreakspace\@pubdiscuss\def\datesep{\newline\def\datesep{ -- }}%
               \fi\fi
               \if!\@revsd!\else\datesep Revised:\nobreakspace\@revsd\fi
               \if!\@accptd!\else\datesep Accepted:\nobreakspace\@accptd\fi
               \ifx\@published\@undefined\else\datesep\fi
             \fi
           \fi
           \ifx\@published\@undefined\else Published: \@published\fi
           \vspace{20pt}}}
     \fi
  \fi
\else%discussions
  \def\titleheight#1{\def\@tithei{#1}} \def\@tithei{7.5cm}%reserved for future usage
  \def\@maketitle{%
    \global\@topnum\z@
    \if@cop@home\ifonline
      \hypertarget{title}{}%
      \hypersetup{pdfauthor={\@runauth}}%
      \hypersetup{pdftitle={\@runtit}}%
    \fi\fi
    \begin{nolinenumbers}%
    \if@cop@home
      \ifx\@msnumber\@undefined
        \CopernicusError{Please add \string\msnumber{...}}{You must provide the number of the manuscript}%
        \global\let\@msnumber\@empty
      \else
      \ifx\@msnumber\@empty
        \CopernicusError{Please fill \string\msnumber{...}}{You must provide the number of the manuscript}%
      \fi\fi
      \parbox[b]{107mm}{\fontsize{8}{11}\usefont{T1}{ma1}{m}{n}%
        %\@journalInfo\\
        %\@journalurlInfo\\
        %\if@noref\else
        %   https://doi.org/10.5194/\@journalnameshortlower-\@pvol-\@fpage-\@pyear
        %\fi\\
        %\@journalcopyright
        \ifx\specialp@perstring\@undefined\else{\specialp@perstring} to\space\fi
        \@journalnameabbreviation, %
        \ifx\specialp@perstring\@undefined
          \if@noref\else\doi{10.5194/\@msnumber}, \@pyear\fi\\
          Manuscript under review for journal \@journalnameabbreviationbase
        \else
          \@msnumber\\\@journalurl/\@msnumber/%
        \fi
        \\
        \ifx\specialp@perstring\@undefined
          Published:\nobreakspace\@published
        \else
           \if@noref\else\doi{10.5194/\@msnumber-editorial-note}\fi
        \fi
        \\
        \copyright\ Author(s) \@pyear. CC-BY 3.0 License.%
        %\\[1mm]\includegraphics[width=1.5cm]{CreativeCommons_Attribution_License.png}%
      }%
      \hfill
      \setbox\z@\hbox{\@journallogo}\@tempdima\dimexpr\ht\z@-17mm\relax
      \smash{\lower\dimexpr3mm+\@tempdima\relax\llap{\@journallogo}}%war2.5mm
      \vskip5mm
      \ifacp\vskip1.5mm\fi
      \ifamt\vskip1.5mm\fi
      \ifhess\vskip1.5mm\fi
      {\fboxsep2mm
       \colorbox{discussion_bartext_background}
         {\advance\hsize-2\fboxsep
          \parbox{\hsize}
            {\color{discussion_bartext}\fontsize{9.5}{13}\usefont{T1}{ma1}{m}{n}%
             \@sentenceDiscussion\par}}}%
    \else
      \parbox[t]{\textwidth}{\@manuscriptInfo}%
    \fi
    \vskip13.6\p@
    \raggedright
    {\huge\bfseries\mathversion{bold}%
     \ifx\specialp@perstring\@undefined\else{\large\specialp@perstring\space to\\}``\fi
     \@title
     \ifx\specialp@perstring\@undefined\else''\\[1mm]\large\@journalnameabbreviation, \@msnumber, \@pyear\fi
     \\[5mm]}%
    \if@noauthor\else
      \def\Authfont{\rmfamily\bfseries}%
      \def\Affilfont{\@affilfontsize\rmfamily\mdseries}%
      \affilsep3mm
      \@author\\[3mm]
    \fi
    \if@cop@home
      {\small Received:\nobreakspace\@recvd\ -- Accepted:\nobreakspace\@accptd\ -- Published:\nobreakspace\@published\\*[2mm]
       \if@noauthor\else Correspondence:\nobreakspace\@corresp\fi\\*[2mm]
       \@sentence}
    \else
      \if@noauthor\else
        {\small Correspondence: \@corresp}%
      \fi
    \fi
    \end{nolinenumbers}%
    \vfill
    \clearpage}
\fi%stage
\if@stage@final
  \if@sansserifface
    \def\section{\@dolinesectrue\@startsection{section}{1}{\z@}
      {-3.5ex\@plus-1ex\@minus-0.2ex}
      {\if@secline2.3ex\else2.3ex\@plus0.2ex\fi}
      {\raggedright\normalsize\sffamily\bfseries\mathversion{sansbold}\upshape\noindent\color{textcol}}}
    \def\subsection{\@dolinesectrue\@startsection{subsection}{2}{\z@}
      {\if@secline-3ex\@plus-1ex\@minus-0.2ex\else-3.25ex\@plus-1ex\@minus-0.2ex\fi}
      {\if@secline1.25ex\else1.5ex\@plus0.2ex\fi}
      {\raggedright\normalsize\sffamily\mdseries\mathversion{sans}\upshape\noindent\color{textcol}}}
    \def\subsubsection{\@dolinesectrue\@startsection{subsubsection}{3}{\z@}
      {\if@secline-3ex\@plus-1ex\@minus-0.2ex\else-3.25ex\@plus-1ex\@minus-0.2ex\fi}
      {\if@secline1.25ex\else1.5ex\@plus0.2ex\fi}
      {\raggedright\normalsize\sffamily\mdseries\mathversion{sans}\upshape\noindent\color{textcol}}}
  \else%classical
    \def\section{\@dolinesectrue\@startsection{section}{1}{\z@}
      {-2em\@plus-1ex\@minus-.2ex}
      {\if@secline1.15em\else1em\@plus.2ex\fi}
      {\raggedright\normalfont\normalsize\bfseries\mathversion{bold}}}
    \def\subsection{\@dolinesectrue\@startsection{subsection}{2}{\z@}
      {-1em\@plus-0.25ex\@minus-.2ex}
      {\if@secline1.15em\else1em\@plus.2ex\fi}
      {\raggedright\normalfont\normalsize\bfseries\mathversion{bold}}}
    \def\subsubsection{\@dolinesectrue\@startsection{subsubsection}{3}{\z@}
      {-1em\@plus-0.25ex\@minus-.2ex}
      {\if@secline1.15em\else1em\@plus.2ex\fi}
      {\raggedright\normalsize\normalfont\bfseries\mathversion{bold}}}
  \fi%final
\else%discussions
  \def\section{\@dolinesectrue\@startsection{section}{1}{\z@}
    {-2em\@plus-1ex\@minus-.2ex}
    {1em\@plus.2ex}
    {\raggedright\normalfont\normalsize\bfseries\mathversion{bold}}}
  \def\subsection{\@dolinesectrue\@startsection{subsection}{2}{\z@}
    {-1em\@plus-0.25ex\@minus-.2ex}
    {1em\@plus.2ex}
    {\raggedright\normalfont\normalsize\bfseries\mathversion{bold}}}
  \def\subsubsection{\@dolinesectrue\@startsection{subsubsection}{3}{\z@}
    {-1em\@plus-0.25ex\@minus-.2ex}
    {1em\@plus.2ex}
    {\raggedright\normalfont\normalsize\bfseries\mathversion{bold}}}
\fi
\def\@startsection#1#2#3#4#5#6{%
  \gdef\cur@secdepth{#2}%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \if@secline\let\@secline@omitted\relax\fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@afterheading{%
  \@nobreaktrue
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
      \fi
      \if@secline
        \if@dolinesec
          \if@sansserifface
            \rlap{\smash{\expandafter\ifnum\cur@secdepth>\@ne\raise1.2\baselineskip\else\raise1.5\baselineskip\fi\hbox{\vrule width\hsize height\arrayrulewidth\relax}}}%
          \else
            \rlap{\smash{\raise1.5\baselineskip\hbox{\vrule width\hsize height\arrayrulewidth\relax}}}%
          \fi
        \fi%
        \@dolinesecfalse
        \global\let\@secline@omitted\@undefined
      \fi
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
}
\let\paragraph=\subsubsection
\let\subparagraph=\paragraph
\if@stage@final
  \if@manuscript
  \else
    \leftmargini2em
    \leftmarginii1.75em
    \leftmarginiii1.5em
    \leftmarginiv1em
    \leftmarginv0.5em
    \leftmarginvi0.5em
  \fi
\fi
\def\labelitemi{\bfseries\textendash}
\def\labelitemii{\bfseries\textendash}
\def\labelitemiii{$\m@th\bullet$}
\def\labelitemiv{$\m@th\cdot$}
\def\itemize{%
  \if@secline
    \ifx\@secline@omitted\relax
      \leavevmode
      \nobreak
      \vspace*{-1.72\baselineskip}%
      \global\let\@secline@omitted\@undefined
    \fi
  \fi
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}}%
  \fi}
\let\@abslang\relax
\long\def\secondabstract#1{%
  \subpdfbookmark{\secabstractname.}{\secabstractname.}%
  \toks@{%
    \if@abstractindented\else\if@stage@final
      \noindent\textcolor{textcol}{\reset@font\normalsize\if@sansserifface\sffamily\fi\bfseries \secabstractname.} \ignorespaces\enskip
    \fi\fi
    #1}
  \immediate\write\@auxout{\string\gdef\string\second@bstract{\the\toks@}}%
  \if@abstractindented\else
    \if@stage@final
    \else
      \section*{\secabstractname}
      \second@bstract
    \fi
  \fi
}
\if@stage@final
  \ifnum\if@abstractcentered1\else\if@abstractindented1\else0\fi\fi=1\relax%modern oder indented
    \long\def\abstract{%
      \immediate\write\@auxout{\string\gdef\string\abstractexists{true}}%
      \iflanguage{ngerman}{\@abslang}{\iflanguage{german}{\@abslang}{}}%
      \subpdfbookmark{\abstractname}{abstract}%
      \edef\ABS@{\@currenvir}%
      \toks@{}\ABS@get@body}
    \let\endabstract\relax
    \long\def\ABS@get@body#1\end
      {\toks@\expandafter{\the\toks@\parindent1em\relax#1}\ABS@find@end}
    \def\ABS@find@end#1{%
      \def\@tempa{#1}%
      \ifx\@tempa\ABS@
        \expandafter\ABS@endabstract
      \else
        \toks@\expandafter{\the\toks@\end{#1}}\expandafter\ABS@get@body
      \fi}
    \def\ABS@{abstract}
    \def\ABS@endabstract{%
      \immediate\write\@auxout{\string\gdef\string\@abstr{\the\toks@}}%
      \iflanguage{ngerman}%
        {\gdef\@abslang{\selectlanguage{english}}}%
        {\iflanguage{german}%
          {\gdef\@abslang{\selectlanguage{english}}}%
          {\gdef\@abslang{\selectlanguage{ngerman}}}}
      \expandafter\end\expandafter{\ABS@}}
  \else%classical
    \renewenvironment{abstract}
     {\gdef\abstractexists{true}%
      \iflanguage{ngerman}{\@abslang}{\iflanguage{german}{\@abslang}{}}%
      \reset@font\normalsize\par\noindent
      \subpdfbookmark{\abstractname}{abstract}%
      \textcolor{textcol}{\reset@font\normalsize\if@sansserifface\sffamily\fi\bfseries\abstractname.} \ignorespaces}
     {%
       \ifx\second@bstract\@undefined\else\vskip\baselineskip\second@bstract\fi
       \if!\@keyw!\else
        \par\vspace{1.7mm}\noindent
        \textbf{Keywords.}\enspace\ignorespaces\@keyw
      \fi
      \if@manuscript\else\if@noline\else
        \par\vskip\baselineskip
      \fi\fi
      \iflanguage{ngerman}
        {\gdef\@abslang{\selectlanguage{english}}}%
        {\iflanguage{german}%
          {\gdef\@abslang{\selectlanguage{english}}}%
          {\gdef\@abslang{\selectlanguage{german}}%
           \if@manuscript\else\if@noline\else\hrule\fi\fi}}}
  \fi
\else%discussions
  \renewenvironment{abstract}
   {\gdef\abstractexists{true}%
    \iflanguage{ngerman}{\@abslang}{\iflanguage{german}{\@abslang}{}}%
    \section*{\abstractname\if@cop@home\ifonline\hypertarget{abstr}{}\fi\fi}}
   {\iflanguage{ngerman}%
        {\gdef\@abslang{\selectlanguage{english}}}%
        {\iflanguage{german}%
          {\gdef\@abslang{\selectlanguage{english}}}%
          {\gdef\@abslang{\selectlanguage{ngerman}}}}}
\fi%stage
%%make sure the author doesn't forget anything
\AtEndDocument{%
  \@ifundefined{abstractexists}
    {\NoSectionWarning{Abstract}}
    {}}
\if@stage@final
  \let\@oxfloat=\@xfloat
\else
  \let\orig@xfloat\@xfloat
  \def\@oxfloat#1[#2]{%
    \clearpage
    \@nodocument
    \begin{nolinenumbers}%
    \def\@captype{#1}%
    \null\vfill}
  \let\orig@end@float\end@float
  \def\end@float{%
    \vfill
    \end{nolinenumbers}}
\fi
\def\@xfloat#1[#2]{%
  \@oxfloat#1[#2]%
  \if@stage@final\vspace*{2mm}\fi
  \centering
  \small}
\if@stage@final
  \if@sansserifface
    \def\fnum@figure{\sffamily\color{textcol}\figurename\nobreakspace\thefigure}
    \def\fnum@table{\sffamily\color{textcol}\tablename\nobreakspace\thetable}
  \fi
\else
  \def\fnum@figure{\rmfamily\bfseries\figurename\nobreakspace\thefigure}
  \def\fnum@table{\rmfamily\bfseries\tablename\nobreakspace\thetable}
\fi
\def\mytextcircled#1{%
  \textcircled{\ifx\in@caption\relax
    \check@mathfonts\fontsize\ssf@size\z@\math@fontsfalse\selectfont\kern-1\p@
  \else
    \check@mathfonts\fontsize\sf@size\z@\math@fontsfalse\selectfont
  \fi #1}}
\long\def\@makecaption#1#2{%
  \def\@tempa{figure}\ifx\@captype\@tempa
    \if@stage@final
      \vskip0.7\abovecaptionskip
    \else
      \vskip\abovecaptionskip\goodbreak
    \fi
  \fi
  {\let\in@caption\relax\reset@font\small{\bfseries#1.} #2\par}%
  \if@cop@home\ifonline\ifnum\csname c@\@captype\endcsname=1 % for 1st fig or tab only
    \immediate\write\@auxout{\string\gdef\string\@num\@captype{}}%
    \hypertarget{\@captype}{}%
  \fi\fi\fi
  \def\@tempa{table}\ifx\@captype\@tempa
    \vskip\abovecaptionskip
    \if@stage@final\else\goodbreak\fi
  \fi}
\if@stage@final
  \if@manuscript
  \else
    \columnsep7mm\relax
  \fi
\else
  \columnsep7mm\relax
\fi
\if@stage@final
  \if@manuscript
    \pagestyle{plain}
  \else
    \pagestyle{headings}
  \fi
\else
  \pagestyle{headings}
\fi
\if@stage@final
  \if@manuscript
  \else
    \@twosidetrue
    \@twocolumntrue
    \sloppy
    \flushbottom
  \fi
\fi
\RequirePackage[normalem]{ulem}%
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\if@cop@home
  \RequirePackage{fontawesome5}
  \RequirePackage{fontawesome}
\fi
\usepackage{upquote}%% #7510
\usepackage{regexpatch}
\def\active@text@prime{\ifin@texttt\textquotesingle\else'\fi}
\def\active@math@prime{^\bgroup\prim@s}
\newif\ifin@texttt
\regexpatchcmd{\pr@m@s}{\'}{\cA\'}{}{}
\xapptocmd{\ttfamily}{\in@texttttrue}{}{}
\begingroup\lccode`\~=`\'
\lowercase{\endgroup\protected\def~}{%
  \ifmmode
    \expandafter\active@math@prime
  \else
    \expandafter\active@text@prime
  \fi}
\AtBeginDocument{\catcode`\'=\active}
\ifx\xmltexversion\@undefined
\begingroup
\obeylines\obeyspaces%
\gdef\@resetactivechars{%
\def^^M{\@activechar@info{EOL}\space}%
\def {\@activechar@info{space}\space}%
}%
\endgroup
\fi
\ifx\xmltexversion\@undefined
  \RequirePackage[utf8]{inputenc}
  \def\strip@x#1x#2\@nil{#1}%
  \IfFileExists{ucharacters.sty}{%
    \def\DefineCharacter##1##2##3{\expandafter\def\expandafter\@argii\expandafter{\strip@x##2x\@nil}\DeclareUnicodeCharacter{\@argii}{##3}}%
    \usepackage{ucharacters}%
  }{}%
\fi
\def\cmrng{{\fontfamily{cmr}\selectfont\ng}}
\let\old@classoptionslist\@classoptionslist
\edef\@classoptionslist{english,\old@classoptionslist}
\RequirePackage{babel}
\let\@classoptionslist\old@classoptionslist
\ifx\StandardLayout\@undefined\let\StandardLayout\relax\fi
\def\@tempa{french}\ifx\bbl@main@language\@tempa
  \StandardLayout
  %% Switch to quotation marks with additional horizontal spacing
  \let\update@frenchlists\relax
  \bbl@frenchguillemets
  \global\let\flqq\og \global\let\frqq\fg
  \ifx\xmltexversion\@undefined\else
    \begingroup
      \catcode`\!=\active\gdef!{\utfeightax!}%
      \catcode`\?=\active\gdef?{\utfeightax?}%
      \catcode`\:=\active\gdef:{\utfeightax:}%
      \catcode`\;=\active\gdef;{\utfeightax;}%
    \endgroup
  \fi
\fi
\expandafter\ifx\csname l@ngerman\endcsname\relax
  \chardef\l@ngerman="FD
\fi
\expandafter\ifx\csname l@german\endcsname\relax
  \chardef\l@german="FE
\fi
\def\@tempa{%
  \def\introductionname{Introduction}%
  \def\authorcontributionname{Author contributions}%
  \def\secabstractname{Kurzfassung}%
  \def\conclusionname{Conclusions}%
  \def\copyrightstatementname{Copyright statement}%
  \def\codeavailabilityname{Code availability}%
  \def\dataavailabilityname{Data availability}%
  \def\ercavailabilityname{Executable research compendium (ERC)}%
  \def\codedataavailabilityname{Code and data availability}%
  \def\sampleavailabilityname{Sample availability}%
  \def\competinginterestsname{Competing interests}%
  \def\videosupplementname{Video supplement}%
  \def\dosupplementname{Supplement}%
  \def\teamlistname{Team list}%
  \def\disclaimername{Disclaimer}%
  \def\sistatementname{Special issue statement}%
  \def\financialsupportname{Financial support}%
  \def\reviewstatementname{Review statement}%
  \def\acknowledgementname{Acknowledgement}%
  \def\acknowledgementsname{Acknowledgements}%
  \if@cop@home
    \def\equationname{Eq.}%
    \def\sectionname{Sect.}%
  \fi}
\expandafter\addto\expandafter\captionsbritish\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsUKenglish\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsenglish\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsamerican\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsUSenglish\expandafter{\@tempa}
\def\@tempa{%
  \def\figurename{Abb.}%
  \def\abstractname{Kurzfassung}%
  \def\secabstractname{Abstract}%
  \def\introductionname{Einleitung}%
  \def\conclusionname{Fazit}%
  \def\copyrightstatementname{Urheberrechtserklärung}%
  \def\codeavailabilityname{Codeverfügbarkeit}%
  \def\dataavailabilityname{Datenverfügbarkeit}%
  \def\ercavailabilityname{Executable research compendium (ERC)}%
  \def\codedataavailabilityname{Code- und Datenverfügbarkeit}%
  \def\sampleavailabilityname{Probenverfügbarkeit}%
  \def\authorcontributionname{Autorenmitwirkung}%
  \def\competinginterestsname{Interessenkonflikt}%
  \def\videosupplementname{Videoanhang}%
  \def\dosupplementname{Supplement}%
  \def\teamlistname{Gruppenautorenschaft}%
  \def\disclaimername{Haftungsausschluss}%
  \def\sistatementname{Erklärung zum Sonderheft}%
  %% TBD
  \def\financialsupportname{Finanzierung}%
  \def\reviewstatementname{Begutachtung}%
  \def\acknowledgementname{Danksagung}%
  \def\acknowledgementsname{Danksagung}%
  \if@cop@home
    \def\equationname{Gl.}%
    \def\sectionname{Kap.}%
  \fi}
\expandafter\addto\expandafter\captionsngerman\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsgerman\expandafter{\@tempa}
\def\@tempa{%
  \def\figurename{Figure}%
  \def\tablename{Tableau}%
  \def\secabstractname{Kurzfassung}%
  \def\introductionname{Introduction}%
  \def\conclusionname{Conclusion}%
  \def\copyrightstatementname{Affirmation du droit d'auteur}%
  \def\codeavailabilityname{Disponibilité du code}%
  \def\dataavailabilityname{Disponibilité des données}%
  \def\ercavailabilityname{Executable research compendium (ERC)}%
  \def\sampleavailabilityname{Disponibilité des examples}%
  \def\codedataavailabilityname{Disponibilité du code et des données}%
  \def\authorcontributionname{Collaborateurs}%
  \def\competinginterestsname{Intérêts concurrents}%
  \def\videosupplementname{Annexes vidéo}%
  \def\dosupplementname{Supplement}%
  \def\teamlistname{Liste d'auteurs}%
  \def\disclaimername{Clause de non-responsabilité}%
  \def\sistatementname{Déclaration de la numéro special}%
  %% TBD
  \def\financialsupportname{Financement}%
  \def\reviewstatementname{Contr\^{o}le par les pairs}%
  \def\acknowledgementname{Remerciements}%
  \def\acknowledgementsname{Remerciements}%
  \if@cop@home
    \def\equationname{Éq.}%
    \def\sectionname{Sect.}%
  \fi}
\expandafter\addto\expandafter\captionsfrench\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsfrancais\expandafter{\@tempa}
\expandafter\addto\expandafter\captionscanadien\expandafter{\@tempa}
\expandafter\addto\expandafter\captionsacadian\expandafter{\@tempa}
\RequirePackage{array}
\def\@cline#1-#2\@nil{%
  \noalign{%
    \ifx\@clinecorr\@undefined
      \vskip0.5mm%
      \global\let\@clinecorr\relax
    \else
      \vskip-1.5mm%
    \fi}%
  \omit
  \@multicnt#1%
  \advance\@multispan\m@ne
  \ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  \@multicnt#2%
  \advance\@multicnt-#1%
  \advance\@multispan\@ne
  \leaders\hrule\@height\arrayrulewidth\hfill
  \cr
  \noalign{%
    \vskip-\arrayrulewidth
    \vskip1.5mm}}
\def\@arraycr{\relax\iffalse{\fi\ifnum 0=`}\fi
 \global\let\@clinecorr\@undefined
 \@ifstar \@xarraycr \@xarraycr}
\RequirePackage{tabularx}
\IfFileExists{graphicx.sty}
  {\RequirePackage{graphicx}%
   \ifnum\pdfoutput=\z@
     \DeclareGraphicsExtensions{.eps,.ps}%
   \else
     \DeclareGraphicsExtensions{.pdf,.png,.jpg}
   \fi}
  {\CopernicusWarningNoLine{Cannot find graphicx.sty; proceeding without it}}
\IfFileExists{color.sty}
  {\RequirePackage{color}}
  {\CopernicusWarningNoLine{Cannot find color.sty; proceeding without it}}
\IfFileExists{amssymb.sty}
  {\RequirePackage{amssymb}}
  {\CopernicusWarningNoLine{Cannot find amssymb.sty; proceeding without it}}
\IfFileExists{amsmath.sty}
  {\RequirePackage[intlimits,fleqn,tbtags]{amsmath}
   \ifx\xmltexversion\@undefined
   \else
     \renewcommand{\allowdisplaybreaks}[1][4]{%
       \global\interdisplaylinepenalty\getdsp@pen{##1}\relax}%
   \fi}
  {\CopernicusWarningNoLine{Cannot find amsmath.sty; proceeding without it}}
\RequirePackage{amsthm}
\newcommand\Authfont{\normalfont}
\newcommand\Affilfont{\normalfont}
\newcommand\Authsep{, }
\newcommand\Authands{, and }
\newcommand\Authand{ and }
\newlength\affilsep\setlength{\affilsep}{1em}
\newlength\@affilsep
\newcounter{Maxaffil}
\setcounter{Maxaffil}{2}
\newcounter{authors}
\newcounter{affil}
\newif\ifnewaffil \newaffiltrue
\newcommand\AB@authnote[1]{\textsuperscript{\normalfont#1}}
\newcommand\AB@affilnote[1]{\textsuperscript{\normalfont#1}}
\providecommand\textsuperscript[1]{$^{#1}$}
\newcommand\AB@blk@and{\protect\Authfont\protect\AB@setsep}
\newcommand\AB@pand{\protect\and \protect\Authfont \protect\AB@setsep}
\@namedef{@sep1}{}
\@namedef{@sep2}{\Authand}
\newcommand\AB@affilsep{\protect\Affilfont}
\newcommand\AB@affilsepx{\protect\\\protect\Affilfont}
\newcommand\AB@setsep{\setlength{\@affilsep}{\affilsep}}
\newcommand\AB@resetsep{\setlength{\@affilsep}{\z@}}
\newcommand\AB@authlist{}
\newcommand\AB@affillist{}
\newcommand\AB@authors{}
\newcommand\AB@empty{}
\xdef\AB@author{\noexpand\AB@blk@and\@author}
\def\true{true}%
\newcounter{authnum}
\global\let\@@deceased\relax
\global\let\@@econtrib\relax

\renewcommand\author[2][]%
      {\ifnewaffil\addtocounter{affil}{1}%
       \xdef\AB@thenote{\arabic{affil}}\fi
       \global\advance\c@authnum\@ne
       \if@cop@home
         \expandafter\ifx\csname deceased@\the\c@authnum\endcsname\true\relax\def\@@deceased{$^{,\text{\faCross}}$}\fi
         \expandafter\ifx\csname econtrib@\the\c@authnum\endcsname\true\relax\def\@@econtrib{$^{,\text{\faStar}}$}\fi
       \fi
       \def\@tempa{#1}\ifx\@tempa\@empty\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \ifnum\value{authors}>1\relax
        \expandafter\gdef\csname @sep\number\c@authors\endcsname{\Authsep}%
      \fi
      \addtocounter{authors}{1}%
      \begingroup
          \let\protect\@unexpandable@protect \let\and\AB@pand
          \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
         \@temptokena=\expandafter{\AB@authors}%
         {\def\\{\protect\\[\@affilsep]\protect\Affilfont
              \protect\AB@resetsep}%
              \protected@xdef\AB@author{\AB@blk@and#2}%
       \ifnewaffil\gdef\AB@las{}\gdef\AB@lasx{\protect\Authand}\gdef\AB@as{}%
           \xdef\AB@authors{\the\@temptokena\AB@blk@and}%
       \else
          \xdef\AB@authors{\the\@temptokena\AB@as\AB@au@str}%
          \global\let\AB@las\AB@lasx\gdef\AB@lasx{\protect\Authands}%
          \gdef\AB@as{\Authsep}%
       \fi
       \gdef\AB@au@str{#2}}%
         \@temptokena=\expandafter{\AB@authlist}%
         \let\\=\authorcr
         \protected@xdef\AB@authlist{\the\@temptokena
           \protect\@nameuse{@sep\number\c@authors}%
           \protect\Authfont#2\AB@authnote{\AB@note}%
           \@@econtrib
           \@@deceased}%
      \endgroup
      \ifnum\value{authors}>2\relax
        \expandafter\gdef\csname @sep\number\c@authors\endcsname{\Authands}%
      \fi
      \newaffilfalse
\global\let\@@deceased\relax\global\let\@@econtrib\relax}
\newcommand\authorcr{\protect\\ \protect\Authfont \protect\AB@setsep}%
\newcommand\affil[2][]%
   {\newaffiltrue\let\AB@blk@and\AB@pand
      \def\@tempa{#1}\ifx\@tempa\@empty\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \begingroup
        \let\protect\@unexpandable@protect
        \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
        \@temptokena=\expandafter{\AB@authors}%
        {\def\\{\protect\\\protect\Affilfont}\protected@xdef\AB@temp{#2}}%
         \protected@xdef\AB@authors{\the\@temptokena\AB@las\AB@au@str
         \protect\\[\affilsep]\protect\Affilfont\AB@temp}%
         \gdef\AB@las{}\gdef\AB@au@str{}%
        {\def\\{, \ignorespaces}\protected@xdef\AB@temp{#2}}%
        \@temptokena=\expandafter{\AB@affillist}%
        \protected@xdef\AB@affillist{\the\@temptokena \AB@affilsep
          \AB@affilnote{\AB@note}\protect\Affilfont\AB@temp}%
      \endgroup
       \let\AB@affilsep\AB@affilsepx
}
\def\@author{}
\renewcommand\@author{%
  \let\no@par\relax
  \ifx\AB@affillist\AB@empty\AB@author\else
    \ifnum\value{affil}>\value{Maxaffil}%
      \AB@authlist\\[\affilsep]\AB@affillist
    \else
      \AB@authors
    \fi
  \fi}

\def\deceased@sep#1,#2\@nil{%
  \immediate\write\@auxout{\string\expandafter\string\gdef\string\csname\space deceased@#1\endcsname{true}}%
  \if!#2!\else\deceased@sep#2\@nil\fi}
\def\econtrib@sep#1,#2\@nil{%
  \immediate\write\@auxout{\string\expandafter\string\gdef\string\csname\space econtrib@#1\endcsname{true}}%
  \if!#2!\else\econtrib@sep#2\@nil\fi}

\newcommand\deceased[2][]{\gdef\@deceasedtext{#1}\@deceased{#2}}
\if@cop@home
\def\@deceased#1{%
  \ifx\@deceasedtext\@empty\gdef\@deceasedNote{deceased}\else\gdef\@deceasedNote{deceased, \@deceasedtext}\fi
   \deceased@sep#1,\@nil
   \@temptokena=\expandafter{\AB@affillist}%
   \protected@xdef\AB@affillist{\the\@temptokena \AB@affilsep
     \AB@affilnote{\faCross}\protect\Affilfont\@deceasedNote}%
  }
\newcommand\equalcontrib[1]{%
  \gdef\@econtribNote{These authors contributed equally to this work.}%
  \econtrib@sep#1,\@nil
   \@temptokena=\expandafter{\AB@affillist}%
   \protected@xdef\AB@affillist{\the\@temptokena \AB@affilsep
     \AB@affilnote{\faStar}\protect\Affilfont\@econtribNote}%
 }
\else
  \let\equalcontrib\@gobble
  \let\@deceased\@gobble
\fi
\def\Author{\@ifnextchar[\@Author{\@Author[]}}%]
\def\@Author[#1]{%
  \def\@tempa{#1}%
  \@ifnextchar(\@@Author{\@@Author()}}%)}
\def\@@Author(#1){%
  \def\@tempb{#1}%
  \@ifnextchar(\@@@Author{\@@@Author()}}%)}
\def\@@@Author(#1)#2#3{%
  \def\@tempc{#1}%
  \protected@edef\@tempd{%
     \ifx\@tempb\@empty\else\@tempb\nobreakspace\fi
     #2\nobreakspace
     #3%
     \ifx\@tempc\@empty\else\nobreakspace\@tempc\fi}%
  \expandafter\expandafter\expandafter\author\expandafter\expandafter\expandafter
    [\expandafter\@tempa\expandafter]\expandafter{\@tempd}}
\providecommand\appendixname{Appendix}
\let\orisection=\section
\let\theolds=\thesection
\let\theoldss=\thesubsection
\def\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \def\thesection{\@Alph\c@section}%
  \def\thesubsection{\thesection\@arabic\c@subsection}%
  \setcounter{secnumdepth}{4}%
  \@addtoreset{equation}{section}%
  \setcounter{equation}{0}%
  \setcounter{reaction}{0}%
  \def\theequation{\thesection\@arabic\c@equation}%
  \def\thereaction{\thesection R\@arabic\c@reaction}%
  \let\c@org@lst\c@listings%
  \let\c@org@eq\c@equation%
  \let\org@theeq\theequation%
  \if@stage@final
    \@addtoreset{figure}{section}%
    \setcounter{figure}{0}%
    \def\thefigure{\thesection\@arabic\c@figure}%
    \@addtoreset{table}{section}%
    \setcounter{table}{0}%
    \def\thetable{\thesection\@arabic\c@table}%
    \@addtoreset{listings}{section}%
    \setcounter{listings}{0}%
    \def\thelistings{\thesection\@arabic\c@listings}%
  \fi
  \global\let\old@sect\@sect
  \def\@sect##1##2##3##4##5##6[##7]##8{%
    \ifnum ##2>\c@secnumdepth
      \let\@svsec\@empty
    \else
      \refstepcounter{##1}%
      \ifnum ##2=\@ne
        \def\@tempa{##8}%
        \protected@edef\@svsec{%
          \appendixname\space\csname the##1\endcsname
          \ifx\@tempa\@empty\else:\enskip\fi\relax}%
      \else
        \protected@edef\@svsec{\@seccntformat{##1}\relax}%
      \fi
    \fi
    \@tempskipa ##5\relax
    \ifdim \@tempskipa>\z@
      \begingroup
        \ifnum ##2=\@ne\let\@hangfrom\noindent\fi
        ##6{%
            \@hangfrom{\hskip ##3\relax\@svsec}%
            \interlinepenalty \@M ##8\@@par}%
      \endgroup
      \csname ##1mark\endcsname{##7}%
      \addcontentsline{toc}{##1}{%
        \appendixname\space\csname the##1\endcsname\if!##7!\else:\space\fi%for bookmarks
        ##7}%
    \else
      \def\@svsechd{%
        ##6{\hskip ##3\relax
        \@svsec ##8}%
        \csname ##1mark\endcsname{##7}%
        \addcontentsline{toc}{##1}{%
          \appendixname\space\csname the##1\endcsname\if!##7!\else:\space\fi%for bookmarks
          ##7}}%
    \fi
    \@xsect{##5}}
  \global\let\old@ssect\@ssect
  \def\@ssect##1##2##3##4##5{%
    \@tempskipa ##3\relax
    \ifdim \@tempskipa>\z@
      \begingroup
        ##4{%
          \@hangfrom{\hskip ##1}%
          \@tempskipa##2\relax
          \ifdim\@tempskipa<-17\p@%check for sectionlevel=1
            \appendixname
            \def\@tempa{##5}\ifx\@tempa\@empty\else:\enskip\fi
          \fi
          \interlinepenalty \@M ##5\@@par}%
      \endgroup
    \else
      \def\@svsechd{##4{\hskip ##1\relax ##5}}%
    \fi
    \@xsect{##3}}}
\def\noappendix{\setcounter{secnumdepth}{0}%
  \global\let\section=\orisection
  \global\let\thesection=\theolds
  \global\let\thesubsection=\theoldss
  \ifx\old@sect\@undefined\else\global\let\@sect\old@sect\fi
  \ifx\old@ssect\@undefined\else\global\let\@ssect\old@ssect\fi
  \def\thefigure{\@arabic\c@figure}%
  \def\thelistings{\@arabic\c@listings}%
  \def\thetable{\@arabic\c@table}}
\IfFileExists{url.sty}
  {\RequirePackage{url}\urlstyle{same}}%
  {\CopernicusWarningNoLine{Cannot find url.sty; proceeding without it}%
   \def\url#1{%
     \CopernicusError{To use \string\url, you must have url.sty}{Install url.sty}}}
\newcommand\doitext{https://doi.org/}
\newcommand*\doi{%
  \begingroup
  \lccode`\~=`\#\relax
  \lowercase{\def~{\#}}%
  \lccode`\~=`\_\relax
  \lowercase{\def~{\_}}%
  \lccode`\~=`\<\relax
  \lowercase{\def~{\textless}}%
  \lccode`\~=`\>\relax
  \lowercase{\def~{\textgreater}}%
  \lccode`\~=0\relax
  \catcode`\#=\active
  \catcode`\_=\active
  \catcode`\<=\active
  \catcode`\>=\active
  %catcode change won't work after \bibitem while backref.sty
  %  grabs for the whole entry
  \@doi}
\def\@doi#1{%
  \let\#\relax
  \let\_\relax
  \let\textless\relax
  \let\textgreater\relax
  \edef\x{\toks0={{#1}}}%
  \x
  \edef\#{\@percentchar23}%
  \edef\_{_}%
  \edef\textless{\@percentchar3C}% instead of {\string<} for Apple
  \edef\textgreater{\@percentchar3E}% instead of {\sting>} for Apple
  \edef\x{\toks1={\noexpand\href{https://doi.org/#1}}}%
  \x
  \edef\x{\endgroup\doitext\the\toks1 \the\toks0}%
  \x}
\IfFileExists{accents.sty}
  {\RequirePackage{accents}}
  {\CopernicusWarningNoLine{Cannot find accents.sty; proceeding without it}}
\IfFileExists{cancel.sty}
  {\RequirePackage{cancel}}
  {\CopernicusWarningNoLine{Cannot find cancel.sty; proceeding without it}}
\IfFileExists{multirow.sty}
  {\RequirePackage{multirow}}
  {\CopernicusWarningNoLine{Cannot find multirow.sty; proceeding without it}}
\IfFileExists{supertabular.sty}
  {\RequirePackage{supertabular}%
   \let\old@tablecaption\tablecaption
   \def\tablecaption{\def\@captype{table}\old@tablecaption}
   \let\old@supertabular\supertabular
   \def\supertabular{%
     \clearpage
     \centering
     \small
     \old@supertabular}
   \@namedef{supertabular*}##1{%
     \clearpage
     \centering
     \small
     \@ifnextchar[{\@nameuse{@supertabular*}{##1}}%
                  {\@nameuse{@supertabular*}{##1}[]}%]
     }
   \let\old@endsupertabular\endsupertabular
   \def\ud@captype{\let\@captype\@undefined}
   \def\ud@cr{\let\\\@normalcr}
   \long\def\endsupertabular{%
     \old@endsupertabular\par
     \global\let\@table@first@head\undefined
     \global\let\@table@last@tail\undefined
     \tablehead{}%
     \tabletail{}%
     \aftergroup\ud@captype
     \aftergroup\ud@cr}
   \expandafter\let\csname endsupertabular*\endcsname\endsupertabular}
  {\CopernicusWarningNoLine{Cannot find supertabular.sty; proceeding without it}}
\IfFileExists{algorithmic.sty}
  {\RequirePackage{algorithmic}}
  {\CopernicusWarningNoLine{Cannot find algorithmic.sty; proceeding without it}}
\IfFileExists{algorithm.sty}
  {\if@stage@final
   \else
     \def\extra@float##1{%
       \@ifnextchar[%]
         {\orig@xfloat{##1}}%
         {\edef\reserved@a{\noexpand\orig@xfloat{##1}[\csname fps@##1\endcsname]}%
          \reserved@a}}
     \RequirePackage{float}%
     \def\float@restyle##1{\expandafter\edef\csname
       fst@##1\endcsname{\expandafter\noexpand\csname
       fs@\float@style\endcsname}%
       \@namedef{##1}{\@nameuse{fst@##1}%
          \@float@setevery{##1}\extra@float{##1}}%
       \@namedef{##1*}{\@nameuse{fst@##1}%
          \@float@setevery{##1}\@dblfloat{##1}}%
       \expandafter\let\csname end##1\endcsname\float@end
       \expandafter\let\csname end##1*\endcsname\float@dblend
       \expandafter\let\csname @float@c@##1\endcsname=\float@caption
       \@ifundefined{@float@every@##1}{%
         \expandafter\newtoks\csname @float@every@##1\endcsname}{}%
       \@nameuse{@float@every@##1}={}}
     \def\float@end{\@endfloatbox
       \global\setbox\@currbox\float@makebox\columnwidth
       \let\@endfloatbox\relax\orig@end@float}
   \fi
   \RequirePackage{algorithm}
   \def\theHalgorithm{\@arabic\c@algorithm}}
  {\CopernicusWarningNoLine{Cannot find algorithm.sty; proceeding without it}}
\let\cop@makecaption\@makecaption
\let\c@org@fig\c@figure
\let\@orgfigurename\figurename
\def\setfigures{\global\let\c@figure\c@org@fig\global\let\figurename\@orgfigurename}
\@definecounter{figscheme}
\def\schemename{Scheme}
\let\figschemename\schemename
\def\setschemes{\global\let\c@figure\c@figscheme\global\let\figurename\figschemename}
\@definecounter{plates}
\def\platesname{Plate}
\def\setplates{\global\let\c@figure\c@plates\global\let\figurename\platesname}
\@definecounter{listings}
\def\listingsname{Listing}
\def\setlistings{\global\let\c@figure\c@listings\global\let\figurename\listingsname}
\@definecounter{boxes}
\def\boxesname{Box}
\def\setboxes{\global\let\c@figure\c@boxes\global\let\figurename\boxesname}
\if@stage@final
  \IfFileExists{caption.sty}
    {\RequirePackage{caption}}
    {\CopernicusWarningNoLine{Cannot find caption.sty; proceeding without it}}
\else
  \IfFileExists{subfig.sty}
    {\RequirePackage{subfig}}
    {\CopernicusWarningNoLine{Cannot find subfig.sty; proceeding without it}}
\fi
\let\@makecaption\cop@makecaption
\IfFileExists{subfloat.sty}
  {\RequirePackage{subfloat}%
   \protected@xdef\themainfigure{\thefigure}%
   \protected@xdef\themaintable{\thetable}%
   \g@addto@macro\subfiguresbegin{\global\let\theHfigure\thesubfloatfigure}
   \g@addto@macro\subtablesbegin{\global\let\theHtable\thesubfloattable}
   \g@addto@macro\subfiguresend{\global\let\theHfigure\thefigure@original}
   \g@addto@macro\subtablesend{\global\let\theHtable\thetable@original}}
  {\CopernicusWarningNoLine{Cannot find subfloat.sty; proceeding without it}}

\newif\ifNAT@openbib
\IfFileExists{natbib.sty}
  {\RequirePackage[authoryear,round]{natbib}
   \bibpunct{(}{)}{;}{a}{,}{,~}
   \def\NAT@sort{0}\def\NAT@cmprs{0}
   \setlength\bibsep\z@
   \let\bibfont\small
   \renewcommand\bibitem{\@ifnextchar[{\@lbibitem}{\@lbibitem[??(????)]}}%]
   \ifx\xmltexversion\@undefined\else
     \NAT@set@cites
     \let\NAT@set@cites\relax
   \fi
   \AtBeginDocument{\let\@citex\NAT@citex}
   \newcommand\urlprefix{}
   \renewenvironment{thebibliography}[1]
   {\bibsection
     \if@secline\leavevmode\vspace*{-\baselineskip}\nobreak\fi
     \parindent\z@
     \bibpreamble
     \bibfont
     \list{\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{##1}%
       \setcounter{NAT@ctr}{0}}%
     \ifNAT@openbib
       \renewcommand\newblock{\par}
     \else
       \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
     \fi
     \sloppy
     % \clubpenalty4000\widowpenalty4000
     \sfcode`\.=1000\relax
     \let\citeN\cite \let\shortcite\cite
     \let\citeasnoun\cite}
   {\def\@noitemerr{%
       \PackageWarning{natbib}{Empty `thebibliography' environment}}%
     \endlist\vskip-\lastskip}
   \def\bibsection{%
     \if@stage@final
       \if@manuscript\newpage\fi
       \pdfbookmark[1]{\refname}{biblio}%
     \fi
     \noappendix\section*{\refname\if@cop@home\ifonline\hypertarget{references}{}\fi\fi}}
 }{\CopernicusWarningNoLine{Cannot find natbib.sty; proceeding without it}}
\RequirePackage{rotating}
\def\@rotxdblfloat#1[#2]{%
  \@float{#1}[#2]%
  \hsize\textwidth\linewidth\textwidth
  \begin{lrbox}\rot@float@box
  \begin{minipage}\textheight
}
\IfFileExists{lineno.sty}
  {\RequirePackage[mathlines,modulo]{lineno}%
   \if@stage@final
     \if@manuscript
       \linenumbers\renewcommand\linenumberfont{\normalfont\small\sffamily}%
     \else
       \setpagewiselinenumbers\switchlinenumbers%cf. the switch option
       \linenumbersep3\p@
       \if@cop@home
         \nolinenumbers
       \else%new, 2015-12-14
         \linenumbers
       \fi
     \fi
   \else
     \setpagewiselinenumbers
     \if@cop@home\linenumbers\fi
   \fi
   \g@addto@macro\nolinenumbers{\linenopenalty\z@}%avoids problems with \patchAmsMathEnvironmentForLinenoX while \nolinenumbers
   \newcommand*\patchAmsMathEnvironmentForLineno[1]{%
     \expandafter\let\csname old##1\expandafter\endcsname\csname ##1\endcsname
     \expandafter\let\csname oldend##1\expandafter\endcsname\csname end##1\endcsname
     \renewenvironment{##1}%
      {\linenomath\csname old##1\endcsname}%
      {\csname oldend##1\endcsname\endlinenomath}}%
   \newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
     \patchAmsMathEnvironmentForLineno{##1}%
     \patchAmsMathEnvironmentForLineno{##1*}}%
   \newcommand*\patchAmsMathEnvironmentForLinenoX[1]{%
     \expandafter\let\csname old##1\expandafter\endcsname\csname ##1\endcsname
     \expandafter\let\csname oldend##1\expandafter\endcsname\csname end##1\endcsname
     \renewenvironment{##1}%
      {\linenomath\advance
       \postdisplaypenalty-\linenopenalty
       \csname old##1\endcsname}%
      {\csname oldend##1\endcsname\endlinenomath}}%
   \newcommand*\patchBothAmsMathEnvironmentsForLinenoX[1]{%
     \patchAmsMathEnvironmentForLinenoX{##1}%
     \patchAmsMathEnvironmentForLinenoX{##1*}}%
   \AtBeginDocument{%
     \patchBothAmsMathEnvironmentsForLineno{equation}%
     \patchBothAmsMathEnvironmentsForLinenoX{align}%
     \patchBothAmsMathEnvironmentsForLinenoX{flalign}%
     \patchBothAmsMathEnvironmentsForLinenoX{alignat}%
     \patchBothAmsMathEnvironmentsForLinenoX{gather}%
     \patchBothAmsMathEnvironmentsForLinenoX{multline}}}
  {\CopernicusWarningNoLine{Cannot find lineno.sty; proceeding without it}%
   \let\nolinenumbers\bgroup\let\endnolinenumbers\egroup}
\IfFileExists{times.sty}
  {\RequirePackage{times}
   \def\Hv@scale{0.95}}
  {\CopernicusWarningNoLine{Cannot find times.sty; proceeding without it}}
\if@stage@final
  \if@cop@home
    \let\vec\@undefined
    \let\grave\@undefined
    \let\acute\@undefined
    \let\check\@undefined
    \let\breve\@undefined
    \let\bar\@undefined
    \let\hat\@undefined
    \let\dot\@undefined
    \let\tilde\@undefined
    \let\ddot\@undefined
    \ifx\xmltexversion\@undefined\else{\catcode`\_=\active\global\let\xmltexUndersc@re_}\fi
    \def\provide@orig@symbol#1{\expandafter\let\csname orig#1\expandafter\endcsname\csname#1\endcsname}
    \provide@orig@symbol{Gamma}
    \provide@orig@symbol{Delta}
    \provide@orig@symbol{Theta}
    \provide@orig@symbol{Lambda}
    \provide@orig@symbol{Xi}
    \provide@orig@symbol{Pi}
    \provide@orig@symbol{Sigma}
    \provide@orig@symbol{Upsilon}
    \provide@orig@symbol{Phi}
    \provide@orig@symbol{Psi}
    \provide@orig@symbol{Omega}
    %% Fix fuer #6924, vgl https://tex.stackexchange.com/questions/561236/setmathalphabet-messes-with-rm
    \usepackage{etoolbox}%
    \patchcmd\document@select@group{#1{#4}}{\expandafter#1\ifx\math@bgroup\bgroup{#4}\else#4\fi}{}{\fail}%
    \RequirePackage[mtbold]{mathtime}
    \DeclareSymbolFont{largesymbolsA}{U}{esint}{m}{n}%from esint.sty
    \DeclareMathSymbol{\oiintop}{\mathop}{largesymbolsA}{'015}%from esint.sty
    \def\oiint{\oiintop\nolimits}%from esint.sty
    \DeclareMathSymbol{\fintop}{\mathop}{largesymbolsA}{'037}%from esint.sty
    \def\fint{\fintop\nolimits}%from esint.sty
    \ifx\xmltexversion\@undefined\else{\catcode`\_=\active\global\let_\xmltexUndersc@re}\fi
    \if@sansserifface
      \DeclareMathVersion{sans}
      \DeclareMathVersion{sansbold}
      \def\mversion@sans{sans}\def\mversion@sansbold{sansbold}
      \SetSymbolFont{operators}{sans}{OT1}{hvr}{m}{n}%
      \SetSymbolFont{letters}{sans}{OML}{hvm}{m}{it}%
      \SetSymbolFont{symbols}     {sans}{MY2}{mtt}{m}{n}%because +=; reencoded in mathtime.sty
      \SetSymbolFont{largesymbols}{sans}{OMX}{hvex}{m}{n}%
      \SetSymbolFont{operators}{sansbold}{OT1}{hvr}{bx}{n}%
      \SetSymbolFont{letters}{sansbold}{OML}{hvm}{b}{it}%
      \SetSymbolFont{symbols}     {sansbold}{MY2}{mtt}{b}{n}%because +=; reencoded in mathtime.sty
      \def\provide@fontspec@symbol#1{%
        \expandafter\let\csname mt#1\expandafter\endcsname\csname#1\endcsname
        \expandafter\DeclareRobustCommand\expandafter*\csname #1\endcsname{%
          \ifx\math@version\mversion@sans\csname orig#1\endcsname
          \else\ifx\math@version\mversion@sansbold\csname orig#1\endcsname
          \else\csname mt#1\endcsname\fi\fi}}
      \provide@fontspec@symbol{Gamma}
      \provide@fontspec@symbol{Delta}
      \provide@fontspec@symbol{Theta}
      \provide@fontspec@symbol{Lambda}
      \provide@fontspec@symbol{Xi}
      \provide@fontspec@symbol{Pi}
      \provide@fontspec@symbol{Sigma}
      \provide@fontspec@symbol{Upsilon}
      \provide@fontspec@symbol{Phi}
      \provide@fontspec@symbol{Psi}
      \provide@fontspec@symbol{Omega}
      \DeclareMathDelimiter{(}{\mathopen} {operators}{"28}{largesymbols}{"00}%was reencoded in mathtime.sty
      \DeclareMathDelimiter{)}{\mathclose}{operators}{"29}{largesymbols}{"01}%was reencoded in mathtime.sty
      \SetMathAlphabet\mathrm{sans}{OT1}{hvr}{m}{n}%mind! (gives more flexibility)
      \SetMathAlphabet\mathrm{sansbold}{OT1}{hvr}{bx}{n}%mind! (gives more flexibility)
      \SetMathAlphabet\mathit{sans}{OT1}{hvr}{m}{it}%
      \SetMathAlphabet\mathit{sansbold}{OT1}{hvr}{bx}{it}%
      \SetMathAlphabet\mathbf{sans}{OT1}{hvr}{bx}{n}%
      \SetMathAlphabet\mathbf{sansbold}{OT1}{hvr}{bx}{n}%
      \RequirePackage{hvams}
 %neu:
      \DeclareFontShape{U}{msb}{m}{n}{<-6>msbm5<6-8>msbm7<8->msbm10}{}%aus amsfonts.sty
      \DeclareFontFamily{U}{msbhv}{}%umbenannt aus hvams.sty
      \DeclareFontShape{U}{msbhv}{m}{n}{<->\@l@scale hvbm10}{}%umbenannt aus hvams.sty
      \SetMathAlphabet\mathbb{sans}{U}{msbhv}{m}{n}%
      \SetMathAlphabet\mathbb{sansbold}{U}{msbhv}{m}{n}%
 %Ende neu
      \DeclareMathAlphabet\mathbold{MY1}{mtt}{b}{\greekshape}%
      \SetMathAlphabet\mathbold{sans}{OML}{hvm}{b}{it}%
      \SetMathAlphabet\mathbold{sansbold}{OML}{hvm}{bx}{it}%
    \fi
  \else
    \if@sansserifface
      \DeclareMathVersion{sans}
      \DeclareMathVersion{sansbold}
      \SetSymbolFont{operators}{sansbold}{OT1}{cmr} {bx}{n}
      \SetSymbolFont{letters}  {sansbold}{OML}{cmm} {b}{it}
      \SetSymbolFont{symbols}  {sansbold}{OMS}{cmsy}{b}{n}
      \SetMathAlphabet\mathsf{sansbold}{OT1}{cmss}{bx}{n}
      \SetMathAlphabet\mathit{sansbold}{OT1}{cmr}{bx}{it}
      \DeclareMathAlphabet\mathbold{OML}{cmm}{b}{it}%
    \fi
  \fi
\else%discussions
  \if@cop@home
    \if@hvmath
      \RequirePackage{hvmath}
      \expandafter\let\csname\expandafter\string\csname T1\endcsname\string\'-\string y\endcsname\relax%patching wrong glyph in hvr, slot 253
      \DeclareMathSymbol{,}{\mathpunct}{operators}{"2C}
      \DeclareMathSymbol{.}{\mathord}{operators}{"2E}
      \RequirePackage{hvams}
    \else
      \let\rmdefault\sfdefault
      \DeclareSymbolFont{operators}{OT1}{cmss} {m}{n}
      \DeclareMathAlphabet{\mathbf}{OT1}{cmss}{bx}{n}
    \fi
  \else
    \let\rmdefault\sfdefault
    \DeclareSymbolFont{operators}{OT1}{cmss} {m}{n}
    \DeclareMathAlphabet{\mathbf}{OT1}{cmss}{bx}{n}
  \fi
\fi
\DeclareMathAlphabet{\mathblackbold}{U}{dsrom}{m}{n}
\RequirePackage{pifont}
\if@cop@home
  \if@nohyperref
  \else
    \if@stage@final\else
      \PassOptionsToPackage{pagebackref,pdffitwindow}{hyperref}
    \fi
    \usepackage[\ifcopyediting bookmarks=false\else bookmarks=true\fi,colorlinks]{hyperref}
    \hypersetup{anchorcolor=black,citecolor=black,filecolor=black,linkcolor=black,%
      menucolor=black,pagecolor=black,urlcolor=black}
    \let\old@Hy@backout\Hy@backout\def\Hy@backout{\leavevmode\old@Hy@backout}%bug-fixing, to be checked
    \ifnum\pdfoutput=\z@\RequirePackage{breakurl}\fi
    \pdfstringdefDisableCommands{\let\boldsymbol\relax\let\vec\relax}
  \fi
  \edef\@pdfcreator{%
    copernicus.cls%
    \space version \csname ver@copernicus.cls\endcsname
    \ifx\xmltexversion\@undefined\else, produced from XML\fi}
  \if@nohyperref\pdfinfo{/Creator (\@pdfcreator)}\fi
\else
  \usepackage[bookmarks=false,pdfborder={0 0 0}]{hyperref}
  \pdfstringdefDisableCommands{\let\boldsymbol\relax\let\vec\relax}
\fi
\ifx\xmltexversion\@undefined
\else
  \ifnum\pdfoutput=\z@
    \def\ReadBookmarks{%
      \begingroup
        \escapechar=`\\%
        \let\escapechar\@gobble %
        \def\@@BOOKMARK[##1][##2]##3##4##5{\calc@bm@number{##5}}%
        \@inputtoc{\jobname.out}{}{}%
        \ifx\WriteBookmarks\relax
          \global\let\WriteBookmarks\relax
        \fi
        \def\@@BOOKMARK[##1][##2]##3##4##5{%
          \def\Hy@temp{##4}%
          \pdfmark{%
            pdfmark=/OUT,%
            Count={##2\check@bm@number{##3}},%
            Dest={##3},%
            Title=\expandafter\strip@prefix\meaning\Hy@temp
          }%
       }%
       {%
        \def\WriteBookmarks{0}%
        \@inputtoc{\jobname.out}{}{}%
       }%
       %{\escapechar\m@ne\InputIfFileExists{\jobname.out}{}{}}%
       \ifx\WriteBookmarks\relax
       \else
         \if@filesw
           \newwrite\@outlinefile
           \immediate\openout\@outlinefile=\jobname.out\relax
           \ifHy@typexml
             \immediate\write\@outlinefile{<relaxxml>\relax}%
           \fi
         \fi
       \fi
       \endgroup}
  \else
    \def\ReadBookmarks{%
      \begingroup
        \escapechar=`\\%
        \let\escapechar\@gobble %
        \def\@@BOOKMARK[##1][##2]##3##4##5{\calc@bm@number{##5}}%
        \@inputtoc{\jobname.out}{}{}%
        \ifx\WriteBookmarks\relax
          \global\let\WriteBookmarks\relax
        \fi
        \def\@@BOOKMARK[##1][##2]##3##4##5{%
          \def\Hy@temp{##4}%
          \Hy@pstringdef\Hy@pstringName{\HyperDestNameFilter{##3}}%
          \Hy@OutlineName{}\Hy@pstringName{%
            ##2\check@bm@number{##3}%
          }{%
            \expandafter\strip@prefix\meaning\Hy@temp
          }%
       }%
       {%
        \def\WriteBookmarks{0}%
        \@inputtoc{\jobname.out}{}{}%
       }%
       %{\escapechar\m@ne\InputIfFileExists{\jobname.out}{}{}}%
       \ifx\WriteBookmarks\relax
       \else
         \if@filesw
           \newwrite\@outlinefile
           \immediate\openout\@outlinefile=\jobname.out\relax
           \ifHy@typexml
             \immediate\write\@outlinefile{<relaxxml>\relax}%
           \fi
         \fi
       \fi
       \endgroup}
  \fi
\fi
\if@stage@final\else
  \if@cop@home
    \ifonline
      \let\orig@psheadings\ps@headings
      \let\orig@abstractname\abstractname
      \let\orig@pdfcreator\@pdfcreator
      \usepackage[screen,rightpanel]{pdfscreencop}
      \let\ps@headings\orig@psheadings \pagestyle{headings}%because pdfscreencop overwrites it
      \let\abstractname\orig@abstractname%because pdfscreencop overwrites it
      \let\@pdfcreator\orig@pdfcreator%because pdfscreencop overwrites it
      \setcounter{secnumdepth}{3}%because pdfscreencop sets it to 4
      \setlength\footskip{5mm}%because pdfscreencop overwrites it
      \def\addButton#1#2{\begingroup\normalsfcodes\fboxsep\z@
        \sffamily\colorbox{buttonbackground}{\hbox to#1{\hfil\Black\st#2\hfil}}\endgroup}
      \hypersetup{anchorcolor=black,citecolor=black,filecolor=black,linkcolor=black,%
                  menucolor=black,pagecolor=black,urlcolor=black,%
                  pdfcenterwindow=false,pdfmenubar=true,pdftoolbar=true,pdfwindowui=true}
                 %because pdfscreencop overwrites it
      \def\PDFSCR@Warning#1{}% no more "No overlay specified" warnings
      \setlength\panelwidth{5cm}%
      \newlength\bigbutton\setlength\bigbutton{0.75\panelwidth}%
      \newlength\buttongap\setlength\buttongap{0.06\panelwidth}%
      \newlength\smallbutton\setlength\smallbutton{0.5\bigbutton}%
      \addtolength\smallbutton{-0.5\buttongap-0.5pt}%
      \def\panelfont{\rmfamily\scriptsize}%
      \margins{10mm}{10mm}{7mm}{7mm}%
      \screensize{15.9cm}{21.6cm}%
      \definecolor{backgroundcolor}{rgb}{1.,1.,1.}%white
      \backgroundcolor{backgroundcolor}%
      \definecolor{section0}{rgb}{0.,0.,0.}%black
      \definecolor{section1}{rgb}{0.,0.,0.}%black
      \definecolor{section2}{rgb}{0.,0.,0.}%black
      \definecolor{section3}{rgb}{0.,0.,0.}%black
      \definecolor{section4}{rgb}{0.,0.,0.}%black
      \def\panel{%
        \colorbox[rgb]{0.94,0.95,0.95}%
          {\begin{minipage}[t][\paperheight][t]{\panelwidth}
           %% set default font for panel:
           \fontseries{m}\fontshape{n}\fontsize{11}{13.7pt}\rmfamily
           %% journal name, volume, pages, year, runningtitle, runningauthor:
           \null\vspace*{7mm}%
           \centering
           \parbox[t]{0.8\panelwidth}%
            {\centering\color{paneltext}%
             {\Large\bfseries
              %overwrite of default urlcolor=black to journal-specific color @journalname
              %for the @journalnameshort link to the journal webpage on the panel
              \hypersetup{urlcolor=journalname}%
              \href{http://\@journalurl}{\@journalnameshort}}\\[2mm]
             \if@noref
             \else
               {\fontsize{8.7}{11}\selectfont
                %\@pvol, \@fpage\if@nolastpage\else{--\@lpage}\fi, \@pyear
                \hypersetup{urlcolor=paneltext}\doi{10.5194/\@msnumber}%
               }\\[1mm]%
             \fi
             \rule{0.8\panelwidth}{1.1pt}\\[1mm]
             {\bfseries\mathversion{bold}%
              \leavevmode\null
              \ifx\firstruntit@utput\@undefined
                \global\let\firstruntit@utput\relax
              \else
                \def\blackb@x[##1]##2{\relax}%
              \fi
              \@runtit}%
             \if@noauthor\else\\[3mm]{\small\leavevmode\null\@runauth}\fi
             \\[0mm]%
             \rule{0.8\panelwidth}{1.1pt}\\[5mm]} %keep this blank!
           %% the buttons:
           \addButton{\bigbutton}
             {\hyperlink{title}{\hfill\color{buttontext}Title Page\hfill}}%
           \\[1.5mm]
           \addButton{\smallbutton}
             {\hyperlink{abstr}{\hfill\color{buttontext}Abstract\hfill}}%
           \hspace{\buttongap}%
           \ifessd
             \addButton{\smallbutton}
               {\hyperlink{instru}{\hfill\color{buttontext}Instruments\hfill}}%
             \\[1.5mm]
           \else
             \addButton{\smallbutton}
               {\hyperlink{intro}{\hfill\color{buttontext}Introduction\hfill}}%
             \\[1.5mm]
           \fi
           \ifessd
             \addButton{\bigbutton}
               {\hyperlink{datastruct}{\hfill\color{buttontext}Data Provenance \& Structure\hfill}}%
             \\[1.5mm]
           \else
             \addButton{\smallbutton}
               {\hyperlink{conclusions}{\hfill\color{buttontext}Conclusions\hfill}}%
             \hspace{\buttongap}%
             \addButton{\smallbutton}
               {\hyperlink{references}{\hfill\color{buttontext}References\hfill}}%
             \\[1.5mm]
           \fi
           \addButton{\smallbutton}
             {\@ifundefined{@numtable}%automatically defined via \@num\@captype
                           {\hfill\color{buttontext}Tables\hfill}
                           {\hyperlink{table}{\hfill\color{buttontext}Tables\hfill}}}%
           \hspace{\buttongap}%
           \addButton{\smallbutton}
             {\@ifundefined{@numfigure}% automatically defined via \@num\@captype
                           {\hfill\color{buttontext}Figures\hfill}
                           {\hyperlink{figure}{\hfill\color{buttontext}Figures\hfill}}}%
           \\[4mm]%
           \Acrobatmenu{FirstPage}{\addButton{\smallbutton}%
             {\color{buttontext}$\rule[-0.144ex]{0.35ex}{1.244ex}\!\blacktriangleleft$}}%
           \hspace{\buttongap}%
           \Acrobatmenu{LastPage}
             {\addButton{\smallbutton}%
               {\color{buttontext}$\blacktriangleright\!\rule[-0.144ex]{0.35ex}{1.244ex}$}}%
           \\[1.5mm]
           \Acrobatmenu{PrevPage}
             {\addButton{\smallbutton}{\color{buttontext}$\blacktriangleleft$}}%
           \hspace{\buttongap}%
           \Acrobatmenu{NextPage}
             {\addButton{\smallbutton}{\color{buttontext}$\blacktriangleright$}}%
           \\[1.5mm]
           \Acrobatmenu{GoBack}{\addButton{\smallbutton}{\color{buttontext}Back}}%
           \hspace{\buttongap}%
           \Acrobatmenu{Close}{\addButton{\smallbutton}{\color{buttontext}Close}}%
           \\[1.5mm]
           \Acrobatmenu{FullScreen}{\addButton{\bigbutton}{\color{buttontext}Full Screen / Esc}}%
           \\[4mm]
           \addButton{\bigbutton}
             {\href{http://\@journalurl/\@pvol/\@fpage/\@pyear/\@journalnameshortlower-\@pvol-\@fpage-\@pyear-print.pdf}%
                   {\hfill\color{buttontext}Printer-friendly Version\hfill}}%
           \\[1.5mm]
           \addButton{\bigbutton}
             {\href{http://\@journalurl/\@pvol/\@fpage/\@pyear/\@journalnameshortlower-\@pvol-\@fpage-\@pyear-discussion.html}%
             {\hfill\color{buttontext}Interactive Discussion\hfill}}%
           \\[4mm]
           \href{http://creativecommons.org/licenses/by/3.0/}{\includegraphics[width=1.7cm]{CreativeCommons_Attribution_License.png}}%
           \null\vspace*{10mm}%
          \end{minipage}}}
    \fi
  \fi
\fi
%% some of the following commands are only active if \@cop@hometrue
\def\texlicencestatement#1#2{\gdef\@texlicencestatement{#1}\gdef\@texlicencelogo{#2}}%
  \def\@texlicencestatement{\CopernicusError{Please add \string\texlicencestatement}{You must provide the licence statement before \string\maketitle"}}
\def\received#1{\if@cop@home\def\@recvd{#1}\fi}        \def\@recvd{}%+1,+2,+d
\def\pubdiscuss#1{\if@cop@home\def\@pubdiscuss{#1}\fi} \def\@pubdiscuss{}%+1,+2,-d -- twostagejnltrue
\def\revised#1{\if@cop@home\def\@revsd{#1}\fi}         \def\@revsd{}%+1,+2,-d
\def\accepted#1{\if@cop@home\def\@accptd{#1}\fi}       \def\@accptd{}%+1,+2,+d
\def\published#1{\if@cop@home\gdef\@published{#1}\fi}  \if@stage@final\else\def\@published{}\fi%+1,+2,+d
\def\firstpage#1{\if@cop@home\ifx\specialp@perstring\@undefined\ifx\citati@nbyarticlenumber\@undefined\gdef\@fpage{#1}\fi\fi\fi}
                                                       \def\@fpage{1}%+1,+2,+d
\def\articlenumber#1{\if@cop@home\ifx\specialp@perstring\@undefined\ifx\citati@nbyarticlenumber\relax\gdef\@fpage{#1}\gdef\article@number{#1}\fi\fi\fi}
\def\citationbyarticlenumber{%
  \@nolastpagetrue
  \let\citati@nbyarticlenumber\relax
  \def\@fpage{-1}}
\ifx\xmltexversion\@undefined
  \@onlypreamble\citationbyarticlenumber
\fi
\def\pubyear#1{\if@cop@home\ifx\specialp@perstring\@undefined\gdef\@pyear{#1}\fi\gdef\@cyear{#1}\fi}
                                                       \def\@pyear{\number\year}%+1,+2,+d
                                                       \let\@cyear\@pyear
\def\pubvol#1{\if@cop@home\ifx\specialp@perstring\@undefined\gdef\@pvol{#1}\fi\fi}%+1,+2,+d
\let\pubnum\@gobble%not for TeX, only for secondary data use
\def\correspondence#1{\gdef\@corresp{#1}}              \def\@corresp{}%+1,+2,+d
\def\citationstatement#1{%
  \edef\@@doi{https://doi.org/10.5194/\@journalnameshortlower-\@pvol-\@fpage-\@pyear}%
  \def\@tempa{#1}%
  \ifx\@tempa\@empty
    \gdef\@howtocite{}%
  \else
    \ifcopyediting
      \gdef\@howtocite{}%
    \else
      \gdef\@howtocite{#1, \@journalnameabbreviation, \@pvol, \@fpage--\@lpage, \expandafter\url{\@@doi}, \@pyear.}%
    \fi
  \fi
}\def\@howtocite{}%+1,+2,+d
\def\msnumber#1{\if@cop@home\gdef\@msnumber{#1}\fi}
\if@stage@final
\else
  \def\affilfontsize#1{\def\@affilfontsize{#1}}
  \def\@affilfontsize{\small}
\fi
\if@stage@final
  \def\bartext#1{\gdef\@btext{#1}}                     \def\@btext{}
\fi
\if@cop@home
  \newcounter{jnlvolume}%the journal volume
  \setcounter{jnlvolume}{\number\year}
  \addtocounter{jnlvolume}{1}
  \AtBeginDocument{\addtocounter{jnlvolume}{-\@journalstartyear}}
  \def\@pvol{\arabic{jnlvolume}}
  \if@stage@final
    \ifadgeo\def\@pvol{1}\fi
    \ifasr\def\@pvol{1}\fi
  \fi
  \AtBeginDocument{%
    \ifx\specialp@perstring\@undefined\else
      \def\origfirstpage#1{\ifx\citati@nbyarticlenumber\@undefined\gdef\@fpage{#1}\fi}
      \def\origlastpage#1{\gdef\@lpage{#1}}
      \def\origpubyear#1{\gdef\@pyear{#1}}
      \def\origpubvol#1{\gdef\@pvol{#1}}
      \def\origarticlenumber#1{\ifx\citati@nbyarticlenumber\relax\gdef\@fpage{#1}\fi}
    \fi}
\else
  \def\@pvol{0}
\fi
\if@stage@final
  \def\keywords#1{\def\@keyw{#1}}
  \def\@keyw{}
\else
  \def\keywords#1{%
    \CopernicusWarningNoLine{Keywords are not supported.}%
    \vspace{1.7mm}\par\noindent\textbf{Keywords.}\enspace\ignorespaces#1}
\fi
\newcommand*\editorthanks[3]
 {\ifthenelse{\equal{#2}{}}% check if the first referee exits, if not write:
    {\\ \hspace*{4mm} Topical Editor\ #1\ thanks two unknown referees %
       for their help in evaluating this paper.}
    {\ifthenelse{\equal{#3}{}}% check if second referee exist, if not write:
       {\\ \hspace*{4mm}Topical Editor\ #1\ thanks\ #2\ and another %
          referee for their help in evaluating this paper.}%
       {\\ \hspace*{4mm}Topical Editor\ #1\ thanks\ #2\ and\ #3\ for their %
          help in evaluating this paper.}}}
\def\runningauthor#1{\def\@runauth{#1}}
\def\@runauth{}
\def\runningtitle#1{\def\@runtit{#1}}
\def\@runtit{}
\if@stage@final
  \def\runninghead#1{\def\@runhd{#1}}
  \def\@runhd{%
    \ifx\firstrunhd@utput\@undefined
      \global\let\firstrunhd@utput\relax
    \else
      \def\blackb@x[##1]##2{\relax}%
    \fi
    \if@noauthor\else\@runauth: \fi\@runtit}
\fi
\DeclareRobustCommand*\degree{\ensuremath{^{\circ}}}
\DeclareRobustCommand*\permil{\ifmmode\text{\textperthousand}\else\textperthousand\fi}
\def\@Radical{\put(2.0,2.0){\circle*{1.5}}\kern3.5\p@}
\def\@RadicalC{\raise0.25ex\hbox{\@Radical}}
\DeclareRobustCommand*\Radical{%
  \ifmmode\mathchoice{\@RadicalC}{\@RadicalC}{\@Radical}{\@Radical}\else\@RadicalC\fi}
\def\testbx{bx}
\DeclareRobustCommand*\chem[1]
 {\ensuremath{%
   {\mathcode`\-="0200\mathcode`\=="003D% no space around "-" and "="
    \ifx\f@series\testbx\mathbf{#1}\else\mathrm{#1}\fi}}}
\@ifpackageloaded{hyperref}
 {\begingroup
    \toks0=\expandafter{\pdfstringdefPreHook}%
    \xdef\pdfstringdefPreHook{%
      \the\toks0 %
      \let\noexpand\hack\noexpand\@gobble
      \let\noexpand\chem\noexpand\@firstofone}%
  \endgroup}
 {\relax}
\DeclareRobustCommand*\unit[1]
 {\ensuremath{%
   {\thinmuskip3mu\relax
    \def\mu{\text{\textmu}}\def~{\,}%
    \ifx\f@series\testbx\mathbf{#1}\else\mathrm{#1}\fi}}}
\@definecounter{reaction}
\def\thereaction{R\@arabic\c@reaction}
\let\c@org@eq\c@equation
\let\org@theeq\theequation
\def\setreaction{%
  \global\let\c@equation\c@reaction
  \global\let\theequation\thereaction}
\def\setequation{%
  \global\let\c@equation\c@org@eq
  \global\let\theequation\org@theeq}
\newenvironment{reaction}
 {\let\c@equation\c@reaction
  \let\theequation\thereaction
  \incr@eqnum
  \mathdisplay@push
  \st@rredfalse \global\@eqnswtrue
  \mathdisplay{equation}}
 {\endmathdisplay{equation}%
  \mathdisplay@pop
  \ignorespacesafterend}
\IfFileExists{lineno.sty}
  {\AtBeginDocument{%
     \patchAmsMathEnvironmentForLineno{reaction}}}
  {}
\newenvironment{rxnarray}
 {\let\c@equation\c@reaction
  \let\theequation\thereaction
  \eqnarray}
 {\endeqnarray
  \let\c@equation\c@reaction
  \let\theequation\thereaction}
\if@stage@final\else
  \newcounter{parentreaction}
  \newenvironment{subreactions}
   {\refstepcounter{reaction}%
    \protected@edef\theparentreaction{\thereaction}%
    \setcounter{parentreaction}{\value{reaction}}%
    \setcounter{reaction}{0}%
    \def\thereaction{\theparentreaction\alph{reaction}}%
    \ignorespaces}
   {\setcounter{reaction}{\value{parentreaction}}%
    \ignorespacesafterend}
\fi
\newcommand\tophline{\hline\noalign{\vspace{1mm}}}
\newcommand\middlehline{\noalign{\vspace{1mm}}\hline\noalign{\vspace{1mm}}}
\newcommand\bottomhline{\noalign{\vspace{1mm}}\hline}
\newcommand\hhline{\noalign{\vspace{1mm}}\hline\noalign{\vspace{1mm}}}
\newdimen\tabularwidth
\def\@tabular{%
  \leavevmode
  \setbox\z@
  \hbox \bgroup $\col@sep\tabcolsep \let\d@llarbegin\begingroup
                                    \let\d@llarend\endgroup
  \@tabarray}
\def\endtabular{\endarray $\egroup
  \global\tabularwidth\wd\z@
  \unhbox\z@}
\expandafter\let\csname endtabular*\endcsname=\endtabular
\DeclareRobustCommand\belowtable[1]{%
  \par\vspace{1ex}%
  {\if@stage@final\else\def\@tempa{table}\ifx\@captype\@tempa\else\centering\fi\fi
   \ifdim\tabularwidth<10mm\tabularwidth\hsize\fi
   \leavevmode\vrule\@width\z@\@height2ex\@depth\z@
   \parbox{\tabularwidth}{\raggedright\scriptsize#1}%
   \if@stage@final\else\par\fi}}
\ifessd
  \newcommand\instrumentation[1][Instrumentation]
   {\section[#1]{#1\if@cop@home\ifonline\hypertarget{instru}{}\fi\fi}}
  \newcommand\datastructure[1][Data Provenance and Structure]
   {\section[#1]{#1\if@cop@home\ifonline\hypertarget{datastruct}{}\fi\fi}}
\fi
\newcommand\introduction[1][\introductionname]
  {\section[#1]{#1\if@cop@home\ifonline\hypertarget{intro}{}\fi\fi}}
\newcommand\conclusions[1][\conclusionname]
  {\section[#1]{#1\if@cop@home\ifonline\hypertarget{conclusions}{}\fi\fi}}
\newcommand\Supplementary[2][]{{%
  \advance\partopsep0.5\baselineskip
  % %2- und 3-zeilige Supplement-Blöcke sollen den gleichen vertikalen Raum in Anspruch nehmen;%% Nicht mehr seit 2018-11-07
  % \setbox\longtwo@box\hbox{\supplement{#1}.}%
  \begin{trivlist}%
  \if@stage@final
    \let\\\@centercr%\@rightskip\z@\@plus\tw@ em
    %\rightskip\@rightskip
    \parindent\z@
  \fi
  \let\do@skip\relax
  \def\@argi{#1}\ifx\@argi\@empty\else\let\do@skip\space\fi%
  \item \dosupplement{#1\do@skip The supplement related to this article is available online at:
    \if@stage@final\else\\\fi
    \supplement{#2}.}%
  \end{trivlist}%
  }}
\def\generateCommand#1#2{%
  \expandafter\long\expandafter\def\csname#1\endcsname##1{%
    \if@stage@final\ifhmode\vskip2\baselineskip\else\addvspace{2\baselineskip}\fi\fi
    \bgroup
    \list{}{\labelwidth\z@ \leftmargin\z@ \itemindent-\leftmargin
            \parsep\z@
            \listparindent\parindent
            \def\makelabel####1{%
               \hspace\labelsep
               \if@stage@final
                 \if@sansserifface
                   \sffamily\bfseries\mathversion{sansbold}\textcolor{textcol}{####1.}%
                 \else
                   \itshape####1.%
                 \fi
                 \pdfbookmark[1]{\csname #1name\endcsname}{#1}%
               \else
                 \itshape####1.%
               \fi}%
            \reset@font\small}%
    \item[\csname #1name\endcsname]%
    ##1#2}}
\generateCommand{copyrightstatement}{\endlist\egroup}
\ifessd
  \long\def\codeavailability#1{\ifx\thesection\theolds\else\noappendix\fi\section{\codeavailabilityname}#1}
  \long\def\dataavailability#1{\ifx\thesection\theolds\else\noappendix\fi\section{\dataavailabilityname}#1}
  \long\def\codedataavailability#1{\ifx\thesection\theolds\else\noappendix\fi\section{\codedataavailabilityname}#1}
  \long\def\ercavailability#1{\ifx\thesection\theolds\else\noappendix\fi\section{\ercavailabilityname}#1}
\else
  \generateCommand{codeavailability}    {\endlist\egroup}
  \generateCommand{dataavailability}    {\endlist\egroup}
  \generateCommand{codedataavailability}{\endlist\egroup}
  \generateCommand{ercavailability}{\endlist\egroup}
\fi
\generateCommand{authorcontribution}{\endlist\egroup}
\generateCommand{sampleavailability}{\endlist\egroup}
\generateCommand{competinginterests}{\endlist\egroup}
\generateCommand{teamlist}          {\endlist\egroup}
\generateCommand{videosupplement}   {\endlist\egroup}
\generateCommand{disclaimer}        {\endlist\egroup}
\generateCommand{sistatement}       {\endlist\egroup}
\generateCommand{dosupplement}      {\endlist\egroup}
\generateCommand{financialsupport}  {\endlist\egroup}
\generateCommand{reviewstatement}   {\endlist\egroup}
\long\def\specialsection#1#2{%
  \expandafter\def\csname specialsection-#1name\endcsname{#1}%
  \expandafter\ifx\csname specialsection-#1name\endcsname\@empty
    \PackageError{copernicus.cls}{\string\specialsection\space needs a heading.}{Make sure that \string\specialsection{}{}\space has two arguments and that the first argument contains a heading.}%
  \else
    \generateCommand{specialsection-#1}  {\endlist\egroup}%
    \csname specialsection-#1\endcsname{#2}%
  \fi}

\generateCommand{acknowledgement}   {}        \def\endacknowledgement{\endlist\egroup}
\generateCommand{acknowledgements}  {}        \def\endacknowledgements{\endlist\egroup}
\iffalse %instead of \if@stage@final, to check what they want
  \def\appendixfigures{%
    \ifx\afterfirstappendixfigures\@undefined
      \let\afterfirstappendixfigures\relax
    \fi
    \setcounter{figure}{0}%
    \def\thefigure{A\@arabic\c@figure}%
    \let\theHfigure\thefigure}
  \def\appendixtables{%
    \ifx\afterfirstappendixtables\@undefined
      \let\afterfirstappendixtables\relax
    \fi
    \setcounter{table}{0}%
    \def\thetable{A\@arabic\c@table}%
    \let\theHtable\thetable}
\else
  \def\appendixfigures{%
    \ifx\afterfirstappendixfigures\@undefined
      \let\afterfirstappendixfigures\relax
      \setcounter{section}{0}%
      \def\thesection{\Alph{section}}%
      \let\theHsection\thesection
    \fi
    \refstepcounter{section}%
    \setcounter{figure}{0}%
    \def\thefigure{\thesection\@arabic\c@figure}%
    \let\theHfigure\thefigure}
  \def\appendixtables{%
    \ifx\afterfirstappendixtables\@undefined
      \let\afterfirstappendixtables\relax
      \setcounter{section}{0}%
      \def\thesection{\Alph{section}}%
      \let\theHsection\thesection
    \fi
    \refstepcounter{section}%
    \setcounter{table}{0}%
    \def\thetable{\thesection\@arabic\c@table}%
    \let\theHtable\thetable}
\fi
\if@cop@home
  \newcounter{CEnote}
  \newcounter{TSnote}
  \def\theCEnote{\@arabic\c@CEnote}
  \def\theTSnote{\@arabic\c@TSnote}
  \newtoks\CEnotes
  \newtoks\TSnotes
  \global\let\edit@rnotereminder\@empty%initialising
  \def\n@telabel#1{\noexpand\n@tel@bel{#1\csname the#1note\endcsname}}
  \def\n@tel@bel#1{%
    \smash{\raisebox{0.2ex}{\bfseries\scriptsize\fboxsep1pt
        \colorbox[RGB]{255,149,64}{\textcolor[RGB]{255,255,255}{#1}}}}}
  \DeclareRobustCommand\blackbox{\@ifnextchar[\blackb@x{\blackb@x[TS]}}%]
  \def\blackb@x[#1]#2{%
    \refstepcounter{#1note}%
    \CopernicusWarningNoLine{Editor's note on page \thepage}%
    \hypertarget{#1\csname the#1note\endcsname}
                {\hyperlink{#1\csname the#1note\endcsname R}
                           {\n@tel@bel{#1\csname the#1note\endcsname}}}%
    \gdef\edit@rnotereminder{%
      \smash{%
        \if@stage@final
          \llap{\rotatebox{90}{\scriptsize
        \else
          \tiny
        \fi
          \lower1ex\rlap{\fboxsep0.5ex\colorbox[RGB]{255,149,64}{\bfseries\strut
          \textcolor[RGB]{255,255,255}
                    {Please note the remarks at the end of the manuscript.}}}%
        \if@stage@final
          }\kern\marginparsep}%
        \fi
      }%
      \global\let\edit@rnotereminder\@empty}%
    \edef\@tempa{\leavevmode
      \noexpand\hypertarget{#1\csname the#1note\endcsname R}
                           {\noexpand\hyperlink{#1\csname the#1note\endcsname}
                                               {\noexpand\hb@xt@10mm{\n@telabel{#1}\hss}}}}%
    \global\csname #1notes\endcsname\expandafter\expandafter\expandafter{%
      \the\expandafter\csname #1notes\expandafter\endcsname\@tempa\mdseries#2\par}}
  \AtEndDocument{%
    \if@stage@final
      \onecolumn
    \else
      \clearpage
    \fi
    \thispagestyle{empty}%
    \parindent\z@
    \begin{nolinenumbers}%
    \expandafter\def\expandafter\@tempa\expandafter{\the\CEnotes}%
    \expandafter\def\expandafter\@tempb\expandafter{\the\TSnotes}%
    \ifx\@tempa\@empty
    \else
      \@tempcnta-\c@page
      \section*{Remarks from the language copy-editor}
      \hangindent10mm
      \@tempa
    \fi
    \ifx\@tempb\@empty
      \ifx\@tempa\@empty
      \else
        \advance\@tempcnta\c@page\advance\@tempcnta\@ne
        \CopernicusInfo{Pages with editing remarks: \the\@tempcnta.}%
      \fi
    \else
      \ifx\@tempa\@empty\@tempcnta-\c@page\fi
      \section*{Remarks from the typesetter}
      \hangindent10mm
      \@tempb
      \advance\@tempcnta\c@page\advance\@tempcnta\@ne
      \CopernicusInfo{Pages with editing remarks: \the\@tempcnta.}%
    \fi
    \end{nolinenumbers}}
\fi
\def\iftwocol#1#2{\if@twocolumn#1\else #2\fi}
\let\hack\@firstofone
\let\notforhtml\@firstofone
\newcommand\@journalname{Journalname}
\newcommand\@journalnameabbreviation{J. Name}
\newcommand\@journalnameshort{JN}
\newcommand\@journalnameshortlower{jn}
\newcommand\@journalurl{www.jn.net}
\newcommand\@journalpublisher{Copernicus Publications}
\newcommand\@journalcopyright{%
  %\copyright\ Author(s)\ \@cyear. %
  \if!\@texlicencestatement!%
    \CopernicusError{\string\texlicencestatement{} must have content}{Say, e.g., "\string\texlicencestatement{CC Attribution 4.0 License.}"}%
  \else
    \@texlicencestatement
    \if!\@texlicencelogo!\else
      \def\@optarg{width=1.5cm}%
      \\[1mm]
      \expandafter\expandafter\expandafter\includegraphics\expandafter\expandafter\expandafter[\expandafter\@optarg\expandafter]\expandafter{\@texlicencelogo}
    \fi
  \fi}
\newcommand\@journalstartyear{2013}
\newcommand\@journallogo{Journallogo}
\newcommand\@sentence{Sentence.}
\newcommand\@sentenceDisc{Sentence.}
\if@stage@final
  \definecolor{textcol}{rgb}{0,0,0}
  \definecolor{bgcol}{rgb}{1,1,1}
  \definecolor{barcol}{rgb}{1,1,1}
\else
  \definecolor{discussion_bartext}{gray}{0.5}
  \definecolor{discussion_bartext_background}{gray}{0.85}
\fi
%%Now, journal configuration from copernicus.cfg:
\@addjournalconfig
%%Now, additions the manuscript and for the the discussion stage:
\if@stage@final
  \if@manuscript
    \definecolor{textcol}{rgb}{0,0,0}
    \definecolor{bgcol}{rgb}{1,1,1}
    \definecolor{barcol}{rgb}{1,1,1}
  \fi
\else
  \edef\@journalname{\@journalname\space Discussions}
  \let\@journalnameabbreviationbase\@journalnameabbreviation
  \edef\@journalnameabbreviation{\@journalnameabbreviation\space Discuss.}
  \edef\@journalnameshort{\@journalnameshort D}
  \edef\@journalnameshortlower{\@journalnameshortlower d}
\fi
\def\Etal#1{#1}
\def\Issue#1{#1}
\def\Particle#1{#1}
\def\Link#1{#1}
\def\Year#1{#1}
\def\Lpage#1{#1}
\def\Fpage#1{#1}
\def\Volume#1{#1}
\def\Source#1{#1}
\def\Articletitle#1{#1}
\def\Givennames#1{#1}
\def\Surname#1{#1}
\def\FirstName#1{#1}
\def\Stringname#1{#1}
\def\Persongroup#1{#1}
\def\Journal#1{#1}
\def\Uri#1{#1}
\def\Content#1{#1}
\def\Book#1{#1}
\def\PublisherName#1{#1}
\def\PublisherLoc#1{#1}
\def\mathring{\mathaccent6}

\newenvironment{plainlist}
{\advance\@itemdepth\@ne
  \expandafter
  \list{}
  {\leftmargin\z@
   \labelwidth\z@
   \labelsep\z@
   \itemsep\z@
   \topsep1\baselineskip
   \parsep\p@\partopsep\z@
   \def\makelabel##1{\hss##1\if!##1!\else\enskip\fi}}%
}
{\endlist}

\endinput
%%
%% End of file `copernicus.cls'.
