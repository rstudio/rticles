%---------------------------------------------------------------------------
%Please  be  aware that the use of this LaTeX class file is governed by the
%following conditions:
%
% based on the original LaTeX ARTICLE DOCUMENT STYLE
% Copyright (C) 1988, 1989 by Leslie Lamport
%
% Copyright (c) 2013 SAGE Publications. All rights reserved.
%
%Rules of Use
%
%% You are NOT ALLOWED to change this file.
%
%
%This class file is made available for use by authors who wish to prepare an
%article for publication in a SAGE Publications journal. 
%The user may not exploit any part of the class file commercially.
%
%This class file is provided on an `as is'  basis, without warranties of any
%kind, either expressed or implied, including but not limited to warranties of
%title, or  implied warranties of merchantablility or fitness for  a
%particular purpose. There will be no duty on the author[s] of the software
%or SAGE Publications to correct any errors or defects in the software.
%Any statutory rights you may have remain unaffected by your acceptance of
%these rules of use.
%---------------------------------------------------------------------------
%
% Created by Alistair Smith, Sunrise Setting Ltd, 27 July 2013
%
% sagej.cls --- For SAGE Publications
%
%  9/6/15 Endnote bug fix.
% 24/6/15 Add "comma" to vancouver natbib line; remove figure extension; Review option added.
% 14/1/17 SAGE graphic removed and replaced by drawn box.

\def\update{2017/01/17 v1.20}

\newcommand{\journalclass}{sagej.cls}
\newcommand{\journalclassshort}{sagej}
%\newcommand{\DOI}{XXX}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sagej}[\update\ \journalclass]

%\newcommand\hmmax{0}

\newif\if@timesfont
\DeclareOption{times}{%
\@timesfonttrue}

\newif\if@doublespace
\DeclareOption{doublespace}{%
\@doublespacetrue}

\newif\if@sageh
\DeclareOption{sageh}{%
\@sagehtrue}

\newif\if@sagev
\DeclareOption{sagev}{%
\@sagevtrue}

\newif\if@sageapa
\DeclareOption{sageapa}{%
\@sageapatrue}

%Setup the trim and text areas
\newif\if@shortAfour
\DeclareOption{shortAfour}{%
\@shortAfourtrue}

\newif\if@Afour
\DeclareOption{Afour}{%
\@Afourtrue}

\newif\if@MCfour
\DeclareOption{MCfour}{%
\@MCfourtrue}

\newif\if@PCfour
\DeclareOption{PCfour}{%
\@PCfourtrue}

\newif\if@Royal
\DeclareOption{Royal}{%
\@Royaltrue}

\newif\if@Crown
\DeclareOption{Crown}{%
\@Crowntrue}

\newif\if@Review
\DeclareOption{Review}{%
\@Reviewtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

\if@timesfont
\RequirePackage{times}
\usepackage[scaled=.95]{helvet}
\fi
\if@doublespace
\RequirePackage[onehalfspacing]{setspace}
\fi

\RequirePackage{graphicx}
\RequirePackage{latexsym,ifthen,rotating,calc,textcase,booktabs,color,endnotes}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath,amsthm}
%\RequirePackage{bm}
\RequirePackage[errorshow]{tracefnt}

\@twosidetrue
\flushbottom
\frenchspacing

\let\sagesf\sf
\if@PCfour
\let\sagesf\rm
\fi

%papersize={width,height}
\if@shortAfour
\usepackage[text={170.5mm,226mm},%
papersize={210mm,280mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}
\if@Afour
\usepackage[text={174mm,258mm},%
papersize={210mm,297mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}
\if@MCfour
\usepackage[text={151.5mm,196mm},%
papersize={189mm,246mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}
\if@PCfour
\usepackage[text={138mm,198mm},%
papersize={170mm,242mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\usepackage{ftnright}
\fi

%papersize={width,height}%single column
\if@Royal
\usepackage[text={124mm,185mm},%
papersize={156mm,234mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\fi

%papersize={width,height}%single column
\if@Crown
\usepackage[text={146.5mm,183mm},%
papersize={7.25in,9.5in},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\fi

%For Review Single column, 12pt
\if@Review
\usepackage[text={124mm,185mm},%
papersize={156mm,234mm},%
columnsep=12pt,%
headsep=21pt,%
centering]{geometry}
\renewcommand{\normalsize}{\fontsize{12}{14pt}\selectfont}
\fi

\parindent 1em

\hyphenpenalty=1000
\pretolerance=8000
\tolerance=9500
\hbadness=8000
\vbadness=9000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\lefthyphenmin=3%
\righthyphenmin=3%
\brokenpenalty=10000%

\thinmuskip = 3mu
\medmuskip = 4mu
\thickmuskip = 5mu

\setcounter{topnumber}{10}
\def\topfraction{1}
\setcounter{bottomnumber}{10}
\def\bottomfraction{0.8}
\setcounter{totalnumber}{10}
\def\textfraction{0}
\renewcommand{\floatpagefraction}{0.95}
\setcounter{dbltopnumber}{10}
\renewcommand{\dblfloatpagefraction}{0.95}
\renewcommand{\dbltopfraction}{1}

\renewcommand\small{%
   \@setfontsize\small\@ixpt{10.5}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               %\parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand{\refsize}{\fontsize{9}{12pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8}{10pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{7.0}{8.5pt}\selectfont}
\renewcommand{\large}{\fontsize{12}{14pt}\selectfont}
\newcommand{\titlesize}{\fontsize{18.0}{20pt}\selectfont}

\newbox\absbox
\def\abstract{\lrbox\absbox\minipage{\textwidth}%
  \sagesf\normalsize%
  \section*{\normalsize Abstract}\vskip -1.5mm%
  }
\def\endabstract{\endminipage\endlrbox}

\def\keywords#1{%
  \gdef\@keywords{\begin{minipage}{\textwidth}{\normalsize\sagesf \textbf{Keywords}}\\ \parbox[t]{\textwidth}{#1}\end{minipage}}}
\let\@keywords\@empty

\skip\footins 20pt plus  8pt
%\gdef\footnoterule{}
\def\footnoterule{\kern-3\p@
  \hrule \@width \columnwidth \kern 3mm}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\long\def\@makefntext#1{\parindent 1em%
\noindent{$\m@th^{\@thefnmark}$}#1}

\newcommand{\email}[1]{%
  \gdef\@email{%
\footnotetext[0]{\sagesf Email: #1}}}
\let\@email\@empty

\def\corrauth#1{\gdef\@corrauth{%
\footnotetext[0]{\par\vskip-3pt\sagesf\noindent\textbf{Corresponding author:}\\ #1}}}
\let\@corrauth\@empty

\def\affiliation#1{%
  \gdef\@affiliation{%
    \footnotetext[0]{\sagesf #1}}}
\let\@affiliation\@empty

\def\affilnum#1{${}^{\text{{#1}}}$}

\renewcommand\maketitle{\par
  \begingroup
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
    \thispagestyle{title}\label{FirstPage}\@affiliation\@corrauth\@email%
  \endgroup
  %\setcounter{footnote}{0}%
    \global\let\affiliation\relax
   \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@affiliation\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
\if@Royal
\vspace*{-20pt}
\fi
\if@Crown
\vspace*{-20pt}
\fi
\vspace*{-34pt}%
\null%
\begin{center}
\if@PCfour
\begin{rm}
\else
\begin{sf}
\fi
\begin{minipage}[t]{\textwidth-57.625mm}
  \vskip 12.5pt%
    {\raggedright\titlesize\textbf{\@title} \par}%
    \vskip 1.5em%
    \vskip 12.5mm%
    \end{minipage}\hspace{15mm}\begin{minipage}[t]{42.625mm}
\hbox{}\scriptsize\journalname\\
\hbox{}\volumenumber(\issuenumber):\startpage--\endpage\\ 
\hbox{}\copyright The Author(s) \volumeyear\\
\hbox{}Reprints and permission:\\
\hbox{}sagepub.co.uk/journalsPermissions.nav\\
\hbox{}DOI: 10.1177/ToBeAssigned\\
\hbox{}www.sagepub.com/\\[2.3pt]
%\hbox{}\includegraphics[height=4mm]{SAGE_Logo}
\hbox{}{\fboxsep 1.5pt\framebox[14mm]{{\normalsize SAGE}}}
\end{minipage}
{\par\large%
\if@Royal
      \vspace*{6mm}
      \fi
      \if@Crown
      \vspace*{6mm}
      \fi%
      \lineskip .5em%
      {\raggedright\textbf{\@author}
      \par}}
     \vskip 40pt%
    {\noindent\usebox\absbox\par}
    {\vspace{20pt}%
      %
      {\noindent\normalsize\@keywords}\par}
      \if@PCfour
      \end{rm}
      \else
      \end{sf}
      \fi
      \end{center}
      \if@Royal
      \vspace*{-4.5mm}
      \fi
      \if@Crown
      \vspace*{-4.5mm}
      \fi
      \vspace{22pt}
        \par%
  }
 
\def\startpage{\pageref{FirstPage}}
\def\endpage{\pageref{LastPage}}
\def\volumeyear{0000}
\def\volumenumber{XX}
\def\issuenumber{X}
\def\journalname{Journal Title}

\def\runninghead#1{\markboth{{#1}}{}}

\def\ps@title{%
\def\@oddhead{\parbox{\textwidth}{\mbox{}\\[-1pt]%
\noindent\rule{\textwidth}{0.5pt}%
}}%
\let\@evenhead\@oddhead
\def\@oddfoot{\parbox[t]{\textwidth}{%
{\scriptsize{\it Prepared using \textsf{\journalclass} [Version: \update]}}}}
\let\@evenfoot\@oddfoot}

\def\ps@sagepage{%
\let\@mkboth\@gobbletwo
\def\@evenhead{\parbox{\textwidth}{%
\normalsize\sagesf\thepage\hfill\itshape\journalname\ \volumenumber(\issuenumber)\\[-6pt]
\noindent\rule{\textwidth}{0.25pt}}}
\def\@oddhead{\parbox{\textwidth}{%
\normalsize\sagesf{\itshape{\leftmark}}\hfill\thepage\\[-6pt]
\noindent\rule{\textwidth}{0.25pt}}}
\def\@evenfoot{\parbox[t]{\textwidth}{%
\scriptsize{\it Prepared using \textsf{\journalclass}}}}
\def\@oddfoot{\@evenfoot}
}

%\renewcommand{\@seccntformat}[1]{{\csname the#1\endcsname.}\hspace{0.5em}}
\setcounter{secnumdepth}{-2}

\newdimen\@bls                              
\@bls=\baselineskip

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {1.2\@bls  plus .3\@bls minus .1\@bls}%
                                   {5pt\@afterindentfalse}%
                                   {\sagesf\large\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {0.9\@bls plus .3\@bls minus .1\@bls}%
                                     {4pt\@afterindentfalse}%
                                     {\sagesf\large\itshape\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {0.5\@bls plus .3\@bls minus .1\@bls}%
                                     {-0.5em\@afterindentfalse}%
                                     {\sagesf\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{1em}%
                                     {0.3\@bls plus .3\@bls minus .1\@bls}%
                                     {-0.5em\@afterindentfalse}%
                                     {\sagesf\normalsize\itshape}}

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\itemsep 0pt\parsep 0pt
         \def\makelabel##1{\hss\llap{##1}}}\fi}

\let\endenumerate =\endlist

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
\list{\csname\@itemitem\endcsname}{\itemsep 0pt\parsep 0pt
\def\makelabel##1{\hss\llap{##1}}}\fi}

\let\enditemize =\endlist

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{sageperiod}{.\hspace*{1ex}}
\captionsetup[figure]{font=small,labelfont={sf,bf},textfont=sf,labelsep=sageperiod,justification=raggedright,singlelinecheck=false}
\captionsetup[table]{position=top,labelsep=sageperiod,font=small,labelfont={sf,bf},textfont=sf,justification=raggedright,skip=2pt,singlelinecheck=false}

\def\@begintheorem#1#2[#3]{%
  \deferred@thm@head{\the\thm@headfont \thm@indent
    \@ifempty{#1}{\let\thmname\@gobble}{\let\thmname\@iden}%
    \@ifempty{#2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
    \@ifempty{#3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
    \thm@swap\swappedhead\thmhead{#1}{#2\the\thm@headpunct}{#3}%
    %\the\thm@headpunct
    \thmheadnl % possibly a newline.
    \hskip\thm@headsep
  }%
  \ignorespaces}

\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }{#2}}%
  \thmnote{ {\the\thm@notefont #3. }}}
  
\newenvironment{acks}[1]%
{\subsection*{\normalsize\sagesf\bfseries Acknowledgements}\begin{refsize}\noindent #1}%
{\end{refsize}}

\newenvironment{funding}[1]%
{\subsection*{\normalsize\sagesf\bfseries Funding}\begin{refsize}\noindent #1}%
{\end{refsize}}

\newenvironment{sm}[1]%
{\subsection*{\normalsize\sagesf\bfseries Supplemental material}\begin{refsize}\noindent #1}%
{\end{refsize}}
 
\newenvironment{dci}[1]%
{\subsection*{\normalsize\sagesf\bfseries Declaration of conflicting interests}\begin{refsize}\noindent #1}%
{\end{refsize}} 

\newenvironment{biog}[1]%
{\subsection*{\normalsize\sagesf\bfseries Author biography}\begin{refsize}\noindent #1}%
{\end{refsize}}

\newenvironment{biogs}[1]%
{\subsection*{\normalsize\sagesf\bfseries Author Biographies}\begin{refsize}\noindent #1}%
{\end{refsize}}
  
%Endnotes
\def\enotesize{\refsize}

\def\enoteheading{\subsection*{\normalsize\sagesf\bfseries\notesname}%
  \mbox{}\par\vskip-\baselineskip}

%\renewcommand\makeenmark{\theenmark.\hspace{0.75em}}

\renewcommand{\enoteformat}{%
   \rightskip\z@ \leftskip15pt \parindent=0pt
   \leavevmode{\makebox[0cm][r]{%
   \hbox to15pt{\@theenmark.\hfill}}}}
 
  
\newtheoremstyle{sage}
{6pt plus 2pt minus 2pt}% space above
{6pt plus 2pt minus 2pt}% space below
{\it}% Body font
{}% Indent amount
{\bfseries}% Theorem head font
{.}% Punctuation after theorem head
{0.75em}% Space after theorem head
{}% Theorem head spec

\theoremstyle{sage}

\renewenvironment{proof}[1][\proofname]{\par
  %AS\pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  %AS\popQED
  \endtrivlist\@endpefalse
}

%\renewenvironment{thebibliography}{%
%\section*{\normalsize\refname}
%\list{}{\topsep=0\p@\parsep=0\p@
%\partopsep=0\p@\itemsep=1\p@\labelsep=0\p@\itemindent=-20\p@
%\labelwidth=0\p@\leftmargin=20\p@
%}\refsize\rm
%\def\newblock{\ }
%\sloppy\clubpenalty4000\widowpenalty4000
%\sfcode`\.=1000\relax}{\endlist}

