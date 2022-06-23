% Journal of Data Science document class file
% v0.1.4 for LaTeX 2e
%
% Copyright (C) 2020 Journal of Data Science Editorial Office
% Developed by Wenjie Wang <https://wenjie-stat.me>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   <http://www.latex-project.org/lppl.txt>
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Wenjie Wang.
%
% This work consists of the file jds.cls.
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jds}[2020/07/13 v0.1.4 Journal of Data Science document class]

% options
\newif\if@review
\newif\if@inpress
\newif\if@discussion
\newif\if@chinese
\newif\if@linenumber

% defaults
\@reviewtrue
\@inpressfalse
\@discussionfalse
\@chinesefalse
\@linenumberfalse

% only one of review and inpress can be true
\DeclareOption{review}{\@reviewtrue \@inpressfalse \@linenumbertrue}
\DeclareOption{inpress}{\@reviewfalse \@inpresstrue}
\DeclareOption{discussion}{\@discussiontrue}
\DeclareOption{chinese}{\@chinesetrue \@discussiontrue}
\DeclareOption{linenumber}{\@linenumbertrue}

% other options from article.cls
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}

\ProcessOptions

\if@review
\LoadClass[12pt,twoside]{article}
\RequirePackage{setspace}
\doublespacing
% \renewcommand{\baselinestretch}{1.8}
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
% end of \if@review
\else
\LoadClass[11pt,twoside]{article}
\RequirePackage[left=1.1in,right=1.1in,top=1.1in,bottom=1.1in]{geometry}
% end of \if@inpress
\fi

\if@discussion
\gdef\disfirstpage{0}
\fi

\if@chinese
%% By default, scheme = chinese, which changes line space and font size.
%% see the manual of ctex package for details
\RequirePackage[UTF8,heading=true,scheme=plain]{ctex}
\ctexset{
  autoindent = true,
  part/afterindent = true,
  % chapter/afterindent = true,
  section/afterindent = true,
  subsection/afterindent = true,
  subsubsection/afterindent = true,
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
  contentsname = {目录},
  listfigurename = {插图},
  indexname = {索引},
  abstractname = {摘要},
  figurename = {图},
  tablename = {表},
  appendixname = {附录},
  bibname = {参考文献},
  proofname = {证明}
  % algorithmname = {算法}
}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\gdef\@pageprefix{S}
\else
\gdef\@pageprefix{}
\fi

%% reference: biom.cls for short title
\def\title{\@ifnextchar [{\@titletwo}{\@titleone}}
\def\@titletwo[#1]#2{\gdef\@title{{#2}}\gdef\@shorttitle{{#1}}}
\def\@titleone#1{\gdef\@title{{#1}}\gdef\@shorttitle{{#1}}}

%% revised maketitle of article.cls
%% without resetting title etc
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    % \if@twocolumn
    %   \ifnum \col@number=\@ne
    %     \@maketitle
    %   \else
    %     \twocolumn[\@maketitle]%
    %   \fi
    % \else
    \if@discussion
      %% for discussion, only show first page header style once
      \if\disfirstpage0
        \thispagestyle{firstpage}
        \gdef\disfirstpage{1}
        \xdef\@discussionfirstpage{\thepage}
      \else
        \if@chinese
          \gdef\disfirstpage{2}
          \thispagestyle{chfirstpage}
        \else
           \thispagestyle{doipage}
        \fi
      \fi
    \else
      \newpage
      \thispagestyle{firstpage}
    \fi
    %% Prevents figures from going at top of page.
    \global\@topnum\z@
    \@maketitle
    % \fi
    \@thanks
  \endgroup
  %% reset all default counters
  \setcounter{part}{0}
  % \setcounter{chapter}{0}
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \setcounter{paragraph}{0}
  \setcounter{subparagraph}{0}
  % \setcounter{page}{0}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{footnote}{0}
  \setcounter{mpfootnote}{0}
  % for the enumerate environment
  \setcounter{enumi}{0}
  \setcounter{enumii}{0}
  \setcounter{enumiii}{0}
  \setcounter{enumiv}{0}
  % for the eqnarray environment
  \setcounter{equation}{0}
  %% reset thanks
  \global\let\@thanks\@empty
  %% set running head be authors
  \ifx\@shortauthors\empty
    \runningauthors
  \fi
}
\def\@maketitle{%
  \if@discussion
  % do nothing
  \else
    \newpage
  \fi
  % \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\Large\textbf\@title \par}%
    \vskip 1.5em%
    {\normalsize
      \lineskip0.5em%
      \begin{tabular}[t]{c}%
        \baselineskip0.5em
        \@author
      \end{tabular}\par}%
    % \vskip 0.5em%
    % {\large \@date}%
  \end{center}%
  % \par
  % \vskip 0.5em
}

