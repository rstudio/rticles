\ProvidesClass{ouparticle}[2009/12/09 v1.0]

\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\newif\ifnum@bib\num@bibtrue
\newif\ifnote@end\note@endfalse

\DeclareOption{oneline}{\PassOptionsToPackage{doublespacing}{setspace}}
\DeclareOption{halfline}{\PassOptionsToPackage{onehalfspacing}{setspace}}
\DeclareOption{endnotes}{\ProvidesPackage{endnotes}\note@endtrue}
\DeclareOption{numbib}{\num@bibtrue}
\DeclareOption{nonumbib}{\num@bibfalse}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}

\RequirePackage{amsmath,amssymb,amsfonts,verbatim,graphicx,setspace,endnotes}%%
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\usepackage{xspace,amscd,rotating,latexsym,multicol,array,algorithm,subfigure}
\usepackage[hyphens,obeyspaces]{url}

\let\@abstract\relax
\long\gdef\abstract#1{{\gdef\@abstract{%
   \small%
   \begin{center}%
        {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
   \end{center}%
   {\quotation%
   \noindent#1%
   \endquotation}%
\par}}}

\newcommand\keywordsname{Keywords}
\def\author#1{\def\and{\\}\gdef\@author{#1}}
\def\keywords#1{\gdef\@keywords{\textbf{\keywordsname:} #1}}\gdef\@keywords{}

\long\def\name#1{#1\\}
\long\def\address#1{#1\\}
\long\def\email#1{#1\\}

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%      
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
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
  \setcounter{footnote}{0}%
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
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  {\leftskip\z@ plus 1fill\rightskip\leftskip
        \let \footnote \thanks
        {\LARGE \noindent\@title \par}%
    \vskip 1.5em%
        {\large\lineskip .5em\noindent\@author\par}%
    \vskip 1em%
    {\large \noindent\@date}%
    \vskip 2em%
        \@abstract%
    \vskip0em%
        \noindent\@keywords
  \par}
  \vskip 1.5em}
\fi

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex}%
                                   {\normalfont\Large\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex}%
                                     {\normalfont\large\bfseries\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex}%
                                     {\normalfont\normalsize\bfseries\raggedright}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}



\renewcommand\appendix{\@ifstar\@starappendix\@appendix}

\newcommand\@starappendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{secnumdepth}{0}
  \gdef\thesection{\@Alph\c@section}}
\newcommand\@appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}

\ifnote@end\let\footnote\endnote\fi%

\newenvironment{notes}[1][Notes]{\par
\section*{#1}%
}{\par}

\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\ifnum@bib\@biblabel{\@arabic\c@enumiv}\fi}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \ifnum@bib
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \else
            \leftmargin\bibindent
            \advance\itemindent-\bibindent
            \fi
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



\setlength\parskip{0\p@}
\setlength\columnsep{12\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput
