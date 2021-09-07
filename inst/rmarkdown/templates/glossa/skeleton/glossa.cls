% Glossa stylefile, modified from the 
% Semantics & Pragmatics style file.
% Kai von Fintel, Christopher Potts, and Chung-chieh Shan
% modifications for Glossa by Guido Vanden Wyngaerd
% v1 13 Nov 2015
% v2 10 Jan 2016
% v3 16 Apr 2016
% v4 26 Jun 2016
% v5 16 Aug 2016
% v6 29 Sep 2016
% v7 27 Jan 2018 patches by Adam Liter for section headings
% v8 16 May 2019 patches by GS for compatibility with xe/pdflatex
% v- 19 Jun 2020 by mitcho to better match Glossa typesetting
% v10 5 May 2021 changes to the stylesheet (no italics for subsections))

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{glossa}[2018/01/27 v.2.3 Class for Glossa]

% OUTLINE OF THIS CLASS FILE
%   option declarations 
%   required packages 
%   metadata 
%   page dimensions 
%   title 
%   running headers 
%   frontmatter 
%   sectioning 
%   footnotes 
%   backmatter 
%   other environments 
%   useful macros

%=====================================================================
%======================== option declarations ========================

\newif\if@lucida\@lucidafalse
\newif\if@cm\@cmtrue
\newif\if@times\@timestrue
\newif\if@brill\@brillfalse
\newif\if@charis\@charisfalse
\newif\if@final\@finalfalse
\newif\if@biblatex\@biblatexfalse
\newif\if@linguex\@linguexfalse

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\newcommand{\@sizeoption@err}{\ClassError{sp}
  {Cannot use size option \CurrentOption} 
  {Glossa style requires (and automatically loads) 11pt text}}

\DeclareOption{10pt}{\@sizeoption@err}
\DeclareOption{12pt}{\@sizeoption@err}

\DeclareOption{lucida}{\@lucidatrue \@timesfalse \@cmfalse \@brillfalse \@charisfalse}
\DeclareOption{times}{\@lucidafalse \@timestrue \@cmfalse \@brillfalse \@charisfalse}
\DeclareOption{cm}{\@lucidafalse \@timesfalse \@cmtrue \@brillfalse \@charisfalse}
\DeclareOption{brill}{\@lucidafalse \@timesfalse \@cmtrue \@brilltrue \@charisfalse}
\DeclareOption{charis}{\@lucidafalse \@timesfalse \@cmtrue \@brillfalse \@charistrue}
\DeclareOption{final}{\@finaltrue}
\DeclareOption{biblatex}{\@biblatextrue}
\DeclareOption{linguex}{\@linguextrue}

\ExecuteOptions{times} % times is the default.
\ProcessOptions\relax
\LoadClass[11pt,twoside]{article}

\if@lucida
 \IfFileExists{lucimatx.sty}{%
    \RequirePackage[romanfamily=bright-osf, scale=0.9, stdmathdigits=true]{lucimatx}%
    \linespread{1.05}%
    \DeclareMathDelimiter{\llbracket} 
      {\mathopen}{letters}{130}{largesymbols}{130} 
    \DeclareMathDelimiter{\rrbracket} 
      {\mathclose}{letters}{131}{largesymbols}{131}
    \normalfont\DeclareTextCommand
      \textbullet\encodingdefault{\UseTextSymbol{OMS}\textbullet}
    \let\nLeftrightarrow\undefined
    \DeclareMathSymbol{\nLeftrightarrow}{\mathrel}{arrows}{105}
}{\ClassWarning{glossa.cls}{Requested fonts not present}}% 
\else\relax 
\fi
%
\if@times
  \RequirePackage[T1]{fontenc}% use T1 font encoding
  \IfFileExists{mathptmx.sty}{\RequirePackage{mathptmx}}{}
  \IfFileExists{stmaryrd.sty}%
    {\RequirePackage{stmaryrd}}%
    {\newcommand{\llbracket}{\ensuremath{\left [\!\left [}}%
     \newcommand{\rrbracket}{\ensuremath{\right ]\!\right ]}}}
  \RequirePackage{textcomp}   
  \RequirePackage{amssymb}
  \else\relax