\if@sageh
\usepackage{natbib}
\bibpunct{(}{)}{;}{}{}{,}
\setlength{\bibsep}{1pt}
\setlength{\bibhang}{16pt}
\renewcommand{\bibfont}{\refsize}
\renewcommand\refname{{\normalsize References}}
\fi

\if@sagev
\usepackage[super,sort&compress,comma]{natbib}
%\bibpunct{(}{)}{;}{}{}{,}
\renewcommand{\bibnumfmt}[1]{#1.}
\setlength{\bibsep}{0pt}
%\setlength{\bibhang}{20pt}
\renewcommand{\bibfont}{\refsize}
\renewcommand\refname{{\normalsize References}}
\fi

\if@sageapa
%\usepackage{apalike}
\usepackage{mslapa}
\setlength{\bibhang}{16pt}
\@ifundefined{chapter}{\def\thebibliography#1{\section*{\refname}\list
  {\relax}{\setlength{\labelsep}{0em}
        \setlength{\itemindent}{-\bibhang}
        \setlength{\leftmargin}{\bibhang}
        \setlength{\itemsep}{0pt}
        \parsep 0pt}%AS
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}}%
\fi

\AtEndDocument{%
\label{LastPage}}

\pagestyle{sagepage}

\if@shortAfour
\twocolumn
\fi

\if@Afour
\twocolumn
\fi

\if@MCfour
\twocolumn
\fi

\if@PCfour
\twocolumn
\fi

\normalsize
\sloppy
