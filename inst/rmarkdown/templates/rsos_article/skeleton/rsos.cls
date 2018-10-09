%%% LaTeX class for manuscripts submitted to the
%%% Royal Society (RS)
%%%
%%% version: 1.1 (26 October 2012)
%%%

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{rsproca}
              [2005/12/01 v1.1
 Standard LaTeX document class]

\newif\if@doublespace\@doublespacefalse
\newif\if@usetimes\@usetimesfalse
\newif\if@usemathtime\@usemathtimefalse
\newif\if@restonecol
\newif\if@titlepage
\newif\iflink
\newif\ifpressmark
\newif\ifwebfig
\newif\ifCapsgreek
\newif\ifopenacc
\newif\if@supertitle@provided \@supertitle@providedfalse

\DeclareOption{usetimes}{\@usetimestrue}
\DeclareOption{usemathtime}{\@usemathtimetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\DeclareOption{nospace}{\@doublespacefalse}
\DeclareOption{link}{\global\linktrue}
\DeclareOption{draft}{\PassOptionsToPackage{draft}{graphicx}}
\DeclareOption{a4paper}{\PassOptionsToPackage{a4}{crop}}
\DeclareOption{centre}{\PassOptionsToPackage{center}{crop}}
\DeclareOption{crop}{\PassOptionsToPackage{cam}{crop}}
\DeclareOption{nocrop}{\PassOptionsToPackage{off}{crop}}
\DeclareOption{info}{\PassOptionsToPackage{info}{crop}}
\DeclareOption{noinfo}{\PassOptionsToPackage{noinfo}{crop}}
\DeclareOption{grid}{\def\@grid{grid}}
\DeclareOption{Capsgreek}{\global\Capsgreektrue}
\DeclareOption{openacc}{\global\openacctrue}

\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\ExecuteOptions{openacc,nocrop,a4paper,centre,twoside,onecolumn,final,openbib,Capsgreek}
\ProcessOptions

\RequirePackage{vruler}
\usepackage{crop}%
\usepackage{amsmath,amssymb,amsfonts,upref,endnotes}
\usepackage{amsthm}
\usepackage{marginnote}
\usepackage{soul}
\RequirePackage{graphicx}
\usepackage[figuresright]{rotating}
\usepackage{color}


\ifCapsgreek
\AtBeginDocument{\let\Gamma\varGamma
\let\Delta\varDelta
\let\Theta\varTheta
\let\Lambda\varLambda
\let\Xi\varXi
\let\Pi\varPi
\let\Sigma\varSigma
\let\Upsilon\varUpsilon
\let\Phi\varPhi
\let\Psi\varPsi
\let\Omega\varOmega}
\fi

\newcommand{\query}[1]{\marginnote{{#1}}}

\usepackage{dcolumn}
\newcolumntype{d}{D{.}{.}{-1}}

\RequirePackage[T1]{fontenc}

\usepackage{palatino}
\usepackage[scaled=0.85]{helvet}

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@ixpt\@xiipt
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus0\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@ixpt{11}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}


\setlength\parindent{15\p@}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {25\p@}
\setlength\topskip   {10\p@}
\setlength\footskip{30\p@}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
\if@compatibility
  \if@twocolumn
    \setlength\textwidth{410\p@}
  \else
    \setlength\textwidth{345\p@}
  \fi
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \setlength\@tempdimb{345\p@}
  \if@twocolumn
    \ifdim\@tempdima>2\@tempdimb\relax
      \setlength\textwidth{2\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \else
    \ifdim\@tempdima>\@tempdimb\relax
      \setlength\textwidth{\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \fi
\fi
\if@compatibility\else
  \@settopoint\textwidth
\fi
\if@compatibility
  \setlength\textheight{43\baselineskip}
\else
  \setlength\@tempdima{\paperheight}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-1.5in}
  \divide\@tempdima\baselineskip
  \@tempcnta=\@tempdima
  \setlength\textheight{\@tempcnta\baselineskip}
\fi
\addtolength\textheight{\topskip}
\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{11\p@}
\fi
\setlength\marginparpush{5\p@}
\if@compatibility
  \if@twoside
     \setlength\oddsidemargin   {44\p@}
     \setlength\evensidemargin  {82\p@}
     \setlength\marginparwidth {107\p@}
  \else
     \setlength\oddsidemargin   {63\p@}
     \setlength\evensidemargin  {63\p@}
     \setlength\marginparwidth  {90\p@}
  \fi
  \if@twocolumn
     \setlength\oddsidemargin  {30\p@}
     \setlength\evensidemargin {30\p@}
     \setlength\marginparwidth {48\p@}
  \fi
\else
  \if@twoside
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.4\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.6\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
  \else
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.5\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.5\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
    \addtolength\marginparwidth {-.4in}
  \fi
  \ifdim \marginparwidth >2in
     \setlength\marginparwidth{2in}
  \fi
  \@settopoint\oddsidemargin
  \@settopoint\marginparwidth
  \setlength\evensidemargin  {\paperwidth}
  \addtolength\evensidemargin{-2in}
  \addtolength\evensidemargin{-\textwidth}
  \addtolength\evensidemargin{-\oddsidemargin}
  \@settopoint\evensidemargin
\fi
\if@compatibility
  \setlength\topmargin{27pt}
\else
  \setlength\topmargin{\paperheight}
  \addtolength\topmargin{-2in}
  \addtolength\topmargin{-\headheight}
  \addtolength\topmargin{-\headsep}
  \addtolength\topmargin{-\textheight}
  \addtolength\topmargin{-\footskip}     % this might be wrong!
  \addtolength\topmargin{-.5\topmargin}
  \@settopoint\topmargin
\fi
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{0\p@ \@plus 0\p@ \@minus 0\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep 0\p@ \@plus0\p@ \@minus\p@
            \topsep 12\p@ \@plus2\p@ \@minus0\p@
            \itemsep0\p@ \@plus0\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    0\p@
              \itemsep  0pt}
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

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}

\setlength\parskip{0\p@}%
\setlength\parindent{1pc}%

\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}%
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}%
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}%