\renewenvironment{abstract}
{%
  % \@beginparpenalty\@lowpenalty
  \begin{center}%
    \if@chinese
      \if\disfirstpage1
        \bfseries Abstract
      \else
        \bfseries \abstractname
      \fi
    \else
      \bfseries Abstract
    \fi
    % \@endparpenalty
  \end{center}
}
{\par}

\newcommand\keywordsname{
  \gdef\@keywordsname{Keywords}
  \if@chinese
    \if\disfirstpage2
    \gdef\@keywordsname{关键词}
    \fi
  \fi
}
\newenvironment{keywords}
{\keywordsname\medskip\noindent\textbf{\@keywordsname}\,\begin{itshape}}
{\end{itshape}}

\newcommand\jdsreceived{\gdef\@jdsreceived}
\newcommand\jdsaccepted{\gdef\@jdsaccepted}
\jdsreceived{}
\jdsaccepted{}


% packages
\RequirePackage{graphicx}
\RequirePackage{color}

%% need cm-super package for a better font looking
\RequirePackage[T1]{fontenc}

\RequirePackage[colorlinks=true,citecolor=blue]{hyperref}
\RequirePackage[authoryear,round]{natbib}
\RequirePackage{refcount}
\RequirePackage{lastpage}

\RequirePackage{enumitem}
\setlist{nosep, leftmargin=1.5em, labelwidth=0.25em}
\raggedbottom

\RequirePackage[noblocks]{authblk}
\setlength{\affilsep}{0.5em}
\renewcommand\Authfont{\sc} %\bf\scshape}
\renewcommand\Affilfont{\mdseries\slshape\small}

% for running head of author information
\newcommand\runningauthors{%
  \begingroup
  \let\thanks\@gobble% ignore \thanks
  \let\footnote\@gobble% ignore \footnote
  \let\textsuperscript\@gobble% ignore protected \textsuperscript
  \expandafter\let\csname textsuperscript \endcsname\@gobble
  \def\Authfont{}% do not use a special font
  \xdef\@shortauthors{\AB@authlist}
  \endgroup
}
\newcommand\shortauthors{\gdef\@shortauthors}
\shortauthors{}

\if@discussion
\RequirePackage{subfiles}
\if@chinese
  \relax
\else
  \RequirePackage{bibunits}
  \defaultbibliographystyle{jds} % chicago}
\fi
\def\jdsrule{
  \if@chinese
    \newpage
    \renewcommand\Authsep{，}
    \renewcommand\Authand{，}
    \renewcommand\Authands{，}
    \if@inpress
      \onehalfspacing
    \fi
  \else
    \if@discussion
      \label{\@jdsdoi}
    \fi
    % \newdimen\spaceleft
    % \spaceleft=\dimexpr\textheight-\pagetotal\relax
    % \ifdim\spaceleft>20\baselineskip
    %   \bigskip
    %   \noindent\rule{\textwidth}{1.5pt}
    % \else
      \newpage
    % \fi
  \fi
  % reset author and affiliation block
  \global\let\AB@authors\@empty
  \global\let\AB@authlist\@empty
  \global\let\AB@affillist\@empty
  \shortauthors{}
  \setcounter{authors}{0}
}
\fi

% \RequirePackage{amsmath}
% \numberwithin{equation}{section}

\newcommand\jdsvolume{\gdef\@jdsvolume}
\jdsvolume{xx}
\newcommand\jdsissue{\gdef\@jdsissue}
\jdsissue{xx}
\newcommand\jdsmonth{\gdef\@jdsmonth}
\jdsmonth{July}

\newcommand\jdsyear{\gdef\@jdsyear}
\jdsyear{2020}
\newcommand\jdsdoi{\gdef\@jdsdoi}
\jdsdoi{xx.xxxx/xxxxxxxx}

