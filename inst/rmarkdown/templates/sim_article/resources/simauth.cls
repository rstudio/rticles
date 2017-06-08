%---------------------------------------------------------------------------
%Please  be  aware that the use of this LaTeX class file is governed by the
%following conditions:
%
% based on the original LaTeX ARTICLE DOCUMENT STYLE
% Copyright (C) 1988, 1989 by Leslie Lamport
%
% Copyright (c) 2008 John Wiley & Sons, Ltd, The Atrium, Southern Gate, Chichester,
% West Sussex, PO19 8SQ UK.   All rights reserved.
%
%Rules of Use
%
%% You are NOT ALLOWED to change this file.
%
%
%This class file is made available for use by authors who wish to prepare an
%article for publication in
%STATISTICS IN MEDICINE
%published by John Wiley & Sons Ltd. The user may not exploit any part of
%the class file commercially.
%
%This class file is provided on an `as is'  basis, without warranties of any
%kind, either expressed or implied, including but not limited to warranties of
%title, or  implied warranties of merchantablility or fitness for  a
%particular purpose. There will be no duty on the author[s] of the software
%or John Wiley & Sons Ltd to correct any errors or defects in the software.
%Any statutory rights you may have remain unaffected by your acceptance of
%these rules of use.
%---------------------------------------------------------------------------
%
% Created by Alistair Smith, Sunrise Setting Ltd, 2 September 2009
% Font change 30/3/2010
% simauth.cls --- For Statist. Med.

\def\update{2010/03/10 v3.00}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simauth}[\update\ Statist. Med.]

%\newcommand\hmmax{0}

%\newif\if@cmbrightfont
%\DeclareOption{cmbright}{%
%\@cmbrightfonttrue}

\newif\if@timesfont
\DeclareOption{times}{%
\@timesfonttrue}

\newif\if@doublespace
\DeclareOption{doublespace}{%
\@doublespacetrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
%\if@cmbrightfont
%\RequirePackage{cmbright}
%\fi
\if@timesfont
\RequirePackage{times}
\fi
\if@doublespace
\RequirePackage[onehalfspacing]{setspace}
\fi

\RequirePackage{graphicx}
\RequirePackage{pifont,latexsym,ifthen,theorem,rotating,calc,textcase,booktabs,color}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath}
%\RequirePackage{bm}
\RequirePackage[errorshow]{tracefnt}

\@twosidetrue
\flushbottom
\frenchspacing
\textwidth 41.6pc
\textheight 682pt
%\setlength\columnsep{24pt}

%Trim sizes
\setlength\voffset{-1in}
\setlength\hoffset{-1in}
\topmargin 4mm
\setlength\oddsidemargin{18mm}%back margin on odd pages
\setlength\evensidemargin{21.5mm}%fore margin on even pages
\setlength\paperwidth{210mm}
\setlength\paperheight{297mm}
%Needed to set PDF page size
\special{papersize=210mm,297mm}

\parskip \z@
\parindent 1em
\headheight 50pt
\headsep    30pt
\footskip 18pt

\brokenpenalty=10000%
\clubpenalty=9999%
\widowpenalty=9999%
\hyphenpenalty=9999%
\finalhyphendemerits=14000%
\doublehyphendemerits=75000%
\lefthyphenmin=3%
\righthyphenmin=3%
\pretolerance=1000%
\tolerance=2000%
\hfuzz=0.99pt%
\hbadness=8000
\vbadness=9000

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

\renewcommand{\normalsize}{\fontsize{10.3}{12pt}\selectfont}
\normalsize

\renewcommand\small{%
   \@setfontsize\small\@viiipt{10}%
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand{\footnotesize}{\fontsize{7.5pt}{9.5pt}\selectfont}
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt{9.5}}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@viipt}
\renewcommand\large{\@setfontsize\large\@xipt{13}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\renewcommand\huge{\fontsize{22pt}{24pt}\selectfont}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\newcommand{\sectionsize}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\titlesize}{\fontsize{24pt}{26pt}\selectfont}
\newcommand{\authorsize}{\fontsize{15pt}{17pt}\selectfont}

\def\journalname{STATISTICS IN MEDICINE}
\def\journalabb{Statist.\ Med.}

\newbox\absbox
\def\abstract{\lrbox\absbox\minipage{\textwidth}%
  \normalsize\bfseries%
  }
\def\endabstract{\copyrightline\endminipage\endlrbox}

\def\keywords#1{%
  \gdef\@keywords{{%
    \textbf{Keywords:}}\hspace{0.75em}\parbox[t]{32pc}{#1}}}
\let\@keywords\@empty

%\def\received#1{%
%\gdef\@received{Received #1}}
%\let\@received\@empty
%\def\revised#1{%
%\gdef\@revised{Revised #1}}
%\let\@revised\@empty
%\def\accepted#1{%
%\gdef\@accepted{Accepted #1}}
%\let\@accepted\@empty

\skip\footins 22pt plus  8pt
\gdef\footnoterule{}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\long\def\@makefntext#1{\parindent 1em%
\noindent{$\m@th^{\@thefnmark}$}#1}

\def\corraddr#1{%
  \gdef\@corraddr{%
    \footnotetext[1]{\itshape Correspondence to: #1}\stepcounter{footnote}}}
\let\@corraddr\@empty
\def\corrauth{\footnotemark[1]}

\def\address#1{%
  \gdef\@address{%
    \footnotetext[0]{\noindent\rule{\textwidth}{5.0pt}\vskip 4pt\noindent\itshape #1}}}
\let\@address\@empty

\def\cgs#1{%
  \gdef\@cgs{%
    \footnotetext[0]{\par\noindent\itshape Contract/grant sponsor:  #1}}}
\let\@cgs\@empty

\def\affilnum#1{${}^{\text{\bf#1}}$}
\def\affil#1{${}^{\text{\bf#1}}$}
\def\comma{$^{\text{\bf,}}$}

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
    \thispagestyle{title}\label{FirstPage}\@address\@corraddr\@cgs
  \endgroup
  %\setcounter{footnote}{0}%
  \global\let\address\relax
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@address\@empty
  \global\let\corraddr\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{\vspace*{-18pt}%
\noindent{\scriptsize{Received XXXX}}\hfill\mbox{}\par
\vspace{10pt}
\noindent{\normalsize(www.interscience.wiley.com) DOI: 10.1002/\DOI}%
  \null
  \vskip 12pt %
    {\titlesize\bfseries\raggedright\@title \par}%
    \vskip 1.5em%
    {\authorsize
      \lineskip .5em%
      %
        \raggedright\bfseries\@author
      \par}%
      \vskip 3pt
 %{\normalsize
%      \lineskip .5em%
%      %
%        {\raggedright\emph\@address}
%      \par}%
    \vskip 18pt%
    {\noindent\usebox\absbox\par}
    {\lineskip 1.5em%
      %
      {\noindent\normalsize\@keywords}\par}
      \vspace{7pt}
    \noindent\rule{\textwidth}{5.0pt}
    \par
  \vskip 0.5em}

\def\startpage{\pageref{FirstPage}}
\def\endpage{\pageref{LastPage}}
\def\volumeyear{0000}
\def\volumenumber{00}
\def\DOI{sim.0000}

\gdef\copyrightline{Copyright \copyright\ \volumeyear\ John Wiley \& Sons, Ltd.}
\def\runninghead#1{\markboth{{#1}}{Statistics in Medicine}}

\gdef\rhtext{{\huge\begin{tabular}[b]{@{}l@{}}Statistics\\[-3pt]
in Medicine\end{tabular}}}

\gdef\ssboxnum{\colorbox{black}{\normalsize\textcolor{white}{\thepage}}}

\def\ps@title{%
\def\@oddhead{\parbox{\textwidth}{%
{\Large\bfseries Research Article}\hfill{\rhtext}\\[-2pt]
\noindent\rule{\textwidth}{5.0pt}%
}}%
\let\@evenhead\@oddhead
\def\@oddfoot{\parbox[t]{\textwidth}{%
\noindent\rule{\textwidth}{5.0pt}\par\vskip -2pt
{\small\emph{Statist.\ Med.}\ {\bfseries\volumeyear}, \volumenumber\ \startpage--\endpage\hfill\copyrightline\hfill\mbox{}\\
\textit{Prepared using \textsf{simauth.cls} [Version: \update]}\mbox{}\\
}}}
\let\@evenfoot\@oddfoot}

\def\ps@sim{%
\def\@evenhead{\parbox{\textwidth}{{\rhtext\hfill\normalsize\leftmark}\\[-2pt]
\noindent\rule{\textwidth}{5.0pt}}}
\def\@oddhead{\parbox{\textwidth}{{\normalsize\leftmark\hfill\rhtext}\\[-2pt]
\noindent\rule{\textwidth}{5.0pt}}}
\def\@evenfoot{\parbox[t]{\textwidth}{\noindent\rule{\textwidth}{5.0pt}\par
\ssboxnum\quad\small \hfill\copyrightline\hfill\emph{Statist.\ Med.}\ {\bfseries\volumeyear}, \volumenumber\ \startpage--\endpage\\
\textit{Prepared using \textsf{simauth.cls}}}}
\def\@oddfoot{\parbox[t]{\textwidth}{\noindent\rule{\textwidth}{5.0pt}\par
\small \emph{Statist.\ Med.}\ {\bfseries\volumeyear}, \volumenumber\ \startpage--\endpage\hfill\copyrightline\hfill \quad\ssboxnum\\
\textit{Prepared using \textsf{simauth.cls}}}}}

\let\@hangfrom\noindent %Remove indent on section turnovers
\renewcommand{\@seccntformat}[1]{{\csname the#1\endcsname.}\hspace{0.5em}}

\newdimen\@bls
\@bls=\baselineskip

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {2\@bls  plus .3\@bls minus .1\@bls}%
                                   {1\@bls\@afterindentfalse}%
                                   {\normalfont\sectionsize\raggedright\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {\@bls plus .3\@bls minus .1\@bls}%
                                     {6pt\@afterindentfalse}%
                                     {\normalfont\normalsize\raggedright\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {\@bls plus .2\@bls}%
                                     {-5pt}%
                                     {\normalfont\normalsize\itshape}}

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

\usepackage[tableposition=top]{caption}
\DeclareCaptionLabelSeparator{jwperiod}{.\hspace*{0.5ex}}
\captionsetup[figure]{font=scriptsize,labelfont=bf,labelsep=jwperiod,justification=justified,singlelinecheck=true}
\captionsetup[table]{font=normalsize,labelfont=bf,labelsep=jwperiod,justification=centerlast,singlelinecheck=true}

\newcommand\ack{\section*{Acknowledgement}}
\newcommand\acks{\section*{Acknowledgements}}

\renewcommand\refname{References}

\renewenvironment{thebibliography}[1]{%
\section*{\refname}
\list{{\arabic{enumi}}}{\def\makelabel##1{\hss{##1.}}\topsep=0\p@\parsep=0\p@
\partopsep=0\p@\itemsep=0\p@
\labelsep=1ex\itemindent=0\p@
\settowidth\labelwidth{\small[#1]}%
\leftmargin\labelwidth
\advance\leftmargin\labelsep
\advance\leftmargin -\itemindent
\usecounter{enumi}}\small
\def\newblock{\ }
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}{\endlist}

\def\biog{\section*{Author's Biography}\small}
\def\biogs{\section*{Authors' Biographies}\small}

\AtEndDocument{%
\label{LastPage}}

\hyphenation{com-mu-ni-ca-tions}

\pagestyle{sim}
\normalsize
\sloppy