\@lowpenalty   51%
\@medpenalty  151%
\@highpenalty 301%

\clubpenalty 10000%
\widowpenalty 10000%

\displaywidowpenalty 100%
\predisplaypenalty   10000%
\postdisplaypenalty  2500%

\interlinepenalty 0%

\brokenpenalty 10000%

\hyphenpenalty=10000

\setlength{\paperheight}{247truemm}%
\setlength{\paperwidth}{174truemm}%

\setlength\headheight{7\p@}          % height of running head
\setlength\topmargin{12.15mm}            % top margin 3pc, 9pt
\addtolength\topmargin{8\p@}         %
\addtolength\topmargin{-1in}         % subtract out the 1 inch driver margin

\setlength\topskip{8\p@}            % height of first line of text%% {10\p@}
\setlength\headsep{0\p@}          % space below running head --
\addtolength\headsep{-\topskip}      %   base to base with first line of text

\setlength\footskip{23\p@}           % space above footer line
\setlength\maxdepth{.02\topskip}      % pages can be short or deep by half a line?

\setlength\textwidth{135mm}           % text measure excluding margins

\setlength\textheight{53\baselineskip}       % text height of 50pc,
\addtolength\textheight{-1.9pt}    %  - including first line of text

\setlength\marginparsep{6\p@}
\setlength\marginparpush{8\p@}
\setlength\marginparwidth{4.2pc}

\setlength\oddsidemargin{19.5mm}%4.8%4.64
\addtolength\oddsidemargin{-1in}    % subtract out the 1 inch driver margin
\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textwidth}
\addtolength\@tempdima{-19.5mm}
\setlength\evensidemargin{\@tempdima}
\addtolength\evensidemargin{-1in}

\setlength\columnsep{6\p@}          % space between columns for double-column text
\setlength\columnseprule{0\p@}      % width of rule between two columns

\setlength\footnotesep{0\p@}     % space between footnotes

\setlength{\skip\footins}{5\p@ \@plus 6\p@ \@minus 1\p@}

\setcounter{totalnumber}{10}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}

\renewcommand\topfraction{.921}
\renewcommand\bottomfraction{.921}
\renewcommand\textfraction{.079}
\renewcommand\floatpagefraction{.887}

\renewcommand\dbltopfraction{.88}
\renewcommand\dblfloatpagefraction{.88}

\setlength\floatsep    {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {18\p@ \@plus 2\p@ \@minus 2\p@}

\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}

\setlength\@fptop{0\p@}         % no space above float page figures
\setlength\@fpsep{12\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}

\setlength\@dblfptop{0\p@}
\setlength\@dblfpsep{12\p@ \@plus 1fil}
\setlength\@dblfpbot{0\p@ \@plus 2fil}

