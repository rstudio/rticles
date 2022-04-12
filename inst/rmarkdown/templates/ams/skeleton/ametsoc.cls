% Version 4.3.2, 25 August 2014
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ametsoc.cls
%
% Article Class for >> AMS Journals <<
%
% Copyright 2014 American Meteorological Society
%
% Written by Amy Hendrickson
% TeXnology Inc.
% http://www.texnology.com
% amyh@texnology.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version history
%
% 7 May 2014 -- Nicole Rietmann, AMS
% Updated to version 4.1
% Changed draft line spacing from 1.66 to 2
% Added \bibpunct command to template
%
% 12 May 2014 -- Nicole Rietmann, AMS
% Updated to version 4.2
% Added version and date to footer
% Changed line spacing from 2 to 2.25
% Added if/else statements for fig/table line spacing (\baselinestretch)
% Decreased vertical space after section heads
% Removed en dashes around page numbers
% Removed line after abstract
% Decreased vertical space after appendix title
%
% 16 May 2014 -- Nicole Rietmann, AMS
% Updated to version 4.3
% Added command to fix equation line spacing
%
% 19 May 2014 -- Nicole Rietmann, AMS 
% Updated to version 4.3.1
% Removed unnecessary \usepackage{tikz} command
%
%
% 25 August 2014 -- Nicole Rietmann, AMS
% Updated to version 4.3.2
% Correction of \BAMS to \bams for journal command
% Addition of JAS to journal list in .cls and template
% Clarified appendix fig/table placement in template and amsdocs.pdf
% Addition of BAMS capsule instructions in template and amsdocs.pdf
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%
%% Options

\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}

\newif\ifdraft
\DeclareOption{draft}{\global\drafttrue
\renewcommand\baselinestretch{2.25}
\def\arraystretch{2.15}
\@twocolumnfalse
\setlength\overfullrule{5pt}}

\DeclareOption{twocol}{\setlength\overfullrule{0pt}
\renewcommand\baselinestretch{1}
\def\arraystretch{1.15}
\brokenpenalty=5000
\global\draftfalse
\@twocolumntrue
}

\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}

%%%%%%%%%%%%%

%% default options declared
\ExecuteOptions{letterpaper,twoside,onecolumn,draft}

%% This is where options used with \documentclass[]{},
%% ie, \documentclass[draft]{ammetsoc}
%% are activated:

\ProcessOptions

%%%%%%%%%%
%% Standard 10 point default settings:

%% Font family settings
\renewcommand\normalsize{%
\ifdraft
   \@setfontsize\normalsize{12pt}{12pt}%
\else
   \@setfontsize\normalsize{9.85pt}{11.5}%
\baselineskip=11.5pt plus .1pt
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}


\normalsize