\fi
%
\if@cm
\IfFileExists{stmaryrd.sty}%
  {\RequirePackage{stmaryrd}}%
  {\newcommand{\llbracket}{\ensuremath{\left [\!\left [}}%
   \newcommand{\rrbracket}{\ensuremath{\right ]\!\right ]}}}
  \RequirePackage{amssymb}
  \RequirePackage{textcomp}
  \else\relax
\fi

\if@brill
\IfFileExists{stmaryrd.sty}%
  {\RequirePackage{stmaryrd}}%
  {\newcommand{\llbracket}{\ensuremath{\left [\!\left [}}%
   \newcommand{\rrbracket}{\ensuremath{\right ]\!\right ]}}}
  \RequirePackage[no-math]{fontspec}
  \setmainfont[RawFeature=+tnum]{Brill} %RawFeature ensures proper alignment of examples with linguex
  \RequirePackage{amssymb}
  \RequirePackage{textcomp}
  \else\relax
\fi

\if@charis
\IfFileExists{stmaryrd.sty}%
  {\RequirePackage{stmaryrd}}%
  {\newcommand{\llbracket}{\ensuremath{\left [\!\left [}}%
   \newcommand{\rrbracket}{\ensuremath{\right ]\!\right ]}}}
  \RequirePackage[bitstream-charter]{mathdesign} %math font close to Charis SIL
  \RequirePackage[no-math]{fontspec}
  \setmainfont{CharisSIL}
  \RequirePackage{FiraSans} %sf font
  \RequirePackage{amssymb}
  \RequirePackage{textcomp}
  \else\relax
\fi

% Strong widow and orphan control

\clubpenalty10000
\widowpenalty10000

%=====================================================================
%========================= required packages =========================
%%% xunicode is not compatible
%%% with pdflatex, and one should not use inputenc with xelatex
%%% LuaLaTeX is incompatible with xunicode, but can safely load tipa
\RequirePackage{iftex}
\ifXeTeX
  \RequirePackage{xunicode} %IPA characters are displayed; the commands of the tipa package are understood
\else
  \RequirePackage[safe]{tipa}
\fi

\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
\else
\fi
%%% End modification

\RequirePackage{xspace}
% microtype handles punctuation at the right margin. We want it for the final product, but it's okay if authors lack it.
\IfFileExists{microtype.sty}{%
  \RequirePackage[final,protrusion={true,compatibility}]{microtype}
}{}
\RequirePackage{ifthen}
\RequirePackage[hyphens]{url}

\if@biblatex
	\RequirePackage[backend=biber,
			bibstyle=biblatex-gl,
			citestyle=gl-authoryear-comp,
			maxcitenames=3,
			maxbibnames=99]{biblatex}