% define more for Chinese title page
\if@chinese
\newcommand\jdsmonthnum{\gdef\@jdsmonthnum}
\jdsmonthnum{7}
\newcommand\jdsreceivedch{\gdef\@jdsreceivedch}
\newcommand\jdsacceptedch{\gdef\@jdsacceptedch}
\jdsreceivedch{}
\jdsacceptedch{}
\fi

% defaults
\title{My JDS Paper Title}
\newcommand\shorttitle{\gdef\@shorttitle}
\shorttitle{\@title}

%% define header and footer
\RequirePackage{fancyhdr}
\setlength{\headheight}{24pt}
\pagestyle{fancy}
\fancyhead{} % clear all header fields
\fancyhead[CO]{\textit \@shorttitle}
\fancyhead[CE]{\textit \@shortauthors}
\fancyhead[LE,RO]{\@pageprefix\thepage}
\fancyfoot{} % clear all footer fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{firstpage}{%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhf{}%
  \fancyhead[L]{\footnotesize {\scshape Journal of Data Science}
    \@jdsvolume\ (\@jdsissue),
    \IfRefUndefinedExpandable{\@jdsdoi}{
      \@pageprefix\thepage--\@pageprefix\pageref*{LastPage}\\
    }{
      \@pageprefix\thepage--\@pageprefix\pageref*{\@jdsdoi}\\
    }
    \@jdsmonth\ \@jdsyear
  }
  \fancyhead[R]{\footnotesize DOI:\ \@jdsdoi\\}
  \fancyfoot[LE,RO]{\@pageprefix\thepage}% number of the first page
  \fancyfoot[RE,LO]{\footnotesize
    \ifx\@jdsreceived\empty
    \else
      \ifx\@jdsaccepted\empty
      \else
        Received \@jdsreceived; Accepted \@jdsaccepted
      \fi
    \fi
  }
}
\if@discussion
\fancypagestyle{doipage}{%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhf{}%
  \fancyhead[L]{\footnotesize {\scshape Journal of Data Science}
    \@jdsvolume\ (\@jdsissue),
    % \@discussionfirstpage--\pageref*{LastPage}\\
    \IfRefUndefinedExpandable{\@jdsdoi}{
      \@pageprefix\thepage--\pageref*{LastPage}\\
    }{
      \@pageprefix\thepage--\pageref*{\@jdsdoi}\\
    }
    \@jdsmonth\ \@jdsyear
  }
  \fancyhead[R]{\footnotesize DOI:\ \@jdsdoi\\}
  \fancyfoot[LE,RO]{\@pageprefix\thepage}% number of the page
}
\fi
\if@chinese
\fancypagestyle{chfirstpage}{%
  \renewcommand{\headrulewidth}{0pt}%
  \fancyhf{}%
  \fancyhead[L]{\footnotesize {\scshape Journal of Data Science}
    \@jdsvolume\ (\@jdsissue),
    \@pageprefix\@discussionfirstpage--\@pageprefix\pageref*{LastPage}\\
    \@jdsyear 年 \@jdsmonthnum 月
  }
  \fancyhead[R]{\footnotesize DOI:\ \@jdsdoi\\}
  \fancyfoot[LE,RO]{\@pageprefix\thepage}% number of the first page
  \fancyfoot[RE,LO]{\footnotesize
    \ifx\@jdsreceivedch\empty
    \else
      \ifx\@jdsacceptedch\empty
      \else
        投稿于 \@jdsreceivedch; 接收于 \@jdsacceptedch
      \fi
    \fi
  }
}
\fi

\if@linenumber
\RequirePackage[pagewise,mathlines]{lineno}
\linenumbers*[1]
%% patches to make lineno work better with amsmath
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
}
\fi

\setlength{\parskip}{0ex plus0.1ex minus0.1ex}
\setlength{\parindent}{2em}
\setlength{\bibsep}{0em}

%% taken and modified from jss.dtx
\let\code\texttt
\let\proglang\textsf
\newcommand{\pkg}[1]{{\fontshape{it}\selectfont #1}}

% control floats
% \renewcommand\floatpagefraction{.95}
% \renewcommand\topfraction{.95}
% \renewcommand\bottomfraction{.95}
% \renewcommand\textfraction{.1}
% \setcounter{totalnumber}{50}
% \setcounter{topnumber}{50}
% \setcounter{bottomnumber}{50}


\endinput
