%%
%% This is file `ajs.cls',
\def\fileversion{1.0}
%% based on jss.cls, file version 2.2.
\def\filename{ajs}
\def\filedate{2014/01/01}
%%
%% Package `ajs' to use with LaTeX2e for AJS publications 
%% (package ajs is based on jss from http://www.jstatsoft.org/ by
%% Achim Zeileis
%% Minor modifications (jss.cls --> ajs.cls) by Matthias Templ
%% ajs.cls is under GPL-2
%%
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{ajs}[\filedate\space\fileversion\space copied version of jss class by Achim Zeileis]
%% options
\newif\if@article
\newif\if@codesnippet
\newif\if@bookreview
\newif\if@softwarereview
\newif\if@review
\newif\if@shortnames
\newif\if@nojss
\newif\if@notitle
\newif\if@noheadings
\newif\if@nofooter

\@articletrue
\@codesnippetfalse
\@bookreviewfalse
\@softwarereviewfalse
\@reviewfalse
\@shortnamesfalse
\@nojssfalse
\@notitlefalse
\@noheadingsfalse
\@nofooterfalse

\DeclareOption{article}{\@articletrue%
  \@codesnippetfalse \@bookreviewfalse \@softwarereviewfalse}
\DeclareOption{codesnippet}{\@articlefalse%
  \@codesnippettrue \@bookreviewfalse \@softwarereviewfalse}
\DeclareOption{bookreview}{\@articlefalse%
  \@codesnippetfalse \@bookreviewtrue \@softwarereviewfalse}
\DeclareOption{softwarereview}{\@articlefalse%
  \@codesnippetfalse \@bookreviewfalse \@softwarereviewtrue}
\DeclareOption{shortnames}{\@shortnamestrue}
\DeclareOption{nojss}{\@nojsstrue}
\DeclareOption{notitle}{\@notitletrue}
\DeclareOption{noheadings}{\@noheadingstrue}
\DeclareOption{nofooter}{\@nofootertrue}

\ProcessOptions
\LoadClass[11pt,a4paper,twoside]{article}
%% required packages
% This fixes https://github.com/matthias-da/ajs-public/issues/2.
% Retrieved from https://github.com/rstudio/rticles/issues/329
\RequirePackage[2020/02/02]{latexrelease}
\RequirePackage{graphicx,color,xcolor,ae,fancyvrb}
\usepackage{orcidlink}
\RequirePackage[T1]{fontenc}
\IfFileExists{upquote.sty}{\RequirePackage{upquote}}{}
\IfFileExists{lmodern.sty}{\RequirePackage{lmodern}}{}
%% bibliography
\if@shortnames
  \usepackage[authoryear,round]{natbib}
\else
  \usepackage[authoryear,round,longnamesfirst]{natbib}
\fi
\bibpunct{(}{)}{;}{a}{}{,}
\bibliographystyle{ajs}
%% page layout
%\topmargin 0pt
\topmargin -50pt
%\textheight 46\baselineskip
\textheight 53\baselineskip
\advance\textheight by \topskip
\oddsidemargin 0.1in
\evensidemargin 0.15in
\marginparwidth 1in
\oddsidemargin 0.125in
\evensidemargin 0.125in
\marginparwidth 0.75in
\textwidth 6.125in
%% paragraphs
\setlength{\parskip}{0.7ex plus0.1ex minus0.1ex}
\setlength{\parindent}{0em}
%% for all publications
\newcommand{\Address}[1]{\def\@Address{#1}}
\newcommand{\Plaintitle}[1]{\def\@Plaintitle{#1}}
\newcommand{\Shorttitle}[1]{\def\@Shorttitle{#1}}
\newcommand{\Plainauthor}[1]{\def\@Plainauthor{#1}}
\newcommand{\Volume}[1]{\def\@Volume{#1}}
\newcommand{\Year}[1]{\def\@Year{#1}}
\newcommand{\Month}[1]{\def\@Month{#1}}
\newcommand{\Issue}[1]{\def\@Issue{#1}}
\newcommand{\Submitdate}[1]{\def\@Submitdate{#1}}
%% for articles and code snippets
\newcommand{\Acceptdate}[1]{\def\@Acceptdate{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Plainkeywords}[1]{\def\@Plainkeywords{#1}}
%% for book and software reviews
\newcommand{\Reviewer}[1]{\def\@Reviewer{#1}}
\newcommand{\Booktitle}[1]{\def\@Booktitle{#1}}
\newcommand{\Bookauthor}[1]{\def\@Bookauthor{#1}}
\newcommand{\Publisher}[1]{\def\@Publisher{#1}}
\newcommand{\Pubaddress}[1]{\def\@Pubaddress{#1}}
\newcommand{\Pubyear}[1]{\def\@Pubyear{#1}}
\newcommand{\ISBN}[1]{\def\@ISBN{#1}}
\newcommand{\Pages}[1]{\def\@Pages{#1}}
\newcommand{\Price}[1]{\def\@Price{#1}}
\newcommand{\Plainreviewer}[1]{\def\@Plainreviewer{#1}}
\newcommand{\Softwaretitle}[1]{\def\@Softwaretitle{#1}}
\newcommand{\URL}[1]{\def\@URL{#1}}
\newcommand{\DOI}[1]{\def\@DOI{#1}}
%% for internal use
\newcommand{\Seriesname}[1]{\def\@Seriesname{#1}}
%\newcommand{\Pages}[1]{\def\@Pages{#1}}
\newcommand{\Hypersubject}[1]{\def\@Hypersubject{#1}}
\newcommand{\Hyperauthor}[1]{\def\@Hyperauthor{#1}}
\newcommand{\Footername}[1]{\def\@Footername{#1}}
\newcommand{\Firstdate}[1]{\def\@Firstdate{#1}}
\newcommand{\Seconddate}[1]{\def\@Seconddate{#1}}
\newcommand{\Reviewauthor}[1]{\def\@Reviewauthor{#1}}

\usepackage{booktabs}
%% defaults
\author{Firstname Lastname\\Affiliation}
\title{Title}
\Abstract{---!!!---an abstract is required---!!!---}
\Plainauthor{\@author}
\Volume{VV}
\Year{YYYY}
\Month{MMMMMM}
\Issue{II}
\Submitdate{yyyy-mm-dd}
\Acceptdate{yyyy-mm-dd}
\Address{
  Firstname Lastname\\
  Affiliation\\
  Address, Country\\
  E-mail: \email{name@address}\\
  URL: \url{http://link/to/webpage/}
}

\Reviewer{Firstname Lastname\\Affiliation}
\Plainreviewer{Firstname Lastname}
\Booktitle{Book Title}
\Bookauthor{Book Author}
\Publisher{Publisher}
\Pubaddress{Publisher's Address}
\Pubyear{YYY}
\ISBN{x-xxxxx-xxx-x}
\Pages{xv + 123}
\Price{USD 69.95 (P)}
\URL{http://link/to/webpage/}
	\DOI{10.17713/ajs.v000.i00}
\if@article
  \Seriesname{Issue}
  \Hypersubject{Austrian Journal of Statistics}
  \Plaintitle{\@title}
  \Shorttitle{\@title}
  \Plainkeywords{\@Keywords}
\fi

\if@codesnippet
  \Seriesname{Code Snippet}
  \Hypersubject{Austrian Journal of Statistics -- Code Snippets}
  \Plaintitle{\@title}
  \Shorttitle{\@title}
  \Plainkeywords{\@Keywords}
\fi

\if@bookreview
  \Seriesname{Book Review}
  \Hypersubject{Austrian Journal of Statistics -- Book Reviews}
  \Plaintitle{\@Booktitle}
  \Shorttitle{\@Booktitle}
  \Reviewauthor{\@Bookauthor\\
                \@Publisher, \@Pubaddress, \@Pubyear.\\
                ISBN~\@ISBN. \@Pages~pp. \@Price.\\
                \url{\@URL}}
  \Plainkeywords{}
  \@reviewtrue
\fi

\if@softwarereview
  \Seriesname{Software Review}
  \Hypersubject{Austrian Journal of Statistics -- Software Reviews}
  \Plaintitle{\@Softwaretitle}
  \Shorttitle{\@Softwaretitle}
  \Booktitle{\@Softwaretitle}
  \Reviewauthor{\@Publisher, \@Pubaddress. \@Price.\\
                \url{\@URL}}
  \Plainkeywords{}
  \@reviewtrue
\fi

\if@review
  \Hyperauthor{\@Plainreviewer}
  \Keywords{}
  \Footername{Reviewer}
  \Firstdate{\textit{Published:} \@Submitdate}
  \Seconddate{}
\else
  \Hyperauthor{\@Plainauthor}
  \Keywords{---!!!---at least one keyword is required---!!!---}
  \Footername{Affiliation}
  \Firstdate{\textit{Submitted:} \@Submitdate}
  \Seconddate{\textit{Accepted:} \@Acceptdate}
\fi
%% Sweave(-like)
\DefineVerbatimEnvironment{Sinput}{Verbatim}{fontshape=sl}
\DefineVerbatimEnvironment{Soutput}{Verbatim}{}
\DefineVerbatimEnvironment{Scode}{Verbatim}{fontshape=sl}
\newenvironment{Schunk}{}{}
\DefineVerbatimEnvironment{Code}{Verbatim}{}
\DefineVerbatimEnvironment{CodeInput}{Verbatim}{fontshape=sl}
\DefineVerbatimEnvironment{CodeOutput}{Verbatim}{}
\newenvironment{CodeChunk}{}{}
\setkeys{Gin}{width=0.8\textwidth}
%% footer
\newlength{\footerskip}
\setlength{\footerskip}{2.5\baselineskip plus 2ex minus 0.5ex}

\newcommand{\makefooter}{%
  \vspace{\footerskip}

  \if@nojss
    \begin{samepage}
    \textbf{\large \@Footername: \nopagebreak}\\[.3\baselineskip] \nopagebreak
    \@Address \nopagebreak
    \end{samepage}
  \else
    \begin{samepage}
    \textbf{\large \@Footername: \nopagebreak}\\[.3\baselineskip] \nopagebreak
    \@Address \nopagebreak
    \vfill
    \hrule \nopagebreak
    \vspace{.1\baselineskip}
    {\fontfamily{phv} \fontsize{11}{13} \selectfont Austrian Journal of Statistics}
    \hfill
    \url{http://www.ajs.or.at/}\\ \nopagebreak
    published by the Austrian Society of Statistics
    \hfill
    \url{http://www.osg.or.at/}\\[.3\baselineskip] \nopagebreak
    {Volume~\@Volume , Issue~\@Issue%, \@Seriesname~\@Issue
    }
    \hfill
    \@Firstdate\\ \nopagebreak
    	    {\href{https://doi.org/\@DOI}{\tt doi:\@DOI}}
    %{\@Month{} \@Year}
    \hfill
    \@Seconddate  \nopagebreak
    \vspace{.3\baselineskip}
    \hrule
    \end{samepage}
  \fi
}
\if@nofooter
  %% \AtEndDocument{\makefooter}
\else
  \AtEndDocument{\makefooter}
\fi
%% required packages
\RequirePackage{hyperref}
%% new \maketitle
\def\@myoddhead{
  {\color{white} AJS}\\[-1.42cm]
  \hspace{-2em} %\includegraphics[height=13mm,keepaspectratio]{jsslogo} \hfill
  \parbox[b][23mm]{118mm}{%\hrule height 3pt
%   \center{
   {\fontfamily{phv} \fontsize{11}{13} \selectfont \href{http://www.ajs.or.at}{Austrian Journal of Statistics}}\\
  % \vfill
   {\it \small \@Month{} \@Year, Volume~\@Volume, Issue~\@Issue, \@Pages. \\%, \@Seriesname~\@Issue. \\%
            %\hfill
            \href{http://www.ajs.or.at/}{http://www.ajs.or.at/}}
            %}
            \\[0.1cm] %\vspace{-3cm}
    % \hrule height 3pt
    }
    \parbox[b][3mm]{118mm}{
    %\vspace*{-2cm}
    \href{www.osg.or.at}{\includegraphics[width=0.2\textwidth]{oesg}} \\ \vfill
    }
    }
% \def\@myoddhead{
%   {\color{white} JSS}\\[-1.42cm]		  {\color{white} AJS}\\[-1.42cm]
%   \hspace{-2em} \includegraphics[height=23mm,keepaspectratio]{jsslogo} \hfill		  \hspace{-2em} %\includegraphics[height=13mm,keepaspectratio]{jsslogo} \hfill
%   \parbox[b][23mm]{118mm}{\hrule height 3pt		  \parbox[b][23mm]{118mm}{%\hrule height 3pt
%    \center{		%   \center{
%    {\fontfamily{pzc} \fontsize{28}{32} \selectfont Journal of Statistical Software}		   {\fontfamily{phv} \fontsize{11}{13} \selectfont \href{http://www.ajs.or.at}{Austrian Journal of Statistics}}\\
%    \vfill		  % \vfill
%    {\it \small \@Month{} \@Year, Volume~\@Volume, \@Seriesname~\@Issue.%		   {\it \small \@Month{} \@Year, Volume~\@Volume, \@Pages. \\%, \@Seriesname~\@Issue. \\%
%             \hfill \href{https://doi.org/\@DOI}{doi:\,\@DOI}}}\\[0.1cm]		            %\hfill 
%      \hrule height 3pt}}
\if@review
  \renewcommand{\maketitle}{
  \if@nojss
    %% \@oddhead{\@myoddhead}\\[3\baselineskip]
  \else
    \@oddhead{\@myoddhead}\\[3\baselineskip]
  \fi
    {\large
    \noindent
    Reviewer: \@Reviewer
    \vspace{\baselineskip}
    \hrule
    \vspace{\baselineskip}
    \textbf{\@Booktitle}
    \begin{quotation} \noindent
    \@Reviewauthor
    \end{quotation}
    \vspace{0.7\baselineskip}
    \hrule
    \vspace{1.3\baselineskip}
    }

    \thispagestyle{empty}
    \if@nojss
      \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hyperauthor}}
    \else
      \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hypersubject}}
    \fi
    \pagestyle{myheadings}
  }
\else
  \def\maketitle{
  \if@nojss
    %% \@oddhead{\@myoddhead} \par
  \else
    \@oddhead{\@myoddhead} \par
  \fi
   \begingroup
     \def\thefootnote{\fnsymbol{footnote}}
     \def\@makefnmark{\hbox to 0pt{$^{\@thefnmark}$\hss}}
     \long\def\@makefntext##1{\parindent 1em\noindent
                              \hbox to1.8em{\hss $\m@th ^{\@thefnmark}$}##1}
     \@maketitle \@thanks
   \endgroup
   \setcounter{footnote}{0}

   \if@noheadings
    %% \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hypersubject}}
    \else
     \thispagestyle{empty}
      \if@nojss
        \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hyperauthor}}
      \else
        \markboth{\centerline{\@Shorttitle}}{\centerline{\@Hypersubject}}
      \fi
     \pagestyle{myheadings}
   \fi

   \let\maketitle\relax \let\@maketitle\relax
   \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax
  }

  \def\@maketitle{\vbox{\hsize\textwidth \linewidth\hsize
  \if@nojss
    %% \vskip 1in
  \else
    \vskip 1in
  \fi
   {\centering
   {\LARGE\bf \@title\par}
   \vskip 0.2in plus 1fil minus 0.1in
   {
       \def\and{\unskip\enspace{\rm and}\enspace}%
       \def\And{\end{tabular}\hss \egroup \hskip 1in plus 2fil
          \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\large\bf\rule{\z@}{24pt}\ignorespaces}%
       \def\AND{\end{tabular}\hss\egroup \hfil\hfil\egroup
          \vskip 0.1in plus 1fil minus 0.05in
          \hbox to \linewidth\bgroup\rule{\z@}{10pt} \hfil\hfil
          \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\large\bf\rule{\z@}{24pt}\ignorespaces}
       \hbox to \linewidth\bgroup\rule{\z@}{10pt} \hfil\hfil
       \hbox to 0pt\bgroup\hss \begin{tabular}[t]{c}\large\bf\rule{\z@}{24pt}\@author
       \end{tabular}\hss\egroup
   \hfil\hfil\egroup}
   \vskip 0.3in minus 0.1in
   \hrule
   \begin{abstract}
   \@Abstract
   \end{abstract}}
   \textit{Keywords}:~\@Keywords.
   \vskip 0.1in minus 0.05in
   \hrule
   \vskip 0.2in minus 0.1in
  }}
\fi
%% sections, subsections, and subsubsections
\newlength{\preXLskip}
\newlength{\preLskip}
\newlength{\preMskip}
\newlength{\preSskip}
\newlength{\postMskip}
\newlength{\postSskip}
\setlength{\preXLskip}{1.8\baselineskip plus 0.5ex minus 0ex}
\setlength{\preLskip}{1.5\baselineskip plus 0.3ex minus 0ex}
\setlength{\preMskip}{1\baselineskip plus 0.2ex minus 0ex}
\setlength{\preSskip}{.8\baselineskip plus 0.2ex minus 0ex}
\setlength{\postMskip}{.5\baselineskip plus 0ex minus 0.1ex}
\setlength{\postSskip}{.3\baselineskip plus 0ex minus 0.1ex}

\newcommand{\jsssec}[2][default]{\vskip \preXLskip%
  \pdfbookmark[1]{#1}{Section.\thesection.#1}%
  \refstepcounter{section}%
  \centerline{\textbf{\Large \thesection. #2}} \nopagebreak
  \vskip \postMskip \nopagebreak}
\newcommand{\jsssecnn}[1]{\vskip \preXLskip%
  \centerline{\textbf{\Large #1}} \nopagebreak
  \vskip \postMskip \nopagebreak}

\newcommand{\jsssubsec}[2][default]{\vskip \preMskip%
  \pdfbookmark[2]{#1}{Subsection.\thesubsection.#1}%
  \refstepcounter{subsection}%
  \textbf{\large \thesubsection. #2} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssubsecnn}[1]{\vskip \preMskip%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}

\newcommand{\jsssubsubsec}[2][default]{\vskip \preSskip%
  \pdfbookmark[3]{#1}{Subsubsection.\thesubsubsection.#1}%
  \refstepcounter{subsubsection}%
  {\large \textit{#2}} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssubsubsecnn}[1]{\vskip \preSskip%
  {\textit{\large #1}} \nopagebreak
  \vskip \postSskip \nopagebreak}

\newcommand{\jsssimplesec}[2][default]{\vskip \preLskip%
%%  \pdfbookmark[1]{#1}{Section.\thesection.#1}%
  \refstepcounter{section}%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}
\newcommand{\jsssimplesecnn}[1]{\vskip \preLskip%
  \textbf{\large #1} \nopagebreak
  \vskip \postSskip \nopagebreak}

\if@review
  \renewcommand{\section}{\secdef \jsssimplesec \jsssimplesecnn}
  \renewcommand{\subsection}{\secdef \jsssimplesec \jsssimplesecnn}
  \renewcommand{\subsubsection}{\secdef \jsssimplesec \jsssimplesecnn}
\else
  \renewcommand{\section}{\secdef \jsssec \jsssecnn}
  \renewcommand{\subsection}{\secdef \jsssubsec \jsssubsecnn}
  \renewcommand{\subsubsection}{\secdef \jsssubsubsec \jsssubsubsecnn}
\fi
%% colors
\definecolor{Red}{rgb}{0.5,0,0}
\definecolor{Blue}{rgb}{0,0,0.5}
\if@review
  \hypersetup{%
    hyperindex = {true},
    colorlinks = {true},
    linktocpage = {true},
    plainpages = {false},
    linkcolor = {Blue},
    citecolor = {Blue},
    urlcolor = {Red},
    pdfstartview = {Fit},
    pdfpagemode = {None},
    pdfview = {XYZ null null null}
  }
\else
  \hypersetup{%
    hyperindex = {true},
    colorlinks = {true},
    linktocpage = {true},
    plainpages = {false},
    linkcolor = {Blue},
    citecolor = {Blue},
    urlcolor = {Red},
    pdfstartview = {Fit},
    pdfpagemode = {UseOutlines},
    pdfview = {XYZ null null null}
  }
\fi
\if@nojss
  \AtBeginDocument{
    \hypersetup{%
      pdfauthor = {\@Hyperauthor},
      pdftitle = {\@Plaintitle},
      pdfkeywords = {\@Plainkeywords}
    }
  }
\else
  \AtBeginDocument{
    \hypersetup{%
      pdfauthor = {\@Hyperauthor},
      pdftitle = {\@Plaintitle},
      pdfsubject = {\@Hypersubject},
      pdfkeywords = {\@Plainkeywords}
    }
  }
\fi
\if@notitle
  %% \AtBeginDocument{\maketitle}
\else
  \AtBeginDocument{\maketitle}
  %\@ifundefined{AddToHook}{\AtBeginDocument{\maketitle}}{\AddToHook{begindocument}[maketitle]{\maketitle}}
\fi
%% commands
\newcommand\code{\bgroup\@makeother\_\@makeother\~\@makeother\$\@codex}
\def\@codex#1{{\normalfont\ttfamily\hyphenchar\font=-1 #1}\egroup}
%%\let\code=\texttt
\let\proglang=\textsf
\newcommand{\pkg}[1]{{\fontseries{b}\selectfont #1}}
\newcommand{\email}[1]{\href{mailto:#1}{\normalfont\texttt{#1}}}
\ifx\csname urlstyle\endcsname\relax
  \newcommand\@doi[1]{doi:\discretionary{}{}{}#1}\else
  \newcommand\@doi{doi:\discretionary{}{}{}\begingroup
\urlstyle{tt}\Url}\fi
\newcommand{\doi}[1]{\href{http://dx.doi.org/#1}{\normalfont\texttt{\@doi{#1}}}}
\newcommand{\E}{\mathsf{E}}
\newcommand{\VAR}{\mathsf{VAR}}
\newcommand{\COV}{\mathsf{COV}}
\newcommand{\Prob}{\mathsf{P}}
\endinput
%%
%% End of file `jss.cls'.
