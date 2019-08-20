%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                                                          %%%%%%
%%%%%           * LATEX CLASS FILE FOR JOURNALS *              %%%%%%
%%%%%                                                          %%%%%%
%%%%%   Journal:  NAR (Nucleic Acids Research)                 %%%%%%
%%%%%                                                          %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{NAR}
              [2007/03/23 v1.4b
 Standard LaTeX document class]
\newif\if@restonecol
\newif\if@titlepage\@titlepagefalse
\DeclareOption{a4paper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.25in}}
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
\DeclareOption{custompaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\newif\if@cropmarkson \@cropmarksontrue
\newif\if@theoremsty \@theoremstytrue
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}\global\@cropmarksontrue}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}\global\@cropmarksonfalse}

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{webpdf}{\gdef\@webpdf{webpdf}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{notheoremsty}{\@theoremstyfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\newif\if@openbib \@openbibfalse
\DeclareOption{openbib}{%
\@openbibtrue%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\ExecuteOptions{custompaper,twoside,crop,reqno,proof}
\ProcessOptions
\RequirePackage{crop,inputenc,amsmath,amssymb,latexsym,
                float,epsfig,wrapfig,graphicx,stfloats,
                multicol,rotating,multirow,dcolumn,
                boxedminipage,makeidx,soul,url,xspace,times}

%
%%%%%%%%%%%%%%%%%%%%%%%% *** SIZES *** %%%%%%%%%%%%%%%%%%%%%%%%%%
%
\renewcommand\normalsize{%
   \@setfontsize\normalsize{10\p@}{11\p@}
   %\@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 13\p@ \@plus6\p@ \@minus3\p@
   \abovedisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 9\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{10}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
%
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{16}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
%
\DeclareMathSizes{10}{10}{8}{6}
\DeclareMathSizes{9}{9}{7.6}{5}
\DeclareMathSizes{8}{8}{6}{5}
%
%%%%%%%%%%%%%%%%%%%% ** PENALTIES ** %%%%%%%%%%%%%%%%%%%
%
% Page break penalties
\@lowpenalty   31
\@medpenalty  151
\@highpenalty 301
% Disallow widows and orphans
\clubpenalty 10000
\widowpenalty 10000
% Disable page breaks before equations, allow pagebreaks after
% equations and discourage widow lines before equations.
\displaywidowpenalty 100
\predisplaypenalty   10000
\postdisplaypenalty  100
% Allow breaking the page in the middle of a paragraph
\interlinepenalty 0
% Disallow breaking the page after a hyphenated line
\brokenpenalty 10000
% Hyphenation; don't split words into less than three characters
\lefthyphenmin=3
\righthyphenmin=3
\hyphenation{figure figures Figure table tables Table Section section Chapter chapter}
%
% Prevent Hyphenation
\hyphenpenalty=2000
\tolerance=1000
%
\frenchspacing
\vbadness=9999
\doublehyphendemerits=10000
\doublehyphendemerits 640000   % corresponds to badness 800
\finalhyphendemerits  1000000  % corresponds to badness 1000
%
%%%%%%%%%%%%%%%%%%%% ** PAGE LAYOUT ** %%%%%%%%%%%%%%%%%%%
%
% Set page layout dimensions
\setlength\topmargin{37pt}          % head margin
\addtolength\topmargin{-1in}       % subtract out the 1 inch driver margin
%
\setlength\headheight{7\p@}         % height of running head
\setlength\topskip{10\p@}           % height of first line of text
\setlength\headsep{35\p@}         % space below running head --
\addtolength\headsep{-\topskip}     % base to base with first line of text
%
\setlength\textwidth{514pt}           % text measure excluding margins
\setlength\textheight{61\baselineskip} % # lines of text
\addtolength\textheight{1.2pt}

% Side Margins
\setlength\oddsidemargin{56pt}
\addtolength\oddsidemargin{-1in}   % subtract out the 1 inch driver margin
%
\setlength\evensidemargin{\paperwidth}
\addtolength\evensidemargin{-\textwidth}
\addtolength\evensidemargin{-\oddsidemargin}
\addtolength\evensidemargin{-2in}
%
\setlength\columnsep{20\p@}         % space between columns for double-column text
\setlength\columnseprule{0\p@}      % width of rule between two columns
%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{1}
\setlength\parskip{0\p@}
\setlength\parindent{1em}
%
\setlength\footskip{24\p@}
\setlength\maxdepth{0pt}%
%
\setlength\marginparwidth{2.5pc}
\setlength\marginparsep{.5pc}
\def \@marginparreset {%
        \reset@font
        \scriptsize
        \@setminipage}
%
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
%
%%%%%%%%%%%%%%%%%%%% ** TITLE DEFS ** %%%%%%%%%%%%%%%%%%%
%
\def\jshort{bio}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{REFERENCES}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\ackname{Acknowledgements}
\newcommand\keywordname{Keywords}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
%
%%%%%%%%%%%%%%%%%%%% ** OLD COMMANDS ** %%%%%%%%%%%%%%%%%%%
%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\sfit}{\normalfont\sffamily\itshape}{\mathsf}
\DeclareOldFontCommand{\sfb}{\normalfont\sffamily\bfseries}{\mathsf}
\DeclareOldFontCommand{\sfbi}{\normalfont\sffamily\bfseries\itshape}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\tti}{\normalfont\ttfamily\itshape}{\mathtt}
\DeclareOldFontCommand{\ttb}{\normalfont\ttfamily\bfseries}{\mathtt}
\DeclareOldFontCommand{\ttbi}{\normalfont\ttfamily\bfseries\itshape}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\bi}{\normalfont\bfseries\itshape}{\mathbi}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
%
%%%%%%%%%%%%%%%%%%%% ** PAGE STYLES ** %%%%%%%%%%%%%%%%%%%
%
\if@twoside
  \def\ps@headings{%
      \def\@evenhead{\rule[-4pt]{\textwidth}{1pt}\hfil\slshape\leftmark}%
      \def\@oddhead{\rule[-4pt]{\textwidth}{1pt}{\slshape\rightmark}\hfil}%
      \def\@oddfoot{\hfil\thepage}
      \def\@evenfoot{\thepage\hfil}
      \let\@mkboth\markboth
      \def\sectionmark##1{\markboth{##1}{##1}}%
       }
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{\markright {##1}}}
\fi
\def\ps@plain{\let\@mkboth\@gobbletwo
     \def\@oddhead{%
     \raisebox{6pt}[0pt]{\smash{\hbox to \textwidth{{\catchlineinfofont Published\ online\ }{\catchlineinfofont\@pubdate}\ \hfill{\catchlineinfofont\catchlineinfo}}}}%
     }%
     \def\@evenhead{%
     \raisebox{6pt}{\smash{\hbox to \textwidth{{\catchlineinfofont Published\ online\ }{\catchlineinfofont\@pubdate}\ \hfill{\catchlineinfofont\catchlineinfo}}}}%
     \llap{\rule[-26pt]{\textwidth}{1pt}}}%
      \def\@oddfoot{\raisebox{24pt}[0pt]{\copyrightfont\begin{tabular*}{\textwidth}{@{}p{\textwidth}@{}}
      \copyright\ \@copyrightyear\ The Author(s)\\
      This is an Open Access article distributed under the terms of the Creative Commons Attribution Non-Commercial License (http://creativecommons.org/licenses/\penalty0by-nc/2.0/uk/) which permits unrestricted non-commercial use, distribution, and reproduction in any medium, provided the original work is properly cited.
      \end{tabular*}}}
      \def\@evenfoot{\rlap{\rule[12pt]{\textwidth}{.5pt}}{\foliofont\thepage}\hfil\copyrightfont \copyright\ The Author 2008. Published by Oxford University Press. All rights reserved. For Permissions, please email: journals.permissions@oxfordjournals.org}
     }
%
\def\ps@front{\let\@mkboth\@gobbletwo
     \def\@oddhead{%
     \raisebox{-9pt}{\smash{\hbox to \textwidth{\hskip\jnameskip{\jnamefont\@jname}\hfill{\ifx\@articletype\articletypecheck\articletypesmallfont\else\articletypefont\fi\@articletype}\hfill{\catchlineinfofont\catchlineinfo}}}}%
     \llap{\rule[-16pt]{\textwidth}{1pt}}}%
     \def\@evenhead{%
     \raisebox{-9pt}{\smash{\hbox to \textwidth{\hskip\jnameskip{\jnamefont\@jname}\hfill{\ifx\@articletype\articletypecheck\articletypesmallfont\else\articletypefont\fi\@articletype}\hfill{\catchlineinfofont\catchlineinfo}}}}%
     \llap{\rule[-16pt]{\textwidth}{1pt}}}%
      \def\@oddfoot{\rlap{\rule[12pt]{\textwidth}{1pt}}\copyrightfont }
      \def\@evenfoot{\rlap{\rule[12pt]{\textwidth}{1pt}}\copyrightfont }
     }
\def\ps@contents{%
      \def\@evenhead{\rlap{\rule[-10pt]{\textwidth}{.5pt}}{\lrhfont\leftmark}\hfil}%
      \def\@oddhead{\rlap{\rule[-10pt]{\textwidth}{.5pt}}\hfil{\rrhfont\rightmark}}%
      \def\@oddfoot{\rlap{\rule[12pt]{\textwidth}{1pt}}}
      \def\@evenfoot{\rlap{\rule[12pt]{\textwidth}{1pt}}}
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    \def\titlemark##1{\markboth{##1}{##1}}%
    \def\authormark##1{\gdef\leftmark{##1}}%
     }
\def\ps@myheadings{%
      \let\@oddfoot\@empty
      \let\@evenfoot\@empty
      \def\@evenhead{{\lrffont\thepage}\quad{\lrhfont\rightmark}\hfil}%
      \def\@oddhead{\hfil{\rrhfont\rightmark}\quad{\rrffont\thepage}}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    \def\titlemark##1{\markboth{##1}{##1}}%
    \def\authormark##1{\gdef\leftmark{##1}}%
}
\def\ps@empty{\let\@mkboth\@gobbletwo%
  \def\@oddhead\@empty%
  \let\@oddfoot\@empty%
  \def\@evenhead\@empty%
  \let\@evenfoot\@empty}
%
%%%%%%%%%%%%%%%%%%%% ** LOCAL FONT DEFINITIONS ** %%%%%%%%%%%%%%%%%%%
%
% Running head, foot, pageno & other info.
\def\lrhfont{\fontfamily{\rmdefault}\fontshape{it}\fontsize{10.16}{10.16}\selectfont}
\def\rrhfont{\fontfamily{\rmdefault}\fontshape{it}\fontsize{10.16}{10.16}\selectfont}
\def\rrffont{\fontfamily{\rmdefault}\fontseries{b}\fontshape{it}\fontsize{10}{10}\selectfont}
\def\lrffont{\fontfamily{\rmdefault}\fontseries{b}\fontshape{it}\fontsize{10}{10}\selectfont}
\def\foliofont{\reset@font\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{9}{11}\selectfont}
\def\opheadfootfont{\fontfamily{\rmdefault}\fontsize{8}{8}\selectfont}
% Header
\def\titlefont{\fontfamily{\sfdefault}\fontsize{20}{22}\fontseries{b}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\subtitlefont{\fontfamily{\sfdefault}\fontsize{14}{18}\fontseries{m}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\authorfont{\reset@font\fontfamily{\sfdefault}\fontsize{12}{14}\fontseries{b}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\addressfont{\reset@font\fontfamily{\sfdefault}\fontsize{10}{12}\fontseries{n}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\abstractfont{\fontfamily{\sfdefault}\fontsize{10}{12}\fontseries{b}\selectfont\leftskip0pt\rightskip0pt}
\def\abstractheadfont{\normalfont\bf\selectfont}
\def\keywordheadfont{\fontfamily{\rmdefault}\fontsize{8}{10}\selectfont\itshape}
\def\keywordfont{\fontfamily{\rmdefault}\fontsize{8}{10}\selectfont\leftskip0pt\rightskip0pt}
\def\historyfont{\fontfamily{\sfdefault}\fontsize{8}{10}\fontseries{n}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\accessfont{\fontfamily{\sfdefault}\fontsize{8}{10}\fontseries{n}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\editorfont{\fontfamily{\sfdefault}\fontsize{8}{10}\fontseries{n}\selectfont\leftskip0pt\rightskip0pt plus1fill}
% Sections
\def\sectionfont{\fontfamily{\sfdefault}\fontsize{10}{11}\fontseries{b}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\subsectionfont{\fontfamily{\rmdefault}\fontsize{10}{11}\fontseries{b}\selectfont\leftskip0pt\rightskip0pt plus1fill}
\def\subsubsectionfont{\fontfamily{\rmdefault}\fontshape{it}\selectfont\raggedright}
\def\paragraphfont{\fontfamily{\rmdefault}\fontsize{10}{12}\bfseries\selectfont}
\def\subparagraphfont{\fontfamily{\sfdefault}\fontsize{8}{10}\fontseries{b}\selectfont}
\def\listheadfont{\normalfont\normalsize}
% Floats
\def\timesc{\fontsize{7.5}{12}\selectfont}
\def\figurenumberfont{\reset@font\fontsize{8}{9}\fontseries{b}\selectfont}%
\def\figurecaptionfont{\fontsize{8}{9}\selectfont}
%
\def\tablenumberfont{\reset@font\fontfamily{\rmdefault}\fontsize{8}{10}\fontseries{b}\selectfont}
\def\tablecaptionfont{\fontfamily{\rmdefault}\fontsize{8}{10}\selectfont\leftskip\tablecapleftskip\rightskip\tablecaprightskip}
\def\tablebodyfont{\fontfamily{\rmdefault}\fontsize{8}{9}\selectfont\leftskip\tableleftskip\rightskip\tablerightskip}
\def\tablefootfont{\fontfamily{\rmdefault}\fontsize{7}{9}\selectfont\leftskip\tablefootleftskip \rightskip\tablefootrightskip}
\def\TCHfont{\fontfamily{\rmdefault}\fontsize{8}{10}\selectfont}
\def\SCHfont{\fontfamily{\rmdefault}\fontsize{8}{10}\selectfont}
% List
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\def\mclistfont{\fontsize{10}{13}\selectfont}
% Biliography
\def\bibfont{\fontsize{8}{9}\selectfont}
% Index
\def\indexfont{\fontsize{9}{11}\selectfont}
% OTHERS
\def\extractfont{}%\fontsize{10}{12}\selectfont
\def\quotefont{\fontsize{10}{11}\selectfont}
\def\symbolsfont{\fontsize{10}{13}\selectfont}
\def\ackfont{\fontsize{10}{12}\selectfont}
%
%%%%%%%%%%%%%%%%%%%% ** JOURNAL HEADER COMMANDS ** %%%%%%%%%%%%%%%%%%%
%
\newskip\jnameskip
\def\jnamefont{\fontfamily{\rmdefault}\fontsize{10}{10}\selectfont\fontshape{it}\selectfont}
\def\jname#1{\gdef\@jname{#1}}\jname{Nucleic Acids Research}
%
\def\articletypefont{\fontfamily{\rmdefault}\fontsize{10}{10}\selectfont\fontshape{it}\selectfont}
\def\articletypesmallfont{\fontfamily{\rmdefault}\fontsize{10}{10}\selectfont\fontshape{it}\selectfont}
\def\articletype#1{\gdef\@articletype{#1}}
\articletype{ORIGINAL PAPER}
\def\articletypecheck{APPLICATIONS NOTE}
%
\def\pubdate#1{\gdef\@pubdate{#1}}
%
\def\articlesubtypefont{\fontfamily{\sfdefault}\fontsize{20}{22}\fontseries{b}\selectfont\selectfont}
\def\articlesubtype#1{\gdef\@articlesubtype{\uppercase{#1}}}
\articlesubtype{}%Sequence analysis
%
\def\jvolume#1{\gdef\@jvol{#1}}\jvolume{00}
\def\jissue#1{\gdef\@jissue{#1}}\jissue{00}
\def\pubyear#1{\def\@pubyear{#1}}\pubyear{0000}

\def\copyrightfont{\fontfamily{\rmdefault}\fontsize{7.5}{9}\selectfont\selectfont}
\def\copyrightyear#1{\def\@copyrightyear{#1}}
\def\artid#1{\gdef\@artid{#1}}\artid{000}
\def\shortjname#1{\gdef\@shortjname{#1}}\shortjname{gkn}
%
\def\catchlineinfofont{\fontfamily{\rmdefault}\fontsize{10}{11}\selectfont\fontshape{it}\selectfont}
\def\catchlineinfo{\begin{tabular}[t]{@{}r@{}}
\@jname,\ \@pubyear,\ \ifx\@jvol\undefined\else Vol.\ \@jvol,\ \fi\ifx\@jissue\undefined\else No.\ \@jissue\hskip1em\fi\ \textbf{\textit{\@firstpage--\@lastpage}}\\
doi:10.1093/nar/\@shortjname\@artid
\end{tabular}}
%
\long\def\title{\@ifnextchar[{\short@title}{\@@title}}
\def\short@title[#1]{\titlemark{#1}\@@@title}
\def\@@title#1{\authormark{#1}\@@@title{#1}}
\long\def\@@@title#1{\gdef\@title{#1}\addcontentsline{toc}{article}{#1}}
%
\def\subtitle#1{\gdef\@subtitle{{#1}}}
%
\long\def\author{\@ifnextchar[{\short@uthor}{\@uthor}}
\def\short@uthor[#1]{\authormark{#1}\@@author}
\def\@uthor#1{\authormark{#1}\@@author{#1}}
\long\def\@@author#1{\gdef\@author{#1}}
%
\def\address#1{\gdef\@address{#1}}
%
\def\history#1{\gdef\@history{#1}}\history{}
\def\access#1{\gdef\@access{#1}}\access{}
\def\editor#1{\gdef\@editor{#1}}\editor{}
%
\def\rec#1{\unskip Received #1}%
\def\acc#1{\unskip Accepted #1}%

\def\keyword#1{\def\@key{{\keywordheadfont \keywordname}:~#1}}
\gdef\email#1{E-mail: #1}

\newenvironment{abstract}{\begingroup%
  \abstractfont%
  \let\section\subparagraph%
  \def\@periodaftersection{}%
  {\fontseries{b}\selectfont ABSTRACT}\vskip6pt\noindent \ignorespaces}
{\endgroup}%\bigskip\@afterheading\@afterindentfalse

%
\def\mystar{\ifx\@webpdf\undefined
            $\ast$
            \else%
            \hyperlink{\csname fn\@roman\c@footnote\endcsname}{\textsuperscript{$\ast$}}%
            \fi}
          %
\def\@fnsymbol#1{\ensuremath{\ifcase#1\or {\ast} \or {\dagger}\or \ddagger\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}
%
\def\@myfnsymbol#1{\ensuremath{\ifcase#1\or ^{\ast} \or ^{\dagger}\or ^{\ddagger}\or
   \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}
%
%%%%%%%%%%%%%%%%%%%% ** ARTICLE HEADER ** %%%%%%%%%%%%%%%%%%%
%
\newcommand\maketitle{\par
  \begingroup
  \makeatletter
  \markboth{\@jname,\ \@pubyear,\ Vol.~\@jvol,\ No.~\@jissue}
  {\@jname,\ \@pubyear,\ Vol.~\@jvol,\ No.~\@jissue}
  \makeatother
  \renewcommand\thefootnote{\@myfnsymbol\c@footnote}%
    \long\def\@makefntext##1{\footnotesize%
      \begin{tabular*}{\textwidth}{@{}p{\textwidth}@{}}
      \if\c@footnote=1%
         \ifx\@webpdf\undefined%
            {\mystar}%
         \else%
            \hypertarget{\csname fn\@roman\c@footnote\endcsname}{\mystar}%
         \fi%
      \else%
         \ifx\@webpdf\undefined%
            {{\@thefnmark}}%
         \else%
            \hypertarget{\csname fn\@roman\c@footnote\endcsname}{{\textsuperscript{\@thefnmark}}}%
         \fi
      \fi
      ##1\end{tabular*}
    }%
    \def\@makefnmark{%
    \if\c@footnote=1%
       \ifx\@webpdf\undefined%
          {\mystar}%
       \else%
          \hyperlink{\csname fn\@roman\c@footnote\endcsname}{\mystar}%
       \fi%
    \else%
       \ifx\@webpdf\undefined%
          {{\@thefnmark}}%
       \else%
          \hyperlink{\csname fn\@roman\c@footnote\endcsname}{{\@thefnmark}}%
       \fi%
    \fi}%
    \if@twocolumn%
      \ifnum \col@number=\@ne%
        \@maketitle%
      \else%
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \@afterindentfalse
  \setcounter{footnote}{0}%
  \global\let\@chapter\@empty\global\let\type\relax
  \global\let\@title\@empty\global\let\title\relax
  \global\let\@subtitle\@empty\global\let\subtitle\relax %%subtitle
  \global\let\@author\@empty\global\let\author\relax
  \global\let\@thanks\@empty\global\let\thanks\relax
  \global\let\@address\@empty\global\let\address\relax
  \global\let\affD\relax
  \global\let\@Date\@empty\global\let\Date\relax
  \global\let\@abs\@empty\global\let\abs\relax
  \global\let\@key\@empty\global\let\key\relax
  \global\let\@tableofcontents\@empty\global\let\tableofcontents\relax
  \global\let\maketitle\relax\global\let\@maketitle\relax
\@afterheading
\enlargethispage{-24.5pt}}
%
\newdimen\titleskip\titleskip=3pt%\titleskip=-5.5pt
\newdimen\ruleskip\ruleskip=4pt
\newdimen\ruleht\ruleht=1pt
\def\@maketitle{%
 \begin{flushleft}%
  \let \footnote\thanks
 \ifx\@articlesubtype\empty\else
    \vspace*{-19.7pt}%
    \vtop to 10.3pt{\articlesubtypefont\@articlesubtype\par\vfill}
 \fi%
 \ifx\@title\empty\else
    \vspace*{\titleskip}%
    {\titlefont\@title\par}\vspace{-2pt}
 \fi%
 \ifx\@subtitle\undefined\else
     \vskip4pt
    {\subtitlefont\@subtitle\par}
 \fi%
 \ifx\@author\empty\else
    \vskip10pt%
    {\authorfont\@author\par}
 \fi%
 \ifx\@address\empty\else
    \vspace*{12pt}%
    {\addressfont\@address\par}
 \fi%
 \ifx\@history\empty\else
    \vspace*{14pt}%
    {\historyfont\@history\par}
 \fi%
 \ifx\@access\empty
    \vspace*{8.5pt}%
    \else
    \vspace*{3pt}%
    {\accessfont\@access\par}
 \fi%
 \ifx\@editor\empty\else
    \vspace*{3pt}%
    {\editorfont\@editor\par}
 \fi%
\vskip6pt
\end{flushleft}%
\par}
%
%%%%%%%%%%%%%%%%%%%% ** DROPCAP ** %%%%%%%%%%%%%%%%%%%
%
\def\dropfont{\fontsize{26}{26}\selectfont\bfseries}
\newcount\droplines\droplines=2
%
\newdimen\dropsep\dropsep=2pt
\newskip\capvskip\capvskip=5pt
\newskip\caphskip\caphskip=0pt
%
\newdimen\capwd
\newdimen\droplinewd
%
\def\dropcap#1#2{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Usage: \dropcap{1st letter}{few words}
            \settowidth{\capwd}{\dropfont#1}
            \droplinewd=\hsize%
            \advance\droplinewd by-\capwd
            %
            \advance\capwd by\dropsep
            \advance\capwd by\caphskip
            \advance\droplinewd by-\dropsep
            \advance\droplinewd by-\caphskip
            %
            \advance\droplines by1
            \vskip-\baselineskip
            \moveright \caphskip \vbox to 0pt{\vspace*{\capvskip}\hbox to \capwd{{\dropfont#1}}}\par%
            \parshape=  \droplines%
                        \ifcase\droplines%
                    \or%
                    \or%
                        \capwd \droplinewd
                        \or
                        \capwd \droplinewd \capwd \droplinewd
                        \or
                        \capwd \droplinewd \capwd \droplinewd \capwd \droplinewd
                        \or
                        \capwd \droplinewd \capwd \droplinewd \capwd \droplinewd \capwd \droplinewd
                        \fi
                        0pt \hsize
            \noindent\ignorespaces\textbf{#2}}
%
%%%%%%%%%%%%%%%%%%%% ** ARTICLE SECTIONS ** %%%%%%%%%%%%%%%%%%%
%
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\newcommand*\chaptermark[1]{}
\newcommand*\authormark[1]{}
\setcounter{secnumdepth}{0}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname~\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
%
\def\@seccntformat#1{\csname the#1\endcsname.\hskip0.4em\relax}

\newcommand\abstracthead{\@startsection {section}{4}{1em}%
                                   {0pt \@plus 0\p@ \@minus 0\p@}%
                                   {-4pt}%
                                   {\abstractheadfont}}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-18pt \@plus -2\p@ \@minus -2\p@}%
                                   {5pt}%
                                   {\sectionfont}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {-12pt \@plus -2\p@ \@minus -2\p@}%
                                   {5\p@}%
                                   {\subsectionfont}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                    {-11pt \@plus -2\p@ \@minus -2\p@}%
                                    {-.5em}%
                                    {\subsubsectionfont}}
\newcommand\paragraph{\@startsection{paragraph}{4}{0pt}%
                                    {2\p@ \@plus 2\p@ \@minus 2\p@}%
                                    {-3\p@ \@plus -1\p@ \@minus -1\p@}%
                                    {\paragraphfont}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{0pt}%
                                    {0\p@ \@plus 0\p@ \@minus 0\p@}%
                                    {-.5em \@plus -1\p@ \@minus -1\p@}%
                                    {\subparagraphfont}}

\newcommand\listhead{\@startsection{subparagraph}{5}{12\p@}%
                                    {0\p@ \@plus 0\p@ \@minus 0\p@}%
                                    {0.0001pt}%
                                    {\listheadfont}}

\def\periodaftersection#1{\gdef\@periodaftersection{#1}}
\periodaftersection{.}

\def\@sect#1#2#3#4#5#6[#7]#8{%
    \ifnum #2>\c@secnumdepth%
        \let\@svsec\@empty%
    \else%
        \refstepcounter{#1}%
        \ifnum #2 >4%
            \edef\@svsec{\csname the#1\endcsname\hskip .25em}%
        \else%
            \edef\@svsec{\csname the#1\endcsname\hskip1em}%
        \fi%
    \fi%
    \@tempskipa #5\relax%
    \ifdim \@tempskipa>\z@%
        \ifcase#2\or%
            \begingroup #6\relax
            \parindent=0pt%
            \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M{\uppercase{#8}}\par}%
            \endgroup
        \or
            %\@afterindenttrue
            \begingroup #6\relax
            \parindent=0pt%
            \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M{{#8}}\par}%
            \endgroup
        \or
            %\@afterindenttrue
            \begingroup #6\relax
            \parindent=0pt%
            \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M{{#8}}\par}%
            \endgroup
        \or
            \begingroup #6\relax
            \parindent=0pt%
            \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M{{#8}}\par}%
            \endgroup
        \or
            \begingroup #6\relax
            \parindent=0pt%
            \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M{{#8}}\par}%
            \endgroup
        \else
            \begingroup #6\relax
            {\noindent{\hskip #3\relax\@svsec}{\interlinepenalty \@M{#8}\par}}%
            \endgroup
        \fi%
        \csname #1mark\endcsname{#7}%
        \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth%
                                  \else \protect\numberline{\csname the#1\endcsname}%
                                  \fi#7}%
    \else%
    \periodaftersection{}
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8\@periodaftersection}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
    \fi%
\@xsect{#5}}
%
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
  \ifcase\level
  \or
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M \uppercase{#5}\@@par}%
    \endgroup
  \or
    %\@afterindenttrue
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \or
    %\@afterindenttrue
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \fi
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
%
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi%
  \par%
  \def\level{#2}%%%%%% my Change
  \@tempskipa #4\relax%
  \@afterindenttrue%
  \ifdim \@tempskipa <\z@%
    \@tempskipa -\@tempskipa \@afterindentfalse%
  \fi%
  \if@nobreak%
    \everypar{}%
  \ifnum#2=2%
  \vspace*{0pt}%
  \fi%
  \else%
    \addpenalty\@secpenalty\addvspace\@tempskipa%
  \fi%
  \@ifstar%
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
%
%%%%%%%%%%%%%%%%%%%% ** LISTS ** %%%%%%%%%%%%%%%%%%%
%
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}

\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}

\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

\newenvironment{quote}
               {\quotefont\list{}{\rightmargin0pt\leftmargin0pt}%
                \item\relax}
               {\endlist}

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%
\newdimen\labelwidthi
\newdimen\labelwidthii
\newdimen\labelwidthiii
\newdimen\labelwidthiv
%
\newskip\topsepi
\newskip\topsepii
\newskip\topsepiii
\newskip\topsepiv
%
\newskip\itemsepi
\newskip\itemsepii
\newskip\itemsepiii
\newskip\itemsepiv
%
\newdimen\labelsepi
\newdimen\labelsepii
\newdimen\labelsepiii
\newdimen\labelsepiv
%
\newdimen\parsepi
\newdimen\parsepii
\newdimen\parsepiii
\newdimen\parsepiv
%
\newdimen\rightmargini
\newdimen\rightmarginii
\newdimen\rightmarginiii
\newdimen\rightmarginiv
%
\newdimen\itemindenti
\newdimen\itemindentii
\newdimen\itemindentiii
\newdimen\itemindentiv
%
\newdimen\labelleftmargin
%
\newif\ifdotalign\global\dotaligntrue
%
\def\myenumerate#1{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else%
    \advance\@enumdepth\@ne%
    \settowidth{\csname labelwidth\romannumeral\the\@enumdepth\endcsname}{\listlabelfont#1}%
    \labelsep   \csname labelsep\romannumeral\the\@enumdepth\endcsname%
    \csname leftmargin\romannumeral\the\@enumdepth\endcsname\csname labelwidth\romannumeral\the\@enumdepth\endcsname%
    \advance\csname leftmargin\romannumeral\the\@enumdepth\endcsname\csname labelsep\romannumeral\the\@enumdepth\endcsname%
    \ifnum \@enumdepth =\@ne\advance\csname leftmargin\romannumeral\the\@enumdepth\endcsname\labelleftmargin\fi%%%%% Label leftmargin set for first level only!
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \expandafter%
      \list%
        \csname label\@enumctr\endcsname%
        {\listfont%
         \topsep     \csname topsep\romannumeral\the\@enumdepth\endcsname%
         \itemsep    \csname itemsep\romannumeral\the\@enumdepth\endcsname%
         \rightmargin\csname rightmargin\romannumeral\the\@enumdepth\endcsname%
         \parsep     \csname parsep\romannumeral\the\@enumdepth\endcsname%
         \itemindent \csname itemindent\romannumeral\the\@enumdepth\endcsname
         \usecounter\@enumctr\def\makelabel##1{%
         \ifdotalign\hss\llap{\listlabelfont##1}%
         \else
         \hfill\llap{{\hbox to\csname labelwidth\romannumeral\the\@enumdepth\endcsname{{{\listlabelfont##1}}}}}%
         \fi}}%
  \fi}
\let\endmyenumerate =\endlist
%
\newenvironment{arabiclist}[1][(1)]{%
\dotaligntrue%
\topsepi5.5pt plus2pt minus0pt%
\topsepii5.5pt plus0pt minus0pt%
\itemsepi3pt plus0pt minus0pt%
\itemsepii3pt plus0pt minus0pt%
\labelsepi4pt%
\labelsepii4pt%
\rightmargini0pt%
\rightmarginii0pt%
\labelleftmargin\parindent% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{(\theenumi)}    \def\theenumi{\arabic{enumi}}
\def\labelenumii{(\theenumii)}  \def\theenumii{\arabic{enumii})}
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}

\newenvironment{alphalist}[1][(b)]{%
\dotalignfalse%
\topsepi5.5pt plus2pt minus0pt%
\topsepii5.5pt plus2pt minus0pt%
\itemsepi3pt plus0pt minus0pt%
\itemsepii3pt plus0pt minus0pt%
\labelsepi4pt%
\labelsepii4pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin\parindent% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{(\theenumi)}    \def\theenumi{\alph{enumi}}
\def\labelenumii{(\theenumii)}  \def\theenumii{\alph{enumii}}
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}

\newenvironment{romanlist}[1][(i)]{%
%\dotalignfalse%
\topsepi6pt plus2pt minus0pt%
\topsepii0pt%
\itemsepi0pt
\itemsepii0pt
\labelsepi4pt%
\labelsepii4pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin1em% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{\theenumi}    \def\theenumi{\roman{enumi}}
\def\labelenumii{\theenumii}  \def\theenumii{\roman{enumii}}
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
\newenvironment{greeklist}[1][(\ensuremath{\gamma})]{%
%\dotalignfalse%
\topsepi6pt plus2pt minus0pt%
\topsepii6pt plus2pt minus0pt%
\itemsepi0pt
\itemsepii0pt
\labelsepi4pt%
\labelsepii4pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin1em% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{\theenumi}    \def\theenumi{(\@greek\c@enumi)}
\def\labelenumii{\theenumii}  \def\theenumii{(\@greek\c@enumii)}
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
\def\@greek#1{\ensuremath{\ifcase#1\or \alpha\or \beta\or \gamma\or
   \delta\or \epsilon\or \lambda\or \mu\or \sigma
   \or \zeta \else\@ctrerr\fi}}
%
\def\bulletfont{}
%
\newenvironment{bulletlist}[1][\bulletfont\textbullet]{%
\topsepi5pt plus2pt minus0pt%
\topsepii0pt%
\itemsepi3pt%
\itemsepii3pt
\labelsepi5.5pt%
\labelsepii5.5pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin9.5pt% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{\lower0pt\hbox{\bulletfont\textbullet}}%
\def\labelenumii{\lower0pt\hbox{\bulletfont\textbullet}}%
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
\newenvironment{methbulletlist}[1][\bulletfont\textbullet]{%
\topsepi5pt plus2pt minus0pt%
\topsepii0pt%
\itemsepi2pt%
\itemsepii2pt
\labelsepi5.5pt%
\labelsepii5.5pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin9.5pt% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{\lower0pt\hbox{\bulletfont\textbullet}}%
\def\labelenumii{\lower0pt\hbox{\bulletfont\textbullet}}%
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
\newenvironment{circlelist}[1][\bulletfont$\circ$]{%
\topsepi6pt plus2pt minus0pt%
\topsepii0pt%
\itemsepi0pt%
\itemsepii0pt
\labelsepi5.5pt%
\labelsepii5.5pt%
\rightmargini0pt \rightmarginii0pt
\labelleftmargin9.5pt% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{\lower0pt\hbox{\bulletfont$\circ$}}%
\def\labelenumii{\lower0pt\hbox{\bulletfont$\circ$}}%
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
\newenvironment{hyphenlist}[1][\textendash]{%
\topsepi6pt plus2pt minus0pt%
\topsepii0pt plus0pt minus0pt%
\itemsepi0pt%
\itemsepii0pt
\labelsepi5.5pt%
\labelsepii5.5pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin1em% leftmargin for labels for first level only
%\raggedright%
\def\labelenumi{\lower0pt\hbox{\textendash}}%
\def\labelenumii{\lower0pt\hbox{\textendash}}%
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
%
\newenvironment{unnumlist}[1][]{%
\topsepi6pt plus2pt minus0pt%
\topsepii0pt%
\itemsepi0pt%
\itemsepii0pt
\labelsepi0pt%
\labelsepii0pt%
\rightmargini0pt
\rightmarginii0pt
\labelleftmargin2em% leftmargin for labels for first level only
\itemindenti-1em%%%%% hangindent
%\raggedright%
\def\labelenumi{}%
\def\labelenumii{}%
\def\listfont{\normalfont}
\def\listlabelfont{\normalfont}
\myenumerate{#1}%
}{\endlist}
%
\gdef\tab#1{\begin{tabular}{#1}}
%
\newenvironment{mclist}[1]{%\par\vskip6pt plus2pt minus0pt
\parindent0pt\mclistfont
\list{}{\topsep6pt%
        \parsep0pt%
        \itemindent0pt
        \leftmargin0pt}\item[]#1}
{\end{tabular}\endlist}%
%
%%%%%%%%%%%%%%%%%%%% ** MATHS ** %%%%%%%%%%%%%%%%%%%
%
\renewcommand \theequation {{\bf\@arabic\c@equation}}
\setlength\arraycolsep{1.5\p@}
\setlength\arrayrulewidth{.4\p@}

%%% To get better spacing in the subscript
%%% \ldots and

\DeclareMathSymbol{\ldotjs}{\mathord}{letters}{"3A}
\def\mymathellipsis{{\mathchoice
  {\mathinner{\mskip0.05mu\ldotjs\mskip4mu\ldotjs\mskip4mu
    \ldotjs\mskip4mu}}%
  {\mathinner{\mskip0.05mu\ldotjs\mskip4mu\ldotjs\mskip4mu
    \ldotjs\mskip4mu}}%
  {\mathinner{\mskip2.6mu\ldotjs\mskip3.3mu\ldotjs\mskip3.3mu
    \ldotjs\mskip3.3mu}}%
  {\mathinner{\mskip2.6mu\ldotjs\mskip3.3mu\ldotjs\mskip3.3mu
    \ldotjs\mskip3.3mu}}}}%
\DeclareRobustCommand{\mydots}{%
   \ifmmode\mymathellipsis\else\textellipsis\fi}%
%\AtBeginDocument{\let\ldots=\mydots}

\def\mathtight{%
\thickmuskip2mu
\thinmuskip1mu
\medmuskip=1.5mu\relax}

%%% Standard math spacing
\def\MathSpS{%
  \thinmuskip=3mu
  \medmuskip=4mu plus 2mu minus 4mu
  \thickmuskip=5mu plus 5mu\relax}
%%% With no extra declaration it is \MathSPS in effect

%%% Standard math spacing with less flexibility
\def\MathSpSS{%
  \thinmuskip=3mu
  \medmuskip=4mu plus 1.5mu minus 2mu
  \thickmuskip=5mu plus 2mu minus 1mu\relax}

%%% Tight math spacing
\def\MathSpT{%
  \thinmuskip=2mu
  \medmuskip=2.8mu plus 1.5mu minus 1.5mu
  \thickmuskip=3.7mu plus 2mu minus 1mu\relax}

%%% Very tight math spacing
\def\MathSpTT{%
  \thinmuskip=2mu
  \medmuskip=2mu plus 1.2mu minus 0.8mu
  \thickmuskip=2.6mu plus 1.5mu minus 1mu\relax}

\jot=3pt
\def\DS{\displaystyle}
\mathchardef\@m=1500   % adapted value
\mathtight
%
%%%%%%%%%%%%%%%%%%%% ** OTHER ENVIR. ** %%%%%%%%%%%%%%%%%%%
%
\newenvironment{extract}
    {\begin{list}{}
    {%
        \extractfont
        \setlength{\topsep}{6pt}
        \setlength{\leftmargin}{1em}
        \setlength{\rightmargin}{0em}
        \setlength{\parsep}{0pt}
        \setlength{\itemsep}{18pt}
        \setlength{\itemindent}{0pt}
        \setlength{\listparindent}{12pt}
    }\item[]}
    {\end{list}}
\def\source#1{{\par\selectfont\leftskip0pt plus1fill #1\par}}
%
\newenvironment{ack}[1][\ackname]
               {\section*{#1}%
                \ackfont\list{}{\rightmargin0pt\leftmargin0pt}%
                \item\relax}
               {\endlist}
%
%%%%%%%%%%%%%%%%%%%% ** FIGURE & TABLE ** %%%%%%%%%%%%%%%%%%%
%
\setlength\tabcolsep{6\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
%
\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
%
\newcounter{table}
\def\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
%
\newenvironment{figure}
               {\let\@makecaption\@figurecaption\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\let\@makecaption\@figurecaption\@dblfloat{figure}}
               {\end@dblfloat}
\newenvironment{intextfigure}
               {\par\addvspace{12pt plus2pt minus2pt}\begin{minipage}{\textwidth}\centering}%
               {\end{minipage}\par\addvspace{12pt plus2pt minus2pt}\@endparenv}
%
\newenvironment{table}
               {\let\@makecaption\@tablecaption\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\let\@makecaption\@tablecaption\@dblfloat{table}}
               {\end@dblfloat}
%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{7\p@}
\setlength\belowcaptionskip{4.2\p@}
%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
%
\long\def\@figurecaption#1#2{%
\ifx\@webpdf\undefined\else%
\def\HyperRaiseLinkDefault{\figureheight}%
\advance\HyperRaiseLinkDefault\abovecaptionskip%
\fi%
  \vskip\abovecaptionskip%
  \sbox\@tempboxa{\figurecaptionfont {\figurenumberfont #1.}\hskip0.5em#2}%
  \ifdim \wd\@tempboxa > \hsize
     {\figurecaptionfont {\figurenumberfont #1.}\hskip0.5em#2\par}
  \else
     \global \@minipagefalse
     \hb@xt@\hsize{{\unhbox\@tempboxa\hfill}}%
  \fi}
%
\graphicspath{{\artdir}{\artdir}}
%
\newdimen\figurewidth
\newdimen\figureheight%
\def\EPSfbox#1{\centering%
\settowidth{\figurewidth}{\epsfbox{#1}}%
\settoheight{\figureheight}{\epsfbox{#1}}%
\vspace*{\@fptop}%
\epsfbox{#1}
}%
%
\newdimen\dwidth
\newdimen\dheight
\newcount\ncolumns
\newcount\nrows
%
\def\showtiff#1#2#3#4{%
\dwidth=#2\dheight=#2
\ncolumns=#3\nrows=#4
\divide\dheight by \ncolumns
\multiply\dheight by \nrows
\edef\width{\number\dwidth}\edef\height{\number\dheight}\hbox{\vbox to
\dheight{\vfill\hbox to \dwidth{\special{insertimage:#1 \width \space
\height}\hfill}}}\vspace{4pt}}%
%
% TABLE
%
\newdimen\tablewd
\newdimen\tablewidth
\newdimen\captionwd
\newbox\tempbox
\newskip\tableleftskip%
\newskip\tablerightskip%
\newskip\tablecapleftskip%
\newskip\tablecaprightskip%
\newskip\tablefootleftskip%
\newskip\tablefootrightskip%
%
\newcolumntype{d}[1]{D{.}{.}{#1}}
%
\def\TCH#1{\TCHfont #1} %Table col-heads
\def\SCH#1{\SCHfont #1} %Table col-heads
%
\def\@tablecaption#1#2{%
  \vspace*{\@fptop}%
  \settowidth{\global\captionwd}{\hbox{\tablecaptionfont{\tablenumberfont #1.}\hskip.5em#2\vphantom{pyg}}}%
  {\tablecaptionfont{\tablenumberfont #1.}\hskip.5em#2\vphantom{pyg}\par}
  \vskip\belowcaptionskip}
%
\long\def\tableparts#1#2#3{%%%%%%%%%%%%%%%%%%%%%%%%%%%%% #1-caption #2-body #3-footnote
    \setbox\tempbox\vbox{#1}                          %% to calculate width caption
    \addtocounter{table}{-1}                          %%
    \settowidth{\global\tablewd}{\tablebodyfont#2}    %% \captionwd - caption of width
    \tablewidth\hsize                                 %% \tablewd   - table width
    \advance\tablewidth-\tablewd
    \divide\tablewidth 2
    \global\tableleftskip\tablewidth
    \global\tablerightskip\tablewidth
    \ifdim\captionwd>\hsize
        \global\tablecapleftskip\tablewidth
        \global\tablecaprightskip\tablewidth %plus2fill
    \else
        \global\tablecapleftskip\tablewidth  %plus2fill
        \global\tablecaprightskip\tablewidth plus2fill
    \fi
    \global\tablefootleftskip\tablewidth
    \global\tablefootrightskip\tablewidth %plus2fill
    {#1 \par}%
    {\tablebodyfont #2\par}%
    {\tablefootfont #3\par}%
}
%
% Tablenotes
\long\def\tablenote#1{\par\textit{Note}:\ #1\par}
\long\def\tablesource#1{\par\textit{Source}:\ #1\par}
\long\def\tablefoot#1{\par#1\par}
%
\def\tfmark#1{\if#1**\else\textsuperscript{\smash{#1}}\fi}
%
\def\myhline#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
   \reserved@a\@xhline}%
%
%\def\toprule{\myhline{1pt}\vrule height12pt depth0pt width0pt}%
%\def\colrule{\vrule height0pt depth5pt width0pt\\\myhline{1pt}\vrule height12pt depth0pt width0pt}%
%\def\botrule{\vrule height0pt depth5pt width0pt\\\myhline{1pt}\omit {\vspace*{4pt}}}%
%

\newcommand{\up}{\HD{12}{0}}
\newcommand{\down}{\HD{0}{8}}
\newcommand{\Ndown}{\HD{0}{6}}

\def\toprule{\noalign{\ifnum0=`}\fi
  \hrule \@height .5\p@
  \hrule \@height 6\p@ \@width \z@
  \futurelet \@tempa\@xhline}

\def\colrule{\noalign{\ifnum0=`}\fi
  \hrule \@height 3.5\p@ \@width \z@
  \hrule \@height .5\p@
  \hrule \@height 5\p@ \@width\z@
  \futurelet \@tempa\@xhline}

\def\botrule{\noalign{\ifnum0=`}\fi
  \hrule \@height 3.25\p@ \@width \z@
  \hrule \@height .5\p@
  \hrule \@height 3.25\p@ \@width\z@
  \futurelet \@tempa\@xhline}

%\def\crules#1{\vrule height0pt depth5pt width0pt\\#1\vrule height11pt depth0pt width0pt}

\def\crules#1{\noalign{\hrule \@height 5.5\p@ \@width \z@}#1\noalign{\hrule \@height 5.5\p@ \@width \z@}}

%%%%%%%%%%%%%%%%%%%% ** FLOAT PLACEMENT ** %%%%%%%%%%%%%%%%%%%
%
% Float placement parameters.
%
% The total number of floats that can be allowed on a page.
\setcounter{totalnumber}{9}
% The maximum number of floats at the top and bottom of a page.
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
% The maximum part of the top or bottom of a text page that can be
% occupied by floats. This is set so that at least four lines of text
% fit on the page.
\renewcommand\topfraction{.9}
\renewcommand\bottomfraction{.9}
% The minimum amount of a text page that must be occupied by text.
% This should accomodate four lines of text.
\renewcommand\textfraction{.1}
% The minimum amount of a float page that must be occupied by floats.
\renewcommand\floatpagefraction{.85}%{.91}
% The same parameters repeated for double column output
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.9}
\renewcommand\dblfloatpagefraction{.9}
% Space between floats
\setlength\floatsep{18\p@ \@plus 3\p@ \@minus \z@}
% Space between floats and text
\setlength\textfloatsep{22\p@ \@plus 3\p@ \@minus 3\p@}
% Space above and below an inline figure
\setlength\intextsep   {6\p@ \@plus \z@ \@minus 2\p@}
% For double column floats
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{17\p@ \@plus 6\p@ \@minus 6\p@}

% Space left at top, bottom and inbetween floats on a float page.
\setlength\@fptop{3.5\p@}% \@plus 1fil         % no space above float page figures
\setlength\@fpsep{12\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}

% The same for double column
\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
%
%%%%%%%%%%%%%%%%%%%% ** TOC ** %%%%%%%%%%%%%%%%%%%
%
\newcommand\@pnumwidth{1.5em}
\newcommand\@tocrmarg{0em}
\newcommand\@dotsep{2}
\setcounter{tocdepth}{1}
\def\dotfill{\leaders\hbox to.3em{\hss .\hss}\hskip\z@ plus  1fill}%
%
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[3]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{.5em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \@hangfrom{\hbox to 10.5pc{\bfseries #1\hfill}}\textbf{#2} \hfil \hb@xt@\@pnumwidth{\hss #3}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@subpart[3]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{.5em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \@hangfrom{\hbox to 10.5pc{\bfseries #1\hfill}}\textbf{#2} \hfil \hb@xt@\@pnumwidth{\hss #3}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%
\newcommand*\l@article[2]{%
\renewcommand\@pnumwidth{5pc}
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{.6em \@plus\p@}%
    \setlength\@tempdima{10.5pc}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \fontsize{9}{11}\selectfont
      \advance\leftskip\@tempdima
      %\hskip -\leftskip
      {\bfseries #1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%
\newcommand*\l@author[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0em \@plus\p@}%
    \setlength\@tempdima{10.5pc}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \fontsize{8}{9}\selectfont
      \advance\leftskip\@tempdima
      %\hskip -\leftskip
      {#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
%

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
%
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
%
%%%%%%%%%%%%%%%%%%%% ** FOOTNOTES ** %%%%%%%%%%%%%%%%%%%
%
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{26\p@ \@plus 4\p@ \@minus 0\p@}
\skip\@mpfootins = \skip\footins
%
\renewcommand\footnoterule{%
  \kern-5\p@
  \hrule\@width\textwidth \@height .5\p@
  \kern5\p@}
%
\def\footnum#1{\gdef\@footnum{#1}}
\footnum{\mbox{\fontsize{5.31}{5}\selectfont\arabic{footnote}}}
%
\newdimen\footnumskip
\def\@makefnmark{$^{\mbox{\fontsize{5.98}{6}\selectfont\arabic{footnote}}}$}
\long\def\@makefntext#1{\hspace*{\footnumskip}{\textsuperscript{\@footnum}}#1\footnumskip=0pt}
%
%%%%%%%%%%%%%%%%%%%% ** APPENDIX ** %%%%%%%%%%%%%%%%%%%
%
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{table}{0}%
  \setcounter{figure}{0}%
  \setcounter{equation}{0}%
  \gdef\thesection{\Alph{section}.1}%
  \def\thefigure{\Alph{section}\@arabic\c@figure}%
  \def\thetable{\Alph{section}\@arabic\c@table}%
  \def\theequation {\Alph{section}\@arabic\c@equation}}
%
%%%%%%%%%%%%%%%%%%%% ** BIBLIOGRAPHY ** %%%%%%%%%%%%%%%%%%%
%
\newdimen\bibindent
\setlength\bibindent{11pt}
\def\@mybiblabel#1{\llap{\hbox to \leftmargin{\hfill#1\hskip\labelsep}\hskip-\labelsep}}
%
\newdimen\maxbibwd
\gdef\maxbib#1{%
\global\settowidth\maxbibwd{#1}
\leftskip-\maxbibwd}
\def\resetmaxbib{\leftskip0pt}
%
\newenvironment{thebibliography}[1]
     {\bibsection%
     \gdef\@bibmax{#1}%
     \addcontentsline{toc}{section}{\protect\numberline{\relax}\refname}
        \list{\ifx\@bibmax\empty\@biblabel{\@arabic\c@enumiv}\else\@mybiblabel{\@biblabel{\@arabic\c@enumiv}}\fi}%
           {\bibfont%
            \ifx\@bibmax\empty
                \settowidth\labelwidth{\@biblabel{#1}}%
                \leftmargin\labelwidth
                \advance\leftmargin\labelsep
            \else
                \itemindent=0pt
                \labelsep=3pt
                \settowidth\bibindent{\@bibmax.}
                \advance\bibindent\labelsep
                \leftmargin\bibindent
            \fi
            \itemsep=0pt \@plus 0\p@
            \parsep=0pt
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
    \endlist
    }
%
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newcommand{\bysame}{\leavevmode\hbox to5em{\hrulefill}\thinspace}
%
%%%%%%%%%%%%%%%% ** CITATION STYLE ** %%%%%%%%%%%%%%%%
%
\if@openbib
\DeclareRobustCommand\cite{%
  \@ifnextchar [{\@tempswatrue\@citex}{\@tempswafalse\@citex[]}}
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{;\penalty\@m\ }%
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {{\csname b@\@citeb\endcsname}}}}{#1}}
\def\@cite#1#2{{#1\if@tempswa , #2\fi}}
\def\@biblabel#1{}
\else
\usepackage[authoryear,sort,comma]{NAR-natbib}
\let\mycite\cite
\let\cite\citep
\setlength{\bibhang}{11pt}
\bibsep=0pt
\fi
\def\bibfont{\fontsize{8}{9}\selectfont}
%
\def\bibsection{\section*{\refname}%\markboth{\refname}{\refname}
\vspace*{2pt}}
\ifx\@webpdf\undefined\else%
\usepackage{hypernat}%% used with natbib pdfstartview={FitH -32768},
\fi
%
\ifx\@webpdf\undefined
\def\url#1{#1}%
\def\href#1#2{#1}%
\else%raiselinks,
\usepackage[hyperfootnotes, dvipsone, breaklinks=true, colorlinks=true,
urlcolor=black, linkcolor=blue,citecolor=blue,linkbordercolor=0 0 0,citebordercolor=0 0 0,
bookmarks,bookmarksopen=true,bookmarksnumbered=true,pdfpagelayout={OneColumn},pdfstartview={FitH -32768}]{hyperref}%
\fi%
%
%%%%%%%%%%%%%%%%%%%% ** INDEX ** %%%%%%%%%%%%%%%%%%%
%
\newenvironment{theindex}
               {%
                \columnseprule \z@
                \columnsep 12\p@
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem
                \linewidth42pc\hsize42pc%
                \multicolsep = 0pt plus 0pt minus 0pt%
                \begin{multicols}{3}[\vspace*{2pc}]%
                }
               {\end{multicols}%\if@restonecol\onecolumn\else\clearpage\fi
               }
\newcommand\@idxitem{\par\hangindent 18\p@}
\newcommand\subitem{\@idxitem \hspace*{9\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{18\p@}}
\newcommand\indexspace{\par \vskip 16\p@ \@plus5\p@ \@minus3\p@\relax}
%
%%%%%%%%%%%%%%%%%%%% ** OTHER MACAROS ** %%%%%%%%%%%%%%%%%%%
%
\newif\iffirstpagegiven \firstpagegivenfalse
\newif\iflastpagegiven   \lastpagegivenfalse

% use \firstpage and \lastpage to set the page range explicitly
\newcommand\firstpage[1]{%
  \gdef\@firstpage{#1}
  \global\firstpagegiventrue%
  }
\def\@firstpage{1}

\newcommand\lastpage[1]{%
  \xdef\@lastpage{#1}%
  \global\lastpagegiventrue}
\def\@lastpage{0}

\def\setlastpage{\iflastpagegiven\else
  \edef\@tempa{@lastpage}%
  \expandafter
  \ifx \csname \@tempa \endcsname \relax
    \gdef\@lastpage{0}%
  \else
    \xdef\@lastpage{\@nameuse{@lastpage}}%
  \fi
  \fi}

\def\writelastpage{%
  \iflastpagegiven
  \else
    \immediate\write\@auxout%
    {\string\global\string\@namedef{@lastpage}{\thepage}}
  \fi}

\def\setfirstpage{%
  \iffirstpagegiven
  \else
    \xdef\@firstpage{\thepage}
  \fi}
%
\AtBeginDocument{\setfirstpage\setlastpage}
\AtEndDocument{\writelastpage%
}
%
\newcommand\ourcurrentdirectory{}
\def\filecontents{\chaptername\space\thechapter}
\AtBeginDocument{\filename@parse{\jobname}
  \gdef\filename{\MakeLowercase{\filename@base}%
    \if\filename@ext\relax.tex%
    \else\MakeLowercase{\filename@ext}\fi}}
% calculate the time of day
\newcount\hours
\newcount\minutes
\hours=\time
\divide\hours by 60
\minutes=-\hours
\multiply\minutes by 60
\advance\minutes by \time
\def\timenow{\two@digits{\the\hours}:\two@digits{\the\minutes}}
%\font\slugfont=hv at 6pt
\font\slugfont=cmss10 at 6truept
\IfFileExists{crop.cfg}{}{%
  \renewcommand*\CROP@@info{%
    \lower 19\p@
    \hbox to \paperwidth{\slugfont%
      \hskip 3mm
      [\timenow\enskip\the\day/\the\month/\the\year\enskip \ourcurrentdirectory\filename]
      \hfill
      \space
      \hfill Page:\space\thepage\quad\@firstpage--\@lastpage%
      \hskip 3mm
      }}
  \renewcommand*\CROP@@ulc{%
    \begin{picture}(0,0)\unitlength 1mm\thinlines
      \put(-10,0){\line(1,0){9}}
      \put(0,10){\line(0,-1){9}}
    \end{picture}}
  \renewcommand*\CROP@@urc{%
    \begin{picture}(0,0)\unitlength 1mm\thinlines
      \put(10,0){\line(-1,0){9}}
      \put(0,10){\line(0,-1){9}}
    \end{picture}}
  \renewcommand*\CROP@@llc{%
    \begin{picture}(0,0)\unitlength 1mm\thinlines
      \put(-10,0){\line(1,0){9}}
      \put(0,-10){\line(0,1){9}}
    \end{picture}}
  \renewcommand*\CROP@@lrc{%
    \begin{picture}(0,0)\unitlength 1mm\thinlines
      \put(10,0){\line(-1,0){9}}
      \put(0,-10){\line(0,1){9}}
    \end{picture}}
  \cropdef\CROP@@ulc\CROP@@urc\CROP@@llc\CROP@@lrc{cam}
  \renewcommand*\CROP@kernel{\color@setgroup
    \vbox to\z@{\vskip-1in
      \hb@xt@\z@{\hskip-1in
        \CROP@every
        \vbox to\paperheight{%
          \hb@xt@\paperwidth{%
            \CROP@ulc\CROP@uedge\CROP@urc}%
          \CROP@ledge
          \hb@xt@\paperwidth{%
            \setbox\z@\hbox{\CROP@info}%
            \ht\z@\z@ \dp\z@\z@ \wd\z@\z@ \box\z@
            \CROP@llc\hfil\CROP@lrc}}%
        \hss}%
      \vss}\color@endgroup}
  }

\if@cropmarkson \crop[cam] \fi
%
\newdimen\grid@sidemargin
\newdimen\grid@wd
\newdimen\grid@ht
\newdimen\grid@linewd\grid@linewd=0.1pt
\newdimen\grid@topofline
\grid@topofline\headheight%
\advance\grid@topofline\headsep%
\advance\grid@topofline.35\topskip%
%
%%%%%%%%%%%%%%%%%%% ** LETTER SPACING & TRACKING %%%%%%%%%%%%%%%%%%
%
\sodef\textso{}{-.015em}{.3em\@plus.08em\@minus.06em}%
        {.55em\@plus.275em\@minus.183em}%
%
\def\dolist{\afterassignment\dodolist\let\next= }
\def\dodolist{\ifx\next\endlist \let\next\relax
   \else \\\let\next\dolist \fi
   \next}
%
\def\track#1#2{%
\def\\{\expandafter\if\space\next\setbox0=\hbox{\ }%
  \else \setbox0=\hbox{\next}\fi%
     \box0\kern#1}%
\leavevmode\hbox{\dolist#2\endlist\unkern}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% SMALL CAP %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newdimen\currfontsize
\def\makesc#1#2{%
\currfontsize=1em
\def\scsize{\fontsize{#1\currfontsize}{1em}\selectfont}%
\def\\{\expandafter\if\space\next\gdef\xxx{\ }%
  \else\gdef\eachchar{%
  \ifx\next a{\scsize A}\else%
  \ifx\next b{\scsize B}\else%
  \ifx\next c{\scsize C}\else%
  \ifx\next d{\scsize D}\else%
  \ifx\next e{\scsize E}\else%
  \ifx\next f{\scsize F}\else%
  \ifx\next g{\scsize G}\else%
  \ifx\next h{\scsize H}\else%
  \ifx\next i{\scsize I}\else%
  \ifx\next j{\scsize J}\else%
  \ifx\next k{\scsize K}\else%
  \ifx\next l{\scsize L}\else%
  \ifx\next m{\scsize M}\else%
  \ifx\next n{\scsize N}\else%
  \ifx\next o{\scsize O}\else%
  \ifx\next p{\scsize P}\else%
  \ifx\next q{\scsize Q}\else%
  \ifx\next r{\scsize R}\else%
  \ifx\next s{\scsize S}\else%
  \ifx\next t{\scsize T}\else%
  \ifx\next u{\scsize U}\else%
  \ifx\next v{\scsize V}\else%
  \ifx\next w{\scsize W}\else%
  \ifx\next x{\scsize X}\else%
  \ifx\next y{\scsize Y}\else%
  \ifx\next z{\scsize Z}\else%
  \next\kern-.25pt\unskip\fi\fi\fi\fi\fi\fi\fi\fi\fi%
  \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi%
  }\fi\eachchar}%
\leavevmode\hbox{\dolist#2\endlist\unkern}}
%
%%%%%%%%%%%%%%%%%%%% ** Author's COMMANDS ** %%%%%%%%%%%%%%%%%%%
%
%%%%for smaller size text
\newenvironment{methods}{%
  \begingroup
  \let\bulletlist\methbulletlist%
  \let\endbulletlist\endmethbulletlist%
\footnotesize
  \par}
{\par\endgroup}%\bigskip\@afterheading\@afterindentfalse
%
\setlength{\jot}{5\p@}
\mathchardef\@m=1500   % adapted value
%
\language=2
\hyphenation{Figure Table Figures Tables}

\def\sbond{\ensuremath{\raise.25ex\hbox{${-}\!\!\!\!{-}$}}\kern -.9pt}
\def\dbond{\ensuremath{\raise.25ex\hbox{=$\!$=}}}
\def\tbond{\ensuremath{\raise.20ex\hbox{${\equiv}\!\!\!{\equiv}$}}}

%
%%%%%%%%%%%%%%%%%%%% ** USER COMMANDS ** %%%%%%%%%%%%%%%%%%%
%
\twocolumn
\pagestyle{myheadings}
\pagenumbering{arabic}
\sloppy
\flushbottom
%

\usepackage{amsthm}
% Theorems
\def\th@plain{%
\thm@headfont{\quad\scshape}% heading font is bold
\thm@notefont{\upshape\mdseries}% same as heading font
\thm@headpunct{.}% no period after heading
\thm@headsep 5\p@ plus\p@ minus\p@\relax
\itshape % body font
}

\renewenvironment{proof}[1][\proofname]{\par
  \normalfont \topsep6\p@\@plus6\p@\relax
  \labelsep 0.5em
  \trivlist
  \item[\hskip\labelsep\hskip1em\textsc{#1}.]\ignorespaces
}{\endtrivlist\@endpefalse}

\def\editorialhead#1{{\fontfamily{\sfdefault}\fontsize{21}{21}\fontseries{b}\fontshape{it}\selectfont\leftskip0pt\rightskip0pt
plus1fill \noindent #1\par\vskip\baselineskip}}

\makeindex
\def\au#1{\index{#1}}

\endinput
%%
%% End of file `NAR.cls'.