\else
	\RequirePackage{natbib}
	\bibpunct[: ]{(}{)}{; }{a}{}{;~}
	\newcommand{\BIBand}{\&}
	\setlength{\bibsep}{0pt}
	\setlength{\bibhang}{0.25in}
	\bibliographystyle{glossa}
    \newcommand{\posscitet}[1]{\citeauthor{#1}'s (\citeyear{#1})}
    \newcommand{\posscitealt}[1]{\citeauthor{#1}'s \citeyear{#1}}
    \newcommand{\possciteauthor}[1]{\citeauthor{#1}'s}
    \newcommand{\pgposscitet}[2]{\citeauthor{#1}'s (\citeyear{#1}:~#2)}
    \newcommand{\secposscitet}[2]{\citeauthor{#1}'s (\citeyear{#1}:~$\S$#2)}
    \newcommand{\pgcitealt}[2]{\citealt{#1}:~#2}
    \newcommand{\seccitealt}[2]{\citealt{#1}:~$\S$#2}
    \newcommand{\pgcitep}[2]{(\citealt{#1}:~#2)}
    \newcommand{\seccitep}[2]{(\citealt{#1}:~$\S$#2)}
    \newcommand{\pgcitet}[2]{\citeauthor{#1} (\citeyear{#1}:~#2)}
    \newcommand{\seccitet}[2]{\citeauthor{#1} (\citeyear{#1}:~$\S$#2)}
\fi	

\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{splinkcolor}{rgb}{.0,.2,.4}
\RequirePackage[colorlinks,breaklinks,
                linkcolor=splinkcolor, 
                urlcolor=splinkcolor, 
                citecolor=splinkcolor,
                filecolor=splinkcolor,
                plainpages=false,
                pdfpagelabels,
                bookmarks=false,
                pdfstartview=FitH]{hyperref}
\newcommand{\doi}[1]{\url{https://doi.org/#1}}
\urlstyle{rm}
\RequirePackage[leqno,tbtags]{amsmath}
% If the author is using postscript (discouraged), then load the breakurl package, else don't load it.
\RequirePackage{ifpdf}
\ifpdf
  \relax
\else
\relax
  %\RequirePackage{breakurl}
\fi
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[hang,FIGBOTCAP,loose]{subfigure}

% additions to the S&P required packages for Glossa are listed below

\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage[font=sf,labelfont=bf,labelsep=colon,justification=raggedright,singlelinecheck=off,justification=centering]{caption}
\RequirePackage{booktabs}

%=====================================================================
%============================= metadata ==============================

\def\@pdfauthor{\relax}
\newcommand{\pdfauthor}[1]{\gdef\@pdfauthor{#1}}
\def\@pdftitle{\relax}
\newcommand{\pdftitle}[1]{\gdef\@pdftitle{#1}}
\def\@pdfkeywords{\relax}
\newcommand{\pdfkeywords}[1]{\gdef\@pdfkeywords{#1}}

\hypersetup{pdfauthor=\@pdfauthor, 
            pdftitle=\@pdftitle,
            pdfkeywords=\@pdfkeywords}

\def\@spvolume{\relax}
\newcommand{\spvolume}[1]{\gdef\@spvolume{#1}}

\def\@sparticle{\relax}
\newcommand{\sparticle}[1]{\gdef\@sparticle{#1}}

\def\@spyear{\relax}
\newcommand{\spyear}[1]{\gdef\@spyear{#1}}

\def\@spdoi{10.5334/.\@spvolume.\@sparticle}
\def\@splastpage{\relax}
\newcommand{\splastpage}[1]{\gdef\@splastpage{#1}}
            
%=====================================================================
%========================== page dimensions ==========================

% Vertical.
\paperheight=297mm
\topmargin=-13mm   %
\headheight=5mm    % head: 30mm (margin + head + sep = 0.46cm); latex adds 1in)
\headsep=17.6mm   %
\topskip=0.1in     % included in the textheight
\textheight=237mm  % (297mm - 60mm)
\footskip=0.46cm   % foot: 30mm total (1.0in leftover)
\parskip=0pt

% Horizontal.
\paperwidth=210mm
\textwidth=150mm % (210mm - 60mm)
\oddsidemargin=0.46cm  % put at 3cm margins (3cm - 1in = 0.46cm)
\evensidemargin=0.46cm % put at 3cm margins (3cm - 1in = 0.46cm)
\raggedbottom % constant spacing in the text; cost is a ragged bottom
\parindent=0.1in
\leftmargini=0.5in
\@ifundefined{mathindent}{}{\mathindent=0.5in\relax}%

% Tell dvips about our paper.
\special{papersize=210mm,297mm}

%=====================================================================
%============================== title ================================

% Formats individual <name--institute> pairs inside \author.
\newcommand{\spauthor}[1]%
{\begin{minipage}[t]{16pc}\centering
        #1%
 \end{minipage}\hspace{.5pc plus1pc}%
 \ignorespaces
}

\renewcommand*{\title}[2][]{\gdef\@shorttitle{#1}\gdef\@title{#2}}
\renewcommand*{\author}[2][]{\gdef\@shortauthor{#1}\gdef\@author{#2}}

% Adapted from JMLR.
\renewcommand{\maketitle}{%
  \par
  \begingroup
  \renewcommand{\thefootnote}{\fnsymbol{footnote}}
  \@maketitle\@thanks
  \setcounter{footnote}{0}
  \endgroup
  \let\maketitle\relax \let\@maketitle\relax
  \gdef\@thanks{}
  \let\thanks\relax%
}

% From salt.cls.
\newskip\onelineskip 
\onelineskip=\baselineskip 
\advance\onelineskip by0pt plus 4pt minus 2pt

\def\@maketitle{%
  \vbox{\hsize\textwidth%
    \linewidth\hsize%
    \centering
    \vskip\onelineskip
    \LARGE\@title\@@par
    \normalsize
    \def\institute{\textit}%
    \newcommand{\AND}{\ignorespaces}%
    \let\par\@empty
    \@author
    \lineskiplimit\onelineskip
    \lineskip\onelineskip
    \@@par
  }%
  \global\everypar{\everypar{}\vskip 3.5ex}
}

%=====================================================================
%========================== running headers ==========================

% Creative commons license text.  The font is even smaller here than it is elsewhere in the headers so that we have a chance of fitting the whole license on the page.
\newcommand{\cctext}{{\footnotesize This is an open-access article distributed under the terms of a Creative Commons Attribution License
    (\http{http://creativecommons.org/licenses/by/3.0/}).}}

% This boolean switch lets the user control whether the logo is included even when the requisite image file is present.  (If it is missing, then the class file accommodates that no matter how the switch is set.)
\newboolean{logo}
\setboolean{logo}{true} % Default true (include logo if it's present)
\newcommand{\splogo}{\setboolean{logo}{true}}
\newcommand{\nosplogo}{\setboolean{logo}{false}}

% This sets the font size for the header and footer on all pages.
\newcommand{\headerfontsize}{\footnotesize}

% Prints publication and copyright info on the first page
% Also loads info into metadata (superseded by new metadata commands)
\gdef\@articlenumber{}%
\newcommand{\firstpageheadings}[6]%
{
  \gdef\@articlenumber{#2}
  \gdef\@spvolume{#1}
  \gdef\@sparticle{#2}
  \gdef\@splastpage{#3}
  \gdef\@spyear{#4}
  \def\ps@spfirstheadings{%
    \let\@mkboth\@gobbletwo%
    \renewcommand{\@oddhead}{%
      \headerfontsize%
      % If the switch is set to "include image",
      \ifthenelse{\boolean{logo}}{%
        \ifpdf
        % If the pdf logo is present,
        \IfFileExists{sp-logo.pdf}{%
          % then insert the pdf version,
          \begin{minipage}[c]{.25in}
            \includegraphics[width=.25in]{sp-logo.pdf}
          \end{minipage}%
        }{}% else nothing; closes \IfFileExists
        \else
        % If the ps logo is present,
        \IfFileExists{sp-logo.ps}{%   
          % then insert the postscript version,
          \begin{minipage}[c]{.25in}
            \includegraphics[width=.25in]{sp-logo.ps}
          \end{minipage}%
        }{}% else, nothing; closes \IfFileExists
        \fi % close \ifpdf
      }{}% closes \ifthenelse
      \begin{minipage}[c]{5.25in}
        \href{http://glossa.ubiquitypress.com/}{Glossa} Volume \@spvolume, Article \@sparticle: 1--\@splastpage, \@spyear\\
        \href{https://doi.org/10.5334/sp.\@spvolume.\@sparticle}{https://doi.org/10.5334/.\@spvolume.\@sparticle}
      \end{minipage}%
    }%
    \renewcommand{\@oddfoot}{%
      \begin{minipage}[c]{1\textwidth}%
        \footnotesize\copyright \@spyear\ \@shortauthor\\
        \cctext
      \end{minipage}%
    }%
    \renewcommand{\@evenhead}{}%
    \renewcommand{\@evenfoot}{}%
  }%
  \thispagestyle{spfirstheadings}%
}%

\newcommand{\firstpagefinalheadings}%
{
  \def\ps@spfirstheadings{%
    \let\@mkboth\@gobbletwo%
    \renewcommand{\@oddhead}{%
      \headerfontsize%
      % If the switch is set to "include image",
      \ifthenelse{\boolean{logo}}{%
        \ifpdf
        % If the pdf logo is present,
        \IfFileExists{sp-logo.pdf}{%
          % then insert the pdf version,
          \begin{minipage}[c]{.25in}
            \includegraphics[width=.25in]{sp-logo}
          \end{minipage}%
        }{}% else nothing; closes \IfFileExists
        \else
        % If the ps logo is present,
        \IfFileExists{sp-logo.ps}{%   
          % then insert the postscript version,
          \begin{minipage}[c]{.25in}
            \includegraphics[width=.25in]{sp-logo}
          \end{minipage}%
        }{}% else, nothing; closes \IfFileExists
        \fi % close \ifpdf
      }{}% closes \ifthenelse
      \begin{minipage}[c]{5.25in}
        \href{http://http://glossa.ubiquitypress.com/}{Glossa} Volume \@spvolume, Article \@sparticle: 1--\@splastpage, \@spyear\\
        \href{https://doi.org/\@spdoi}{https://doi.org/\@spdoi}
      \end{minipage}%
      \gdef\@articlenumber{\@sparticle}
    }%
    \renewcommand{\@oddfoot}{%
      \begin{minipage}[c]{1\textwidth}%
        \footnotesize\copyright \@spyear\ \@shortauthor\\
        \cctext
      \end{minipage}%
    }%
    \renewcommand{\@evenhead}{}%
    \renewcommand{\@evenfoot}{}%
  }%
  \thispagestyle{spfirstheadings}%
}%


% Prints abbreviated article information on non-initial pages.
\def\ps@spheadings{%
  \let\@mkboth\@gobbletwo%
  \def\@oddhead{{\headerfontsize\sffamily \@shorttitle}\hfill{\headerfontsize\sffamily\ifx\@empty\@articlenumber\else\@articlenumber:\fi\thepage}}% short title, inner
  \def\@oddfoot{%\hfill{\headerfontsize\ifx\@empty\@articlenumber\else\@articlenumber:\fi%\thepage}\hfill
  }% centered pg no
  \def\@evenhead{{\headerfontsize\sffamily\ifx\@empty\@articlenumber\else\@articlenumber:\fi\thepage} \hfill {\headerfontsize\sffamily\@shortauthor}}% author names, inner
  \def\@evenfoot{%\hfill{\headerfontsize\ifx\@empty\@articlenumber\else\@articlenumber:\fi\thepage}\hfill
  }% centered pg no
}
\pagestyle{spheadings}         

%=====================================================================
%=========================== final typeset ===========================


\if@final
\RequirePackage{sp-hyperxmp}
\splogo
\AtBeginDocument{\firstpagefinalheadings}
\else            
\nosplogo
\AtBeginDocument{\thispagestyle{plain}} 
\fi


%=====================================================================
%=========================== frontmatter =============================

% The spacing specs (arg 2 of \list) are the same for the mshistory, abstract, and keywords environments, except that the abstract is indented somewhat.

% Single parameter determines the left and right margin size.
\newcommand{\frontmatterspacing}[1]{%
  \small
  \topsep 10\p@ \@plus4\p@   \@minus6\p@ % from size12.clo
  \advance\topsep by3.5ex plus -1ex minus -.2ex
  \setlength{\listparindent}{0em}
  \setlength{\itemindent}{0em}
  \setlength{\leftmargin}{#1}
  \setlength{\rightmargin}{\leftmargin}
  \setlength{\parskip}{0em}
}

\newenvironment{mshistory}%
{\list{}{\frontmatterspacing{0em}}%
\item\relax}%
{\endlist}

\renewenvironment{abstract}%
{\list{}{\frontmatterspacing{0.25in}}%
\item\relax\textbf{\abstractname} }%
{\endlist}

\newenvironment{keywords}%
{\list{}{\frontmatterspacing{0em}}%
\item\relax\textbf{Keywords:}}%
{\endlist}

%=====================================================================
%============================ sectioning =============================

\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

\renewcommand{\section}{\@startsection{section}{1}{0pt}%
  {-3.5ex plus -1ex minus -.2ex}%
  {1.8ex plus.2ex}%
  {\noindent\normalfont\Large\sffamily\bfseries}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{0pt}%
  {-3.5ex plus -1ex minus -.2ex}%
  {1.8ex plus.2ex}%
  {\noindent\normalfont\large\sffamily\bfseries}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{0pt}%
  {-3.5ex plus -1ex minus -.2ex}%
  {1.8ex plus.2ex}%
  {\noindent\normalfont\normalsize\sffamily\bfseries}}

\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
  {-3.5ex plus -1ex minus -.2ex}%
  {1.8ex plus.2ex}%
  {\noindent\normalsize\sffamily\bfseries}}

\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
  {-3.5ex plus -1ex minus -.2ex}%
  {1.8ex plus.2ex}%
  {\noindent\normalsize\sffamily\it}}

% General formatting --- for punctuating section headings.
\renewcommand{\@seccntformat}[1]{\@nameuse{the#1}\hspace{1em}}

%=====================================================================
%============================ footnotes ==============================

\renewcommand{\@makefntext}[1]{%
  \parindent=0.25in
  \noindent \hbox to \z@{\hss{\textsuperscript{\@thefnmark}} \hfil}#1}

%=====================================================================
%============================ backmatter =============================

% Environment for formatting all the addresses.
\newenvironment{addresses}%
{\@@par
 \let\par\@empty
 \addvspace{3.25ex}%
 \noindent%\textbf{Author addresses}
 \small
 % Individual author addresses.
 \newenvironment{address}%
   {% For email addresses inside the address environment.
    %\newcommand{\email}{\texttt}%
    \begin{minipage}[t]{19pc}\raggedright}
   {\end{minipage}\hspace{.15pc plus1pc}}%
 \ignorespaces
}%
{\lineskiplimit 1pc
 \lineskip 1pc
 \@@par}

%=====================================================================
%======================== other environments =========================

% enumerate labeling that won't conflict with standard ex. numbers.
\renewcommand{\theenumi}{\roman{enumi}}
\renewcommand{\labelenumi}{\theenumi.}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\labelenumii}{\theenumii.}

% list spacing ought to satisfy \itemsep + \parsep < \topsep + \parskip
\def\@listi{\leftmargin\leftmargini
            \parsep 4\p@  \@plus2\p@ \@minus\p@
            \topsep 10\p@ \@plus4\p@ \@minus\p@
            \itemsep4\p@  \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi

% typeset figures with lines above and below and the caption title and caption texts in boxes next to each other, top aligned.  these definitions extend those of float.sty.
%
% sp caption style
%\newcommand\floatc@sp[2]{%
%  \parbox[t]{0.15\textwidth}{{\@fs@cfont#1}}%
%  \parbox[t]{0.85\textwidth}{#2}}%

% sp float style; uses the sp caption style
%\newcommand\fs@sp{
%  \def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@sp
%  \def\@fs@pre{\hrule\kern5pt}%
%  \def\@fs@post{\kern5pt\hrule\relax}%
%  \def\@fs@mid{\kern10pt}
%  \let\@fs@iftopcapt\iffalse}

% users can override these commands using float.sty's functionality
%\floatstyle{sp}
%\restylefloat{figure}
%\restylefloat{table}

%=====================================================================
%=========================== useful macros ===========================

\newcommand{\spj}{\emph{S\&P}\xspace}

\def\co{\colon\thinspace}

\DeclareRobustCommand\dash{%
  \unskip\nobreak\thinspace\textemdash\thinspace\ignorespaces}
\pdfstringdefDisableCommands{\renewcommand{\dash}{ - }}

% based on \url defined in hyperref.sty
\DeclareRobustCommand*{\http}{\hyper@normalise\http@}
\def\http@#1{\hyper@linkurl{\Hurl{#1}}{http://#1}}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}

\providecommand{\sv}[1]{\ensuremath{\llbracket #1 \rrbracket}}

%=====================================================================
%=========================== linguex settings ========================

\if@linguex
    \RequirePackage{linguex}%
    \renewcommand{\firstrefdash}{}%
    \AtBeginDocument{\settowidth{\Exlabelwidth}{(110)}}
\else
\relax
\fi

\RequirePackage{cgloss} %for adding the language name and source of the example on the first line of glossed examples (requires \gll before the foreign language example and \glt before the translation)

%================================ miscellaneous ======================
%=====================================================================

\setlist{nolistsep} %reduce space between items in lists
