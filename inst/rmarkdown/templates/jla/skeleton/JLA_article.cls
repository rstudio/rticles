%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Journal of Learning Analytics
% Class File
% Version 1.0 (15/11/17)
%
% 
% Based on Stylish Article format
% Original authors:
% Mathias Legrand (legrand.mathias@gmail.com)
% Vel (vel@latextemplates.com)
%
% Modified by:
% Xavier Ochoa (xavier.ochoa@gmail.com)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JLA_article}[25/01/2012, v1.0]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

%----------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------

\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts


%----------------------------------------------------------------------
%	VARIOUS USEFUL PACKAGES
%----------------------------------------------------------------------
\RequirePackage{hyperref}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage{booktabs}
\RequirePackage{apacite}

%----------------------------------------------------------------------
%	MARGINS	
%----------------------------------------------------------------------
	  	  
\RequirePackage[left=2cm,%
right=2cm,%
top=2.25cm,%
bottom=2.25cm,%
headheight=11pt,%
headsep=24pt,%
letterpaper]{geometry}%
				
%----------------------------------------------------------------------
%	FIGURES AND TABLES CAPTIONS
%----------------------------------------------------------------------

\RequirePackage[labelfont={bf,sf,small},%
labelsep=period,%
justification=raggedright]{caption}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\definecolor{color1}{RGB}{0,0,0} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20} % Color of the boxes behind the abstract and headings

				
%----------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\lhead{}%
\chead{\includegraphics[width=\textwidth]{header.png}}%
\rhead{}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{\footnotesize\sffamily \textit{\thepage}}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%----------------------------------------------------------------------
%	SECTION/SUBSECTION/PARAGRAPH SET-UP
%----------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\arabic{section}. #1}}}
  %{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{#1}}}
  %{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{#1}}}
  []  
\titleformat{\subsection}
  {\color{color1}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []    
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1} 
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%----------------------------------------------------------------------
%	TABLEOFCONTENTS SET-UP
%----------------------------------------------------------------------
\newlength{\tocsep} 
\setlength\tocsep{1.5pc} % Sets the indentation of the sections in the table of contents
\setcounter{tocdepth}{3} % Three levels in the table of contents section: sections, subsections and subsubsections

\usepackage{titletoc}
\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily}
  {}
  {}
  {}
  [\ \textbullet\ ]  

%----------------------------------------------------------------------
%	MULTIPLE AUTHOR SET
%----------------------------------------------------------------------  
  
\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@
\newcount\@tempcnt\@tempcnt\z@
\newcount\@notecnt


\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	 
\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}
	 

	 
\def\@note{%
  \ifnum\@tempcnt<\@notecnt
   \global\advance\@tempcnt1
    \item{\csname @not\romannumeral\the\@tempcnt\endcsname}%
   \let\next\@note \vskip1pt
  \else
   \let\next\relax
  \fi
\next}

\newcommand{\note}[1]{%
    \global\advance\@notecnt1
    \expandafter\gdef\csname @not\romannumeral\the\@notecnt\endcsname
    {#1}}
	 


%----------------------------------------------------------------------
%	LIST CONTROL
%----------------------------------------------------------------------  

\RequirePackage{enumitem}
%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)

%----------------------------------------------------------------------
%	ABSTRACT+AUTHOR FRAME
%----------------------------------------------------------------------  

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\JournalInfo}[1]{\def\@JournalInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Submitted}[1]{\def\@Submitted{#1}}
\newcommand{\Accepted}[1]{\def\@Accepted{#1}}
\newcommand{\Published}[1]{\def\@Published{#1}}
\newcommand{\Notesname}[1]{\def\@Notesname{#1}}
\newcommand{\Volume}[1]{\def\@Volume{#1}}
\newcommand{\Number}[1]{\def\@Number{#1}}
\newcommand{\Pages}[1]{\def\@Pages{#1}}
\newcommand{\Doi}[1]{\def\@Doi{#1}}


% ---------------------------------------------------------------------



% ---------------------------------------------------------------------
\newif\ifWithoutNotes

\renewcommand{\@maketitle}{%
%\twocolumn{%
\hfill
\thispagestyle{fancy}%
{\raggedleft\small\sffamily Volume \@Volume(\@Number), \@Pages. http://dx.doi.org/\@Doi\\}%
%\vskip48pt%
{\raggedright\color{color1}\sffamily\bfseries\fontsize{20}{25}\selectfont \@PaperTitle\par}%
\vskip10pt%
{\raggedright\color{color1}\sffamily\fontsize{12}{16}\selectfont  \@Authors\par}%
%\vskip18pt%
\hfill\\
\sffamily\textbf{\abstractname}\\\@Abstract\\[4pt]%
\fcolorbox{color1}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%

\ifWithoutNotes
\parbox{\textwidth-6\fboxsep-2\fboxrule}{%
\textbf{Keywords}\\\@Keywords\\[4pt]%
\textbf{Submitted:} \@Submitted \hskip4pt ---  \textbf{Accepted:} \@Accepted  \hskip4pt ---  \textbf{Published:} \@Published
}
\else
\colorbox{color2!10}{%
\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
\sffamily\textbf{\@Notesname}%
\begin{itemize}
\begingroup%
%\raggedright\sffamily\small%
\@note%
\endgroup%%
\end{itemize}
}%
}%
\vskip4pt%
\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
\textbf{Keywords}\\\@Keywords\\[4pt]%
\textbf{Submitted:} \@Submitted \hskip4pt ---  \textbf{Accepted:} \@Accepted  \hskip4pt ---  				\textbf{Published:} \@Published
}
\fi

}%
}%
\\

\begingroup%
\raggedright\sffamily\small%
\footnotesize\@affiliation\par%
\endgroup%%
\vskip25pt%

%}]%
}

%----------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------  

\bibliographystyle{apacite}
% Remove brackets from numbering in List of References
%\renewcommand{\@biblabel}[1]{}
%\setlength{\bibitemsep}{0cm}
%\let\oldbibliography\thebibliography
%\renewcommand{\thebibliography}[1]{%
%\addcontentsline{toc}{section}{\refname}%
%\oldbibliography{#1}%
%\setlength\itemsep{0pt}}%