\newcommand\normaltextsize{%
   \@setfontsize\normaltextsize{10.5pt}{12}
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\newcommand\bigfootnotesize{%
   \@setfontsize\bigfootnotesize{8.5pt}{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\bigtiny{\@setfontsize\bigtiny{5.5pt}\@vipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

%% Font commands to accomodate 
%% earlier TeX and LaTeX font conventions:
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Page style settings
 \parindent = 10pt
 \parskip = 0\p@ %\@plus .0001pt
 \textheight=9in %%
\advance\textheight-12pt %this works for first page
\advance\textheight-8pt

\advance\textheight4pt

\textwidth= 39pc

\pdfpagewidth=7.87in
\pdfpageheight=10.5in

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}


\setlength\headheight{12\p@}
\setlength\headsep   {12\p@}
\setlength\topskip   {10\p@}
\setlength\footskip{35\p@}


\setlength\maxdepth{.5\topskip} 

%%% Running head and foot definition.

\def\currvolume{Please supply {\tt\string\volume\string{<volume number>\string}}}
\def\currdate{Please supply {\tt\string\issuedate\string{<issue date>\string}}}
\def\volume#1{\def\currvolume{Volume #1}}
\def\issuedate#1{\def\currdate{#1}}
\let\currvolume\relax
\let\currdate\relax

\def\ps@plain{%
    \def\@oddhead{\vbox{\ifdraft\else\iffirstpage\global\firstpagefalse
\vtop to0pt{\vss
\rlap{\hbox to\textwidth{\hfill\color{gray}\small
Generated using the official AMS \LaTeX\ template---two-column layout.
FOR AUTHOR USE ONLY, NOT FOR SUBMISSION!\hfill}}
\vskip3pt
\hrule width \textwidth
\vskip18pt}
\fi\fi
\ifdraft\else
\vtop to 0pt{\vss
\rlap{\hbox to\textwidth{\footnotesize\sc\rlap{\currvolume}\hfill
%%%
\uppercase{\currjournal}
%%%
\hfill
\llap{\currdate}}}
\vss}\fi}}%
    \def\@oddfoot{\hbox to\textwidth{\rlap{\ifdraft\small\else\scriptsize\fi
%\copyright \theyear\ 
Generated using v4.3.2 of the AMS \LaTeX\ template}\hfill
\normalsize\ifdraft\thepage\hfill\else
\thepage\hfill\fi}}%
    \let\@evenfoot\@empty
    \let\@evenfoot\@empty}

  \def\ps@headings{%
    \def\@oddfoot{\ifdraft\centerline{\thepage}\else\hfill\fi}
    \let\@evenfoot\@oddfoot
    \def\@evenhead{{\ifdraft\hfill\else\normalsize\thepage
\bigfootnotesize\sc\hfill 
\uppercase{\currjournal}
\hfill \currvolume\fi}}%
    \def\@oddhead{{\ifdraft\hfill\else\bigfootnotesize\sc\currdate\hfill \therunningheadauthors\hfill \normalsize\thepage
%\currvolume
\fi}}%
}

%%%%%%%%%%%%
%% Names to be used in Bibliography, Figure and Table captions, and
%% Appendix

\newcommand\refname{References}
\newcommand\figurename{{\sc Fig.}}
\newcommand\tablename{{\sc Table}}
\newcommand\appendixname{Appendix}

%%%%%%%%%%%%%%%
%% margin notes positioning
\setlength\marginparsep {10\p@}
\setlength\marginparpush{5\p@}
\setlength\marginparwidth {48\p@}

%%%%%%%%%%%%%%%
%% needed by output routine

\setlength\oddsidemargin   {-19pt}
\evensidemargin\oddsidemargin


%%%%%%%%%%%%%%%
%% Footnote settings

\renewcommand\footnoterule{%
\vskip11pt
  \hrule\@width.2\columnwidth
  \vskip10pt}

\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

%% distance between footnotes
\setlength\footnotesep{6.65\p@}

%% distance between text and baseline of first footnote
\setlength{\skip\footins}{6\p@ \@plus .1\p@ \@minus 2\p@
}

\skip\@mpfootins = \skip\footins

%%%%%%%%%%%%%%%
%% distance between figures and tables and text
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}

%% Separation used when you type \begin{figure}[h]...\end{figure} or
%% \begin{table}[h]...\end{table}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}

%% Separation used when you type \begin{figure*}...\end{figure*} or
%% \begin{table*}...\end{table*}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}

%% Separation used when you type \begin{figure*}[h]...\end{figure*} or
%% \begin{table*}[h]...\end{table*}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}

%%%%%%%%%%
%% float positioning, needed by output routine
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}

%%%%%%%%%
%% Listing defaults, 
%% up to six levels of indentation

%% add to top of new list if started in vertical mode
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

\def\@listi{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi

\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}

\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}

\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}

\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}

\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}


%% indentation of various levels of listing:
\setlength\leftmargini  {2em}
\leftmargin  \leftmargini

\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}

  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}

\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

%% \begin{enumerate}\item \end{enumerate}
%% will use these defaults:

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

%% \begin{itemize}\item \end{itemize}
%% will use these defaults:

\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

%% \begin{description}\item \end{description}
%% will use these defaults:

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

%%%%%%%%%%
%% Used within other commands for influencing
%% whether to start a new page.
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Float settings

%% How many figures or tables at the top of page?
\setcounter{topnumber}{10}
%% How much space may be used by figures and tables at the top of page?
\renewcommand\topfraction{.95}

%% Same, at the bottom of the page
\setcounter{bottomnumber}{10}
\renewcommand\bottomfraction{.95}

%% How many figures/tables in total on one page?
\setcounter{totalnumber}{10}

