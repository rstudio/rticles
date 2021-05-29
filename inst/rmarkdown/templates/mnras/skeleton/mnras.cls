% mnras.cls
%
% MNRAS journal document class file
% v3.0 for LaTeX 2e
%
% Copyright (C) Royal Astronomical Society 2015, Blackwell Science 2001,
% Cambridge University Press 1994
%
% Authors:
% David Rhead, Springer Verlag, M. Reed, Sue Brooks, Alison Woollatt,
% Mark Reed, Nadine Thompson, John Thompson, David Evans, Keith T. Smith,
% Norman Gray
%
% For a full change log see the end of this file.
% See mnras_guide for a user guide
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `author-maintained'.
% 
% The Current Maintainer of this work is: Royal Astronomical Society,
% MNRAS Editorial Office, who can be contacted on mn@ras.org.uk
%
% This work consists of all the files listed in readme.txt


% Preamble to this style file

\def\@version{3.0}
\def\@releasedate{2015/05/22}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mnras}[\@releasedate\ v\@version\ LaTeX2e MNRAS document class]

\typeout{MNRAS document style v\@version, released \@releasedate}

%  Journals use two-sided printing.
%
\@twosidetrue
\@twocolumntrue
\@mparswitchtrue
\def\ds@draft{\overfullrule 5pt}
\def\ds@twocolumn{\@twocolumntrue}
\def\ds@onecolumn{\@twocolumnfalse}

% letters option
%
\newif\if@letters
\def\ds@letters{\@letterstrue}

% landscape option
%
\newif\ifSFB@landscape
\def\ds@landscape{\SFB@landscapetrue}

% galley option
%
\newif\ifSFB@galley
\def\ds@galley{\SFB@galleytrue}

% usenatbib option
%
\newif\if@usenatbib
\def\ds@usenatbib{\@usenatbibtrue}

% usedcolumn option
%
\newif\if@usedcolumn
\def\ds@usedcolumn{\@usedcolumntrue}

% usegraphicx option
\newif\if@usegraphicx
\def\ds@usegraphicx{\@usegraphicxtrue\usepackage{graphicx}}

% referee option
%
\newif\ifSFB@referee
\def\ds@referee{%
 \SFB@refereetrue
 \@twocolumnfalse
}
\newif\ifdoublesp@cing
\def\ds@doublespacing{%
 \doublesp@cingtrue
}%
%%%
%%% NHT: New AMS fonts option
%%%
\newif\ifNHT@useAMS
\def\ds@useAMS{\NHT@useAMStrue}
%

% Prevent fleqn throwing an 'unknown option' warning
\newif\if@fleqn
\def\ds@fleqn{\@fleqntrue}

% Silently execute these options. I'm not convinced this actually does anything.
\ExecuteOptions{a4paper,twoside,final,fleqn}
% \ExecuteOptions{twoside,final,fleqn}

% Throw warning if the user tries to use US Letter paper
\newif\if@letterpaper
\def\ds@letterpaper{\PackageWarning{mnras}{MNRAS uses A4 paper, option 'letterpaper' is ignored}}

% Error message for unknown options
\DeclareOption*{\PackageWarning{mnras}{Unknown option `\CurrentOption'}}

\ProcessOptions\relax

% Before we do anything else with layout, ensure that the paper is A4
\usepackage[a4paper]{geometry}
%%
\setlength\paperwidth{210mm}%
\setlength\paperheight{276mm}%
%%

% Fix several errors with LaTeX2e, including 2-column floats out of order
% \usepackage{fixltx2e}  %% Unnecessary since TL2015

% Include hyperref, so we can have clickable links
\usepackage[pdfpagelabels=false]{hyperref}	% Hyperlinks
\hypersetup{colorlinks=true,linkcolor=blue,citecolor=blue,filecolor=blue,urlcolor=blue,}
%
%  ****************************************
%  *              Font sizes              *
%  ****************************************
%  Note these are misleadingly named - most text is not in \normalsize etc.

\lineskip 1pt
\normallineskip 1pt
\ifSFB@referee
  \def\baselinestretch{1.5}
\else
  \ifdoublesp@cing
  \def\baselinestretch{2}
\else
  \def\baselinestretch{1}
\fi\fi
\if@twocolumn
  \renewcommand\normalsize{\@setfontsize\normalsize\@ixpt{11}%
   \abovedisplayskip 6pt plus 2pt minus 2pt
   \belowdisplayskip \abovedisplayskip
   \abovedisplayshortskip 6pt plus 2pt
   \belowdisplayshortskip \abovedisplayshortskip
   \let\@listi\@listI}
 \else
 \ifSFB@referee
  \renewcommand\normalsize{\@setfontsize\normalsize\@xiipt{14}%
   \abovedisplayskip 4pt plus 1pt minus 1pt
   \belowdisplayskip \abovedisplayskip
   \abovedisplayshortskip 4pt plus 1pt
   \belowdisplayshortskip \abovedisplayshortskip
   \let\@listi\@listI}
 \else
 \renewcommand\normalsize{\@setfontsize\normalsize\@ixpt{12}%
   \abovedisplayskip 4pt plus 1pt minus 1pt
   \belowdisplayskip \abovedisplayskip
   \abovedisplayshortskip 4pt plus 1pt
   \belowdisplayshortskip \abovedisplayshortskip
   \let\@listi\@listI}
 \fi
\fi
\newcommand\small{\@setfontsize\small\@viiipt{10}%
 \abovedisplayskip 4pt plus 1pt minus 1pt
 \belowdisplayskip \abovedisplayskip
 \abovedisplayshortskip 4pt plus 1pt
 \belowdisplayshortskip \abovedisplayshortskip
 \def\@listi{\leftmargin\leftmargini
  \topsep 2pt plus 1pt minus 1pt
  \parsep \z@
  \itemsep 2pt}}
\newcommand\footnotesize{\@setfontsize\footnotesize\@viiipt{10}%
 \abovedisplayskip 4pt plus 1pt minus 1pt
 \belowdisplayskip \abovedisplayskip
 \abovedisplayshortskip 4pt plus 1pt
 \belowdisplayshortskip \abovedisplayshortskip
 \renewcommand\@listi{\leftmargin\leftmargini
  \topsep 2pt plus 1pt minus 1pt
  \parsep \z@
  \itemsep 2pt}}
\newcommand\scriptsize{\@setfontsize\scriptsize\@vipt{8}}
\newcommand\tiny{\@setfontsize\tiny\@vpt{6}}
%
%%new font for            abstract/keywords
\def\@xivpt{14}
\def\@xiipt{12}
\def\@xvipt{16}
\newcommand\abslarge{\@setfontsize\abslarge\@xpt{12.5}}
%%
\if@twocolumn
   \newcommand\large{\@setfontsize\large\@xpt{11}}
 \else
  \newcommand\large{\@setfontsize\large\@xpt{12}}
 \fi
\newcommand\Large{\@setfontsize\Large\@xiipt{14}}
%%\newcommand\LARGE{\@setfontsize\LARGE\@xivpt{17}}
\newcommand\LARGE{\@setfontsize\LARGE\@xiipt{15}}
%%\newcommand\huge{\@setfontsize\huge\@xviipt{20}}
\newcommand\huge{\@setfontsize\huge\@xvipt{18}}
\newcommand\Huge{\@setfontsize\Huge\@xxpt{25}}
%
\newcommand\sevensize{\@setfontsize\sevensize\@viipt{8}}
%
\normalsize