\def\startpage#1{\gdef\@startpage{#1}%
\setcounter{page}{#1}}\gdef\@startpage{}%
\def\endpage#1{\gdef\@endpage{#1}}\endpage{}%

\def\lastpage@putlabel{\addtocounter{page}{-1}%
   \iflink%
   \immediate\write\@auxout{\string%
   \newlabel{LastPage}{{\thepage}{\thepage}{}{}{}}%
   }%
   \else%
   \immediate\write\@auxout{\string%
   \newlabel{LastPage}{{\thepage}{\thepage}}%
   }%
   \fi%
   \addtocounter{page}{1}}


\AtBeginDocument{%
\usepackage{longtable}}

\newif\ifquery
\def\printqry#1#2{%
\gdef\@firstauthor{#1}%
\gdef\@corrauthor{#2}%
\global\querytrue}

\AtEndDocument{%
\message{Setting LastPage}%
\clearpage\lastpage@putlabel}%

\def\jname#1{\gdef\@jname{#1}}
\def\@jname{rsos}

\sodef\stitletrack{}{0.11em}{0.5em}{\z@}

\def\mytrack#1{\kern1pt\fontsize{8}{10}\selectfont\stitletrack{#1}}
\def\supertitle#1{\def\@supertitle{{\noindent {{#1}}}}\global\@supertitle@providedtrue}
\def\Journal#1{\gdef\@Journal{#1}}\Journal{R. Soc. open sci. }
\def\Doi#1{\gdef\@doi{10.1098/\@jname.#1}}\Doi{}
\def\Year#1{\gdef\@Year{#1}}\Year{}
\def\Vol#1{\gdef\@Vol{#1}}\Vol{}
\def\artid#1{\gdef\@artid{#1}}\artid{}
\def\Issue#1{\gdef\@Issue{#1}}\Issue{}
\def\Pages#1{\gdef\@Pages{#1}}\Pages{\@startpage--\iflink\ref*{LastPage}\else\ref{LastPage}\fi}%

\def\rhfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{11}{14}\selectfont}
\def\foliofont{\reset@font\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{9}{12}\selectfont}
\def\dropfoliofont{\reset@font\fontfamily{\rmdefault}\fontseries{m}\fontshape{n}\fontsize{10}{12}\selectfont}
\def\rffont{\fontfamily{\rmdefault}\fontseries{m}\fontshape{it}\fontsize{8}{10}\selectfont}

\gdef\rec#1{\gdef\@rec{#1}}\rec{}
\gdef\acc#1{\gdef\@acc{#1}}\acc{}
\gdef\pub#1{\gdef\@pub{#1}}\pub{}
\gdef\onlinepub#1{\gdef\@onlinepub{#1}}\onlinepub{}

\def\Copyrightinfo#1{\gdef\@copyrightinfo{#1}}\Copyrightinfo{This journal is \raise1.2pt\hbox{\scriptsize\smash{\copyright}}\ 2012 The Royal Society}
\def\slinf#1{\gdef\@sinfo{\vbox to 0pt{\vskip14pt\scriptsize {\jobname --- \the\day/\the\month/\the\year ---\CROP@time ---Copy Edited by: #1}}}}\slinf{}

\def\AOPfooter{\hbox to \textwidth{\begin{minipage}[b]{\textwidth}%
\fontsize{8}{9}\selectfont%
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll@{}}%
\ifx\@rec\empty\ \else\textit{Received}\ \@rec\fi & \\%
\ifx\@acc\empty\ \else\textit{Accepted}\ \@acc\fi &  \@copyrightinfo%
\end{tabular*}%
\vspace*{-3.5pt}%
\end{minipage}}}

\newdimen\catchlinewd\catchlinewd\textwidth
\advance\catchlinewd-23pt%

\newdimen\dcht\dcht=2.25pt
\newdimen\frametextht\frametextht\textheight%
\advance\frametextht-\dcht%

\def\innerframe{\ifx\@undefined\@grid\else\rlap{\textcolor{magenta}{\vbox to 0pt{%
\vskip-\headheight%
\vbox to 0pt{\vss\hrule \@height.1pt width\textwidth}%
\vskip\headheight\vbox to 0pt{\vss\hrule \@height.1pt width\textwidth}%
\vskip\headsep\vbox to 0pt{\vss\hrule \@height.1pt width\textwidth}%
\hbox to \textwidth{\llap{\vrule \@width.1pt height\frametextht}\hfil%
\vrule \@width.1pt  height\frametextht}%
\vbox to 0pt{\vss\hrule  \@height.1pt width\textwidth}%
\vskip \footskip\vskip\dcht\vbox to 0pt{\vss\hrule  \@height.1pt width\textwidth}%
\@ifundefined{footheight}{}{\vskip -\footheight}%
\vbox to 0pt{\vss\hrule \@height.1pt width\textwidth}%
\vss%
}}}\fi}%

\definecolor{gray}{cmyk}{0,0,0,.2}% #1 50pt width
\def\fproofmark#1{\vbox to 0pt{\noindent{\textcolor{gray}{\vrule height23pt depth0pt width\textwidth}}\llap{\raise6pt\hbox to \textwidth{\hfill {\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{16}{14}\selectfont\textcolor{white}{#1}} \hfill}}}\nointerlineskip}
\def\pressmark#1{\ifpressmark{\rlap{\vbox to 0pt{\vskip-3pc\fproofmark{#1}}}}\fi}

\definecolor{jobcolor}{cmyk}{0,0,0,.95}
\definecolor{joblightcolor}{cmyk}{0,0,0,.95}
\definecolor{abstractcolor}{cmyk}{0,0,0,.95}
\definecolor{copyrightcolor}{cmyk}{.04,.04,.12,.08}