%% How much of the page should be text?
\renewcommand\textfraction{.01}%% How much of the page must reserved for text?
\renewcommand\floatpagefraction{.95}

%% Similarly, but for double column figures or tables:
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.95}
\renewcommand\dblfloatpagefraction{.95}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Section head definitions
\setcounter{secnumdepth}{4}

\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\@alph\c@subsection}
\renewcommand\thesubsubsection{\@arabic\c@subsubsection}
\renewcommand\theparagraph    {(\@roman\c@paragraph)}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

%% Innards of \@startsection, used  for section fonts.
%% The change is to make italic small caps for subsubsection, have
%% upright section number

\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\ifnum#2=4\else\ifnum#2=3)\else.\fi\fi\ \hskip1pt\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M 
%% the following line is the change from the latex.ltx default:
\ifnum#2=3\let\dothis\sc\else\let\dothis\relax\fi\dothis{#8}
\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-12pt \@plus -1ex \@minus -.2ex}%
                                   {6pt}%
                                   {\ifdraft\large\else\normalsize\fi\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {-12pt \@plus -1ex \@minus -.2ex}%
                                   {6pt}%
                                     {\ifdraft\large\else\normalsize\fi\it}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {-12pt \@plus -1ex \@minus -.2ex}%
                                   {6pt}%
                                     {\sc}}%
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {6pt \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\ifdraft\large\else\normaltextsize\fi\it}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normaltextsize\bfseries}}


