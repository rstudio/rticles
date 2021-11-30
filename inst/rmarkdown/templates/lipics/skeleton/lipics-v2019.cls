%%
%% This is file `lipics-v2019.cls'.
%%
%% -----------------------------------------------------------------
%% Author:     Dagstuhl Publishing & le-tex publishing services
%%
%% This file is part of the lipics package for preparing
%% LIPICS articles.
%%
%% Copyright (C) 2018 Schloss Dagstuhl
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is
%% Schloss Dagstuhl (publishing@dagstuhl.de).
%% -----------------------------------------------------------------
%%
\ProvidesClass{lipics-v2019}
    [2020/04/29 v2.2.1 LIPIcs articles]
\NeedsTeXFormat{LaTeX2e}[2015/01/01]
\emergencystretch1em
\advance\hoffset-1in
\advance\voffset-1in
\advance\hoffset2.95mm
\newif\if@nobotseplist  \@nobotseplistfalse
\def\@endparenv{%
  \addpenalty\@endparpenalty\if@nobotseplist\else\addvspace\@topsepadd\fi\@endpetrue}
\def\@doendpe{%
  \@endpetrue
  \def\par{\@restorepar
           \everypar{}%
           \par
           \if@nobotseplist
             \addvspace\topsep
             \addvspace\partopsep
             \global\@nobotseplistfalse
           \fi
           \@endpefalse}%
  \everypar{{\setbox\z@\lastbox}%
            \everypar{}%
            \if@nobotseplist\global\@nobotseplistfalse\fi
            \@endpefalse}}
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \expandafter
    \list
      \csname label\@enumctr\endcsname
      {\advance\partopsep\topsep
       \topsep\z@\@plus\p@
       \ifnum\@listdepth=\@ne
         \labelsep0.72em
       \else
         \ifnum\@listdepth=\tw@
           \labelsep0.3em
         \else
           \labelsep0.5em
         \fi
       \fi
       \usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
  \fi}
\def\endenumerate{\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\advance\partopsep\topsep
       \topsep\z@\@plus\p@
       \ifnum\@listdepth=\@ne
         \labelsep0.83em
       \else
         \ifnum\@listdepth=\tw@
           \labelsep0.75em
         \else
           \labelsep0.5em
         \fi
      \fi
      \def\makelabel##1{\hss\llap{##1}}}%
  \fi}
\def\enditemize{\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\def\@title{\textcolor{red}{Author: Please provide a title}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax
          \ifnum #2=1
            \colorbox{lipicsYellow}{\kern0.15em\@svsec\kern0.15em}\quad
          \else
            \@svsec\quad
          \fi}%
          \interlinepenalty \@M #8\@@par}%
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
\def\@seccntformat#1{\csname the#1\endcsname}
\def\@biblabel#1{\textcolor{lipicsGray}{\sffamily\bfseries#1}}
\def\copyrightline{%
  \ifx\@hideLIPIcs\@undefined
    \ifx\@EventLogo\@empty
    \else
      \setbox\@tempboxa\hbox{\includegraphics[height=42\p@]{\@EventLogo}}%
      \rlap{\hspace\textwidth\hspace{-\wd\@tempboxa}\hspace{\z@}%
            \vtop to\z@{\vskip-0mm\unhbox\@tempboxa\vss}}%
    \fi
    \scriptsize
    \vtop{\hsize\textwidth
      \nobreakspace\par
      \@Copyright
      \ifx\@EventLongTitle\@empty\else\@EventLongTitle.\\\fi
      \ifx\@EventEditors\@empty\else
        \@Eds: \@EventEditors
        ; Article~No.\,\@ArticleNo; pp.\,\@ArticleNo:\thepage--\@ArticleNo:\pageref{LastPage}%
        \\
      \fi
      \setbox\@tempboxa\hbox{\includegraphics[height=14\p@,trim=0 15 0 0]{lipics-logo-bw}}%
      \hspace*{\wd\@tempboxa}\enskip
      \href{https://www.dagstuhl.de/lipics/}%
           {Leibniz International Proceedings in Informatics}\\
      \smash{\unhbox\@tempboxa}\enskip
      \href{https://www.dagstuhl.de}%
           {Schloss Dagstuhl -- Leibniz-Zentrum f{\"u}r Informatik, Dagstuhl Publishing, Germany}}%
  \fi}
\def\ps@plain{\let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \let\@evenfoot\copyrightline
  \let\@oddfoot\copyrightline}
\def\lipics@opterrshort{Option  "\CurrentOption" not supported}
\def\lipics@opterrlong{The option "\CurrentOption" from article.cls is not supported by lipics.cls.}
\DeclareOption{a5paper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{b5paper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{legalpaper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{executivepaper}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{landscape}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{10pt}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{11pt}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{12pt}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{oneside}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{twoside}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{titlepage}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{notitlepage}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{onecolumn}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{twocolumn}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{fleqn}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{openbib}{\@latexerr{\lipics@opterrshort}{\lipics@opterrlong}}
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}
                        \advance\hoffset-2.95mm
                        \advance\voffset8.8mm}
\DeclareOption{numberwithinsect}{\let\numberwithinsect\relax}
\DeclareOption{cleveref}{\let\usecleveref\relax}
\DeclareOption{autoref}{\let\useautoref\relax}
\DeclareOption{anonymous}{\let\authoranonymous\relax}
\DeclareOption{thm-restate}{\let\usethmrestate\relax}
\DeclareOption{authorcolumns}{\let\authorcolumns\relax}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[twoside,notitlepage,fleqn]{article}
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{13}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand\small{%
   \@setfontsize\small\@ixpt{11.5}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize{8.5}{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\large{\@setfontsize\large{10.5}{13}}
\renewcommand\Large{\@setfontsize\Large{12}{14}}
\setlength\parindent{1.5em}
\setlength\headheight{3mm}
\setlength\headsep   {10mm}
\setlength\footskip{3mm}
\setlength\textwidth{140mm}
\setlength\textheight{222mm}
\setlength\oddsidemargin{32mm}
\setlength\evensidemargin{38mm}
\setlength\marginparwidth{25mm}
\setlength\topmargin{13mm}
\setlength{\skip\footins}{2\baselineskip \@plus 4\p@ \@minus 2\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep\z@ \@plus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep\z@ \@plus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \z@ \@plus\p@}
\def\ps@headings{%
    \def\@evenhead{\large\sffamily\bfseries
                   \llap{\hbox to0.5\oddsidemargin{  \ifx\@hideLIPIcs\@undefined\ifx\@ArticleNo\@empty\textcolor{red}{XX}\else\@ArticleNo\fi:\fi\thepage\hss}}\leftmark\hfil}%
    \def\@oddhead{\large\sffamily\bfseries\rightmark\hfil
                  \rlap{\hbox to0.5\oddsidemargin{\hss  \ifx\@hideLIPIcs\@undefined\ifx\@ArticleNo\@empty\textcolor{red}{XX}\else\@ArticleNo\fi:\fi\thepage}}}%
    \def\@oddfoot{\hfil
                  \rlap{%
                    \vtop{%
                      \vskip10mm
                      \colorbox{lipicsYellow}
                                    {\@tempdima\evensidemargin
                                     \advance\@tempdima1in
                                     \advance\@tempdima\hoffset
                                     \hb@xt@\@tempdima{%
                                       \ifx\@hideLIPIcs\@undefined
                                         \textcolor{lipicsGray}{\normalsize\sffamily
                                         \bfseries\quad
                                         \expandafter\textsolittle
                                         \expandafter{\@EventShortTitle}}%
                                       \fi
                                     \strut\hss}}}}}
    \let\@evenfoot\@empty
    \let\@mkboth\markboth
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble}
\pagestyle{headings}
\renewcommand\maketitle{\par
  \begingroup
    \thispagestyle{plain}
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\newwrite\tocfile
\def\@maketitle{%
  \newpage
  \null\vskip-\baselineskip
  \vskip-\headsep
  \@titlerunning
  \@authorrunning
  %%\let \footnote \thanks
  \parindent\z@ \raggedright
  \if!\@title!\def\@title{\textcolor{red}{Author: Please fill in a title}}\fi
    {\LARGE\sffamily\bfseries\mathversion{bold}\@title \par}%
    \vskip 1em
    \ifx\@author\orig@author
      \textcolor{red}{Author: Please provide author information}%
    \else
      {\def\thefootnote{\@arabic\c@footnote}%
       \setcounter{footnote}{0}%
       \fontsize{9.5}{12}\selectfont\@author}%
    \fi
    \bgroup
      \immediate\openout\tocfile=\jobname.vtc
      \protected@write\tocfile{
			\let\footnote\@gobble
			\let\thanks\@gobble
			\def\footnotemark{}
			\def\and{and }%
			\def\,{ }
			\def\\{ }
		}{%
	        \string\contitem
	        \string\title{\@title}%
	        \string\author{\@authorsfortoc}%
	        \string\page{\@ArticleNo:\thepage--\@ArticleNo:\number\numexpr\getpagerefnumber{LastPage}}}%
      \closeout\tocfile
    \egroup
  \par}
\renewcommand\tableofcontents{%
  \section*{\contentsname}%
  \@starttoc{toc}}
\setcounter{secnumdepth}{4}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sffamily\Large\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\sffamily\Large\bfseries\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\sffamily\Large\bfseries\raggedright}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-3.25ex \@plus-1ex \@minus-.2ex}%
                                    {1.5ex \@plus .2ex}%
                                    {\sffamily\large\bfseries\raggedright}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\sffamily\normalsize\bfseries}}
\setlength\leftmargini  \parindent
\setlength\leftmarginii {1.2em}
\setlength\leftmarginiii{1.2em}
\setlength\leftmarginiv {1.2em}
\setlength\leftmarginv  {1.2em}
\setlength\leftmarginvi {1.2em}
\renewcommand\labelenumi{%
  \textcolor{lipicsGray}{\sffamily\bfseries\upshape\mathversion{bold}\theenumi.}}
\renewcommand\labelenumii{%
  \textcolor{lipicsGray}{\sffamily\bfseries\upshape\mathversion{bold}\theenumii.}}
\renewcommand\labelenumiii{%
  \textcolor{lipicsGray}{\sffamily\bfseries\upshape\mathversion{bold}\theenumiii.}}
\renewcommand\labelenumiv{%
  \textcolor{lipicsGray}{\sffamily\bfseries\upshape\mathversion{bold}\theenumiv.}}
\renewcommand\labelitemi{%
  \textcolor{lipicsBulletGray}{\ifnum\@listdepth=\@ne
                                  \rule{0.67em}{0.33em}%
                                \else
                                  \rule{0.45em}{0.225em}%
                                \fi}}
\renewcommand\labelitemii{%
  \textcolor{lipicsBulletGray}{\rule{0.45em}{0.225em}}}
\renewcommand\labelitemiii{%
  \textcolor{lipicsBulletGray}{\sffamily\bfseries\textasteriskcentered}}
\renewcommand\labelitemiv{%
  \textcolor{lipicsBulletGray}{\sffamily\bfseries\textperiodcentered}}
\renewenvironment{description}
               {\list{}{\advance\partopsep\topsep\topsep\z@\@plus\p@
                        \labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\renewcommand*\descriptionlabel[1]{%
  \hspace\labelsep\textcolor{lipicsGray}{\sffamily\bfseries\mathversion{bold}#1}}
\renewenvironment{abstract}{%
  \vskip0.7\bigskipamount
  \noindent
  \rlap{\color{lipicsLineGray}\vrule\@width\textwidth\@height1\p@}%
  \hspace*{7mm}\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
    \large\selectfont\sffamily\bfseries\abstractname}}%
  \vskip3\p@
  \fontsize{9}{12}\selectfont
  \noindent\ignorespaces}
  {\vskip0.7\baselineskip\noindent
   \subjclassHeading
   \ifx\@ccsdescString\@empty
     \textcolor{red}{Author: Please fill in 1 or more \string\ccsdesc\space macro}%
   \else
     \@ccsdescString
   \fi
   \vskip0.7\baselineskip
   \noindent\keywordsHeading
   \ifx\@keywords\@empty
     \textcolor{red}{Author: Please fill in \string\keywords\space macro}%
   \else
     \@keywords
   \fi
   \ifx\@hideLIPIcs\@undefined
     \ifx\@DOIPrefix\@empty\else
       \vskip0.7\baselineskip\noindent
       \doiHeading\href{https://doi.org/\@DOIPrefix.\@EventAcronym.\@EventYear.\@ArticleNo}{\@DOIPrefix.\@EventAcronym.\@EventYear.\@ArticleNo}%
     \fi
   \fi
   \ifx\@category\@empty\else
     \vskip0.7\baselineskip\noindent
     \categoryHeading\@category
   \fi
   \ifx\@relatedversion\@empty\else
     \vskip0.7\baselineskip\noindent
     \relatedversionHeading\@relatedversion
   \fi
   \ifx\@supplement\@empty\else
     \vskip0.7\baselineskip\noindent
     \supplementHeading\@supplement
   \fi
   \ifx\@funding\@empty\else
     \vskip0.7\baselineskip\noindent
     \fundingHeading\ifx\authoranonymous\relax\textcolor{red}{Anonymous funding}\else\@funding\fi
   \fi
   \ifx\@acknowledgements\@empty\else
     \vskip0.7\baselineskip\noindent
     \acknowledgementsHeading\ifx\authoranonymous\relax\textcolor{red}{Anonymous acknowledgements} \else\@acknowledgements\fi
   \fi
	\protected@write\@auxout{}{\string\gdef\string\@pageNumberEndAbstract{\thepage}}%
	}% end abstract
\renewenvironment{thebibliography}[1]
  {\if@noskipsec \leavevmode \fi
   \par
   \@tempskipa-3.5ex \@plus -1ex \@minus -.2ex\relax
   \@afterindenttrue
   \@tempskipa -\@tempskipa \@afterindentfalse
   \if@nobreak
     \everypar{}%
   \else
     \addpenalty\@secpenalty\addvspace\@tempskipa
   \fi
   \noindent
   \rlap{\color{lipicsLineGray}\vrule\@width\textwidth\@height1\p@}%
   \hspace*{7mm}\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
     \normalsize\sffamily\bfseries\refname}}%
   \@xsect{1ex \@plus.2ex}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\leftmargin8.5mm
         \labelsep\leftmargin
         \settowidth\labelwidth{\@biblabel{#1}}%
         \advance\labelsep-\labelwidth
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \fontsize{9}{12}\selectfont
   \sloppy
   \clubpenalty4000
   \@clubpenalty \clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m\protected@write\@auxout{}{\string\gdef\string\@pageNumberStartBibliography{\thepage}}}
  {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
   \protected@write\@auxout{}{\string\gdef\string\@pageNumberEndBibliography{\thepage}}%
   \endlist}
\g@addto@macro\appendix{\immediate\write\@auxout{\string\gdef\string\@pageNumberStartAppendix{\thepage}}}%
\renewcommand\footnoterule{%
  \kern-8\p@
  {\color{lipicsBulletGray}\hrule\@width40mm\@height1\p@}%
  \kern6.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent\z@\hangindent1em
    \leavevmode
    \hb@xt@1em{\@makefnmark\hss}#1}
\usepackage{microtype}
\usepackage[utf8]{inputenc}
\IfFileExists{lmodern.sty}{\RequirePackage{lmodern}}{}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage[mathscr]{eucal}
\RequirePackage{amssymb}
\PassOptionsToPackage{retainmissing}{MnSymbol}
\AtBeginDocument{\@ifpackageloaded{MnSymbol}%
    {\expandafter\let\csname ver@amssymb.sty\endcsname\relax
     \let\complement\@undefined
     \RequirePackage{amssymb}}{}}
\RequirePackage{soul}
\sodef\textsolittle{}{.12em}{.5em\@plus.08em\@minus.06em}%
        {.4em\@plus.275em\@minus.183em}
\RequirePackage{color} %kept for backward compatibility
\AtBeginDocument{
	\@ifpackageloaded{xcolor}{
	}{
		\RequirePackage{xcolor}
	}
	\definecolor{darkgray}{rgb}{0.31,0.31,0.33}
	\definecolor[named]{lipicsGray}{rgb}{0.31,0.31,0.33}
	\definecolor[named]{lipicsBulletGray}{rgb}{0.60,0.60,0.61}
	\definecolor[named]{lipicsLineGray}{rgb}{0.51,0.50,0.52}
	\definecolor[named]{lipicsLightGray}{rgb}{0.85,0.85,0.86}
	\definecolor[named]{lipicsYellow}{rgb}{0.99,0.78,0.07}
}
\RequirePackage{babel}
\RequirePackage[tbtags,fleqn]{amsmath}
\AtBeginDocument{
	\@ifpackageloaded{enumitem}{\ClassWarning{Package 'enuitem' incompatible}{Don't use package 'enumitem'; Package enumerate preloaded!}}{}
	\@ifpackageloaded{paralist}{\ClassWarning{Package 'paralist' incompatible}{Don't use package 'paralist'; Package enumerate preloaded!}}{}
}
\RequirePackage{enumerate}
\def\@enum@{\list{\textcolor{lipicsGray}{\sffamily\bfseries\upshape\mathversion{bold}\csname label\@enumctr\endcsname}}%
           {\advance\partopsep\topsep
            \topsep\z@\@plus\p@
            \usecounter{\@enumctr}\def\makelabel##1{\hss\llap{##1}}}}
\def\romanenumerate{\enumerate[(i)]}
\let\endromanenumerate\endenumerate
\def\alphaenumerate{\enumerate[(a)]}
\let\endalphaenumerate\endenumerate
\def\bracketenumerate{\enumerate[(1)]}
\let\endbracketenumerate\endenumerate
\RequirePackage{graphicx}
\RequirePackage{array}
\let\@classzold\@classz
\def\@classz{%
   \expandafter\ifx\d@llarbegin\begingroup
     \toks \count@ =
     \expandafter{\expandafter\small\the\toks\count@}%
   \fi
   \@classzold}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage[online]{threeparttable}
\def\TPTtagStyle#1{#1)}
\def\tablenotes{\small\TPT@defaults
  \@ifnextchar[\TPT@setuptnotes\TPTdoTablenotes} % ]
\RequirePackage{listings}
\lstset{basicstyle=\small\ttfamily,%
        backgroundcolor=\color{lipicsLightGray},%
        frame=single,framerule=0pt,xleftmargin=\fboxsep,xrightmargin=\fboxsep}
\RequirePackage[left,mathlines]{lineno}
\linenumbers
\renewcommand\linenumberfont{\normalfont\tiny\sffamily}
%%%% patch to cope with amsmath
%%%% http://phaseportrait.blogspot.de/2007/08/lineno-and-amsmath-compatibility.html
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
  \patchBothAmsMathEnvironmentsForLineno{multline}}
\RequirePackage{lastpage}
\RequirePackage{hyperref}
\AtBeginDocument{
	\pdfstringdefDisableCommands{%
		\let\thanks\@gobble
		\let\footnote\@gobble
		\def\footnotemark{}
		\def\cs#1{\textbackslash #1}%
		\let\normalfont\@empty
		\let\scshape\@empty
		\def\and{and }%
		\def\,{ }
	}
	\hypersetup{
		breaklinks=true,
		pdfborder={0 0 0},
		pdftitle={\@title},
		pdfauthor={\ifx\authoranonymous\relax Anonymous author(s) \else \@authorsforpdf \fi},
		pdfkeywords={\@keywords},
		pdfcreator={LaTeX with lipics-v2019.cls and hyperref.sty},
		%TODO Find way to move information to correct fields in pdf metadata
		pdfsubject={LIPIcs, Vol.\@SeriesVolume, \@EventShortTitle; Copyright (C) \ifx\authoranonymous\relax Anonymous author(s) \else \@copyrightholder; \fi licensed under Creative Commons License CC-BY}
		%pdflicenseurl={https://creativecommons.org/licenses/by/3.0/},
		%pdfcopyright={Copyright (C), \@copyrightholder; licensed under Creative Commons License CC-BY},
	}
}
\RequirePackage[labelsep=space,singlelinecheck=false,%
  font={up,small},labelfont={sf,bf},%
  listof=false]{caption}%"listof" instead of "list" for backward compatibility
\@ifpackagelater{hyperref}{2009/12/09}
  {\captionsetup{compatibility=false}}%cf. http://groups.google.de/group/comp.text.tex/browse_thread/thread/db9310eb540fbbd8/42e30f3b7b3aa17a?lnk=raot
  {}
\DeclareCaptionLabelFormat{boxed}{%
  \kern0.05em{\color[rgb]{0.99,0.78,0.07}\rule{0.73em}{0.73em}}%
  \hspace*{0.67em}\bothIfFirst{#1}{~}#2}
\captionsetup{labelformat=boxed}
\captionsetup[table]{position=top}
\RequirePackage[figuresright]{rotating}
\caption@AtBeginDocument{\@ifpackageloaded{subfig}{\ClassError{lipics}{%
  Do not load the subfig package}{The more recent subcaption package is already loaded}}{}}
\RequirePackage{subcaption}
\def\titlerunning#1{\gdef\@titlerunning{{\let\footnote\@gobble\markboth{#1}{#1}}}}
\def\authorrunning#1{%
  \gdef\@authorrunning{\markright{\ifx\authoranonymous\relax\textcolor{red}{Anonymous author(s)} \else\if!#1!\textcolor{red}{Author: Please fill in the \string\authorrunning\space macro}\else#1\fi\fi}}}
\titlerunning{\@title}
\authorrunning{\textcolor{red}{Author: Please use the \string\authorrunning\space macro}}
\def\EventLongTitle#1{\gdef\@EventLongTitle{#1}}
\EventLongTitle{}
\def\EventShortTitle#1{\gdef\@EventShortTitle{#1}}
\EventShortTitle{}
\def\EventEditors#1{\gdef\@EventEditors{#1}}
\EventEditors{}
\def\EventNoEds#1{\gdef\@EventNoEds{#1}\xdef\@Eds{Editor\ifnum#1>1s\fi}}
\EventNoEds{1}
\def\EventLogo#1{\gdef\@EventLogo{#1}}
\EventLogo{}
\def\EventAcronym#1{\gdef\@EventAcronym{#1}}
\EventAcronym{}
\def\EventYear#1{\gdef\@EventYear{#1}}
\EventYear{}
\def\EventDate#1{\gdef\@EventDate{#1}}
\EventDate{}
\def\EventLocation#1{\gdef\@EventLocation{#1}}
\EventLocation{}
\def\SeriesVolume#1{\gdef\@SeriesVolume{#1}}
\SeriesVolume{}
\def\ArticleNo#1{\gdef\@ArticleNo{#1}}
\ArticleNo{}
\def\DOIPrefix#1{\gdef\@DOIPrefix{#1}}
\DOIPrefix{10.4230/LIPIcs}
\def\and{\newline}
\let\orig@author\@author
\let\@authorsfortoc\@empty
\let\@authorsforpdf\@empty
\newcount\c@author
\newcounter{currentauthor}
\def\@authornum{0}
\def\author#1#2#3#4#5{%
  \ifx\@author\orig@author\let\@author\@empty\fi
  \g@addto@macro\@author{%
	\ifx\authorcolumns\relax
		\ifnum\c@author>6
			\stepcounter{currentauthor}
			\ifodd\value{currentauthor}
				\begin{minipage}[t]{\textwidth}
				\begin{minipage}[t]{0.49\textwidth}
			\else
				\hfill \begin{minipage}[t]{0.49\textwidth}
			\fi
		\else
			\ClassWarning{Option 'authorcolumns' only applicable for > 6 authors}{Option 'authorcolumns' only applicable for >6 authors!}
			\addvspace{0.5\baselineskip}
		\fi
	\else
		\addvspace{0.5\baselineskip}
	\fi
    {\Large\bfseries
     \if!#1!
       \textcolor{red}{Author: Please enter author name}%
     \else
       \ifx\authoranonymous\relax
			\textcolor{red}{Anonymous author}
		\else
			#1%
			\if!#4!\else{\space\href{#4}{\includegraphics[height=9\p@]{orcid}}}\fi
			\if!#5!\else
				\ifx\@funding\@empty
					\expandafter\g@addto@macro\expandafter\@funding{\textit{\expandafter{\let\footnote\@gobble #1}}:\space{#5}}
				\else
					\expandafter\g@addto@macro\expandafter\@funding{\\\textit{\expandafter{\let\footnote\@gobble #1}}:\space{#5}}
				\fi
			\fi
		\fi
     \fi
     }
	{\small
    \if!#2!\textcolor{red}{Author: Please enter affiliation as second parameter of the author macro}\else{\\* \ifx\authoranonymous\relax\textcolor{red}{Anonymous affiliation}\else#2\fi}\fi
    \if!#3!\else{\ifx\authoranonymous\relax\else\\*\href{mailto:#3}{#3}\fi}\fi
	}\par
	\ifx\authorcolumns\relax
		\ifnum\c@author>6
			\end{minipage}
			\ifnum\c@author=\value{currentauthor}
				\end{minipage}
			\else
				\ifodd\value{currentauthor}
				\else
					\end{minipage}%
					\medskip
				\fi
			\fi
		\fi
	\fi}%
  \global\advance\c@author\@ne
  \protected@write\@auxout{}{\string\gdef\string\@authornum{\the\c@author}}
  \ifnum\c@author=\@ne
    \gdef\@authorsfortoc{#1}%
    \gdef\@authorsforpdf{#1}
  \else
    \expandafter\g@addto@macro\expandafter\@authorsforpdf\expandafter{,\space #1}
    \expandafter\g@addto@macro\expandafter\@authorsfortoc\expandafter{\expandafter\csname\the\c@author authand\endcsname#1}%
    \@namedef{\the\c@author authand}{,\space}%
    \AtBeginDocument{%
      \expandafter\ifnum\@authornum=2
        \@namedef{2authand}{\space and\space}%
      \else
        \@namedef{\@authornum authand}{,\space and\space}%
      \fi}
  \fi}
\newcommand*\affil[2][]{%
  \ClassError{lipics}
    {\string\affil\space deprecated: Please enter affiliation as second parameter of the author macro}
    {Since 2017, \string\affil\space is obsolete in lipics.}}
\newcommand*\Copyright[1]{%
  \def\@copyrightholder{#1}
  \def\@Copyright{%
    \setbox\@tempboxa\hbox{\includegraphics[height=14\p@,clip]{cc-by}}%
    \@rightskip\@flushglue \rightskip\@rightskip
    \hangindent\dimexpr\wd\@tempboxa+0.5em\relax
    \href{https://creativecommons.org/licenses/by/3.0/}%
         {\smash{\lower\baselineskip\hbox{\unhcopy\@tempboxa}}}\enskip
    \textcopyright\ %
    \ifx!#1!\textcolor{red}{Author: Please fill in the \string\Copyright\space macro}\else\ifx\authoranonymous\relax\textcolor{red}{Anonymous author(s)}\else#1\fi\fi
    ;\\%
    licensed under Creative Commons License CC-BY\ifx!#1!\\\null\fi\par}}
\Copyright{\textcolor{red}{Author: Please provide a copyright holder}}
\let\@copyrightholder\@empty
\def\hideLIPIcs{\let\@hideLIPIcs\relax}
\def\keywords#1{\def\@keywords{#1}}
\let\@keywords\@empty
\def\keywordsHeading{%
  \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                       Keywords and phrases\enskip}}
\RequirePackage{comment}
\excludecomment{CCSXML}
% inspired by https://tex.stackexchange.com/questions/12810/how-do-i-split-a-string
\global\newcommand\ccsdesc[2][100]{\@ccsdesc#1~#2~~\relax}
\usepackage{xstring}
\let\orig@ccsdesc\@ccsdesc
\let\@ccsdesc\@empty
\let\@ccsdescString\@empty
\gdef\@ccsdesc#1~#2~#3~{
	\ifx\@ccsdesc\orig@ccsdesc\let\@ccsdesc\@empty\fi
	\ifx!#3!
		\ifx\@ccsdescString\@empty
			\g@addto@macro\@ccsdescString{{#2}}
		\else
			\g@addto@macro\@ccsdescString{; {#2}}
		\fi
	\else
		\ifx\@ccsdescString\@empty
			\g@addto@macro\@ccsdescString{{#2} $\rightarrow$ {#3}}
		\else
			\g@addto@macro\@ccsdescString{; {#2} $\rightarrow$ {#3}}
		\fi
	\fi
\ccsdescEnd
}
\def\ccsdescEnd#1\relax{}
\def\subjclass#1{
  \ClassError{lipics}
    {\string\subjclass\space deprecated: Please enter subject classification in 1 or more ccsdesc macros}
    {Since 2019, \string\subjclass\space is obsolete in lipics.}}
\let\@subjclass\@empty
\def\subjclassHeading{%
  \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                       2012 ACM Subject Classification\enskip}}
\def\doiHeading{%
  \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                       Digital Object Identifier\enskip}}
\def\category#1{\def\@category{#1}}
\let\@category\@empty
\def\categoryHeading{%
  \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                       Category\enskip}}
\def\relatedversion#1{\def\@relatedversion{#1}}
\let\@relatedversion\@empty
\def\relatedversionHeading{%
  \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                       Related Version\enskip}}
\def\supplement#1{\def\@supplement{#1}}
\let\@supplement\@empty
\def\supplementHeading{%
  \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                       Supplementary Material\enskip}}
\def\funding#1{\def\@funding{#1}}
\let\@funding\@empty
\def\fundingHeading{%
 \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                      Funding\enskip}}
\def\acknowledgements#1{\def\@acknowledgements{#1}}
\let\@acknowledgements\@empty
\def\acknowledgementsHeading{%
 \textcolor{lipicsGray}{\fontsize{9}{12}\sffamily\bfseries
                      Acknowledgements\enskip}}
\RequirePackage{amsthm}
\ifx\usethmrestate\relax
	\RequirePackage{thm-restate}
\fi
\thm@headfont{%
  \textcolor{lipicsGray}{$\blacktriangleright$}\nobreakspace\sffamily\bfseries}
\def\th@remark{%
  \thm@headfont{%
    \textcolor{lipicsGray}{$\blacktriangleright$}\nobreakspace\sffamily}%
  \normalfont % body font
  \thm@preskip\topsep \divide\thm@preskip\tw@
  \thm@postskip\thm@preskip
}
\def\@endtheorem{\endtrivlist}%\@endpefalse
\renewcommand\qedsymbol{\textcolor{lipicsGray}{\ensuremath{\blacktriangleleft}}}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{lipicsGray}\sffamily\bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist%\@endpefalse
}
\newenvironment{claimproof}[1][\proofname]{
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{lipicsGray}\sffamily
    #1\@addpunct{.}]\ignorespaces
}{%
  \renewcommand\qedsymbol{\textcolor{lipicsGray}{\ensuremath{\vartriangleleft}}}
  \popQED\endtrivlist%\@endpefalse
  \renewcommand\qedsymbol{\textcolor{lipicsGray}{\ensuremath{\blacktriangleleft}}}
}
% inspired by qed of amsthm class
\DeclareRobustCommand{\lipicsEnd}{%
	\leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
	\quad\hbox{$\lrcorner$}%
}
\AtBeginDocument{
	\@ifpackageloaded{algorithm2e}{
		\renewcommand{\algorithmcfname}{\sffamily\bfseries{}Algorithm}
		\SetAlgoCaptionSeparator{~}
		\SetAlCapHSkip{0pt}
		\renewcommand{\algocf@captiontext}[2]{%
		    \kern0.05em{\color{lipicsYellow}\rule{0.73em}{0.73em}}%
		\hspace*{0.67em}\small #1\algocf@capseparator\nobreakspace#2}
		\renewcommand{\algocf@makecaption}[2]{%
		    \parbox[t]{\textwidth}{\algocf@captiontext{#1}{#2}}%
		}%
		\renewcommand{\@algocf@capt@boxed}{above}
		\renewcommand{\@algocf@capt@ruled}{above}
		\setlength\algotitleheightrule{0pt}
	}{}
	\@ifpackageloaded{algorithm}{
		\captionsetup[algorithm]{name=Algorithm, labelformat=boxed, position=top}
		\newcommand\fs@ruled@notop{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
		\def\@fs@pre{}%
		\def\@fs@post{\kern2pt\hrule\relax}%
		\def\@fs@mid{\kern2pt\hrule\kern2pt}%
		\let\@fs@iftopcapt\iftrue}
		\renewcommand\fst@algorithm{\fs@ruled@notop}
	}{}
	\ifx\usecleveref\relax\else
		\@ifpackageloaded{cleveref}{\ClassWarning{Use document option 'cleveref' instead}{Use document option 'cleveref' instead directly loading package 'cleveref'}}{}
	\fi
	\ifx\usethmrestate\relax\else
		\@ifpackageloaded{thm-restate}{\ClassWarning{Use document option 'thm-restate' instead}{Use document option 'thm-restate' instead directly loading package 'thm-restate'}}{}
	\fi
	\ifx\useautoref\relax
		\@ifundefined{algorithmautorefname}{\newcommand{\algorithmautorefname}{Algorithm}}{\renewcommand{\algorithmautorefname}{Algorithm}}%
	\fi
}

\ifx\usecleveref\relax
	\RequirePackage[capitalise, noabbrev]{cleveref}
	\crefname{algocf}{Algorithm}{Algorithms}
	\Crefname{algocf}{Algorithm}{Algorithms}
\fi
\ifx\useautoref\relax
	\RequirePackage{aliascnt}
\fi
\newtheoremstyle{claimstyle}{\topsep}{\topsep}{}{0pt}{\sffamily}{. }{5pt plus 1pt minus 1pt}%
  {$\vartriangleright$ \thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\ifx\numberwithinsect\relax
  \@addtoreset{theorem}{section}
  \expandafter\def\expandafter\thetheorem\expandafter{%
    \expandafter\thesection\expandafter\@thmcountersep\thetheorem}
\fi

\ifx\useautoref\relax
	\addto\extrasenglish{%
		\def\chapterautorefname{Chapter}%
		\def\sectionautorefname{Section}%
		\def\subsectionautorefname{Subsection}%
		\def\subsubsectionautorefname{Subsubsection}%
		\def\paragraphautorefname{Paragraph}%
		\def\subparagraphautorefname{Subparagraph}%
	}
	\addto\extrasUKenglish{%
		\def\chapterautorefname{Chapter}%
		\def\sectionautorefname{Section}%
		\def\subsectionautorefname{Subsection}%
		\def\subsubsectionautorefname{Subsubsection}%
		\def\paragraphautorefname{Paragraph}%
		\def\subparagraphautorefname{Subparagraph}%
	}
	\addto\extrasUSenglish{%
		\def\chapterautorefname{Chapter}%
		\def\sectionautorefname{Section}%
		\def\subsectionautorefname{Subsection}%
		\def\subsubsectionautorefname{Subsubsection}%
		\def\paragraphautorefname{Paragraph}%
		\def\subparagraphautorefname{Subparagraph}%
	}
	\ifx\usethmrestate\relax
		\newtheorem{lemma}[theorem]{Lemma}
		\newtheorem{corollary}[theorem]{Corollary}
		\newtheorem{proposition}[theorem]{Proposition}
		\newtheorem{exercise}[theorem]{Exercise}
		\newtheorem{definition}[theorem]{Definition}
		\theoremstyle{definition}
		\newtheorem{example}[theorem]{Example}
		\theoremstyle{remark}
		\newtheorem{note}[theorem]{Note}
		\newtheorem*{note*}{Note}
		\newtheorem{remark}[theorem]{Remark}
		\newtheorem*{remark*}{Remark}
		\theoremstyle{claimstyle}
		\newtheorem{claim}[theorem]{Claim}
		\newtheorem*{claim*}{Claim}
	\else
		\newaliascnt{lemma}{theorem}
		\newtheorem{lemma}[lemma]{Lemma}
		\aliascntresetthe{lemma}
		\newcommand{\lemmaautorefname}{Lemma}
		\newaliascnt{corollary}{theorem}
		\newtheorem{corollary}[corollary]{Corollary}
		\aliascntresetthe{corollary}
		\newcommand{\corollaryautorefname}{Corollary}
		\newaliascnt{proposition}{theorem}
		\newtheorem{proposition}[proposition]{Proposition}
		\aliascntresetthe{proposition}
		\newcommand{\propositionautorefname}{Proposition}
		\newaliascnt{exercise}{theorem}
		\newtheorem{exercise}[exercise]{Exercise}
		\aliascntresetthe{exercise}
		\newcommand{\exerciseautorefname}{Exercise}
		\newaliascnt{definition}{theorem}
		\newtheorem{definition}[definition]{Definition}
		\aliascntresetthe{definition}
		\newcommand{\definitionautorefname}{Definition}
		\theoremstyle{definition}
		\newaliascnt{example}{theorem}
		\newtheorem{example}[example]{Example}
		\aliascntresetthe{example}
		\newcommand{\exampleautorefname}{Example}
		\theoremstyle{remark}
		\newaliascnt{note}{theorem}
		\newtheorem{note}[note]{Note}
		\aliascntresetthe{note}
		\newcommand{\noteautorefname}{Note}
		\newtheorem*{note*}{Note}
		\newaliascnt{remark}{theorem}
		\newtheorem{remark}[remark]{Remark}
		\aliascntresetthe{remark}
		\newcommand{\remarkautorefname}{Remark}
		\newtheorem*{remark*}{Remark}
		\theoremstyle{claimstyle}
		\newaliascnt{claim}{theorem}
		\newtheorem{claim}[claim]{Claim}
		\aliascntresetthe{claim}
		\newcommand{\claimautorefname}{Claim}
		\newtheorem*{claim*}{Claim}
	\fi
\else
	\newtheorem{lemma}[theorem]{Lemma}
	\newtheorem{corollary}[theorem]{Corollary}
	\newtheorem{proposition}[theorem]{Proposition}
	\newtheorem{exercise}[theorem]{Exercise}
	\newtheorem{definition}[theorem]{Definition}
	\theoremstyle{definition}
	\newtheorem{example}[theorem]{Example}
	\theoremstyle{remark}
	\newtheorem{note}[theorem]{Note}
	\newtheorem*{note*}{Note}
	\newtheorem{remark}[theorem]{Remark}
	\newtheorem*{remark*}{Remark}
	\theoremstyle{claimstyle}
	\newtheorem{claim}[theorem]{Claim}
	\newtheorem*{claim*}{Claim}
\fi
\theoremstyle{plain}
\endinput
%%
%% End of file `lipics-v2019.cls'.
