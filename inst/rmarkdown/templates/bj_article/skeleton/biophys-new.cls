\ProvidesClass{biophys-new}[2019/04/25]

\newif\if@twocol
\newif\if@endfloat
\newif\if@lineno
\newif\if@biblatex
\DeclareOption{twocolumn}{\@twocoltrue}
\DeclareOption{endfloat}{\@endfloattrue}
\DeclareOption{lineno}{\@linenotrue}
\DeclareOption{biblatex}{\@biblatextrue}
\DeclareOption{bibtex}{\@biblatexfalse}

\ProcessOptions\relax
\LoadClass[10pt,twoside]{article}

\RequirePackage{mathtools}
\RequirePackage{sansmath}
\RequirePackage{xpatch}

\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\IfFileExists{newtxtext.sty}{%
  \RequirePackage{newtxtext}
  \RequirePackage{newtxmath}
}{%
  \RequirePackage{mathptmx}
  \RequirePackage[scaled]{helvet}
}
\RequirePackage{textcase}
\RequirePackage{xcolor}
\frenchspacing

\RequirePackage[bf,sf]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lineno}
\RequirePackage{authblk}
\RequirePackage{environ}
\RequirePackage[runin]{abstract}
\RequirePackage{geometry}
\RequirePackage{threeparttable}
\RequirePackage[tableposition=top,figureposition=bottom]{caption}
\RequirePackage{mdframed}

\geometry{letterpaper,
  inner=48pt,
  textwidth=41.6pc,
  top=70pt,
  textheight=54.85pc,
  columnsep=18pt,
  headsep=\baselineskip,
  footskip=3\baselineskip
}

\def\@papertype{Article}
\def\@titlerunning{}
\def\@authorunning{}
\newcommand{\papertype}[1]{\def\@papertype{#1}}
\newcommand{\runningtitle}[1]{\def\@runningtitle{#1}}
\newcommand{\runningauthor}[1]{\def\@runningauthor{#1}}

\fancyhf{}
\renewcommand{\headrule}{}
\fancyhead[RO]{\sffamily\footnotesize\@runningtitle}
\fancyhead[LE]{\sffamily\footnotesize\@runningauthor}
\fancyfoot[RO]{\sffamily\footnotesize Manuscript submitted to Biophysical Journal\hspace{1em}\textbf{\thepage}}
\fancyfoot[LE]{\sffamily\footnotesize\textbf{\thepage}\hspace{1em}Manuscript submitted to Biophysical Journal}
\pagestyle{fancy}

\fancypagestyle{titlepage}{%
  \pagestyle{fancy}
  \fancyhead{}
}

\renewcommand{\@maketitle}{%
\thispagestyle{titlepage}
\textsf{Manuscript submitted to \textbf{Biophysical}}\kern1pt\textit{Journal}\\[-0.5em]%
{\LARGE\sffamily\bfseries\color{gray}\@papertype\par}
\bigskip
{\raggedright\bfseries\sffamily\huge\@title\par}
\bigskip
{\raggedright\@author\par}%
}
\renewcommand{\Authfont}{\sffamily\sansmath}
\renewcommand{\Affilfont}{\sffamily\sansmath}
\patchcmd{\AB@authnote}{\normalfont}{}{}{}
\patchcmd{\AB@affilnote}{\normalfont}{}{}{}
\newcommand{\corrauthor}[2][]{\affil[#1]{Correspondence: #2}}

\NewEnviron{frontmatter}{%
  \setlength{\parindent}{0pt}
  \if@twocol
    \twocolumn[%
      \if@lineno
        \internallinenumbers
      \fi
      \@maketitle\BODY\bigskip      
    ]%
  \else
    \@maketitle\BODY\medskip%
  \fi
}{}

\renewcommand{\abstracttextfont}{\sffamily\normalsize}
\renewcommand{\abstractnamefont}{\sffamily\normalsize\MakeTextUppercase}
\abslabeldelim{\quad}
\setlength{\absparindent}{0pt}
\setlength{\abstitleskip}{-\parindent}
\setlength{\absleftindent}{0pt}
\setlength{\absrightindent}{0pt}
%% 25 April, 2019: Added sigstatement 
\newenvironment{sigstatement}
  {\renewcommand{\abstractname}{Significance}%
   \begin{abstract}}
   {\end{abstract}}
\surroundwithmdframed[backgroundcolor=gray!20,innertopmargin=10pt,innerbottommargin=10pt]{sigstatement}

\if@lineno\linenumbers\fi
\setlength\linenumbersep{4pt}

\setcounter{secnumdepth}{3}
\titleformat{\section}{\sffamily\bfseries\large\raggedright}{\thesection}{1em}{\MakeTextUppercase}

\titleformat*{\subsection}{\sffamily\bfseries\large\raggedright}

\titleformat*{\subsubsection}{\sffamily\bfseries\normalsize\raggedright}

\titlespacing*{\section}{0pt}{1.25\baselineskip}{0.25\baselineskip}

\titlespacing*{\subsection}{0pt}{1.25\baselineskip}{0.25\baselineskip}

\titlespacing*{\subsubsection}{0pt}{1.25\baselineskip}{0.25\baselineskip}

\if@endfloat
  \RequirePackage{endfloat}
  \renewcommand\floatplace[1]{%
      \begin{center}
        [\csname #1name\endcsname~\csname thepost#1\endcsname\ about here; moved to end of manuscript by \texttt{endfloat}.]
      \end{center}}
\fi

\if@biblatex
  \RequirePackage[style=numeric-comp,backend=biber,sorting=none,date=year,natbib]{biblatex}
  \DeclareFieldFormat{labelnumberwidth}{#1.}
  \DeclareFieldFormat{shorthandwidth}{#1.}
  \setlength{\biblabelsep}{0.5em}
  % drastic; but fastest way to get parentheses for cites.
  \renewrobustcmd{\mkbibbrackets}{\mkbibparens}
\else
  \RequirePackage[numbers,sort&compress,round]{natbib}
  \bibliographystyle{biophysj}
  \renewcommand{\bibnumfmt}[1]{#1.}
\fi

\endinput