\Vol{00}
\artid{0000000}

\newlength{\myrunhwidth}
\def\runhead{\textcolor{jobcolor}{\rhfont \@jname.royalsocietypublishing.org\enskip \@Journal \@artid\,\,\,}}

\settowidth{\myrunhwidth}{\runhead}

\def\myrunhead{\vbox{\hbox{\colorbox{black}{\hbox to 10pt{\hfil\textcolor{white}{\foliofont\thepage}\hfil}}}\vskip11pt
\hbox{\hskip3pt\begin{turn}{-90}{\vbox{\hbox{\runhead}
\vspace*{3pt}
\hbox to \the\myrunhwidth{\dotfill}}}\end{turn}}}\hspace*{-3.5pc}}

 \def\ps@plain{\vskip-3pc\let\@mkboth\@gobbletwo
         \def\@oddfoot{\noindent\raisebox{-7.5pt}{\hskip-12.8pt\includegraphics{RSOS_Pubs_Logo_Line_CMYK}}
         \ifopenacc
            \hskip28.8pt\colorbox{copyrightcolor}{\hbox to 75mm{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{7.5}{10}\selectfont 
            \vbox{\hsize75mm \textcolor{black}{$\copyright$ \@Year\ The Authors. Published by the Royal Society under the terms of the Creative Commons Attribution
            License \iflink\href{http://creativecommons.org/licenses/by/4.0/}{http://creativecommons.org/licenses/}\break \href{http://creativecommons.org/licenses/by/4.0/}{by/4.0/}\else http://creativecommons.org/licenses/\break by/4.0/\fi, which permits unrestricted use, provided the original author and source are credited.\vphantom{g}}}\par}}
         \else
            \hskip28.8pt\colorbox{copyrightcolor}{\hbox to 75mm{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{7.5}{10}\selectfont 
            \vbox{\hsize75mm \textcolor{black}{$\copyright$ \@Year\ The Author(s) Published by the Royal Society.
            All rights reserved.}}\par}}
\fi
}%
         \let\@evenfoot\@oddfoot%
         \def\@oddhead{\smash{\begin{picture}(0,0)\put(0,23){\pressmark{{ARTICLE IN PRESS}}}\end{picture}}\innerframe}%
         \let\@evenhead\@oddhead}

\def\ps@headings{%
    \let\@oddfoot\@empty
      \def\@evenhead{\hspace*{\fill}\myrunhead}%
      \def\@oddhead{\hspace*{\fill}\myrunhead}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}

\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{}%
    \def\@oddhead{}%
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
    {\Large\mathversion{bold}\@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
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
    \thispagestyle{plain}
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
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
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\mathversion{bold} \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {(\@alph\c@subsection)}
\renewcommand\thesubsubsection{\@roman\c@subsubsection}
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

\def\sectionfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{16}{18}\selectfont\color{jobcolor}}
\def\subsectionfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{14}{18}\selectfont\color{jobcolor}}
\def\subsubsectionfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{12}{14}\selectfont\color{jobcolor}}

\newcommand\section{\def\@seccntformat##1{\csname the##1\endcsname.\hskip.4em}\@startsection {section}{1}{\z@}%
                                   {-12pt \@plus -1ex \@minus -.2ex}%
                                   {6pt}%
                                   {\sectionfont}}
\newcommand\subsection{\def\@seccntformat##1{\csname the##1\endcsname\hskip.4em}\@startsection{subsection}{2}{\z@}%
                                     {10pt \@plus 1ex \@minus .2ex}%
                                     {6pt}%
                                     {\subsectionfont}}
\newcommand\subsubsection{\def\@seccntformat##1{\textup{(\csname the##1\endcsname\textup)}\,}\@startsection{subsubsection}{3}{\z@}%
                                     {9pt \@plus 1ex \@minus .2ex}%
                                     {6pt}%
                                     {\subsubsectionfont}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}

%
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \ifnum#2=2
    \@afterindentfalse
  \fi
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
%
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {32.5pt}
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
\setlength  \labelsep  {.4em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{(\@roman\c@enumi)}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi}
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
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
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
\newenvironment{quote}%
               {\par\small\list{}{\topsep12pt\leftmargin2pc\rightmargin\z@
               }%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
\renewcommand \theequation {A\hskip2pt\@arabic\c@equation}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\numberwithin{equation}{section}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newcounter{scheme}
\renewcommand \thescheme {\@arabic\c@scheme}
\def\fps@scheme{tbp}
\def\ftype@scheme{1}
\def\ext@scheme{lof}
\def\fnum@scheme{\schemename~\thescheme}
\newenvironment{scheme}
               {\@float{scheme}}
               {\end@float}
\newenvironment{scheme*}
               {\@dblfloat{scheme}}
               {\end@dblfloat}

\def\captionfont{\reset@font\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{8.5}{10}\selectfont}
\def\captionheadfont{\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{8.5}{10}\selectfont\raggedright}
\def\tablebodyfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{8.5}{11}\selectfont\raggedright}
\def\tablenotefont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{8.5}{11}\leftskip-\leftnoteskip\rightskip-\leftnoteskip plus1fill\selectfont}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{6.75\p@}
\setlength\belowcaptionskip{9\p@}

\long\def\tabnote#1{{\par\vskip2pt\tablenotefont #1\par}}
\newdimen\leftnoteskip
\def\processtable#1#2#3{{%
\setlength\abovecaptionskip{0\p@}%
#1{{\tablebodyfont #2}}%
\settowidth{\leftnoteskip}{{{\tablebodyfont #2}}}%
\advance\leftnoteskip-\textwidth%
\divide\leftnoteskip 2
{#3}}}%

\usepackage{colortbl}

\def\tabhead#1{\textcolor{white}{#1\vphantom{y}}}

\def\toprule{\noalign{\ifnum0=`}\fi%
\color{jobcolor}
  \hrule \@height 14\p@\relax
  \hrule \@height -12.8\p@ \@width 0\p@
    \futurelet\@tempa\@xhline
}

\def\mtoprule{\noalign{\ifnum0=`}\fi%
\color{jobcolor}
  \hrule \@height 13\p@\relax
  \hrule \@height -14.8\p@ \@width 0\p@
  \futurelet\@tempa\@xhline
}

  \def\midruledotfill{%
  \leavevmode
  \cleaders \hb@xt@ .19em{\hss\tiny.\hss}\hfill
  \kern\z@}

\def\midrule{\noalign{\midruledotfill}}

\def\botrule{\noalign{\midruledotfill}}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\captionheadfont #1.}\hskip2.5pt{\captionfont #2}}%
  \ifdim \wd\@tempboxa <\hsize
        \global \@minipagefalse
        \hb@xt@\hsize{\box\@tempboxa}%
  \else
    \ifdim \wd\@tempboxa >1.99\hsize
        {{\captionheadfont #1.}\hskip2.5pt {\captionfont #2}\par}
    \else
        {{\captionheadfont #1.}\hskip2.5pt {\captionfont#2}\par}
    \fi
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{18pt}
\newcommand\@tocrmarg{18pt plus 1fil}
\newcommand\@dotsep{3}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
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


\def\@biblabel#1{#1}

\newdimen\bibindent
\setlength\bibindent{0pc}
\def\bibfont{\fontfamily{\rmdefault}\fontseries{m}\fontshape{n}\fontsize{9}{11}\selectfont}
\newenvironment{thebibliography}[1]
     {\section*{\refname%\@mkboth{\refname}{\refname}
     }%
     \addcontentsline{toc}{section}{\refname}%
      \bibfont
      \list{\@biblabel{\@arabic\c@enumiv.}}
           {\settowidth\labelwidth{\@biblabel{#1.}}
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
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
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\schemename{Scheme}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
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

\def\supertitlefont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{24}{26}\selectfont\raggedright}
\def\titlefont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{20}{22}\selectfont\raggedright\color{jobcolor}}
\def\authorfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{14}{22}\selectfont\raggedright\color{jobcolor}}
\def\addressfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{11}{15}\selectfont\raggedright}
\def\abstractfont{\fontfamily{\rmdefault}\fontseries{m}\fontshape{n}\fontsize{9}{12}\selectfont\parindent1em}
\def\keywordfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright\mathversion{bold}}
\def\subjectfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright\mathversion{bold}}
\def\researchfont{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright\mathversion{bold}}


\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

\def\title{\@ifnextchar[{\@title@wst@}{\@title@nst@}}
\def\@title@wst@[#1]{\@title@assign@}
\def\@title@nst@#1{\@title@assign@{#1}}
\def\@title@assign@#1{\def\@title{#1}}

\def\shorttitle#1{\gdef\@shorttitle{#1}}

\def\author{\@ifnextchar[{\@author@wst@}{\@author@nst@}}
\def\@author@wst@[#1]{\@author@assign@}
\def\@author@nst@#1{\@author@assign@{#1}}
\def\@author@assign@#1{\gdef\@author{#1}}

\newif\if@classification@provided \@classification@providedfalse
\newif\if@esm@provided \@esm@providedfalse
\newif\if@others@provided \@others@providedfalse
\newif\if@corres@provided \@corres@providedfalse
\newif\if@keywords@provided \@keywords@providedfalse
\newif\if@subject@provided \@subject@providedfalse
\newif\if@citearticle@provided \@citearticle@providedfalse
\newif\if@history@provided \@history@providedfalse

\newcommand{\address}[1]{\gdef\@address{#1}}%

\newbox\absbox
\renewenvironment{abstract}{\global\setbox\absbox\vbox\bgroup\par\abstractfont\leftskip0pc\rightskip14.2pc\noindent\ignorespaces}{\par\egroup}

\newbox\fmtextbox
\newenvironment{fmtext}{\global\setbox\fmtextbox\vbox\bgroup\par\normalfont\hsize18.8pc\leftskip0pc\rightskip0pc

\renewenvironment{quote}%
               {\par\small\list{}{\topsep12pt\leftmargin2pc\rightmargin15.2pc
               }%
                \item\relax}
               {\endlist}

\def\@listi{\leftmargin\leftmargini
\rightmargin13.2pc
            \parsep 0\p@ \@plus0\p@ \@minus\p@
            \topsep 12\p@ \@plus2\p@ \@minus0\p@
            \itemsep0\p@ \@plus0\p@ \@minus\p@}
\let\@listI\@listi

\noindent\ignorespaces}{\par\egroup}

\def\keywordsname{{\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright Keywords:}}
\def\@keywords{}
\newcommand\keywords[1]{%
     \global\@keywords@providedtrue%
     \gdef\@keywords{{\keywordsname}\par #1}}%


\def\subjectname{{\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright Subject Areas:}}
\def\@subject{}
\newcommand\subject[1]{%
     \global\@subject@providedtrue%
     \gdef\@subject{{\subjectname}\par #1}}%

\def\titlehead{Research}

\def\researchname{{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{18}{31}\selectfont\raggedright%
\raisebox{9pt}{\titlehead}\ifopenacc\hfill\hfill%
\else\hfill\fi\href{http://crossmark.crossref.org/dialog/?doi=\@doi&domain=pdf&date_stamp=\@onlinepub}{\includegraphics{OpenAccesslogo_bw}\hfill\includegraphics{RS_crossmark_logo}}\par}}

\def\@citearticle{}
\newcommand\citearticle[3]{%
     \global\@citearticle@providedtrue%
     \gdef\@citearticle{{\researchname}\par \resau{Cite this article:} #1. \@Year\ #2. Proc R Soc A #3. https://doi.org/\@doi}}%

\def\@corres{}
\newcommand\corres[1]{%
     \global\@corres@providedtrue%
     \gdef\@corres{{\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright 
     \correshead}\par #1}}%

\def\@history{{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright Article submitted to journal}}
\newcommand\history[1]{%
\global\@history@providedtrue
\gdef\@history{#1}}

%\newcommand\history{%
%     \global\@history@providedtrue%
%     \gdef\@history{{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}l@{}}%
%\ifx\@rec\empty \else Received:\ \@rec\fi\\%
%\ifx\@acc\empty \else Accepted:\ \@acc\fi\\%
%\ifx\@pub\empty \else Published:\ \@pub\fi%
%\end{tabular*}
%}}}%

\def\@esm{}
\newcommand\esm[1]{%
     \global\@esm@providedtrue%
     \gdef\@esm{{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont Electronic supplementary material is available
at https://doi.org/\@doi\ or via http://\@jname.royalsocietypublishing.org.\par}}}%

\def\@others{}
\newcommand\others[1]{%
     \global\@others@providedtrue%
     \gdef\@others{{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{10}{14}\selectfont #1\par}}}%

\def\resau#1{{\fontfamily{\sfdefault}\fontseries{b}\fontshape{n}\fontsize{10}{14}\selectfont\raggedright#1}}

\def\@classification{}
\newcommand\classification[2][Jel Classification]{%
     \global\@classification@providedtrue%
     \gdef\@classification{{\noindent\centering\textit{#1.}\enskip #2\par}}}%

\def\@fnsymbol#1{\ensuremath{\ifcase#1\or \text{*}\or ^{\dagger}\or ^{\ddagger}\or
   ^{\mathsection}\or ^{\mathparagraph}\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi}}

\def\correshead{Author for correspondence:}%

\renewcommand\maketitle{\par
  \begingroup
\ifquery
   \unsetvruler%
   \pagestyle{empty}
   \noindent{\begin{tabular}{@{}p{67pt}@{\quad}>{\hangindent1em}P{25.5pc}@{}}%\fboxrule=.1pt\fboxsep0pt\fbox
   Journal: & \textbf{PROCEEDINGS OF THE ROYAL SOCIETY A}\\\\
   Article id: & \textbf{\jobname}\\\\
   Article Title:&  \textbf{\@title}\\\\
   First Author: & \@firstauthor\\\\
   Corr. Author: &  \@corrauthor
   \end{tabular}}
   \vskip4\baselineskip
   \noindent \textbf{AUTHOR QUERIES -- TO BE ANSWERED BY THE
   CORRESPONDING AUTHOR}
   \vskip\baselineskip
   \noindent The following queries have arisen during the typesetting of your
   manuscript. Please answer these queries by marking the required
   corrections at the appropriate point in the text.
   \vskip\baselineskip
   \def\arraystretch{1.25}
   \input\jobname_AQ.tex%
   \setcounter{page}{0}%
   \setcounter{table}{0}%
\fi
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{{{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\noindent{{\normalfont\@thefnmark}}\correshead##1\gdef\correshead{}}%
    \if@twocolumn
    \thispagestyle{plain}
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
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
\enlargethispage{-8pt}%
}
\def\Bytext{B\textsc{Y}}

\def\@maketitle{%
\vspace*{-5.5pc}
\noindent\begin{minipage}[!t]{50mm}
\hskip-1pc
\vbox to 242mm{{\vskip68pt\includegraphics{OPENSCIENCE}\vskip21pt
{\fontfamily{\sfdefault}\fontseries{m}\fontshape{n}\fontsize{13.5}{15}\selectfont\raggedright 
\textcolor{jobcolor}{\@jname.royalsocietypublishing.org}}\vskip10pt
\if@citearticle@provided
        \vskip11pt
        {\researchfont \@citearticle\par}
\vskip16pt
    \else
    {\researchname}
\vskip16pt
    \fi
%\if@history@provided
\@history
\vskip22pt
%\else
%\vskip22pt
%\fi
    \if@subject@provided
        {\subjectfont \@subject\par}
\vskip12pt
    \else
    \fi
    \if@keywords@provided
        {\keywordfont \@keywords\par}
\vskip16pt
    \else
    \fi
  \if@corres@provided
        {\keywordfont \@corres\par}
  \else
   \fi
\vfill
\if@others@provided
\vskip1.5pc
\@others
\vspace*{23pt}
\else
\fi
\if@esm@provided
\@esm
\vspace*{23pt}
\else
\fi
}}
\end{minipage}\hspace*{2pc}
  \noindent\begin{minipage}[!t]{80mm}%
\vbox to 239mm{\vskip64pt
  \let\footnote\thanks%
  \parindent=0pt%
  \if@supertitle@provided
  \centerline{\supertitlefont{\@supertitle}}
\vskip12pt
  \fi
      {\titlefont\mathversion{bold}\@title \par}%
\vspace*{-11pt}
    \rule{80mm}{.5pt}\vspace*{-7pt}
    {{\authorfont \@author\vphantom{$^1$}\par}}\vspace*{-5pt}
    \rule{80mm}{.5pt}
    \ifx\@address\empty\else
        {{\addressfont \leavevmode\vphantom{$^1$}\@address\par}}
    \fi
    \ifvoid\absbox\else
        \vskip15pt%
        {\colorbox{copyrightcolor}{\vbox{\hsize75mm{{\noindent\usebox\absbox}}}}}%
    \fi
    \ifvoid\fmtextbox\else
        \vskip15pt%
        {{\noindent\usebox\fmtextbox}}%
    \fi
    \if@classification@provided
\vskip4pt
      {\leftskip\z@\parfillskip=\z@ plus1fill%
        \fontsize{8}{9}\selectfont\@classification\par}%
    \fi
\vspace*{\fill}
            }
  \end{minipage}%
  \par
  \thispagestyle{plain}
  \vskip 14pt plus8pt minus3pt
 }
 
\renewcommand\footnoterule{}
\renewcommand\@makefntext[1]{\fontsize{7}{10}\selectfont\noindent{\@makefnmark}#1\vskip-1pt}

\newtheorem{mythm}{mythm}[section]

\newif\if@rotate \@rotatefalse
\newif\if@rotatecenter \@rotatecenterfalse
\def\rotatecenter{\global\@rotatecentertrue}
\def\rotateendcenter{\global\@rotatecenterfalse}
\def\rotate{\global\@rotatetrue}
\def\endrotate{\global\@rotatefalse}
\newdimen\rotdimen
\def\rotstart#1{\special{ps: gsave currentpoint currentpoint translate
    #1 neg exch neg exch translate}}
\def\rotfinish{\special{ps: currentpoint grestore moveto}}
\def\rotl#1{\rotdimen=\ht#1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to\wd#1{\vskip \wd#1
    \rotstart{270 rotate}\box #1\vss}\hss}\rotfinish}
\def\rotr#1{\rotdimen=\ht #1\advance\rotdimen by \dp#1
    \hbox to \rotdimen{\vbox to \wd#1{\vskip \wd#1
    \rotstart{90 rotate}\box #1\vss}\hss}\rotfinish}

\hyphenation{Table}
\hyphenation{Figure}
\hyphenation{Section}
\hyphenation{equation}
\hyphenation{Theorem}
\hyphenation{Lemma}
\hyphenation{Algorithm}
\hyphenation{Definition}
\hyphenation{Corollary}
\hyphenation{Proof}
\hyphenation{Remark}

\DeclareMathSizes{5}     {5}   {5}  {5}
\DeclareMathSizes{6}     {6}   {5}  {5}
\DeclareMathSizes{7}     {7}   {5}  {5}
\DeclareMathSizes{8}     {8}   {6}  {5}
\DeclareMathSizes{9}     {9}   {7}  {5}
\DeclareMathSizes{10}   {10}   {7}  {5}
\DeclareMathSizes{12}   {12}   {9}  {7}

\setlength{\jot}{5\p@}
\skip\@mpfootins = \skip\footins
\fboxsep=6\p@
\fboxrule=.25\p@

\medmuskip=4mu
\thickmuskip=3.5mu

\vbadness=9999
\tolerance=9999
\doublehyphendemerits=10000
\doublehyphendemerits 640000
\finalhyphendemerits  1000000

\flushbottom
\frenchspacing
\onecolumn
\pagestyle{headings}

\DeclareSymbolFont{EulerExtension}{U}{euex}{m}{n}
\DeclareMathSymbol{\intop}{\mathop}{EulerExtension}{"52}
\DeclareMathSymbol{\ointop}{\mathop}{EulerExtension}{"48}

\renewenvironment{subequations}{%
  \refstepcounter{equation}%
  \protected@edef\theparentequation{\theequation}%
  \setcounter{parentequation}{\value{equation}}%
  \setcounter{equation}{0}%
  \def\theequation{\theparentequation{\it\alph{equation}}}%
  \ignorespaces
}{%
  \setcounter{equation}{\value{parentequation}}%
  \ignorespacesafterend
}

\newcommand{\sfrac}[2]{\leavevmode\kern.1em
            \raise.5ex\hbox{\footnotesize #1}\kern-.1em
                    /\kern-.15em\lower.25ex\hbox{\footnotesize #2}}


\def\dbond{\raise0.18ex\hbox{$=$}}
\def\bond{\raise0.18ex\hbox{$-$}}

\newcolumntype{P}[1]{>{\raggedright\let\\\@arraycr\hangindent1em}p{#1}}

\def\email#1{\href{mailto:#1}{e-mail: #1}}

\def\tcontinued{({\it Continued}.)}
\def\bcontinued{\leftskip-\leftnoteskip plus1fill\rightskip-\leftnoteskip{({\it Continued}.)}}

\def\source#1{\par\rightline{#1}}

\newdimen\eqntext
\def\leftno#1#2{%
\settowidth{\eqntext}{$\displaystyle#2$}%
\advance\eqntext-\textwidth%
\divide\eqntext 2%
\llap{\hbox to -\eqntext{$#1$\hfill}}#2}

\def\l{l\kern-3pt\raisebox{3.25pt}{\rotatebox{-20}{\fontsize{4}{6}\selectfont/}\kern-.25pt}}
\def\L{L\kern-6.4pt\raisebox{3.25pt}{\rotatebox{-20}{\fontsize{4}{6}\selectfont/}\kern3.2pt}}

%%%%
\def\vdotsfor#1#2{\rlap{\vbox to 0pt{\vskip-\ht\@arstrutbox\hskip#2\vbox to #1{\hsize0pt\xleaders\vbox{%
   \hbox{.}%
   \vskip3.5pt%
     }\vskip3.5pt plus2pt minus2pt}}}}%

\def\fmbreak{\break\vspace*{-12pt}}

\def\ack#1{{\vskip5.5pt\noindent \fontsize{8}{11}\selectfont#1}}

\def\myquery#1#2{\\{\smash{\begin{picture}(0,0)\put(420,-#1){#2}\end{picture}}\innerframe}~}

\def\ack#1{{\vskip5.5pt\noindent \fontsize{8}{11}\selectfont#1}}

\def\ethics#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Ethics.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\dataccess#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Data Accessibility.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\aucontribute#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Authors' Contributions.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\competing#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Competing Interests.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\funding#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Funding.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\ack#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Acknowledgements.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\disclaimer#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Disclaimer.}\fontsize{8}{11}\selectfont\enskip #1}}
\def\conflict#1{{\vskip5.5pt\noindent \textcolor{jobcolor}{\fontsize{9}{11}\selectfont Conflict of interests.}\fontsize{8}{11}\selectfont\enskip #1}}

\usepackage[sort&compress]{natbib}
\def\NAT@def@citea{\def\@citea{\NAT@separator}}
\bibpunct{[}{]}{,}{n}{}{,}
\def\@biblabel#1{#1.}

\usepackage[bookmarksnumbered,raiselinks,breaklinks]{hyperref}
\hypersetup{
    colorlinks,%
    citecolor=blue,%
    filecolor=blue,%
    linkcolor=blue,%
    urlcolor=blue
}


\Year{2014}

\endinput