%%%%%%%%%%%%%%%%%%%%%%%% Extra Math / Symbol code %%%%%%%%%%%%%%%%%%%%%%%%

  \newcommand{\rmn}[1]{{\mathrm{#1}}}
  \newcommand{\itl}[1]{{\mathit{#1}}}
  \newcommand{\bld}[1]{{\mathbf{#1}}}

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand\cal{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand\mit{\@fontswitch{\relax}{\mathchoice}}
%

\def\hexnumber#1{\ifcase#1 0\or1\or2\or3\or4\or5\or6\or7%
  \or8\or9\or A\or B\or C\or D\or E\or F\fi}

\def\setboxz@h{\setbox\z@\hbox}
\def\wdz@{\wd\z@}
\def\boxz@{\box\z@}
\def\setbox@ne{\setbox\@ne}
\def\wd@ne{\wd\@ne}

\def\math@atom#1#2{%
   \binrel@{#1}\binrel@@{#2}}
\def\binrel@#1{\setboxz@h{\thinmuskip0mu
  \medmuskip\m@ne mu\thickmuskip\@ne mu$#1\m@th$}%
 \setbox@ne\hbox{\thinmuskip0mu\medmuskip\m@ne mu\thickmuskip
  \@ne mu${}#1{}\m@th$}%
 \setbox\tw@\hbox{\hskip\wd@ne\hskip-\wdz@}}
\def\binrel@@#1{\ifdim\wd2<\z@\mathbin{#1}\else\ifdim\wd\tw@>\z@
 \mathrel{#1}\else{#1}\fi\fi}

% These must be here because \newif and \newtoks are defined \outer.
\newif\iffirstta
\newtoks\math@groups
\newif\ifd@f


% Make these do nothing (for backwards compatibility}
\let\loadboldmathitalic=\relax
\let\loadboldgreek=\relax

% font definitions for NFSS release 2

\newcommand{\textbfit}[1]{\textbf{\textit{#1}}}
\newcommand{\mathbfit}[1]{\textbf{\textit{#1}}}
\newcommand{\textbfss}[1]{\textbf{\textsf{#1}}}
\newcommand{\mathbfss}[1]{\textbf{\textsf{#1}}}

  %
  \def\mathch{\protect\p@mathch}
  \def\p@mathch#1#2{%
    \begingroup
    \let\@nomath\@gobble \mathversion{#1}%
    \math@atom{#2}{%
    \mathchoice%
      {\hbox{$\m@th\displaystyle#2$}}%
      {\hbox{$\m@th\textstyle#2$}}%
      {\hbox{$\m@th\scriptstyle#2$}}%
      {\hbox{$\m@th\scriptscriptstyle#2$}}}%
  \endgroup}
  %
  \def\bmath{\protect\p@boldm}
  \def\p@boldm#1{\mathch{bold}{#1}}
%

  \let\mit=\mathnormal
  %
  % The following is needed because NFSS release 2
  % does not define the bold
  % math symbol font to be available!
  %
  \SetSymbolFont{symbols}{bold}{OMS}{cmsy}{b}{n}
  %
  \DeclareSymbolFont{bmisymbols}{OML}{cmm}{b}{it}
  \DeclareMathSymbol{\balpha}{0}{bmisymbols}{"0B}
  \DeclareMathSymbol{\bbeta}{0}{bmisymbols}{"0C}
  \DeclareMathSymbol{\bgamma}{0}{bmisymbols}{"0D}
  \DeclareMathSymbol{\bdelta}{0}{bmisymbols}{"0E}
  \DeclareMathSymbol{\bepsilon}{0}{bmisymbols}{"0F}
  \DeclareMathSymbol{\bzeta}{0}{bmisymbols}{"10}
  \DeclareMathSymbol{\boldeta}{0}{bmisymbols}{"11}
  \DeclareMathSymbol{\btheta}{0}{bmisymbols}{"12}
  \DeclareMathSymbol{\biota}{0}{bmisymbols}{"13}
  \DeclareMathSymbol{\bkappa}{0}{bmisymbols}{"14}
  \DeclareMathSymbol{\blambda}{0}{bmisymbols}{"15}
  \DeclareMathSymbol{\bmu}{0}{bmisymbols}{"16}
  \DeclareMathSymbol{\bnu}{0}{bmisymbols}{"17}
  \DeclareMathSymbol{\bxi}{0}{bmisymbols}{"18}
  \DeclareMathSymbol{\bpi}{0}{bmisymbols}{"19}
  \DeclareMathSymbol{\brho}{0}{bmisymbols}{"1A}
  \DeclareMathSymbol{\bsigma}{0}{bmisymbols}{"1B}
  \DeclareMathSymbol{\btau}{0}{bmisymbols}{"1C}
  \DeclareMathSymbol{\bupsilon}{0}{bmisymbols}{"1D}
  \DeclareMathSymbol{\bphi}{0}{bmisymbols}{"1E}
  \DeclareMathSymbol{\bchi}{0}{bmisymbols}{"1F}
  \DeclareMathSymbol{\bpsi}{0}{bmisymbols}{"20}
  \DeclareMathSymbol{\bomega}{0}{bmisymbols}{"21}
  \DeclareMathSymbol{\bvarepsilon}{0}{bmisymbols}{"22}
  \DeclareMathSymbol{\bvartheta}{0}{bmisymbols}{"23}
  \DeclareMathSymbol{\bvarpi}{0}{bmisymbols}{"24}
  \DeclareMathSymbol{\bvarrho}{0}{bmisymbols}{"25}
  \DeclareMathSymbol{\bvarsigma}{0}{bmisymbols}{"26}
  \DeclareMathSymbol{\bvarphi}{0}{bmisymbols}{"27}
  %

%% Define font shapes for Euler upright Math
\ifNHT@useAMS
      \DeclareSymbolFont{UPM}{U}{eur}{m}{n}
      \SetSymbolFont{UPM}{bold}{U}{eur}{b}{n}
      \DeclareSymbolFont{AMSa}{U}{msa}{m}{n}
      \DeclareMathSymbol{\upi}{0}{UPM}{"19}
      \DeclareMathSymbol{\umu}{0}{UPM}{"16}
      \DeclareMathSymbol{\upartial}{0}{UPM}{"40}
      \DeclareMathSymbol{\leqslant}{3}{AMSa}{"36}
      \DeclareMathSymbol{\geqslant}{3}{AMSa}{"3E}
      \DeclareMathSymbol{\la}{3}{AMSa}{46}
      \DeclareMathSymbol{\ga}{3}{AMSa}{38}
      %
      \let\oldle=\le     \let\oldleq=\leq
      \let\oldge=\ge     \let\oldgeq=\geq
      \let\leq=\leqslant \let\le=\leqslant
      \let\geq=\geqslant \let\ge=\geqslant

\else
     \newcommand{\upi}{\pi}
     \newcommand{\umu}{\mu}
     \newcommand{\upartial}{\partial}
     \newcommand{\la}{\,\rlap{\raise 0.5ex\hbox{$<$}}{\lower 1.0ex\hbox{$\sim$}}\,}
     \newcommand{\ga}{\,\rlap{\raise 0.5ex\hbox{$>$}}{\lower 1.0ex\hbox{$\sim$}}\,}

\fi

% Astronomy and Astrophysics symbol macros

\newcommand\getsto{\mathrel{\mathchoice {\vcenter{\offinterlineskip
\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr\gets\cr\to\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr\gets
\cr\to\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr\gets
\cr\to\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
\gets\cr\to\cr}}}}}

\newcommand\cor{\mathrel{\mathchoice {\hbox{$\widehat=$}}{\hbox{$\widehat=$}}
{\hbox{$\reset@font\scriptstyle\hat=$}}
{\hbox{$\reset@font\scriptscriptstyle\hat=$}}}}

\newcommand\lid{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr<\cr\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr<\cr
\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr<\cr
\noalign{\vskip1pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
<\cr
\noalign{\vskip0.9pt}=\cr}}}}}

\newcommand\gid{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr>\cr\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr>\cr
\noalign{\vskip1.2pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr>\cr
\noalign{\vskip1pt}=\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
>\cr
\noalign{\vskip0.9pt}=\cr}}}}}

\newcommand\sol{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr\sim\cr<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr\sim\cr
<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr\sim\cr
<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
\sim\cr<\cr}}}}}

\newcommand\sog{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr\sim\cr>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr\sim\cr
>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
\sim\cr>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
\sim\cr>\cr}}}}}

\newcommand\lse{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr<\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr
<\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
<\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
<\cr\simeq\cr}}}}}

\newcommand\gse{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr>\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr
>\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
>\cr\simeq\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
>\cr\simeq\cr}}}}}

\newcommand\grole{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr>\cr\noalign{\vskip-1.5pt}<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr
>\cr\noalign{\vskip-1.5pt}<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
>\cr\noalign{\vskip-1pt}<\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
>\cr\noalign{\vskip-0.5pt}<\cr}}}}}

\newcommand\leogr{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr<\cr\noalign{\vskip-1.5pt}>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr
<\cr\noalign{\vskip-1.5pt}>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
<\cr\noalign{\vskip-1pt}>\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
<\cr\noalign{\vskip-0.5pt}>\cr}}}}}

\newcommand\loa{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr<\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr
<\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
<\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
<\cr\approx\cr}}}}}

\newcommand\goa{\mathrel{\mathchoice {\vcenter{\offinterlineskip\halign{\hfil
$\reset@font\displaystyle##$\hfil\cr>\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\textstyle##$\hfil\cr
>\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptstyle##$\hfil\cr
>\cr\approx\cr}}}
{\vcenter{\offinterlineskip\halign{\hfil$\reset@font\scriptscriptstyle##$\hfil\cr
>\cr\approx\cr}}}}}

\newcommand\sun{\hbox{$\odot$}}
\newcommand\earth{\hbox{$\oplus$}}
\newcommand\degr{\hbox{$^\circ$}}
\newcommand\diameter{{\ifmmode\mathchoice
{\ooalign{\hfil\hbox{$\reset@font\displaystyle/$}\hfil\crcr
{\hbox{$\reset@font\displaystyle\mathchar"20D$}}}}
{\ooalign{\hfil\hbox{$\reset@font\textstyle/$}\hfil\crcr
{\hbox{$\reset@font\textstyle\mathchar"20D$}}}}
{\ooalign{\hfil\hbox{$\reset@font\scriptstyle/$}\hfil\crcr
{\hbox{$\reset@font\scriptstyle\mathchar"20D$}}}}
{\ooalign{\hfil\hbox{$\reset@font\scriptscriptstyle/$}\hfil\crcr
{\hbox{$\reset@font\scriptscriptstyle\mathchar"20D$}}}}
\else{\ooalign{\hfil/\hfil\crcr\mathhexbox20D}}%
\fi}}

\newcommand\sq{\hbox{\rlap{$\sqcap$}$\sqcup$}}

\newcommand{\romn}[1] {{\mathrm #1}}

\newcommand\fd{\hbox{$.\!\!^{\reset@font\romn d}$}}
\newcommand\fh{\hbox{$.\!\!^{\reset@font\romn h}$}}
\newcommand\fm{\hbox{$.\!\!^{\reset@font\romn m}$}}
\newcommand\fs{\hbox{$.\!\!^{\reset@font\romn s}$}}
\newcommand\fdg{\hbox{$.\!\!^\circ$}}
\newcommand\farcm{\hbox{$.\mkern-4mu^\prime$}}
\newcommand\farcs{\hbox{$.\!\!^{\prime\prime}$}}
\newcommand\fp{\hbox{$.\!\!^{\reset@font\reset@font\scriptscriptstyle\romn p}$}}
\newcommand\arcmin{\hbox{$^\prime$}}
\newcommand\arcsec{\hbox{$^{\prime\prime}$}}

\newcommand\micron{\hbox{$\umu$m}}
\newcommand\ion[2]{\text{#1\,\textsc{\lowercase{#2}}}}	% ionization states

% Standard journal abbreviations
% Mostly as used by ADS, with a few additions for journals where MNRAS does not
% follow normal IAU style.

\newcommand\aap{A\&A}                % Astronomy and Astrophysics
\let\astap=\aap                          % alternative shortcut
\newcommand\aapr{A\&ARv}             % Astronomy and Astrophysics Review (the)
\newcommand\aaps{A\&AS}              % Astronomy and Astrophysics Supplement Series
\newcommand\actaa{Acta Astron.}      % Acta Astronomica
\newcommand\afz{Afz}                 % Astrofizika
\newcommand\aj{AJ}                   % Astronomical Journal (the)
\newcommand\ao{Appl. Opt.}           % Applied Optics
\let\applopt=\ao                         % alternative shortcut
\newcommand\aplett{Astrophys.~Lett.} % Astrophysics Letters
\newcommand\apj{ApJ}                 % Astrophysical Journal
\newcommand\apjl{ApJ}                % Astrophysical Journal, Letters
\let\apjlett=\apjl                       % alternative shortcut
\newcommand\apjs{ApJS}               % Astrophysical Journal, Supplement
\let\apjsupp=\apjs                       % alternative shortcut
% The following journal does not appear to exist! Disabled.
%\newcommand\apspr{Astrophys.~Space~Phys.~Res.} % Astrophysics Space Physics Research
\newcommand\apss{Ap\&SS}             % Astrophysics and Space Science
\newcommand\araa{ARA\&A}             % Annual Review of Astronomy and Astrophysics
\newcommand\arep{Astron. Rep.}       % Astronomy Reports
\newcommand\aspc{ASP Conf. Ser.}     % ASP Conference Series
\newcommand\azh{Azh}                 % Astronomicheskii Zhurnal
\newcommand\baas{BAAS}               % Bulletin of the American Astronomical Society
\newcommand\bac{Bull. Astron. Inst. Czechoslovakia} % Bulletin of the Astronomical Institutes of Czechoslovakia 
\newcommand\bain{Bull. Astron. Inst. Netherlands} % Bulletin Astronomical Institute of the Netherlands
\newcommand\caa{Chinese Astron. Astrophys.} % Chinese Astronomy and Astrophysics
\newcommand\cjaa{Chinese J.~Astron. Astrophys.} % Chinese Journal of Astronomy and Astrophysics
\newcommand\fcp{Fundamentals Cosmic Phys.}  % Fundamentals of Cosmic Physics
\newcommand\gca{Geochimica Cosmochimica Acta}   % Geochimica Cosmochimica Acta
\newcommand\grl{Geophys. Res. Lett.} % Geophysics Research Letters
\newcommand\iaucirc{IAU~Circ.}       % IAU Cirulars
\newcommand\icarus{Icarus}           % Icarus
\newcommand\japa{J.~Astrophys. Astron.} % Journal of Astrophysics and Astronomy
\newcommand\jcap{J.~Cosmology Astropart. Phys.} % Journal of Cosmology and Astroparticle Physics
\newcommand\jcp{J.~Chem.~Phys.}      % Journal of Chemical Physics
\newcommand\jgr{J.~Geophys.~Res.}    % Journal of Geophysics Research
\newcommand\jqsrt{J.~Quant. Spectrosc. Radiative Transfer} % Journal of Quantitiative Spectroscopy and Radiative Transfer
\newcommand\jrasc{J.~R.~Astron. Soc. Canada} % Journal of the RAS of Canada
\newcommand\memras{Mem.~RAS}         % Memoirs of the RAS
\newcommand\memsai{Mem. Soc. Astron. Italiana} % Memoire della Societa Astronomica Italiana
\newcommand\mnassa{MNASSA}           % Monthly Notes of the Astronomical Society of Southern Africa
\newcommand\mnras{MNRAS}             % Monthly Notices of the Royal Astronomical Society
\newcommand\na{New~Astron.}          % New Astronomy
\newcommand\nar{New~Astron.~Rev.}    % New Astronomy Review
\newcommand\nat{Nature}              % Nature
\newcommand\nphysa{Nuclear Phys.~A}  % Nuclear Physics A
\newcommand\pra{Phys. Rev.~A}        % Physical Review A: General Physics
\newcommand\prb{Phys. Rev.~B}        % Physical Review B: Solid State
\newcommand\prc{Phys. Rev.~C}        % Physical Review C
\newcommand\prd{Phys. Rev.~D}        % Physical Review D
\newcommand\pre{Phys. Rev.~E}        % Physical Review E
\newcommand\prl{Phys. Rev.~Lett.}    % Physical Review Letters
\newcommand\pasa{Publ. Astron. Soc. Australia}  % Publications of the Astronomical Society of Australia
\newcommand\pasp{PASP}               % Publications of the Astronomical Society of the Pacific
\newcommand\pasj{PASJ}               % Publications of the Astronomical Society of Japan
\newcommand\physrep{Phys.~Rep.}      % Physics Reports
\newcommand\physscr{Phys.~Scr.}      % Physica Scripta
\newcommand\planss{Planet. Space~Sci.} % Planetary Space Science
\newcommand\procspie{Proc.~SPIE}     % Proceedings of the Society of Photo-Optical Instrumentation Engineers
\newcommand\rmxaa{Rev. Mex. Astron. Astrofis.} % Revista Mexicana de Astronomia y Astrofisica
\newcommand\qjras{QJRAS}             % Quarterly Journal of the RAS
\newcommand\sci{Science}             % Science
\newcommand\skytel{Sky \& Telesc.}   % Sky and Telescope
\newcommand\solphys{Sol.~Phys.}      % Solar Physics
\newcommand\sovast{Soviet~Ast.}      % Soviet Astronomy (aka Astronomy Reports)
\newcommand\ssr{Space Sci. Rev.}     % Space Science Reviews
\newcommand\zap{Z.~Astrophys.}       % Zeitschrift fuer Astrophysik

%%%Command to produce a box around selected text
%%%NB This is for use in the file mnras_guide only -- it is NOT
%%%    to be used in the journal
\newcommand{\boxit}[1]{%
 \noindent\fbox{%
   \begin{minipage}[]{84mm}#1\end{minipage}
 }
}

%%%%%%%%%%%%%%%%%%%%% End of Extra Math / Symbol code %%%%%%%%%%%%%%%%%%%%%

%  ****************************************
%  *            PAGE LAYOUT               *
%  ****************************************
%
% SIDE MARGINS:
\if@twocolumn
  \setlength\oddsidemargin{-2.5pc}
  \setlength\evensidemargin{-2.5pc}
\else
 \ifSFB@referee
  \setlength\oddsidemargin{\z@}
  \setlength\evensidemargin{\z@}
 \else
  \setlength\oddsidemargin{-2pc}
  \setlength\evensidemargin{-2pc}
 \fi
\fi
\setlength\marginparwidth{4pc}
\setlength\marginparsep{0.5pc}

% VERTICAL SPACING:
%\if@twocolumn
  \setlength\topmargin{-2pc}
%\else
  \setlength\topmargin{-4pc}
%\fi
\setlength{\headheight}{14pt}
\setlength{\headsep}   {15pt}
\setlength{\topskip}   {9pt}
\setlength{\footskip}  {22pt} %was 26 pt
%
% DIMENSION OF TEXT: % SFB 0.1.01
%
\newdimen\SFB@measure
\SFB@measure 508pt%42pc
%
\setlength\textheight{682pt}
\setlength\textwidth{\SFB@measure}
%
\ifSFB@landscape
 \setlength\textwidth{\textheight}
 \setlength\textheight{\SFB@measure}
\fi
\ifSFB@referee
 \setlength\textwidth{39pc}
\fi
\setlength\columnsep{20pt}%{2pc}
\setlength\columnseprule{0pt}

% FOOTNOTES:
\setlength\footnotesep{6pt}
\setlength\skip{\footins 19.5pt plus 12pt minus 1pt}

% FLOATS:
\setlength\floatsep{ 12pt plus 5.5pt minus 1pt}
\setlength\textfloatsep{ 12pt plus 7.5pt}
\setlength\intextsep{ 12pt plus 5.5pt minus 2pt}
\setlength\dblfloatsep{ 12pt plus 5.5pt minus 2pt }
\setlength\dbltextfloatsep{ 15pt plus 4.5pt minus 3pt}
\setlength\@fptop{ 0pt plus 0fil}
\setlength\@fpsep{ 12pt plus 0fil }
\setlength\@fpbot{ 0pt plus 0fil }
\setlength\@dblfptop{ 0pt plus 0fil}
\setlength\@dblfpsep{ 12pt plus 0fil}
\setlength\@dblfpbot{ 0pt plus 0fil}
\setlength\marginparpush{ 5pt }

%  ****************************************
%  *           PARAGRAPHING               *
%  ****************************************
%
\newlength{\realparindent} % needed for abstract
\setlength\parskip{ \z@ plus .1pt }
\setlength\parindent{9pt}
\setlength{\realparindent}{\parindent}
\setlength\partopsep{ 0pt plus 1pt }
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty -\@lowpenalty
\@itempenalty -\@lowpenalty
\clubpenalty=0
\widowpenalty=10000

%  ****************************************
%  *       PARTS & SECTIONS NUMBERS       *
%  ****************************************
%
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\def\thepart {\arabic{part}}
\def\thesection {\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}

%%%Additional material below is from GJI class file
% Sometimes people want to number equations by section, rather than
% sequentially through the whole paper.

% Removed - \numberwithin{equation}{section} already does this!

%  ****************************************
%  *                PARTS                 *
%  ****************************************
%
\def\part{\par \addvspace{4ex}\@afterindentfalse
 \secdef\@part\@spart}
\def\@part[#1]#2{\ifnum \c@secnumdepth >\m@ne
  \refstepcounter{part}
  \addcontentsline{toc}{part}{Part \thepart: #1}
 \else \addcontentsline{toc}{part}{#1}
 \fi
 {\parindent 0pt \raggedright
  \ifnum \c@secnumdepth >\m@ne
   \reset@font\large\rm PART
   \ifcase\thepart \or ONE \or TWO \or THREE \or FOUR \or FIVE
    \or SIX \or SEVEN \or EIGHT \or NINE \or TEN \else \fi
   \par \nobreak
  \fi
  \reset@font\LARGE \rm #2 \markboth{}{}\par }
 \nobreak \vskip 3ex \@afterheading}
\def\@spart#1{{\parindent 0pt \raggedright
  \reset@font\LARGE \rm #1\par}
 \nobreak \vskip 3ex \@afterheading}

%  ****************************************
%  *               SECTIONS               *
%  ****************************************
%
% \@startsection modified to leave less space before \subsection
%    if it immediately follows \section

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}

\newif\if@levelone

\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifnum #2=\@ne  % if level=1 ie. section
     \global\@levelonetrue
   \else
     \global\@levelonefalse
   \fi
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
   \if@nobreak
     \everypar{}\ifnum#2=2 \vskip 0pt plus1pt\fi % was 6pt
   \else
     \addpenalty{\@secpenalty}\addvspace{\@tempskipa}
   \fi \@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\SFB@hangraggedright{\rightskip=\@flushglue \let\\=\@centercr \parindent=0pt}

\newif\if@firstsection
\@firstsectiontrue
\def\section{%
 \if@firstsection \fixfootnotes\@firstsectionfalse \fi%
 \@startsection{section}{1}{\z@}
 {-24pt plus -12pt minus -1pt}{6pt}
 {\SFB@hangraggedright\reset@font\normalsize\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}
 {-18pt plus -9pt minus -1pt}{6pt}
 {\SFB@hangraggedright\reset@font\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}
 {-18pt plus -9pt minus -1pt}{6pt}
 {\SFB@hangraggedright\reset@font\normalsize\it}}
\def\paragraph{\@startsection{paragraph}{4}{\z@}
 {12pt plus 2.25pt minus 1pt}{-0.5em}{\reset@font\normalsize\bf}}
\def\subparagraph{\@startsection{subparagraph}{5}{\parindent}
 {12pt plus 2.25pt minus 1pt}{-0.5em}{\reset@font\normalsize\it}}
\setcounter{secnumdepth}{4} % SFB 0.1.01
%
% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \def\@svsec{}%
  \else
    \refstepcounter{#1}%
    \if@levelone % is it a \section or \section*
      \ifSFB@appendix
        \edef\@svsec{}%
      \else
        \edef\@svsec{\csname the#1\endcsname\hskip .5em}%
      \fi
    \else
      \edef\@svsec{\csname the#1\endcsname\hskip .5em}%
    \fi
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup #6\relax
    \if@levelone
      \ifSFB@appendix
        \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M
        APPENDIX \csname the#1\endcsname:\hskip 0.5em\uppercase{#8}\par}%
      \else
        \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M
        \uppercase{#8}\par}%
      \fi
    \else
      \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}%
    \fi
  \endgroup
   \csname #1mark\endcsname{#7}%
   \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else %ajw
   \protect\numberline{\csname the#1\endcsname}\fi #7}%ajw
 \else
  \def\@svsechd{#6\hskip #3\@svsec \if@levelone \uppercase{#8}\else #8\fi
  \csname #1mark\endcsname{#7}
  \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else %ajw
  \protect\numberline{\csname the#1\endcsname}\fi#7}%ajw
  }\fi
 \@xsect{#5}}

% from latex.tex
%   \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
    \ifdim \@tempskipa>\z@
      \begingroup #4\@hangfrom{\hskip #1}{%
      \interlinepenalty \@M
      \if@levelone
        \uppercase{#5}%
      \else {#5}%
      \fi\par}%
     \endgroup
    \else
      \def\@svsechd{#4\hskip #1\relax
      \if@levelone
        \uppercase{#5}%
      \else {#5}%
      \fi}
    \fi
  \@xsect{#3}%
}

\newif\ifSFB@appendix
\def\appendix{\par
 \SFB@appendixtrue
 \@addtoreset{equation}{section}
 \@addtoreset{table}{section}
 \@addtoreset{figure}{section}
 \setcounter{section}{0}
 \setcounter{equation}{0}
 \setcounter{figure}{0}
 \setcounter{table}{0}
 \def\thesection{\Alph{section}}
 \renewcommand\thesubsection{\thesection\arabic{subsection}}
 \renewcommand\theequation{\thesection\arabic{equation}}
  \renewcommand\thefigure{\thesection\@arabic\c@figure}
  \renewcommand\thetable{\thesection\@arabic\c@table}
  \renewcommand{\theHsection}{A\arabic{section}} % for hyperref links
}

%  ****************************************
%  *               SKIPS                  *
%  ****************************************
%
\newskip\@indentskip
\newskip\smallindent
\newskip\@footindent
\newskip\@leftskip
\@indentskip=18pt
\smallindent=1.5em
\@footindent=\smallindent
\@leftskip=\z@

%  ****************************************
%  *                LISTS                 *
%  ****************************************
%
\setlength\leftmargini{   \z@ }
\setlength\leftmarginii{  1em }
\setlength\leftmarginiii{ 1em }
\setlength\leftmarginiv{  1em }
\setlength\leftmarginv{  1pc }
\setlength\leftmarginvi{  1pc }
\setlength\leftmargin{\leftmargini}
\setlength\labelsep{ 0.5em}
\labelwidth\leftmargini\advance\labelwidth-\labelsep
%
% label macros for Range-Left and Range-Right labels
\def\makeRLlabel#1{\rlap{#1}\hss}
\def\makeRRlabel#1{\hss\llap{#1}}
\def\makenewlabel#1{#1}
%
\def\@listI{\leftmargin\leftmargini
 \parsep \z@
 \topsep 6pt plus 1pt minus 1pt
 \itemsep \z@ plus .1pt
}
\let\@listi\@listI
\@listi
\def\@listii{\leftmargin\leftmarginii
 \topsep 6pt plus 1pt minus 1pt
 \parsep \z@
 \itemsep \z@ plus .1pt
}
\def\@listiii{\leftmargin\leftmarginiii
 \topsep 6pt plus 1pt minus 1pt
 \parsep \z@
 \partopsep \z@
 \itemsep \topsep
}
\def\@listiv{\leftmargin\leftmarginiv
}
\def\@listv{\leftmargin\leftmarginv
 \labelwidth\leftmarginv\advance\labelwidth-\labelsep
}
\def\@listvi{\leftmargin\leftmarginvi
 \labelwidth\leftmarginvi\advance\labelwidth-\labelsep
}
%
% ITEMIZE
\def\itemize{%
  \ifnum \@itemdepth >3 \@toodeep
  \else \advance\@itemdepth \@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \list{\csname\@itemitem\endcsname}%
   {\let\makelabel\makeRRlabel}%
   \parindent 1em%
   \leftmargin 3.5em\labelsep 0.5em\itemindent 2.0em\labelwidth 0.5em%
  \fi}
\def\labelitemi{$\bullet$}
\def\labelitemii{--}
\def\labelitemiii{$\cdot$}
\def\labelitemiv{*}
%
% ENUMERATE
% SFB -- enumerate with optional argument to set left margin...
\def\enumerate{\ifnum \@enumdepth >3 \@toodeep \else
  \advance\@enumdepth \@ne
  \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
 \fi
 \@ifnextchar [{\@enumeratetwo}{\@enumerateone}%
}
\def\@enumeratetwo[#1]{%
 \list{\csname label\@enumctr\endcsname}%
  {\settowidth\labelwidth{[#1]}
   \leftmargin\z@
   \listparindent 1em
   \usecounter{\@enumctr}
   \let\makelabel\makenewlabel}
}
\def\@enumerateone{%
 \list{\csname label\@enumctr\endcsname}%
  {\usecounter{\@enumctr}\itemindent 1em\listparindent 1em
   \let\makelabel\makenewlabel}}
%
\def\labelenumi{\theenumi}
\def\theenumi{(\roman{enumi})}
\def\labelenumii{\theenumii}
\def\theenumii{(\alph{enumii})}
\def\p@enumii{\theenumi}
\def\labelenumiii{\theenumiii}
\def\theenumiii{(\arabic{enumiii})}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{\theenumiv}
\def\theenumiv{(\Alph{enumiv})}
\def\p@enumiv{\p@enumiii\theenumiii}
%
% DESCRIPTION
\def\descriptionlabel#1{\reset@font\bf #1}
\def\description{\list{}{\labelwidth\z@
  \leftmargin \z@
  \itemindent 1em
}}
\let\enddescription\endlist

%  ****************************************
%  *            DISPLAYED TEXT            *
%  ****************************************
%
% VERSE
\def\verse{\let\\=\@centercr
 \list{}{\itemsep\z@
  \itemindent -\@indentskip
  \listparindent \itemindent
  \rightmargin\leftmargin
  \advance\leftmargin \@indentskip}\item[]}
\let\endverse\endlist
%
% QUOTATION
\def\quotation{\list{}{\listparindent \smallindent
%  \itemindent\listparindent
  \leftmargin\z@\rightmargin\leftmargin
  \parsep 0pt plus 1pt}\item[]\reset@font\small}
\let\endquotation=\endlist
%
% QUOTE
\def\quote{\list{}{\leftmargin\z@\rightmargin\leftmargin}\item[]%
  \reset@font\small}
\let\endquote=\endlist
%
% BSL QUOTE
\newenvironment{lquote}{\begin{list}{}%
  {\setlength{\leftmargin}{2em}}
  \item[]}
  {\end{list}}
%
%  ****************************************
%  *         OTHER ENVIRONMENTS           *
%  ****************************************
%
% THEOREM
\def\@begintheorem#1#2{\reset@font\rm \trivlist \item[\hskip \labelsep
  {\reset@font\bf #1\ #2.}]}
\def\@opargbegintheorem#1#2#3{\reset@font\rm \trivlist
  \item[\hskip \labelsep{\reset@font\bf #1\ #2.\ (#3)}]}
\def\@endtheorem{\endtrivlist}
%
% PROOF
\def\proof{\reset@font\rm \trivlist \item[\hskip \labelsep
  {\reset@font\it Proof.}]}
\def\endproof{\hspace*{1em}{\begin{picture}(6.5,6.5)%
  \put(0,0){\framebox(6.5,6.5){}}\end{picture}}\endtrivlist}
\@namedef{proof*}{\reset@font\rm \trivlist \item[\hskip \labelsep
  {\reset@font\it Proof.}]}
\@namedef{endproof*}{\endtrivlist}
\def\proofbox{\begin{picture}(6.5,6.5)%
  \put(0,0){\framebox(6.5,6.5){}}\end{picture}}
%
% TITLEPAGE
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
  \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% ARRAY AND TABULAR
%
\arraycolsep   5pt
\tabcolsep     6pt
\arrayrulewidth .5pt
\doublerulesep 1.5pt

\def\tabular{\def\@halignto{}
 \def\hline{\noalign{\ifnum0=`}\fi
  \vskip 3pt
  \hrule \@height \arrayrulewidth
  \vskip 3pt
  \futurelet \@tempa\@xhline}
 \def\fullhline{\noalign{\ifnum0=`}\fi
  \vskip 3pt
  \hrule \@height \arrayrulewidth
  \vskip 3pt
  \futurelet \@tempa\@xhline}
 \def\@xhline{\ifx\@tempa\hline
   \vskip -6pt
   \vskip \doublerulesep
  \fi
  \ifnum0=`{\fi}}
  \def\@arrayrule{\@addtopreamble{\hskip -.5\arrayrulewidth
%                                  \vrule \@width \arrayrulewidth
                                  \hskip .5\arrayrulewidth}}
\@tabular
}
% TABBING
%
\tabbingsep \labelsep

% MINIPAGE
%
\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
% Space left between box and text by \fbox and \framebox.
\fboxsep = 3pt
% Width of rules in box made by \fbox and \framebox.
\fboxrule = \arrayrulewidth

%  ****************************************
%  *         TITLE AND ABSTRACT           *
%  ****************************************
%
\def\maketitle{\par
 \begingroup
  \if@twocolumn
   \twocolumn[\vspace*{17pt}\@maketitle]
  \else
   \newpage
   \global\@topnum\z@
   \@maketitle
  \fi
  \thispagestyle{titlepage}
 \endgroup
 \let\maketitle\relax
 \let\@maketitle\relax
 \gdef\@author{}
 \gdef\@title{}
 \let\thanks\relax
}
\def\newauthor{%                       DE's definitions
  \end{tabular}\par
  \begin{tabular}[t]{@{}l@{}}\let\\=\author@nextline%
}
\def\and{%
  \end{tabular}\vskip 3pt\par
  \begin{tabular}[t]{@{}l@{}}\let\\=\author@nextline%
}
\def\@maketitle{\newpage
 \vspace*{7pt}
 {\raggedright \sloppy
  {\reset@font\huge \bf \@title \par}
  \vskip 16pt
  {\reset@font\LARGE
   \begin{tabular}[t]{@{}l@{}}\let\\=\author@nextline\@author%
   \end{tabular}
   \par}
  \vskip 22pt
 }                          %End of DE's definitions
 \par\noindent
 {\reset@font\small \@date \par}
 \vskip 22pt
}

\def\author@nextline{%          %DE's definition
\tabularnewline[-5pt]\reset@font\small\it\ignorespaces\unskip\unskip\unskip%
\let\\=\author@nextline}%       %let command added by NT to bring
                               % subsequent lines into correct format

%
\def\abstract{\if@twocolumn
   \start@SFBbox\@abstract
 \else
   \@abstract
 \fi}
\def\endabstract{\if@twocolumn
   \endlist\finish@SFBbox
 \else
  \endlist
 \fi}
\def\@abstract{\list{}{%
    \listparindent\realparindent
    \itemindent\z@
    \labelwidth\z@ \labelsep\z@
    \leftmargin\z@\rightmargin\z@%%was 11pc left
    \parsep 0pt plus 1pt}\item[]%
    \reset@font\normalsize{\bf ABSTRACT}\\\reset@font\abslarge
} % SFB 0.1.01
%
\newif\ifSFB@keywords
\def\keywords{\if@twocolumn
  \start@SFBbox\@keywords
 \else
  \@keywords
 \fi
}
\def\@keywords{\list{}{%
    \labelwidth\z@ \labelsep\z@
    \leftmargin\z@\rightmargin\z@  %was 11pc left was 11pc\right....
    \parsep 0pt plus 1pt}\item[]\reset@font\abslarge{\bf Key words: }%
}
\def\endkeywords{\if@twocolumn
  \endlist\addvspace{37pt plus 0.5\baselineskip}\finish@SFBbox
 \else
  \endlist
 \fi
 \@thanks
 \gdef\@thanks{}
 \SFB@keywordstrue
}
\def\nokeywords{\ifSFB@keywords\else
 \if@twocolumn \start@SFBbox\addvspace{37pt}\finish@SFBbox \fi
 \@thanks
 \gdef\@thanks{}\fi
}

\def\author@tabular{\def\@halignto{}\@authortable}
\let\endauthor@tabular=\endtabular
%
\def\author@tabcrone{\vspace{2pt}{\ifnum0=`}\fi%
  \@xtabularcr[-7pt]\reset@font\small\it
  \let\\=\author@tabcrtwo\ignorespaces}
%
\def\author@tabcrtwo{{\ifnum0=`}\fi\@xtabularcr[-7pt]\reset@font\small\it
 \let\\=\author@tabcrtwo\ignorespaces}
%
\def\@authortable{\leavevmode \hbox \bgroup $\let\@acol\@tabacol
 \let\@classz\@tabclassz \let\@classiv\@tabclassiv
 \let\\=\author@tabcrone\ignorespaces \@tabarray}

\def\start@SFBbox{\@next\@currbox\@freelist{}{}%
 \global\setbox\@currbox
 \vbox\bgroup
  \hsize \textwidth
  \@parboxrestore
}
\def\finish@SFBbox{\par\vskip -\dbltextfloatsep
  \egroup
  \global\count\@currbox\tw@
  \global\@dbltopnum\@ne
  \global\@dbltoproom\maxdimen\@addtodblcol
  \global\vsize\@colht
  \global\@colroom\@colht
}

%  ****************************************
%  *            PAGE STYLES               *
%  ****************************************
%
\mark{{}{}}
\gdef\@author{\mbox{}}
\def\author{\@ifnextchar [{\@authortwo}{\@authorone}}
\def\@authortwo[#1]#2{\gdef\@author{#2}\gdef\@shortauthor{#1}}
\def\@authorone#1{\gdef\@author{#1}\gdef\@shortauthor{#1}}
\gdef\@shortauthor{}
\gdef\@title{\mbox{}}
\def\title{\@ifnextchar [{\@titletwo}{\@titleone}}
\def\@titletwo[#1]#2{\gdef\@title{#2}\gdef\@shorttitle{#1}}
\def\@titleone#1{\gdef\@title{#1}\gdef\@shorttitle{#1}}
\gdef\@shorttitle{}
\def\volume#1{\gdef\@volume{#1}}
\gdef\@volume{000}
\def\tod@y{\today}
\def\microfiche#1{\gdef\@microfiche{#1}}
\gdef\@microfiche{}
\def\pubyear#1{\gdef\@pubyear{#1}}
\gdef\@pubyear{0000}
\def\pagerange#1{\gdef\@pagerange{#1}}
\gdef\@pagerange{000--000}
\def\journal#1{\gdef\@journal{#1}}
\def\plate#1{\gdef\pl@te{#1}}
\ifx\CUP@mtlplain@loaded\undefined
  \def\@printed{Preprint \tod@y\
    \qquad\qquad\qquad Compiled using MNRAS \LaTeX\ style file v\@version} % manual spacing isn't ideal
\else
  \def\@printed{}
\fi
\gdef\@journal{{MNRAS} {\bf \@volume}, \@pagerange\
% (\number\year) \@microfiche\@printed}
  (\@pubyear) \@microfiche \hfill \@printed}
%
% \ps@empty and \ps@plain defined in LATEX.TEX
%
\def\@ddell{}
\if@letters
  \def\@ddell{L}
\fi

% Headers and footers

\def\ps@headings{\let\@mkboth\markboth
 \def\@oddhead{\Large\hfill{\it\@shorttitle}\hspace{1.5em}%
   \rm\@ddell\thepage}
 \def\@oddfoot{\hfill\small MNRAS {\bf \@volume}, \@pagerange\ (\@pubyear)}
 \def\@evenhead{\Large\@ddell\thepage\hspace{1.5em}\it\@shortauthor\hfill}
 \def\@evenfoot{\small MNRAS {\bf \@volume}, \@pagerange\ (\@pubyear)\hfil}
 \def\sectionmark##1{\markboth{##1}{}}
 \def\subsectionmark##1{\markright{##1}}}

\def\ps@myheadings{\let\@mkboth\@gobbletwo
 \def\@oddhead{\Large\hfill\it\rightmark\hspace{1.5em}\rm\@ddell\thepage}
 \def\@oddfoot{\small MNRAS {\bf \@volume}, \@pagerange\ (\@pubyear)\hfil}
 \def\@evenhead{\Large\@ddell\thepage\hspace{1.5em}\it\leftmark\hfill}
 \def\@evenfoot{\hfil\small MNRAS {\bf \@volume}, \@pagerange\ (\@pubyear)}
 \def\sectionmark##1{}
 \def\subsectionmark##1{}}

\def\ps@titlepage{\let\@mkboth\@gobbletwo
 \def\@oddhead{\footnotesize\@journal}
 \def\@oddfoot{\small\copyright\ \@pubyear\ The Authors\hfil}
 \def\@evenhead{\footnotesize\@journal\hfill}
 \def\@evenfoot{\hfil\small\copyright\ \@pubyear\ The Authors}
 \def\sectionmark##1{}
 \def\subsectionmark##1{}}

\def\ps@plate{\let\@mkboth\@gobbletwo
  \def\@oddhead{\footnotesize\pl@te\hfill}
  \def\@oddfoot{\small MNRAS {\bf \@volume}, \@pagerange\ (\@pubyear)\hfil}
  \def\@evenhead{\footnotesize\pl@te\hfill}
  \def\@evenfoot{\hfil\small MNRAS {\bf \@volume}, \@pagerange\ (\@pubyear)}
}

%  ****************************************
%  *         TABLE OF CONTENTS, ETC.      *
%  ****************************************
%
\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}
\def\@undottedtocline#1#2#3#4#5{\ifnum #1>\c@tocdepth
 \else
  \vskip \z@ plus .2pt
  {\hangindent #2\relax
   \rightskip \@tocrmarg \parfillskip -\rightskip
   \parindent #2\relax \@afterindenttrue
   \interlinepenalty\@M \leavevmode
   \@tempdima #3\relax #4\nobreak \hfill \nobreak
   \hbox to\@pnumwidth{\hfil\reset@font\rm \ }\par}\fi}
\def\tableofcontents{\@restonecolfalse
 \if@twocolumn\@restonecoltrue\onecolumn\fi
 \section*{CONTENTS} \@starttoc{toc}
 \if@restonecol\twocolumn\fi \par\vspace{12pt}}
\def\l@part#1#2{\addpenalty{-\@highpenalty}
 \addvspace{2.25em plus 1pt}
 \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth
  {\reset@font\normalsize\rm
   \leavevmode \hspace*{3pc}
   #1\hfil \hbox to\@pnumwidth{\hss \ }}\par
   \nobreak \global\@nobreaktrue
   \everypar{\global\@nobreakfalse\everypar{}}\endgroup}
\def\l@section#1#2{\addpenalty{\@secpenalty}
 \@tempdima 1.5em
 \begingroup
  \parindent \z@ \rightskip \@pnumwidth
  \parfillskip -\@pnumwidth \reset@font\rm \leavevmode
  \advance\leftskip\@tempdima \hskip -\leftskip
  #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss \ }\par
 \endgroup}
\def\l@subsection{\@undottedtocline{2}{1.5em}{2.3em}}
\def\l@subsubsection{\@undottedtocline{3}{3.8em}{3.2em}}
\def\l@paragraph{\@undottedtocline{4}{7.0em}{4.1em}}
\def\l@subparagraph{\@undottedtocline{5}{10em}{5em}}
\def\listoffigures{\@restonecolfalse
 \if@twocolumn\@restonecoltrue\onecolumn\fi
 \section*{LIST OF FIGURES\@mkboth{LIST OF FIGURES}{LIST OF FIGURES}}
 \@starttoc{lof} \if@restonecol\twocolumn\fi}
\def\l@figure{\@undottedtocline{1}{1.5em}{2.3em}}
\def\listoftables{\@restonecolfalse
 \if@twocolumn\@restonecoltrue\onecolumn\fi
 \section*{LIST OF TABLES\@mkboth{LIST OF TABLES}{LIST OF TABLES}}
 \@starttoc{lot} \if@restonecol\twocolumn\fi}
\let\l@table\l@figure
%  ****************************************
%  *             BIBLIOGRAPHY             *
%  ****************************************
%

\def\thebibliography#1{\section*{REFERENCES}
 \addcontentsline{toc}{section}{REFERENCES}
 % KTS: most of this stuff gets over-written by natbib below, so
 % I don't think it does anything.
 \newcounter{dummy}
 \list{}{\usecounter{dummy}%
         \labelwidth \z@
         \leftmargin 0em %1.5em
		 \bibhang \z@
         \itemsep \z@
         \itemindent-\leftmargin}
 \reset@font\footnotesize
 \parindent\z@
 \parskip\z@ plus .1pt\relax
 \def\newblock{}%\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax
}
\let\endthebibliography=\endlist
\def\@biblabel#1{\hspace*{\labelsep}[#1]}

\if@usenatbib%
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \usepackage[authoryear]{natbib}
 \bibpunct{(}{)}{;}{a}{}{,}
 % Re-define these in upper case as natbib.sty has them capitalised
 \renewcommand\bibname{BIBLIOGRAPHY}
 \renewcommand\refname{REFERENCES}
\fi

% Natbib has overwritten a bunch of settings, so redfine them
% Works both with and without natbib (in theory)
\let\originalbib\thebibliography
\renewcommand{\thebibliography}{\labelwidth \z@ \bibhang 1.5em \footnotesize \originalbib}
% The typesetters actually use a 12pt bibhang, but with 8pt text this is 1.5em

% new column specifiers to be used with dcolumn
\if@usedcolumn%
 \usepackage{dcolumn}
 \newcolumntype{d}[1]{D{.}{.}{#1}}
 \newcolumntype{.}{D{.}{.}{-1}}
 \newcolumntype{,}{D{,}{,}{2}}
\fi


%  ****************************************
%  *    COMMANDS FOR USE WITH MNRAS.BST    *
%  ****************************************
%
% The following three macros provide auxiliary support for the BibTeX
% wranglings in mnras.bst.  They provide support for functionality
% which it is impossible, or at least unmaintainably arcane, to
% provide within BibTeX Style Language.
%
% These definitions can be loaded as a package or, probably better,
% should be incorporated into a mnras.cls file.
%
% These depend on the presence of a \href{URL}{text} macro, as
% provided by the hyperref package.  The mnras.bst style depends
% additionally on the \url{URL} macro, which hyperref also provides.
%
% If the hyperref package is not included, then suitable defaults are
%
%   \def\href#1#2{#2}
%   \def\@url#1{#1\endgroup}
%   \def\url{\begingroup\@urlcharsother \ttfamily \@url}
%
% These must appear _after_ this package is loaded, and should appear
% _instead_ of loading the hyperref package (it'll probably be OK to
% let the hyperref package redefine these, but that is to tempt fate).


% \@urlcharsother
%
% 'Other' some characters which may appear in DOIs and URIs.
%
% All of the characters here may appear in URIs, except for '^' and '\'.
%
% There appear to be almost no restrictions on what characters appear
% in DOIs (or at least none discovereable in ISO 26324:2012, which
% says simply that the 'DOI suffix' is "a character string of any
% length".  A DOI registrant which uses characters outside ASCII plus
% the following set, is a DOI registrant who should be taken outside
% and challenged on their taste.
%
% The following list is not simply \dospecials, because that includes
% '{' and '}', which we need.  And if they're in a DOI... well.
\def\@urlcharsother{%
  \let\do\@makeother 
  \do\\\do\$\do\&\do\#\do\^\do\_\do\%\do\~}

% \doi
%
% \doi{10.foo} formats the DOI in the argument, and provides a link to dx.doi.org.
% \doi[text]{10.foo} formats the DOI 10.foo, but provides 'text' as the link.
% The DOI can contain {\$&#^_%~} (though there's not necessarily a
% guarantee that these will still work as URL characters within the PDF)
\def\doi{\begingroup
  \@urlcharsother
  \@ifnextchar[%
    {\@doi}
    {\@doi[]}}
\def\@doi[#1]#2{%
  \def\@tempa{#1}%
  \ifx\@tempa\@empty
    \href{http://dx.doi.org/#2}{doi:#2}%
  \else
    \href{http://dx.doi.org/#2}{#1}%
  \fi
  \endgroup
  }

% \eprint
%
% \eprint{defaultArchivePrefix}{id} expands to a link to the given ID
% at a suitable archive.  The 'id' can be either a bare ID (such as
% yymm.1234) for arXiv, or can include an archive prefix.  If there is
% no prefix in the 'id', then 'defaultArchivePrefix' supplies a default.
%
% Thus
%   \eprint{}{arXiv:yymm.1234} -> \href{http://arxiv.org/abs/yymm.1234}{arXiv:yymm.1234}
%   \eprint{}{yymm.1234} -> same as \eprint{}{arXiv:yymm.1234}
%   \eprint{arXiv}{arXiv:yymm.1234} -> same
%   \eprint{dblp}{1234} -> \href{http://dblp.uni-trier.de/rec/bibtex/1234.xml}{dblp:1234}
%   \eprint{dblp}{arXiv:yymm.1234} -> same as \eprint{}{arXiv:yymm.1234}
%   \eprint{}{wibble:1234} -> wibble:1234 (doesn't match anything)
%
% A prefix 'PFX' is 'registered' by defining a macro
% \@eprint@PFX#1{...} which formats the identifier (that is, \eprint's
% second argument _minus_ any colon-terminated prefix).
\def\eprint#1#2{%
  \@eprint#1:#2::\@nil}
\def\@eprint@arXiv#1{\href{http://arxiv.org/abs/#1}{{\tt arXiv:#1}}}
\def\@eprint@dblp#1{\href{http://dblp.uni-trier.de/rec/bibtex/#1.xml}{dblp:#1}}
\def\@eprint#1:#2:#3:#4\@nil{%
  \def\@tempa{#1}%
  \def\@tempb{#2}%
  \def\@tempc{#3}%
  \ifx\@tempc\@empty
    \let\@tempc\@tempb
    \let\@tempb\@tempa
  \fi
  \ifx\@tempb\@empty
    % default to arXiv
    \def\@tempb{arXiv}%
  \fi
  % If \@tempb is a 'recognised' prefix, then call it, otherwise, just
  % print prefix:id and be done with it.  A prefix is 'recognised' if
  % there's a macro \@eprint@<prefix>.
  \@ifundefined{@eprint@\@tempb}
    {\@tempb:\@tempc}
    % or call macro '@eprint@\@tempb' on the argument \@tempc
    {\expandafter\expandafter\csname @eprint@\@tempb\endcsname\expandafter{\@tempc}}%
  }

% \mniiiauthor
%
% The following implements the three-author-hack described in mnras.bst.
%
% This consumes a command for each such author.  It's surely possible
% to avoid this (with some constructions involving {\\#1}; see
% Appendix D cleverness), but that would verge on the unmaintanably
% arcane, and not really be worth it.
\def\mniiiauthor#1#2#3{%
  \@ifundefined{mniiiauth@#1}
    {\global\expandafter\let\csname mniiiauth@#1\endcsname\null #2}
    {#3}}


%  ****************************************
%  *              THE INDEX               *
%  ****************************************
%
\newif\if@restonecol
\def\theindex{\section*{INDEX}
 \addcontentsline{toc}{section}{INDEX}
 \reset@font\footnotesize \parindent\z@ \parskip\z@ plus .1pt\relax
 \let\item\@idxitem}
\def\@idxitem{\par\hangindent 1em}
\def\subitem {\par\hangindent 1em \hspace*{1em}}
\def\subsubitem{\par\hangindent 1em\hspace*{1em}}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\indexspace{\par\vskip\baselineskip \relax}

%  ****************************************
%  *             FOOTNOTES                *
%  ****************************************
%
\def\footnoterule{\kern-3\p@ \hrule width 12pc height \z@ \kern 3\p@}

\renewcommand{\thefootnote}{\mbox{{$\fnsymbol{footnote}$}}}
\renewcommand{\thempfootnote}{\mbox{{${\alph{mpfootnote}}$}}}

\def\@fnsymbol#1{\ifcase#1\or \mbox{${^{\star}}$}\or
   \dagger\or \ddagger\or
   \S \or \P \or \|\or \mbox{$^{\star\star}$}\or \dagger\dagger
   \or \ddagger\ddagger\or \S\S\or \P\P\or \|\|\else ***
   \fi\relax}

\providecommand\@makefntext[1]{}

\renewcommand{\@makefnmark}{$\@thefnmark$}
\renewcommand\@makefntext[1]{\parindent 1em\noindent
  ${\@thefnmark}$\hspace{4pt}#1}

\newcommand{\fixfootnotes}{%
\renewcommand{\@makefnmark}{$^{\@thefnmark}$}%
\renewcommand\@makefntext[1]{\parindent 1em\noindent%
  $^{\@thefnmark}$\hspace{4pt}##1}%
\renewcommand{\thefootnote}{\arabic{footnote}}%
\setcounter{footnote}{0}%
}
%****************************************
%  *         FIGURES AND TABLES           *
%  ****************************************
%
% Settings for how much of the page can be used for floats
\setcounter{topnumber}{4}
\def\topfraction{0.9}
\setcounter{bottomnumber}{2}
\def\bottomfraction{0.5}
\setcounter{dbltopnumber}{3} % two-column floats
\def\dbltopfraction{0.9}
\setcounter{totalnumber}{4}
\def\textfraction{0.1}
\def\floatpagefraction{0.9}
\def\dblfloatpagefraction{0.9}

\newif\ifst@rredfloat
\newcounter{table}
\def\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{1}
\def\fstyle@table{\reset@font\small\rm}
\def\ext@table{lot}
\def\fnum@table{Table \thetable}
\def\table{\def\baselinestretch{1}%
  \let\@makecaption=\SFB@maketablecaption%
  \@float{table}\fstyle@table}
\let\endtable\end@float
\@namedef{table*}{\def\baselinestretch{1}\st@rredfloattrue
  \let\@makecaption=\SFB@maketablecaption%
  \@dblfloat{table}\centering\fstyle@table}
\@namedef{endtable*}{\end@dblfloat\st@rredfloatfalse}

\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{2}
\def\fstyle@figure{\reset@font\small\rm}
\def\ext@figure{lof}
\def\fnum@figure{Figure \thefigure}
\def\figure{\def\baselinestretch{1}%
  \let\@makecaption=\SFB@makefigurecaption%
  \@float{figure}\fstyle@figure}
\let\endfigure\end@float
\@namedef{figure*}{\def\baselinestretch{1}\st@rredfloattrue
  \let\@makecaption=\SFB@makefigurecaption%
  \@dblfloat{figure}\centering\fstyle@figure}
\@namedef{endfigure*}{\end@dblfloat\st@rredfloatfalse}

\long\def\SFB@makefigurecaption#1#2{\vskip 6pt
  \setbox\@tempboxa\hbox{\reset@font\small{\bf #1}%
    \if@cont \ -- {\it continued}\else{\bf .}\fi\ {\rm #2}\par}%
 \ifdim \wd\@tempboxa >\hsize
   {\reset@font\small{\bf #1}%
     \if@cont \ -- {\it continued}\else{\bf .}\fi\ {\rm #2}\par}%
 \else
   \ifst@rredfloat
     \hbox to\hsize{\hfill\box\@tempboxa\hfill}%
   \else
     \hbox to\hsize{\hfill\box\@tempboxa\hfill}%
   \fi
 \fi
 \vskip 6pt
 \@contfalse
}

\long\def\SFB@maketablecaption#1#2{\vskip 6pt
  \setbox\@tempboxa\hbox{\reset@font\small{\bf #1}%
    \if@cont \ -- {\it continued}\else{\bf .}\fi\ {\rm #2}\par}%
 \ifdim \wd\@tempboxa >\hsize
    {\reset@font\small{\bf #1}%
    \if@cont \ -- {\it continued}\else{\bf .}\fi\ {\rm #2}\par}%
 \else
   \hbox to\hsize{\box\@tempboxa\hfill}%
 \fi
 \vskip 6pt
 \@contfalse
}

\newif\if@cont
\def\caption{\refstepcounter\@captype \@dblarg{\@caption\@captype}}
\def\contcaption{\@conttrue\SFB@caption\@captype}

\long\def\SFB@caption#1#2{%\par
 \begingroup
  \@parboxrestore
  \reset@font\normalsize
  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #2}\par
 \endgroup}

%  ****************************************
%  *           CUP specials               *
%  ****************************************
%
% KTS: I'm not convinced that any of these are still used, but will avoid
% deleting them just in case.
%
%  The following code is taken from authordate.sty, by David Rhead, of
%  the Cripps Computing Centre (February 1990), with some modifications
%  by ggw. It is intended for documents
%  that use the author-date citation system. When used in conjunction with
%  authordate1.bst, ... , authordate4.bst, it allows citations of the
%  form \shortcite{bloggs-60} as well as the usual \cite{bloggs-60}.
%  When
%       ... \cite{bloggs-60} ... \shortcite{bloggs-60} ...
%  appears in the input file,
%       ... (Bloggs, 1960) ... (1960) ...
%  appears in the final document.
%
%  Code taken from apalike.sty.
%
\def\@cite#1#2{(#1\if@tempswa , #2\fi)}
\def\@biblabel#1{}

% Set length of hanging indentation for bibliography entries
%

\if@usenatbib\relax\else%
\newlength{\bibhang}
\setlength{\bibhang}{2em}
\fi

%  Define default title and page-head text.
%
\def\bibtitle{References}
\def\bibheadtitle{REFERENCES}

%  Code taken from aaai.sty.
%
% don't box citations, add space between multiple citations, separate with ;
\def\@citex[#1]#2{%
  \if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \def\@citea{}\@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{; }\@ifundefined
       {b@\@citeb}{{\reset@font\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
{\csname b@\@citeb\endcsname}}}{#1}}
% Allow short (name-less) citations, when used in
% conjunction with a bibliography style that creates labels like
%       \citename{<names>, }<year>
\let\@internalcite\cite
\def\cite{\def\citename##1{##1}\@internalcite}
\def\shortcite{\def\citename##1{}\@internalcite}

% Typesetting note at the end of the article
\def\bsp{\vspace{0.5cm}\reset@font\footnotesize\noindent This paper
has been typeset from a \TeX/\LaTeX\ file prepared by the author.}



%  ****************************************
%  *            MISCELLANEOUS             *
%  ****************************************
%
% DATE
\def\today{\number\day\ \ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December
 \fi \ \number\year}

% REVISED AUTHOR QUERY COMMAND
% Queries in text are printed in large bold font, in square brackets
% Queries in references are printed as bold number followed by text
 \DeclareFixedFont{\largerm}{OT1}{cmss}{m}{n}{17}
 \DeclareFixedFont{\largeital}{OT1}{cmss}{m}{sl}{17}
 \newcommand{\aquery}[1]{\mbox{\largerm {[#1]}}}
 \newcommand{\BSLquery}[1]{\aquery{#1}}
 %For backwards compatibility with old query command
 \newcommand{\tquery}[1]{\mbox{\largeital{[#1]}}}
 %Typesetter query: same format
 \newenvironment{query}{\vspace{5mm} \noindent {\bf Queries}\\}{}
 \newcommand{\authorquery}[2]{\noindent{{\bf #1} #2}\\}

% definition required for newarray.sty
\gdef\d@llar{}

%  ****************************************
%  *           INITIALIZATION             *
%  ****************************************
%
%
%%%NHT: this code needs fixed.
%%%     At the moment the zif is always undefined, so it does nothing!
\newif\ifCUPmtlplainloaded
\ifx\CUP@mtlplain@loaded\undefined
\else
  \global\CUPmtlplainloadedtrue
  \input mnsym
\fi
%
\flushbottom
\ps@headings
\ifSFB@galley
 \raggedbottom
 \ps@empty
\fi
%\ifSFB@referee
% \raggedbottom
%\fi
\pagenumbering{arabic}
\if@twocolumn
 \twocolumn
 \sloppy
\else
 \onecolumn
\fi
\frenchspacing


%  ****************************************
%  *              Change log              *
%  ****************************************


%    Original file produced by Cambridge University Press 1994
%    for LaTeX version 2.09, 1988, by Leslie Lamport
%    based on the original LaTeX ARTICLE DOCUMENT STYLE
%    modifications by Sue Brooks, Alison Woollatt and Mark Reed 1993, 1994
%    further modifications by Nadine and John Thompson 1999 August
%    and David Evans 1999 December. Updates by Keith T. Smith 2013.
%
% > Incorporating also parts of authordate.sty
%   by David Rhead, Cripps Computing Centre (Feb 1990).
% > Incorporating special symbol code from laa.sty v1.1 (25th Feb 1991)
%   used with the permission of Springer Verlag.
% > Incorporating parts of mssymb.tex (8th July 1987).
% > Incorporating newfont.sty vALPHA pl 8 (16th August 1994), by M. Reed
%
% v0.1.01  SFB text area, abstract heading, secnumdepth,
%          \dblfloatpagefraction
% v0.1.02  SFB landscape, galley and referee options;
%          new catchline; enumerated lists; correct raggedright
%          on section headings;
% v0.1.03  SFB continued floats with \caption* (removed now),
%          short captions centred
% v0.1.04  SFB appendices, unnumbered list (using description)
% v0.1.05  AJW roman catchline, final statement
% v1.0     RM  BSP note, \bsp, added to cup specials
% v1.1     AJW / MR, 28th January 1994. NFSS 1/2 compatible,
%          Springer-Verlag macros added
% v1.2     AJW, 18th July 1994. Improved cont. captions,
%          MR font selection check improved,
%          MR removed some redundant code, AW \sevensize added,
%          MR Added MR's `NewFont' support, MR Improved NFSS 1/2 support,
%          MR Added support for Bold math and AMS symbols for NFSS 1,
%          MR par's in abstract now have par indents.
%          MR added \ifCUPmtlplainloaded switch for use in documents.
%          MR Added mnsym.tex (for Times version).
% v1.25    MR, not released to authors 16th August 1994.
%          Replaced existing Newfont.sty code with updated code, after
%          discovering several bugs. This version not released to authors
%          because they are unlikely to find the bugs unless:
%          1) they have an extremely long article,
%          2) have used many \New.. commands (no docs were supplied for
%          these anyway).
% v1.3     MR, 5 September 1994. Added printing of style file version to
%          'Printed' info in catchline. Will help us identify how the
%          article was produced (TeX/LaTeX) and the version number of the
%          macros.
%          MR Tables and Figures no longer get double spaced when using the
%          `referee' or `doublespacing' options.
%          MR Corrected 7th footnote symbol: made a \star\star (was **).
%          MR Corrected problem where some headings were not upper-case
%          when they should have been (\section*).
% v1.4     AJW, 14th September 1995. Add footlines and \newauthor,
%          correct \listparindent in enumerate environment.
% v2.1     NHT/JST 1999 August 22. Conversion to
%          a LaTeX2e class file, following the conversions used
%          in GJIb.sty->GJI.cls.
%          Obselete NFSS font information removed.
%          footnotes redefined.
% v2.2      DE various changes.
%           NHT 1999 Dec 23. \la and \ga symbols fixed. Bug in displaying
%           author names and addresses fixed. Problem in producing footnotes
%           in minipages fixed.
% v2.3b    Keith T. Smith (Royal Astronomical Society)
%          September 2013
%          Beta testing only - never publicly released
%          First update in over a decade
%          Now requires the 'geometry' package to enforce A4 paper
%          Now requires the 'fixltx2e' package to fix float ordering
%          Now requires the 'hyperref' package for clickable links
%          Updated headers and footers, and typesetting of reference list
%          Removed the fleqn code in this file, which didn't do anything
%          Added definitions for journal abbreviations used by ADS
%          Define a \ion command for ionization states
%          Added commands used by the new version 
%            of the .bst file (code by Norman Gray)
%          Now licensed under LPPL, comments updated accordingly
%          Various minor tweaks and updates
% v3.0  Keith T. Smith (Royal Astronomical Society)
%         May 2015
%         Package renamed from 'mn2e' to 'mnras' after
%           discussion with the TeX Users Group
%         Numerous small tweaks and improvements following testing
% end of mnras.cls