%%%%%%%%%%%%
%% Quotation, Quote
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting table and array widths
%% (\begin{tabular}...\end{tabular} and
%% \begin{array}...\end{array}

%% white space between columns in array
\setlength\arraycolsep{5\p@}

%%%%%%%%%%%
%% white space between columns in tabular
\setlength\tabcolsep{6\p@}

%%%%%%%%%%%
%% Width of ruled lines in array
\setlength\arrayrulewidth{.4\p@}

%%%%%%%%%%%
%% Distance between two ruled lines
\setlength\doublerulesep{2\p@}

%%%%%%%%%%%
\setlength\tabbingsep{\labelsep}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% \fbox{} settings

%% determine how much space between ruled lines and text:
\setlength\fboxsep{3\p@}

%% Width of ruled lines used by \fbox:
\setlength\fboxrule{.4\p@}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Declaring counters

%% equations counter:
\renewcommand \theequation {\@arabic\c@equation}

%% figure counter:
\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Equation line spacing

\everydisplay{\def\arraystretch{1.0}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figures

%% Choices for figure float placement if [] hasn't been
%% used for \begin{figure} 
\def\fps@figure{tbp}
\def\draftspace{\renewcommand\baselinestretch{2.25}}
\def\twocolspace{\renewcommand\baselinestretch{1}}
%\renewcommand\baselinestretch{2.25}
\ifdraft\draftspace\else\twocolspace\fi


\def\ftype@figure{1}
\def\ext@figure{lof} %for List of Figures, which we won't use
\def\fnum@figure{\figurename~\thefigure}

\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables
\newcounter{table}

%% Choices for figure float placement if [] hasn't been
%% used for \begin{figure} 
\def\fps@table{tbp}

%\renewcommand\baselinestretch{2.25}
\ifdraft\draftspace\else\twocolspace\fi

\def\ftype@table{2}
\def\ext@table{lot} % for List of Tables, which we won't use
\def\fnum@table{\tablename~\thetable}

\newenvironment{table}
               {\footnotesize\@float{table}}
               {\end@float}

\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

%%% Figure and Table Captions
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{5\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Bibliography
%%% Customized with natbib package

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% To get curr month/day/year

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Two-column defaults

\setlength\columnsep{12\p@}
\setlength\columnseprule{0\p@}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Default page style: plain
%% Running heads and feet

\pagestyle{headings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Default page numbering

\pagenumbering{arabic}

%% default page style, some leaway for lines going into
%% margin, no ragged bottom
\ifdraft\else
  \twocolumn\fi
  \sloppy
  \flushbottom

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% All the usepackages included in this style %%%%%%%%%%%%%%%%%
\usepackage{graphicx}
\usepackage{amsmath,amsfonts,amssymb,bm}
\usepackage[scaled=.97]{helvet} %% to get bold helvetica
\usepackage{mathptmx}%{times}
\usepackage{natbib}
\def\bibfont{\ifdraft\normalsize\else\footnotesize\fi}
\usepackage{url}
\usepackage{xcolor}
\usepackage{indentfirst}
\usepackage{multicol}
\usepackage{ifthen}
\usepackage{rotating}
%% Start line numbers immediately if in draft mode,
%% use endfloat commands to put tables and figures at
%% end of paper.
\ifdraft
\usepackage[nomarkers,tablesfirst]{endfloat}
\usepackage{lineno}
\linenumbers
\fi



%%%%%%%%%% Setting up title/running head info %%%%%%%%%%%%%%%%
\def\title#1{\def\thetitle{#1}}
\def\received#1{\ifdraft\def\thereceived{}\else\def\thereceived{#1}\fi}
\received{}
\def\authors#1{\def\theauthors{#1}}
\def\author#1{\def\theauthors{#1}}

\newcounter{extraauth}
\newcounter{loopnum}

\def\extraauthor#1{\global\advance\c@extraauth by 1
\expandafter\gdef\csname extraauthors\the\c@extraauth\endcsname{#1}}

\let\extraauthors\extraauthor

\def\extraaffil#1{\expandafter\gdef\csname extraaffil\the\c@extraauth\endcsname{#1}}

\def\affiliation#1{\def\theaffiliation{#1}}

\let\theextraaffil\relax
\let\theextraauthor\relax
\let\theextraauthors\relax

\def\abstract#1{\def\theabstract{%
\centerline{\vtop{\ifdraft\normalsize\else \bigfootnotesize\fi\hsize 5.125in
\ifdraft\internallinenumbers\fi
\noindent\hskip8pt\relax #1\vskip1sp}}}}

\let\dothanks\relax

\def\correspondingauthor#1{%
\thanks{\ifdraft\internallinenumbers\normalsize\fi
 \noindent{\it Corresponding author address:}\ #1
  \vskip1pt
  \noindent\theemail
}}

\let\thecorrespondingauthor\relax

{\makeatletter
\gdef\email{\bgroup\makeatletter\xemail}
\gdef\xemail#1{\gdef\theemail{{\ifdraft\normalsize\else\footnotesize\fi E-mail: #1}}\egroup}
}

\def\articledoi#1{\def\thedoi{{\ifdraft\normalsize\else\scriptsize\fi\sc DOI: #1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% \maketitle, \@maketitle, for beginning of article

%% allows multiple \thanks in draft mode
\newcount\thanksnum
\newcount\savethanksnum
\def\thanksloop{\savethanksnum=\thanksnum
\thanksnum=1\relax
\loop
\ifnum\thanksnum<\savethanksnum
\ifx\expandafter\csname thanks\the\thanksnum\endcsname\relax
\else
\vskip1sp
\noindent\llap{$^{\@fnsymbol{\the\thanksnum}}$}\csname thanks\the\thanksnum\endcsname
\global\advance\thanksnum by 1\fi
\repeat
\ifx\expandafter\csname thanks\the\thanksnum\endcsname\relax
\else
\vskip1sp
\noindent\llap{$^{\@fnsymbol{\the\thanksnum}}$}\csname thanks\the\thanksnum\endcsname\ \vskip1sp\fi
}


%% allows multiple \extraauthor and \extraaffil

\def\extraloop{\c@loopnum=\c@extraauth
\c@extraauth=1\relax
\loop
\ifnum\c@extraauth<\c@loopnum
\ifx\expandafter\csname extraauthors\the\c@extraauth\endcsname\relax
\else
\vskip12pt
\ifdraft\rm\else\sc\fi
\csname extraauthors\the\c@extraauth\endcsname
\vskip3pt
{\it
\csname extraaffil\the\c@extraauth\endcsname}
\global\advance\c@extraauth by 1\fi
\repeat
\ifx\expandafter\csname extraauthors\the\c@extraauth\endcsname\relax
\else
\vskip12pt
\ifdraft\rm\else\sc\fi
\csname extraauthors\the\c@extraauth\endcsname
\vskip3pt
{\it \csname extraaffil\the\c@extraauth\endcsname}
\fi
}

%% Makes title on first page of article, 
%% allows switches for draft/twocol mode
\newif\iffirstpage
\newcommand\maketitle{\par
\global\firstpagetrue
\thispagestyle{plain}
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
     \long\def\@makefntext##1{\parindent 1em\footnotesize\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1
     \vskip1sp
%     \vskip1pt\footnoterule
     \small
     \vskip3pt
\ifdraft\else\dothanks\fi
}%
\ifdraft
    \@maketitle
\@thanks 
\else
    \twocolumn[\@maketitle]%
\@thanks
\fi
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\theauthor\@empty
  \global\let\@date\@empty
  \global\let\thetitle\@empty
  \global\let\title\relax
  \global\let\author\relax
\normalsize
}

%% Allows switches for draft/twocol mode
\def\@maketitle{%
\vglue61pt
  \begin{center}%
\ifdraft
\def\thanks##1{\global\advance\thanksnum by 1
$^{\@fnsymbol{\the\thanksnum}}$%
\expandafter\gdef\csname thanks\the\thanksnum\endcsname{##1}}
\fi%
    {
\vglue-4pt
\ifdraft\Large\else\large\fi\bf \thetitle \par}% 
    \vskip 12pt
        {\normalsize\ifdraft\rm\else\sc\fi\theauthors%
}
    \vskip 6pt
{\bigfootnotesize\it
\ifdraft\internallinenumbers\normalsize\fi
\theaffiliation
\ifdraft\normalsize\fi
%%
{\normalsize
\extraloop
}\vskip5pt
%\fi
%%
\vskip14pt
\rm
\ifx\thereceived\empty\else
(\thereceived)
\vskip9pt
\fi
}
\end{center}
\ifdraft
\vfill
\thanksloop
\dothanks
\eject\fi
\centerline{\ifdraft\normalsize\else\bigfootnotesize\fi\sc ABSTRACT}
\vskip7pt
\theabstract
\vskip17pt
\ifdraft\newpage\fi
}


\advance\voffset-36pt


%% to be used in running heads for [twocol] option:
\def\runningheadauthors#1{%
\def\therunningheadauthors{{\spaceskip=1pt #1}}}
\runningheadauthors{Please use command {\tt\string\runningheadauthors\string{\string}}}
\runningheadauthors{}

%% to be used in running heads for [twocol] option:
\def\and{\ \ \ A N D\ \ \ }

%% Keeps single line at bottom of previous page or at top of current page
%% from occurring.
\clubpenalty=10000
\widowpenalty=10000

%% It would be nice to use this, but it messes up the page makeup.
%% No hyphenation over page breaks
%\brokenpenalty=5000

%% bold helvetica, which will scale according to font family
%% where it is found:

\def\sfbf#1{\leavevmode\hbox{\fontfamily{phv}\selectfont\bfseries #1}}


%% needed for small caps in italic for subsubsection head
%% Doing this in tikz saves having to import another font file

\newcommand{\textscsl}[1]{%
   \tikz[baseline=(N.base)]%
   % The transform says:
   % x' = 1x + 0.22y + 0pt
   % y' = 0x + 1y    + 0pt
   % This gives a slant - adjust the value for each font!
   \pgfsys@transformcm{1}{0}{0.22}{1}{0pt}{0pt}%
   \node[inner sep=0pt] (N) {\textsc{#1}};%
}

\def\listfigurename{\uppercase{List of Figures}}
\def\listtablename{\uppercase{List of Tables}}

%% needed for draft version
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
\baselineskip=18pt
\normalsize
    \@starttoc{lof}%
    }

\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{\MakeUppercase\listtablename}%
              {\MakeUppercase\listtablename}}%
\baselineskip=18pt
\normalsize
    \@starttoc{lot}%
    }

%% Handle table and figure captions somewhat differently; put
%% in line numbers when in draft mode, change font size for draft mode.

\def\appendcaption#1#2{\ifdraft
\ifx\@captype\xtable 
\@makecaption{Table #1}{#2}
  \addcontentsline{\csname ext@table\endcsname}{table}%
    {\protect\numberline{#1}{\ignorespaces #2}}%
\else
\@makecaption{Fig. #1}{#2}
  \addcontentsline{\csname ext@figure\endcsname}{figure}%
    {\protect\numberline{#1}{\ignorespaces #2}}%
\fi
\else
\caption{#2}
\fi
}

\def\xtable{table}
\long\def\@makecaption#1#2{%
\ifx\@captype\xtable \vskip4pt\else  \vskip\abovecaptionskip\fi
  \sbox\@tempboxa{\ifdraft\normaltextsize\else\footnotesize\fi #1. #2}%
  \ifdim \wd\@tempboxa >\hsize
%%
\global\setbox0\vbox{
\ifdraft\normaltextsize\internallinenumbers\baselineskip=20pt\else \footnotesize\fi
#1. #2
}
\ifdim\ht0<24pt
\setbox1=\vbox{\unvbox0
\global\setbox2=\lastbox}
\copy1
\vskip-6pt
\centerline{\hbox{\unhbox2}}
\par
\else
\ifdraft\normaltextsize\else\footnotesize\fi
\ifdraft\internallinenumbers\baselineskip=20pt\fi
\hskip10pt #1. #2\par
\fi
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
\ifx\@captype\xtable 
  \vskip\belowcaptionskip\fi}

%% make section heads end with a period.
\def\@seccntformat#1{\csname the#1\endcsname}

\def\acknowledgments{\paragraph*{Acknowledgments.}}
\def\acknowledgment{\paragraph*{Acknowledgment.}}

%% tables, to make correct space around the horizontal lines at the
%% top, underneath the column headers, and at the bottom of the table.
\def\topline{\hline\hline\vrule height 10pt depth4pt width0pt\relax}
\def\midline{\hline\vrule height 10pt width0pt\relax}
\def\botline{\hline}


%% Allow two 1 col width tables or 1 col width figures to
%% be side by side in a two-column width illustration or table.

\def\sidebyside#1#2{\hbox to\textwidth{%
\vbox{\hsize=.5\textwidth\advance\hsize -6pt #1}\hfill
\vbox{\let\internallinenumbers\relax\hsize=.5\textwidth\advance\hsize -6pt #2}}}

%% Make tabular default fontsize be footnotesize.
\let\savetabular\tabular
\def\tabular{\footnotesize\baselineskip=12pt\savetabular}

\@namedef{tabular*}#1{\def\@halignto{to#1}
\footnotesize\baselineskip12pt\@tabular}

%%% The following commands are used for draft mode when
%%% figures and tables are sent to the end of the paper.
%%% These terms help format the list of tables and list of figures nicely.

\def\fignumberline#1#2{\bgroup
\normaltextsize\parindent=0pt\leftskip=42pt\noindent\hskip-42pt\hbox to 42pt{\bf Fig.~#1.\hfill}%
\advance\hsize -42pt
#2\xdotfill\currpage\hbox to -44pt{}\vskip1sp\egroup}

\def\tabnumberline#1#2{\bgroup
\normaltextsize\parindent=0pt\leftskip=50pt\noindent\hskip-50pt\hbox to 50pt{\bf Table~#1.\hfill}%
\advance\hsize -88pt
#2\xdotfill\currpage\hbox to -50pt{}\vskip1sp\egroup}


\def\l@figure#1#2{%
\let\numberline\fignumberline
\def\currpage{#2}#1\vskip12pt}

\def\l@table#1#2{%
\let\numberline\tabnumberline
\def\currpage{#2}#1\vskip12pt}

%% Make meaning different depending on whether in draft or twocol mode.
\def\thanks#1{\footnotemark\,
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{%
\ifdraft\noexpand\internallinenumbers\fi#1}}%
}

%% Wider space between dots than standard \dotfill
\def\xdotfill{%
  \leavevmode
  \cleaders \hb@xt@ 1.5em{\hss.\hss}\hfill
  \kern\z@}



\ifdraft
%%% only needed if line numbers are activated

%%% from Brian Papa, ametsoc.sty

% The following section defines a new command that helps to resolve the issue of missing line numbers preceding some 
% equations when using various math display environments
%
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}}% 
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
\patchBothAmsMathEnvironmentsForLineno{equation}%
\patchBothAmsMathEnvironmentsForLineno{align}%
\patchBothAmsMathEnvironmentsForLineno{flalign}%
\patchBothAmsMathEnvironmentsForLineno{alignat}%
\patchBothAmsMathEnvironmentsForLineno{gather}%
\patchBothAmsMathEnvironmentsForLineno{multline}%
\patchBothAmsMathEnvironmentsForLineno{eqnarray}%
}
\fi

%%%%%%%%%%%%
%% Appendix

\newif\iffirstappendix
\newenvironment{appendix}[1][1]%
{\vskip12pt\goodbreak
\ifthenelse{\equal{#1}{1}}%
{\renewcommand\theequation{A\arabic{equation}}%
\setcounter{equation}{0}% reset counter
\ifdraft\else
\setcounter{figure}{0}% reset counter
\setcounter{table}{0}% reset counter
\renewcommand\thefigure{A\arabic{figure}}
\renewcommand\thetable{A\arabic{table}}
\fi
\setcounter{section}{0}% reset counter
\setcounter{subsection}{0}% reset counter
\renewcommand\thesection{A\arabic{section}}
\begin{center}%
{\textnormal APPENDIX}%
\end{center}}%
{\renewcommand\theequation{{#1}\arabic{equation}}%
\setcounter{equation}{0}% reset counter
\setcounter{section}{0}% reset counter
\setcounter{subsection}{0}% reset counter
\ifdraft\else
\renewcommand\thefigure{#1\arabic{figure}}
\renewcommand\thetable{#1\arabic{table}}
\fi
\renewcommand\thesection{#1\arabic{section}}
\begin{center}%
{\textnormal APPENDIX #1}%
\end{center}}
}%



\long\def\appendixtitle#1{{\vskip-1pt\centering\bf #1\vskip6pt}}

%%% Added Nov 12, 2013; updated 25 Aug 2014

\def\journal#1{\expandafter\ifx\csname #1\endcsname\relax
\typeout{^^J^^J
\string\journal\string{\string} has incorrect name!^^J
Please choose a journal name from the following list:^^J^^J
jamc   (Journal of Applied Meteorology and Climatology)^^J
jtech    (Journal of  Atmospheric and Oceanic Technology)^^J
jhm    (Journal of Hydrometeorology)^^J
jpo   (Journal of Physical Oceanography)^^J
jas   (Journal of Atmospheric Sciences)^^J
jcli    (Journal of Climate)^^J
mwr    (Monthly Weather Review)^^J
wcas    (Weather, Climate, and Society)^^J
waf     (Weather and Forecasting)^^J
bams (Bulletin of the American Meteorological Society)^^J
ei (Earth Interactions)^^J^^J}
\stop
\else
\xdef\currjournal{\csname #1\endcsname}
\xdef\therunningheadauthors{\csname #1\endcsname}
\fi}

\def\jamc{J o u r n a l \ \ o f \ \ A p p l i e d \ \  M e t e o r o l o g y \ \  a n d \ \ C l i m a t o l o g y}

\def\jtech{J o u r n a l \ \  o f \ \ A t m o s p h e r i c \ \ a n d \ \ O c e a n i c \ \ T e c h n o l o g y}

\def\jhm{J o u r n a l \ \  o f \ \ H y d r o m e t e o r o l o g y}

\def\jpo{J o u r n a l \ \  o f \ \  P h y s i c a l \ \ O c e a n o g r a p h y}

\def\jas{J o u r n a l \ \  o f \ \  t h e \ \ A t m o s p h e r i c \ \ S c i e n c e s}

\def\jcli{J o u r n a l  \ \  o f \ \ C l i m a t e}

\def\mwr{M o n t h l y \ \ W e a t h e r \ \  R e v i e w}

\def\wcas{W e a t h e r, \ \ C l i m a t e, \ \ a n d \ \ S o c i e t y}

\def\waf{W e a t h e r \ \ a n d \ \  F o r e c a s t i n g}

\def\bams{B u l l e t i n \ \  o f \ \ t h e \ \ A m e r i c a n \ \ M e t e o r o l o g i c a l \ \ S o c i e t y}

\def\ei{E a r t h \ \ I n t e r a c t i o n s}

\def\theyear{\the\year}
\def\curryear#1{\def\theyear{#1}}
\endinput
