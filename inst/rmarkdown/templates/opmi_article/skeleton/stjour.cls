\def\currversion{April 8, 2016}

  %****************************************************************%
  %*                                                              *%
  %*  MIT Press Science/Technology Journal Style                  *%
  %*                                                              *%
  %*  Amy Hendrickson, TeXnology Inc.                             *%
  %*                                                              *%
  %*  amyh@texnology.com                                          *%
  %*  617 738-8029                                                *%
  %*  http://www.texnology.com                                    *%
  %*                                                              *%
  %****************************************************************%

%% Journals:
%% 1. Journal of Computational Psychiatry
%% 2. Open Mind: Discoveries in Cognitive Science
  
%%%%%%%%%%%
%% Journal of Computational Psychiatry

%% Peter Dayan and Read Montague, Editors
%% Journal Description:
%% Computational Psychiatry publishes original research articles and
%% reviews that involve the application, analysis, or invention of
%% theoretical, computational and statistical approaches to mental
%% function and dysfunction. Topics include brain modeling over multiple
%% scales and levels of analysis, and the use of these models to
%% understand psychiatric dysfunction, its remediation, and the
%% sustenance of healthy cognition through the lifespan. The journal also
%% has a special interest in computational issues pertaining to related
%% areas such as law and education.
%% 
%% Computational Psychiatry is an Open Access journal.
%% 
%% Visit computationalpsychiatry.org.
%% Press Release:
%% http://www.mitpressjournals.org/userimages/ContentEditor/1444762890059/CPSY_Press_Release.pdf

%%%%%%%%%%%
%% Open Mind: Discoveries in Cognitive Science
%%
%% Journal Description:
%% The broad array of content areas within cognitive science will be
%% covered, including learning and memory, attention, linguistics,
%% language processing and development, causal reasoning, judgment and
%% decision-making, and many others. These content areas will be studied
%% using methods from cognitive psychology, computer science and
%% mathematical psychology, cognitive neuroscience and neuropsychology,
%% comparative psychology and behavioral anthropology, and decision
%% science. The sole format of the journal will be novel empirical and/or
%% computational contributions (no reviews, opinion pieces, or
%% commentaries), with a 5,000-word limit plus supplemental materials.
%%
%%                 -- Dr. Richard Aslin, Editor
%%                    Director of Rochester Center for Brain Imaging
%%                    https://mitpress.mit.edu/blog/open-mind
%%
%% Open Mind is an Open Access Journal

\ProvidesClass{stjour}
              [4/08/2016]

  %% Comment
  %% \typeout makes content appear on the screen as you run LaTeX on
  %% the file. ^^J ends the line, thus ^^J^^J will produce a blank
  %% line making it easier to read.
  %% Content will also appear in the .log file, which is helpful to
  %% determine what version of .cls file is being used if someone has
  %% a problem, and needs to send in a .log file

\typeout{^^J^^J
MIT Press^^J^^J
Science and Technology Journal Style,^^J
^^J
Copyright MIT Press^^J
Designed and Implemented by^^J
Amy Hendrickson, TeXnology, Inc., 3/2016^^J
^^J
This version is dated \currversion^^J^^J}

%% SEARCH BELOW FOR THE NUMBER TO FIND PARTICULAR MACRO GROUP

    %% Macro Contents:
    %% 0) Usepackage graphicx, colorx, other .sty files which we'll need to have available.

    %% 1) Setting Default Dimensions

    %% 2) Global Parameters

    %% 3) Setting and Using Options

    %% 4) Font Family declarations

    %% 5) Running heads, Footnotes

    %% 6) Title Page: Journal Name, 
    %%    Title, Authors, Affils, Corresponding Authors, Author Notes, Key Points; abstract

    %% 7) Section Commands 

    %% 8) Figure and Table Captions 

    %% 9) Listing

    %% 10) Etc.: Hyphenation Library, Quote, Extract 

    %% 11) End Article: Appendix, Glossary, Acronyms, Notation, Acknowledgments

    %% 12) Bibliography, References  

    %% 13) Track Changes



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 0) Bringing in packages that we will need:

%% Nicer font choice than Computer Modern
\usepackage{times}

%% always will want this available
\usepackage{graphicx}

%% to get illustrations to print, in spite of being in Draft mode:
\setkeys{Gin}{draft=false}

%% used for running head which is in light gray
\usepackage[table]{xcolor}

\definecolor{ltgray}{cmyk}{.12,0,0,.3}
\definecolor{veryltgray}{cmyk}{.12,0,0,.2}
\definecolor{dkgray}{cmyk}{.12,0,0,.8}
\definecolor{ltcyan}{cmyk}{.12,0,0,0}
\definecolor{ltRoyalBlue}{cmyk}{.25,.12,0,0}
%\definecolor{dkRoyalBlue}{cmyk}{1,.97,.12,.08}
\definecolor{dkRoyalBlue}{cmyk}{.8,.77,.02,.04}
\definecolor{newdkRoyalBlue}{cmyk}{.8,.6,.02,.04}
\definecolor{dkcyan}{cmyk}{1,0,0,.25}
\definecolor{verydkcyan}{cmyk}{1,0,0,.7}
\definecolor{newverydkcyan}{cmyk}{1,0,0,.4}
\definecolor{mdcyan}{cmyk}{.16,0,0,0}
\definecolor{notsoltcyan}{cmyk}{.2,0,0,0}

%% Line numbering
\usepackage{lineno}
%% add more space between text and number:
\advance\linenumbersep -2pt



%% Defines \sidewaystable and \sidewaysfigure, preferred by AGU
\usepackage{rotating}
\newif\ifturnofflinenums
\let\savesidewaystable\sidewaystable
\let\savesidewaysfigure\sidewaysfigure
%% turns off line numbers in rotated tables and figures, aesthetic consideration,
%% not necessary.
\def\sidewaystable{\turnofflinenumstrue\savesidewaystable\centering}
\def\sidewaysfigure{\turnofflinenumstrue\savesidewaysfigure\centering}

\PassOptionsToPackage{normalem}{ulem}
\usepackage{ulem}

\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{xfrac}

\usepackage{multicol}

\definecolor{shadecolor}{cmyk}{.1,0,0,.01}
\definecolor{outsideshadecolor}{cmyk}{1,0,0,0}

%% 


%% <== End \usepackages

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Setting Default Dimensions

%%% Basic Page Dimensions
  %% Comment
  %% \textwidth= Width of text in normal page. Can change this width locally
  %% with either \leftskip/\rightskip or change in \hsize, but will
  %% still be able to return to the normal width by setting \hsize=\textwidth
  %% Running head normally uses \textwidth as its width so that a change
  %% in \hsize in text will not change width of running head or feet.

  %% \textheight is distance from bottom of text, exclusive of running
  %% foot, to top of text, exclusive of running head.

\textwidth=5.25in
\textheight=8.5in
\advance\textheight by 24pt
\advance\oddsidemargin 101pt
\evensidemargin=\oddsidemargin

  %% Comment
  %% parindent= indentation for every new paragraph
  %% parskip= distance between paragraphs. Giving `plus .1pt' allows
  %% a little stretch between paragraphs. If you don't like this stretch
  %% you can set \parskip=0pt

\parindent=24pt
\parskip=8pt % plus .1pt

  %% Comment
  %% \voffset moves the printed page up or down on the physical page.
\advance\voffset-.25in

  %% Comment
  %% \hoffset moves the printed page left or right on the physical page.
\advance\hoffset.35in
  
  %% Comment
  %% Setting page dimensions
  %% See p. 84-- 85 in LaTeX Companion, Goosins, Mittlebach and Samarin
  %% or p. 555--556 in A Guide to LaTeX, Kopka and Daly, both Addison Wesley
  %% books.

  %% \topmargin space between top of page and running head

  %% \headheight height of running head

  %% \headsep  space between running head and text

  %% \topskip  space between top of text and baseline of first line
  %%            of text

  %% \footskip space between text and baseline of page number

  %% \columnsep space between two column text

  %% \columnseprule width of optional rule between columns, usually set to 0pt

  %%  \footnotesep Distance between two footnotes

  %%  \skip\footins Distance between text and footnote

  %%  \floatsep Distance between float and another
  %%       float for single col floats.

  %%  \textfloatsep Distance between float and text at top
  %%                     or bottom of page.

  %%  \intextsep  Distance between float and text if float is mid page
  %%                 or mid column

  %%  \dblfloatsep  For float spanning both columns in two column text,
  %%  above or below both columns, space between float and and float.


\topmargin0pt
\headheight 30pt
\headsep 6pt
\topskip  10pt
\footskip 36pt

\columnsep 10pt
\columnseprule 0pt

\footnotesep 6.65pt
\skip\footins 24pt plus .1pt minus .1pt

\floatsep 12pt plus 2pt minus 2pt
\textfloatsep 36pt plus 2pt minus 4pt
\intextsep 24pt plus 2pt minus 2pt

\dblfloatsep 12pt plus 2pt minus 2pt
\dbltextfloatsep 20pt plus 2pt minus 4pt

%% float placement, used by output routine
\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

  %% When using \marginpar, how wide can marginal note be?

\marginparwidth .75in

  %% When using \marginpar, how much horizontal space between marginal
  %% note and text

  \setlength\marginparsep{40\p@}

  %% When to push marginal note on to next page, minimum vertical space between
  %% two marginal notes

\setlength\marginparpush{5\p@}

  %% space added before trivlist, which is used in many other
  %% macros, (for instance, verbatim environment) 
  %% if macro is called in vertical mode, otherwise only parskip
  %% is added. Can set this without stretch if you don't like
  %% the stretchy space added.

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

  %% Comment
  %% Setting parameters that control float placement
  %% 
  %% \topnumber counter holds the maximum number of
  %% floats that can appear on the top of a text page.
  %% 
  %% \topfraction indicates the maximum part of a text page that can be
  %%     occupied by floats at the top.
  %% 
  %% \bottomnumber counter holds the maximum number of
  %%     floats that can appear on the bottom of a text page.
  %% 
  %% \bottomfraction indicates the maximum part of a text page that can be
  %%     occupied by floats at the bottom.
  %% 
  %% \totalnumber indicates the maximum number of floats that can appear on
  %%     any text page.
  %% 
  %% \textfraction indicates the minimum part of a text page that has to be
  %%     occupied by text.
  %% 
  %% \floatpagefraction indicates the minimum part of a page that has to be
  %%     occupied by floating objects before a `float page' is produced.
  %% 
  %% \dbltopnumber counter holds the maximum number of
  %%     two column floats that can appear on the top of a two column text
  %%     page.
  %% 
  %% \dbltopfraction indicates the maximum part of a two column text page that
  %%     can be occupied by two column floats at the top.
  %% 
  %% \dblfloatpagefraction indicates the minimum part of a page that has to be
  %%     occupied by two column wide floating objects before a `float
  %%     page' is produced.
  %%%

\setcounter{topnumber}{10}
\def\topfraction{.9}
\setcounter{bottomnumber}{10}
\def\bottomfraction{.1}
\setcounter{totalnumber}{10}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

  %% Setting Array and Table Spacing
  %% distance between columns in array
\setlength\arraycolsep{5\p@}

  %% distance between columns in tabular
\tabcolsep 6pt

  %% width of lines in array
\setlength\arrayrulewidth{.4\p@}

  %% horizontal space between two lines in array
\setlength\doublerulesep{2\p@}

  %% space between two lines in tabular
\setlength\tabbingsep{\labelsep}

  %% Minipage
  %% minipage space
\skip\@mpfootins = \skip\footins

  %% Framebox \fbox{} or \framebox{}
  %% space between line in framebox and text within it
\setlength\fboxsep{6\p@}

  %% width of ruled line in framebox
\setlength\fboxrule{.6\p@}


%%%%%%%%%%%%%%% <<== end dimensions

% 2) %%% Global parameters ==>>

  %% Makes sure that there will not be any widow or club lines,
  %% smaller numbers allow them occassionally, but you probably need
  %% these set to 10000 so that there are never any

\widowpenalty10000
\clubpenalty10000

  %% How many levels deep do you want sections to be numbered-- higher number
  %% means more levels will be numbered. Here was are asking only for
  %% sections to be numbered, not subsections, or subsubsection etc.
\setcounter{secnumdepth}{0}


  %% To make left and right page position differently, and have
  %% running heads be different on even and odd pages
\@twosidetrue  

  %% Marginal notes should be on the left on even numbered pages; on
  %% right on odd numbered pages.
\@mparswitchtrue

  %% Starting with one column text
\@twocolumnfalse

  %% openbib will allow separate lines for parts of bibliography
  %% entries, default is to run different parts of bib entry into a
  %% paragraph form.

\newif\if@openbib
\@openbibfalse

  %% Conditionals that we can set and use later
\newif\if@openright
\newif\if@mainmatter 
\newif\if@restonecol
\newif\if@titlepage
\newif\ifxdraft %% xdraft rather than draft to prevent hyperref from turning off
\newif\ifnumlines

  %% Comment
  %% Set Names, to be used later, usually in more than one
  %% macro.
\newcommand{\bibname}{Bibliography}
\newcommand{\figurename}{Figure}
\newcommand{\tablename}{Table}

%%% <== end global parameters

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3) Declare Options and Use Default Options

\definecolor{ltgray}{gray}{.9}% .89
\font\bighelv=phvr at 2in %
\def\setwatermarkfontsize#1{\font\bighelv=phvr at #1}

\def\watermark#1{\def\thewatermark{
\vtop to
1.1\textheight{\vskip1in
\hskip-24pt\rotatebox{60}
{\hbox{\bighelv \color{ltgray}
\uppercase{#1}}}}}}

\watermark{D R A F T}

\newif\iftrack
\DeclareOption{manuscript}{\global\xdrafttrue 
%% tracking changes only in manuscript mode
\global\tracktrue
\textwidth=7in
\textheight=9in
\advance\oddsidemargin -1.75in
\evensidemargin=\oddsidemargin
\advance\voffset -.25in
\raggedright
\advance\headsep 12pt
\numlinestrue
}

\newif\iffinalfonts
\DeclareOption{finalfonts}{\global\finalfontstrue}

%% Journal Computational Psychiatry 
\newif\ifCompPsych
\DeclareOption{CompPsych}
   {\global\CompPsychtrue
\gdef\thejournalname{Computational Psychiatry}
}

%% Open Mind Journal
\newif\ifOpenMind
\DeclareOption{OpenMind}
   {\global\OpenMindtrue
\gdef\thejournalname{Open Mind: Discoveries in Cognitive Science}
}



\DeclareOption{linenumbers}{\global\numlinestrue}

\DeclareOption{final}{\setlength\overfullrule{0pt}\global\xdraftfalse}

\ExecuteOptions{letterpaper,10pt,onecolumn,final,openright}
\ProcessOptions

\ifnumlines
\linenumbers*[1]
\else
\nolinenumbers
\fi


%% <==== End Setting Options 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4) Font Family Info

%% Comment
%% When \ifxdraft is true it will make the baselineskip = \draftskip

\newcount\draftskip
\draftskip=22

\newcommand{\@ptsize}{}

  %% Comment
  %% Set font sizes, normal baselineskip, for the range of sizes, 
  %% changing baselineskip to be larger if draft option is true
  %% \setfontsize takes the first arg as the size of the font and
  %% the second as the size of the baselineskip
  %% \abovedisplayskip and \belowdisplayskip is the space before and
  %% after an equation, adjusted in some sizes.

  %% \Huge 25pt
  %% \huge 20pt
  %% \LARGE 17pt
  %% \Large 14pt
  %% \large 12pt
  %% \normalsize 10 pt font
  %% \small 9pt
  %% \footnotesize 8pt
  %% \scriptsize 7pt font
  %% \tiny 5pt font

\renewcommand\normalsize{%
\ifxdraft
   \@setfontsize\normalsize\@xiipt{\draftskip}
\else
   \@setfontsize\normalsize{9.5pt}{13pt}
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ %\@minus2\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 4\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize

\newcommand\bignormalsize{\ifxdraft
\@setfontsize\bignormalsize{10.5pt}{\draftskip}
\else
\@setfontsize\bignormalsize{10.5pt}{14}\fi}


\newcommand\small{%
\ifxdraft
   \@setfontsize\small\@xpt{\draftskip}
\else
   \@setfontsize\small\@ixpt{11}%
\fi
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
\ifxdraft
   \@setfontsize\footnotesize\@viiipt{\draftskip}%
\else
   \@setfontsize\footnotesize\@viiipt{9.5}%
\fi
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

%%% above 10 pt:
\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\ifxdraft
\@setfontsize\Large\@xivpt{\draftskip}
\else
\@setfontsize\Large\@xivpt{18}
\fi}
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

%%%%%%%%%%%%%%%%%%%%%%%%%%

%% These definitions accomodate older font typeface commands,
%% that are still in use.

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand{\mit}{\@fontswitch{\relax}{\mathnormal}}

%% end font family declarations
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5) Running heads and footnotes

%% Running heads ===>>>

  %% unless we need these, leave these uncommented
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
  %%
\newif\iftitle

\ifxdraft
\def\ps@headings{
%%
\def\@oddhead{\ifxdraft\iftitle
\vbox to 0pt{\vss
\small
\centerline{\footnotesize\tt == D R A F T\qquad\today\qquad\expandafter\ifx\csname
thereceived\endcsname\relax\else(Received \thereceived)\fi \ ==}
\vskip3pt
\centerline{\expandafter\ifx\csname titlejournalname\endcsname\relax 
           \else{\Large\bf{\large\bfseries\itshape Journal:} \titlejournalname}\fi}\vskip6pt
\color{veryltgray}\hrule height 2pt
\vskip14pt}
\else
          \vbox to0pt{\vss\xdraftfalse\small\parskip=0pt
\centerline{\footnotesize\tt == D R A F T\qquad\today\qquad\expandafter\ifx\csname
thereceived\endcsname\relax\else(Received \thereceived)\fi \ ==}
\vskip5pt
\centerline{\expandafter\ifx\csname titlejournalname\endcsname\relax 
           \else Journal: \titlejournalname\fi \qquad/\qquad {\expandafter\ifx\csname thetitle\endcsname\relax\else
{Title: \thetitle}\fi}}\vskip5pt
\centerline{\expandafter\ifx\csname theauthorshortlist\endcsname\relax\else {Authors:}
\theauthorshortlist\fi}% 
\vskip4pt
\color{veryltgray}\hrule height 2pt
\vskip12pt
}\fi% end ifdraft
\fi% end if title
}\let\@evenhead\@oddhead
\def\@oddfoot{
\ifxdraft\iftitle\global\titlefalse
\centerline{\footnotesize\bf Copyright \copyright \the\year\ The
Author(s). Published by MIT Press. All Rights
Reserved.}\else\centerline{--\the\c@page--}\fi\else\hfill\fi}
\let\@evenfoot\@oddfoot
}

%% After ps@headings is defined for draft version, now we use it to activate the definitions
\ps@headings

\fi

%%% Footnotes

  %% save these definitions so that we can use them if
  %% we don't like the redefinition
\let\savefootnote\footnote
\let\savefootnotetext\footnotetext

  %%% ruled line above footnote

  \renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}

 \let\savefootnoterule\footnoterule

% turn off footnote rule, line at bottom of page above footnotes
  \let\footnoterule\relax

% can turn it back on by uncommenting
\let\footnoterule\savefootnoterule

% Making footnote indent 1em
\long\def\@makefntext#1{%
\noindent\hspace*{1em}\@makefnmark\,#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 6) Title Page: 
   %% Journal Name, running heads;
   %% Title, Authors, Affils, Corresponding Authors, Author Notes, Key Points;
   %% Starting article with abstract.

\gdef\openmind{Open Mind}
\gdef\cpsy{Computational Psychiatry}

\def\@listi{\leftmargin\leftmargini
            \parsep 0\p@ %\@plus2\p@ \@minus0\p@
            \topsep 4\p@ %\@plus2\p@ \@minus0\p@
            \itemsep1\p@ %\@plus2\p@ \@minus0\p@
}


\def\thebibliography#1{}

 \def\setbibstyle{%
 \ifx\thejournalname\openmind
 \bibliographystyle{apacite}
 \def\doi##1{\href{https://doi.org/##1}{##1}}
 \def\url##1{\href{##1}{\saveurl{##1}}}
 \def\APACrefYearMonthDay##1##2##3{(##1)}
 \else
\ifx\thejournalname\cpsy
 \def\doi##1{\href{https://doi.org/##1}{##1}}
 \def\url##1{\href{##1}{\saveurl{##1}}}
 \usepackage{natbib}
 \bibliographystyle{mit-chicago}
 \fi\fi}

%% default, here because it doesn't work within a conditional(??)
%% overwritten if cpsy is the style, in which case natbib is used.
\usepackage[natbibapa]{apacite}

\def\journalname#1{\gdef\thejournalname{#1}
\gdef\titlejournalname{\uppercase{#1}}
\setbibstyle
}

\def\authors{\@ifnextchar[{\xauthor}{\yauthor}}
\let\author\authors

\def\xauthor[#1]#2{{\centering \authorfont #2\vskip12pt}
\gdef\theauthorshortlist{#1}}

%% if a short list of authors is not specified with [<short list of authors>] all the authors
%% will be used for the shortauthor list.
\def\yauthor#1{{\centering \authorfont #1\vskip12pt}
\gdef\theauthorshorlist{#1}}

\def\affil#1{$^{#1}$\ignorespaces}

\long\def\affiliation#1#2{\vskip2pt\relax{\centering{\scriptsize
$^{#1}$#2\relax}\vskip-\parskip}}

\def\correspondingauthor#1#2{{\let\@thefnmark\relax\@footnotetext{\noindent\vrule
height 18pt width0pt\relax\hbox to-8pt{}{\small
Corresponding author: #1,
{\tt #2}}}}}

%% Used to send footnote to bottom of page when entered in \authors{} field.
\def\thanks#1{{\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\noindent\hskip-9pt\hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}\footnote{#1}\
		}}

\def\keypoints{\vskip24pt\vskip1sp\subsection*{Key Points:}
\begin{itemize}}
\def\endkeypoints{\end{itemize}}

\def\abstract{\vskip12pt\noindent{\bf Abstract}\vskip-\parskip
\global\c@footnote=0\relax%
\noindent\ignorespaces}
\def\endabstract{\vskip18pt}


%% <== End Title page and Abstract

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 7) Section Commands

%  SectionCounters, Header Level Counters ===>>

  %% the argument in square brackets is for the command that will reset
  %% counter to zero
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]


  %% Header Level Counters ==>>
  %% Change to any level will change the levels below


\renewcommand{\thesection}      {\arabic{section}}
\renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph}    {\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph} {\theparagraph.\arabic{subparagraph}}

\newcommand{\@chapapp}{\chaptername}

  %%% <<== End Header Level Counters

  %% Definition printed here so that you can see what the various arguments are
  %% when used for \section, \subsection, etc, below
  %% \newcommand{\section}{\@startsection {section}{1}{\z@}...}


% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.
%                 If negative, then paragraph indent of text following
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading, else
%                 negative of skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.
%  Uses the counter 'secnumdepth' whose value is the highest section
%  level that is to be numbered.

  %% Startsection calls \@sect, the engine that formats each section

  %% the minus dimensions are used to tell LaTeX not to indent
  %% the text following the section head 
  %% (silly, isn't it? but built into LaTeX)
  %% You can add things like underline or uppercase to the last arg
  %% to get those effects in a section head

%% adds a little space after the section number, before following text.
\def\@seccntformat#1{\csname the#1\endcsname\ \ }

\newskip\aftersectionskip
\def\aftersectionskip{1sp\vskip-4pt}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {\ifxdraft -18pt \else -12pt \fi}%
                                   {\aftersectionskip}
                                   {\bignormalsize\bfseries\boldmath\sectionfont\MakeUppercase}}


\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {\ifxdraft -12pt   \else -6pt \fi}%
                                   {\aftersectionskip}%
                                   {\noindent\normalfont\boldmath\vrule height
				   16pt width 0pt
				   \subsectionfont\ifxdraft\else\MakeUppercase\fi}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {\ifxdraft 18pt\else 9pt\fi}%
                                   {-1.5em}%
                                   {\normalfont\boldmath\subsubsectionfont}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
                                    {-3pt plus 1pt minus 1pt}%
                                    {-1.5em}%
                                    {\boldmath\paragraphfont}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                    {3pt plus 1pt minus 1pt}%
                                    {-1em}%
                                      {\normalfont\normalsize\itshape\subparagraphfont}}

  %%% <<=== end section commands


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8) Figure and Table Captions ==>>>

\long\def\@caption#1[#2]#3{%
  \par
  \begingroup
    \@parboxrestore
\linenumbers
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
\def\@float#1{%
  \@ifnextchar[%
    {\@xfloat{#1}}%
    {\edef\reserved@a{\noexpand\@xfloat{#1}[\csname fps@#1\endcsname]}%
     \reserved@a}}
\def\@dblfloat{%
  \if@twocolumn\let\reserved@a\@dbflt\else\let\reserved@a\@float\fi
  \reserved@a}

  %%  Name of Figure or Table is set with \figurename or \tablename above
  %% \@float is what puts the text at the top or bottom of the page
  %% \@dblfloat is for floats in two column text

\newcounter{figure}
\renewcommand{\thefigure}{\arabic{figure}}

\def\fps@figure{tbp} % position figure at top, bottom, or on its own page
\def\ftype@figure{1} % used for placing float in page
\def\ext@figure{lof} % send info to .lof file
\def\fnum@figure{\figurename~~\thefigure} % \figurename, defined above,
                              %% and the current state of figure counter

  %% \begin{figure} calls up float and gives it the {figure} argument,
  %% which is then used to call up the definitions above, by using
  %% \csname fps@\captype\endcsname, for instance, to get \fps@figure;
  %% adjusting the macro to do different things depending on whether
  %% figure, table, environment, or other term is used.

\newenvironment{figure}
               {\@float{figure}}
               {\end@float}

  %% figure in two column text
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

  %% Similar as the sequence of definitions above used for figure
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
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

  %%%%%%%%%%%%%%%%
  %% Setting space between caption in table or figure and the
  %% table or figure
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{10\p@}

  %% to test in caption to see whether it is a figure or table
\def\xfigure{figure}

  %% Variation on LaTeX code
  %% Skips below caption
  %% an extra 3pt if it is a table to give extra space between caption
  %% and table, since caption for table goes above table.

  %% \sbox\@tempboxa sets a temporary box so that we can measure
  %% the width of the caption; if width is greater than .9\hsize
  %% then make it format in a paragraph, otherwise center it.

  %% Test to see if it a figure or table: \ifx\@captype\xfigure
  %% If figure, \vskip\belowcaptionskip

\long\def\@makecaption#1#2{%
{\ifxdraft\footnotesize\else    \small\fi
\ifx\@captype\xfigure
\vskip\abovecaptionskip\fi
{\ifturnofflinenums\else\ifnumlines\internallinenumbers\fi\fi
 \sbox\@tempboxa{\bf#1.\quad \rm #2}%
  \ifdim \wd\@tempboxa >.9\hsize
\bf #1.\quad\rm\relax #2\par
  \else
{\centering
 \bf #1.\rm\quad #2
\vskip1sp}
  \fi}
%%
\ifx\@captype\xfigure\else
  \vskip\belowcaptionskip\fi
}}


  %% Code to get text in tables to extend all the way to left and right
  %% of table. The LaTeX table macros are made to allow space to the
  %% left and the right of tables to accomodate vertical ruled lines. But
  %% most publishers don't want vertical ruled lines.  If the authors
  %% don't use the ruled lines there would be extra white space without
  %% the changes below. This code is very complicated, but you can see
  %% the changed part.

\def\xtable{table}
\def\@array[#1]#2{\setbox\@arstrutbox=\hbox{\vrule 
     height\arraystretch \ht\strutbox
     depth\arraystretch \dp\strutbox
     width\z@}\@mkpream{#2}\edef\@preamble{\halign \noexpand\@halignto
\bgroup%
\tabskip\z@\@arstrut\@preamble
\ifx\@captype\xtable\hskip-\tabcolsep\fi  %% <==== Changed
\tabskip\z@ \cr}%
\let\@startpbox\@@startpbox \let\@endpbox\@@endpbox%
  \if #1t\vtop \else \if#1b\vbox \else \vcenter \fi\fi%
  \bgroup\let\par\relax%
  \let\@sharp##\let\protect\relax \lineskip\z@\baselineskip\z@\@preamble}


  %% Variation on code found in Latex.tex
\def\new@tabacol{\edef\@preamble{\@preamble\hskip0pt}}

\def\@tabclassz{\ifcase \@lastchclass\@acolampacol% 
\or \@ampacol \or
   \or \or \@addamp \or \@acolampacol\or \@firstampfalse 
\ifx\@captype\xtable \new@tabacol\else\@tabacol \fi%
\fi%
\edef\@preamble{\@preamble%
  \ifcase \@chnum%
     \hfil\ignorespaces\@sharp\unskip\hfil%
     \or \ignorespaces\@sharp\unskip\hfil%
     \or \hfil\hskip\z@ \ignorespaces\@sharp\unskip\fi}}

  %% This puts extra space between horizontal lines in tables. 
  %% If you want to use vertical lines in tables, you should use
  %% \savehline rather than \hline, otherwise the vertical and
  %% horizontal lines will not abutt.

  %% \noalign is a command that allows the uses to put something
  %% between lines in a table.
\let\savehline\hline
% ??? this prevents vertical lines and horizontal lines from meeting up.
\def\hline{\noalign{\vskip3pt}\savehline\noalign{\vskip3pt}}

  %% Simple macro for table notes, that makes sure that there is
  %% a little space between the table and the notes, and that they
  %% print in footnotesize.
\def\tablenotes{\vskip2pt\footnotesize}
\let\endtablenotes\relax

  %%% <<=== end Figure and Table Captions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 9) Listing, ==>>
\def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ %\@plus2\p@ \@minus0\p@
            \topsep 4\p@ %\@plus2\p@ \@minus0\p@
            \itemsep1\p@ %\@plus2\p@ \@minus0\p@
}
\let\@listi\@listI
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

  %% amount left edge of text is indented relative to normal text
  %% i is for first level in, ii is for second level in, etc.
\setlength\leftmargini  {24pt}
\setlength\leftmarginii  {11pt}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}


  %% default indentation for first level itemized lists
\setlength\leftmargin    {\leftmargini}

  %% horizontal distance between item and following text
\setlength  \labelsep  {6pt}

  %% how wide should item be?
\setlength  \labelwidth{\leftmargini}

  %% subtract width of label separation
\addtolength\labelwidth{-\labelsep}

  %% more listing defaults
\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep


\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

  %% defining listing markers for enumerate
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\theenumiv}{\Alph{enumiv}}

  %% using listing markers for enumerate
\newcommand{\labelenumi}{\theenumi.\hskip-2pt}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}

  %% crossreferencing for listing markers
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

\def\sqbullet{\vrule height 2.5pt depth0pt width 2.5pt\relax}
  %% listing markers for itemize (no crossreferencing needed)
\newcommand{\labelitemi}{\raise.4ex\hbox{\sqbullet}}
\newcommand{\labelitemii}{\normalfont\bfseries --}
\newcommand{\labelitemiii}{$\m@th\ast$}
\newcommand{\labelitemiv}{$\m@th\cdot$}

  %% Setting up description listing environment
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}

\newcommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

%%% <<=== end of listing commands 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 10) ETC.: Month/year, Hyphenation Library, Quote, Quotation, Extract 

%% Month and Year

% Nice example of \ifcase which takes a counter and activates
% the slot following the counter that matches the same number;
% \month expands to a number, so ifcase will activate the slot
% matching that number. Can use it for setting date in draft
% footnote if desired. Not activated at this time.

\newcommand{\today}{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

%  Hyphenation Library
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hyphenation Library, add to this
%% list if desired

\hyphenation{
dem-o-graph-ics
mi-cro-ec-o-nom-ic
or-gan-i-za-tion
or-gan-i-za-tions
ra-tion-ale
sys-tem-at-i-cal-ly
}


%%%% Quote, Quotation, Extract
  %% \newenvironment produces a \begin{}..\end{} macro set.
  %% \newenvironment{<name of macro>}{<definition for begin macro>}
  %% {<definition for end macro>}

  %% For long quotation which runs more than one paragraph,
  %% uses list environment to indent text, supplies dummy
  %% item, \item[], since one item is required for every listing
  %% environment or you will get an error message.

  %% quotation indents new paragraphs, while quote does not.

\newenvironment{quotation}
               {\small
\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\small
\list{}{\rightmargin\leftmargin}%
                \item[]}
               {\endlist}

  %% If \begin{extract}...\end{extract} is used you will get the same
  %% results as \begin{quotation}...\end{quotation} 

\let\extract\quotation
\let\endextract\endquotation

  %% <<== end ETC.: Month/year, Hyphenation Library, Quote, Quotation, Extract 

%%%%%%%%%
% 11) End Article: Appendix, Glossary, Acronyms, Acknowledgments

% Appendix: 
\newcounter{appendnum}

\newif\ifappendon
\newif\ifupperappend


\def\appendix{
\ifxdraft\else
\everydisplay{\hskip-2.25in}
\leftskip=-2.25in
\linewidth=\fullpagewidth
\advance\linewidth by  6pt
 \@totalleftmargin=-2.25in
\fi
\nolinenumbers
\setcounter{secnumdepth}{1}
\def\@currentlabel{\Alph{section}:}
\@addtoreset{equation}{section}
\@addtoreset{table}{section}
\@addtoreset{figure}{section}
%%
\renewcommand{\thesection}{\Alph{section}}
\renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
\renewcommand{\thefigure}{\Alph{section}.\arabic{figure}}
\renewcommand{\thetable}{\Alph{section}.\arabic{table}}
\global\appendontrue\goodbreak
\global\c@section=0
\global\c@equation=0
\def\thesection{\Alph{section}: }
\def\thesubsection{\Alph{section}.\@arabic{\c@subsection}}
\def\thesubsubsection{\thesubsection.\@arabic{\c@subsubsection}}
\def\thesubsubsubsection{\thesubsubsection.\@arabic{\c@subsubsection}}
%%
%%
\ifxdraft\else
\let\eqnarray\wideeqnarray
\let\endeqnarray\endwideeqnarray
\def\[{$$}
\def\]{$$}
\fi
}

\def\wideeqnarray{%
\vskip\abovedisplayskip
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue
   \m@th
   \global\@eqcnt\z@
   \tabskip\@centering
   \let\\\@eqncr
   %$$
\everycr{}\halign to\textwidth\bgroup
\hskip-2.25in
%       \hskip\@centering
$\displaystyle\tabskip\z@skip{##}$\@eqnsel
      &\global\@eqcnt\@ne\hskip \tw@\arraycolsep \hfil${##}$\hfil
      &\global\@eqcnt\tw@ \hskip \tw@\arraycolsep
         $\displaystyle{##}$\hfil\tabskip\@centering
      &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
         \tabskip\z@skip
      \cr
}

\def\endwideeqnarray{%
      \@@eqncr
      \egroup
      \global\advance\c@equation\m@ne
   %$$
\vskip\belowdisplayskip
\hskip-\parindent\@ignoretrue}



%%%%% end appendix 

%%  Glossary


\def\glossary{\bgroup
\nolinenumbers
\parskip=0pt
\def\symbol##1{\vskip3pt\noindent\hskip-.2\textwidth\hbox to
.2\textwidth{##1\hfill}\ignorespaces}
\ifxdraft\else\footnotesize\fi
\raggedright
\leftskip=.2\textwidth
\symbol{\bf Symbol}{\bf Meaning}\vskip3pt\hrule\vskip3pt}

\def\endglossary{\vskip1sp\egroup}
%% 

%% Acknowledgments
\def\acknowledgments{\vskip12pt\noindent{\bf
Acknowledgments\vrule depth 6pt
width0pt\relax}\\*\noindent\ignorespaces}

%%% <<=== end  Appendix, Glossary, Acronyms, Notation, Acknowledgments


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 12) %% Bibliography, References ===>>


%% In case you want to enter bib entries without using bibtex
\def\references{\thebibliography{}\item[]}
\let\endreferences\endthebibliography

\def\@cite#1#2{{#1\if@tempswa , #2\fi}}

\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }%
     \edef\@citeb{\expandafter\@firstofone\@citeb}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
  %%
  %% This is changed from the default so that lengthy citations can
  %% be broken across lines
       {%\hbox{
\csname b@\@citeb\endcsname%}
}}}{#1}}


\def\newblock{\hskip .11em\@plus.33em\@minus.07em}

%% end Bibliography, and References

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%% 13) Track Changes
%% Amy Hendrickson, Nov 2015
%% Change Jan 2016, to allow list of changes
%% to give line and page numbers for more than one entry on the same line.
%% Change Feb 2016, to allow optional argument for time/date, and/or editor initials, etc.

\providecolor{trackchange}{rgb}{1,0,0}
\providecolor{explain}{rgb}{.5,0,.5}

\newcount\refchangenumber
\def\added{\@ifnextchar[{\xadded}{\yadded}}

\long\def\xadded[#1]#2{%
\iftrack {\global\advance\refchangenumber by 1\relax%
\vtop to 0pt{\vss
\hypertarget{link\the\refchangenumber}{}
\vskip14pt}
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackchange}(Added: #2)}%%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Added: [#1]
\textcolor{trackchange}{#2}, }\else#2\fi}

\long\def\yadded#1{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\vtop to 0pt{\vss
\hypertarget{link\the\refchangenumber}{}
\vskip14pt}
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackchange}(Added: #1)}%%
\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Added:
\textcolor{trackchange}{#1}, }\else#1\fi}

\def\deleted{\@ifnextchar[{\xdeleted}{\ydeleted}}
\let\delete\deleted

\long\def\xdeleted[#1]#2{
\iftrack
\global\advance\refchangenumber by 1
\vtop to 0pt{\vss
\hypertarget{link\the\refchangenumber}{}
\vskip14pt}
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackchange}(Deleted: \sout{#2})}%
\expandafter\def\csname
changenum\the\refchangenumber\endcsname{Deleted: [#1]
{\color{trackchange}\sout{#2}}, }\fi}

\long\def\ydeleted#1{
\iftrack
\global\advance\refchangenumber by 1
\vtop to 0pt{\vss
\hypertarget{link\the\refchangenumber}{}
\vskip14pt}
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackchange}(Deleted: \sout{#1})}%
\expandafter\def\csname changenum\the\refchangenumber\endcsname{Deleted:
{\color{trackchange}\sout{#1}}, }\fi}

\def\replaced{\@ifnextchar[{\xreplaced}{\yreplaced}}

\long\def\xreplaced[#1]#2#3{%
\iftrack
\global\advance\refchangenumber by 1
\vtop to 0pt{\vss
\hypertarget{link\the\refchangenumber}{}
\vskip14pt}
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackchange}(Replaced: \sout{#2}}
{\color{black}replaced with:} {\color{trackchange} #3)}%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Replaced: [#1]
{\color{trackchange}\sout{#2}} {\color{black} replaced with:}
{\color{trackchange}#3}, }\else#3\fi}

\long\def\yreplaced#1#2{%
\iftrack
\global\advance\refchangenumber by 1
\vtop to 0pt{\vss
\hypertarget{link\the\refchangenumber}{}
\vskip14pt}
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackchange}(Replaced: \sout{#1}}
{\color{black}replaced with:} {\color{trackchange} #2)}%
\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Replaced:
{\color{trackchange}\sout{#1}} {\color{black} replaced with:}
{\color{trackchange}#2}, }\else#2\fi}

\def\explain{\@ifnextchar[{\xexplain}{\yexplain}}

\def\xexplain[#1]#2{\iftrack\ {\it\color{explain} [Explanation of change:
#2 (#1)]\ }\fi}

\def\yexplain#1{\iftrack\ {\it\color{explain} [Explanation of change:
#1]\ }\fi}

\newcount\listchangenum

\def\listofchanges{
\clearpage
\iftrack
\ifnum\refchangenumber>0
\ifnumlines\nolinenumbers\else
\hypersetup{linkcolor=black}
\fi
\vskip36pt
%\vtop{
\hrule
\noindent{\vrule height 14pt width0pt depth 6pt\large\bf List of Changes}
\hrule
\vskip18pt%}
\nobreak
{\parskip=4pt \parindent=0pt
\loop
\vskip-1pt\relax
\global\advance\listchangenum by 1\relax
\expandafter\ifx\csname changenum\the\listchangenum\endcsname\relax
\else
\csname changenum\the\listchangenum\endcsname\ 
on page
%% can't get hyperlink to work correctly for page numbers, yet:
%\hyperlink{link\the\listchangenum}{
\pageref{\the\listchangenum}%}%
\ifnumlines
\setbox0=\hbox{\lineref{\the\listchangenum}}%
\ifdim\wd0>20pt%
\else
, line\
\hyperlink{link\the\listchangenum}{\lineref{\the\listchangenum}}%
\fi\fi.
\repeat}
\fi\fi
\thispagestyle{empty}
}

\PassOptionsToPackage{normalem}{ulem}
\usepackage{ulem}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Start page numbering, formatting

\pagenumbering{arabic}
\widowpenalty=10000
\clubpenalty=10000


%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcount\articlenumber

\def\keywords#1{\vskip24pt{\small\noindent{\bf Keywords:
}{#1}}\vskip6pt}

\let\saveenddocument\enddocument

\def\endarticle{\ifxdraft\clearpage
\listofchanges
\fi}

\def\enddocument{\endarticle\saveenddocument}

\newcount\footnum
\newcount\savefootnum
\def\endnote#1{\global\advance\footnum by 1\relax$^{\the\footnum}$%
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\footnotesize\hsize=\textwidth\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\def\endnotetext#1{\global\advance\footnum by 1\relax
\long\expandafter\gdef\csname foot\the\footnum\endcsname{%
\vtop{\footnotesize\hsize=\textwidth\leftskip=12pt\relax\parindent=-12pt
\indent\hbox to12pt{\the\footnum.\hfill}{#1\strut\vskip1sp}}\vskip1pt}}

\def\endnotes{\ifnum\footnum=0\else
\section*{Endnotes}
\savefootnum=\footnum
\footnum=0
\noindent\loop\ifnum\savefootnum>\footnum%
\global\advance\footnum by1\relax%
\csname foot\the\footnum\endcsname\relax%
\expandafter\gdef\csname foot\the\footnum\endcsname{\relax}\relax%
\repeat\global\footnum=0\relax\fi}

%\let\footnote\endnote

%% Article Type Choices:
%% Research Article
%% Commentary
%% Review Article
%% Modification
%% Retraction

\def\articletype#1{\gdef\topline{\ifxdraft\vglue24pt
\ifx\thejournalname\cpsy
{\noindent\toplinefont
\uppercase{#1}\vskip18pt}\fi\fi}}

% default:
\articletype{Research Article}


\def\toplinefont{\normalsize\sf} 

\def\setdoi#1{\def\thedoi{\href{http://dx.doi.org/#1}{http://dx.doi.org/#1}}}

%% for OpenMind
\def\supplementslinks#1{\def\thesupplementslink{\href{http://#1}{http://#1}}}

%% for CPSY
\def\supportinginfo#1{\def\thesupportinginfo{\href{http://#1}{http://#1}}}

%% if none, this command doesn't need to be used
\def\conflictsofinterest#1{\gdef\theconflict{#1}}
\conflictsofinterest{The\\ authors have
declared that no\\ competing interests exist.}


%%%%%%%%%%% to be supplied by MIT Press, only %%%%%%%%%%%%%

\def\citation#1{\long\def\thecitation{#1}}
\def\received#1{\def\thereceived{#1}}
\def\accepted#1{\def\theaccepted{#1}}
\def\published#1{\def\thepublished{#1}}

%%%%%%%%%% end MIT Press commands %%%%%%%%%%%%%%%%%%%%%%%%%


\long\def\boxedtext{\vskip-\lastskip\vskip12pt\setbox0=\vtop\bgroup\hsize=\textwidth
\advance\hsize-24pt
\advance\hsize-1.2pt
\advance\hsize-2pt
\small} 

\def\endboxedtext{\egroup
{\fboxsep=12.3pt\noindent\hskip1.2pt\fcolorbox{cyan}{white}{\copy0}}\vskip12pt}

\long\def\wideboxedtext{\vskip-\lastskip\vskip12pt\setbox0=\vtop\bgroup\hsize=\fullpagewidth
\advance\hsize-24pt
\advance\hsize-1.2pt
} 

\def\endwideboxedtext{\egroup
{\fboxsep=12pt
\hbox to\textwidth{\hss\fcolorbox{cyan}{white}{\copy0}}}\vskip12pt}


%%%%%%%

\def\abbreviations{}

\def\authorcontributions{\section*{Author Contributions}}
\def\acknowledgments{\section*{Acknowledgments}}

\def\and{\ {and}\ }


%%%%%%%%%%%% Fonts %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Using Berry naming conventions, should
%%% work the same on Mac as on PC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Helvetica
\def\helvetica{phvr}
\def\helveticaoblique{phvro}
\def\helveticabold{phvb}
\def\helveticaboldoblique{phvbo}

\xdef\helvetica{\helvetica\space}
\xdef\helveticaoblique{\helveticaoblique\space}
\xdef\helveticabold{\helveticabold\space}
\xdef\helveticaboldoblique{\helveticaboldoblique\space}

%% Courier
\def\courier{pcrr}
\xdef\courier{\courier\space}
\font\boldtt=pcrb at 8pt 

\newdimen\fullpagewidth
\ifOpenMind
\fullpagewidth=7.5in
\else
\fullpagewidth=7.5in % ??
\fi

%%%%%% Fonts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifxdraft\else
\usepackage{mathpazo}

\def\palroman{pplr\space}
\def\palbold{pplb\space}
\def\palitalic{pplri\space}
\def\palbolditalic{pplbi\space}

\let\timesroman\palroman
\let\timesbold\palbold
\let\timesitalic\palitalic
\let\timesbolditalic\palbolditalic
\fi

%% Draft Fonts
\ifxdraft
\usepackage{natbib}
 \usepackage[bookmarks=false,         % show bookmarks bar?
     pdfnewwindow=true,      % links in new window
     colorlinks=true,    % false: boxed links; true: colored links
     linkcolor=cyan,     % color of internal links
     citecolor=cyan,     % color of links to bibliography
     filecolor=cyan,  % color of file links
     urlcolor=cyan,      % color of external links
 ]{hyperref}

\def\bighrulefill{\leavevmode\leaders\hrule height 1pt\hfill\kern\z@}
\fi

\ifxdraft
\usepackage{times}

%% Times-Roman
\def\timesroman{ptmr\space}
\def\timesbold{ptmb\space}
\def\timesitalic{ptmri\space}
\def\timesbolditalic{ptmbi\space}

%% Special Use Fonts 
%% Running heads
\font\runningheadfont=\timesitalic at 11pt
\font\foliofont=\timesbold at 12pt % was times roman
\font\dropfoliofont=\timesroman at 11pt

%% Journal Title Page
\font\journaltitlefont=\timesbold at  16pt %34.5pt
\font\journalsubtitlefont=\timesbold at 16pt
\def\authorfont{\small\bf}

%% Section heads
\font\sectionfont=\timesbold at 12pt
\font\subsectionfont=\timesbolditalic at 11pt
\font\subsubsectionfont=\timesitalic at 11pt
\font\paragraphfont=cmcsc10 at 10pt

%% Appendix title
\font\appendixtitlefont=\timesbold at 14pt

%% Caption 
\font\fignumfont=\timesbolditalic at 9pt
\font\tabnumfont=\timesbolditalic at 9pt 
\font\figtextfont=\timesitalic at 9pt
\font\realtabtextfont=\timesitalic at 9pt
\def\tabtextfont{\small\realtabtextfont}

%% Table fonts
\def\tablefontsize{\normalsize} 
\def\tablefootnotesize{\footnotesize}

%% References/Bibliography
\def\bibfontsize{\normalsize}
\fi %%%%%%%%%%%%% <<<=== end fonts for manuscript style


\let\bibfont\small

%% Article Title

\def\title{\ifOpenMind\else\vglue-.75in\topline\fi
\ifxdraft\else
\ifOpenMind
\vglue-57pt\fi\fi
\global\advance\articlenumber by 1
\expandafter\gdef\csname
firstpage\the\articlenumber\endcsname{\the\c@page}
\bgroup\centering
\global\titletrue
\@ifnextchar[{\xtitle}{\ytitle}}

\def\xsubtitle{\subtitle}
\long\def\lookahead#1{\def\one{#1}\ifx\one\xsubtitle{\journaltitlefont
:}\else\vskip12pt\egroup\fi#1}

\def\xtitle[#1]#2{\global\c@footnote=0\relax%
\gdef\thetitle{#1}
{\journaltitlefont #2}\lookahead}

\def\ytitle#1{\gdef\thetitle{#1}
{\journaltitlefont #1}\lookahead}

\def\subtitle#1{\ \journalsubtitlefont
#1\vskip1pt\egroup\vskip12pt}

\let\thetitle\relax
\let\theauthorshortlist\relax

\pdfpagewidth=8.5in
\pdfpageheight=11in
\paperheight=11in
\paperwidth=8.5in


%% Open Mind 

\long\def\savethebibliography#1{\bibfont %\list 
\def\makelabel#1{}% get rid of error message about no list
{\@biblabel {\the \c@NAT@ctr}}
{\@bibsetup {#1}\global \c@NAT@ctr \z@ }
\ifNAT@openbib \renewcommand\newblock {\par }\else \renewcommand
\newblock {\hskip .11em \@plus .33em  \@minus .07em}\fi 
\sloppy \clubpenalty 4000\widowpenalty 4000 \sfcode `\.\@m 
\let\NAT@bibitem@first@sw \@firstoftwo 
\let \citeN \cite \let \shortcite\cite \let\citeasnoun\cite
}

\newskip\bibskip

\ifOpenMind

 \usepackage[bookmarks=false,         % show bookmarks bar?
     pdfnewwindow=true,      % links in new window
     colorlinks=true,    % false: boxed links; true: colored links
     linkcolor=gray,     % color of internal links
     citecolor=gray,     % color of links to bibliography
     filecolor=gray,  % color of file links
     urlcolor=gray,      % color of external links
 ]{hyperref}

%%%%%%%%%%%%%
%% Open Mind Fonts

\iffinalfonts %% ===>>>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Final Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}

%% caption
\def\captionnamefont{\fontsize{10}{11}
\fontspec{OptimaLTStd-Bold}}

\def\captiontextfont{\fontsize{9}{11}%
\fontspec{OptimaLTStd}}

\def\sectionfont{\fontsize{9.5}{12}%
\fontspec{OptimaLTStd-Bold}}%

\def\subsectionfont{\fontsize{8.5}{12}%
\fontspec{OptimaLTStd-BoldItalic}}%

\def\subsubsectionfont{\fontsize{8.5}{12}%
\fontspec{OptimaLTStd-Bold}}%

\def\paragraphfont{\fontsize{8.5}{12}%
\fontspec{OptimaLTStd-BoldItalic}}%

\let\subparagraphfont\subsubsectionfont

\def\Optima{\setmainfont[Ligatures=TeX, Mapping=tex-text,
BoldFont=OptimaLTStd-Bold,
ItalicFont=OptimaLTStd-Italic]
{OptimaLTStd}}

\def\optimatext{\normalsize\Optima}
\def\Optimatext{\normalsize\Optima}
\Optimatext % default fonts

\def\OPNtitlefont{\fontsize{16}{22}
\fontspec{HelveticaNeueLTStd-Bd}
\addfontfeature{LetterSpace=12}
}
\def\OPNsubtitlefont{\fontsize{16}{22}
\fontspec{HelveticaNeueLTStd-Bd}
\addfontfeature{LetterSpace=12}
}

\def\normalsf{\fontsize{11}{11}
\fontspec{HelveticaNeueLTStd-Roman}}

\def\verbatim@font{\fontspec{CourierStd}}

\def\journaltitlefont{\OPNtitlefont}
\def\journalsubtitlefont{\OPNsubtitlefont}
\def\authorfont{\small\bf}
\font\runningheadfont=\palbolditalic at 10pt
\font\runningheadrmfont=\palroman at 8pt
\font\runningfootfont=\helveticaoblique at 9pt
\font\dropfoliofont=\helvetica at 11pt
%%
\else
%%
\font\opntitlefont=\helveticabold at 16pt
\def\journaltitlefont{\opntitlefont \baselineskip=22pt}
\let\journalsubtitlefont\journaltitlefont
\def\authorfont{\small\bf}
\font\runningheadfont=\palbolditalic at 10pt
\font\runningheadrmfont=\palroman at 8pt
\font\runningfootfont=\helveticaoblique at 8pt
\font\dropfoliofont=\helvetica at 10pt
\font\sectionfont=\palbold at 9.5pt
\font\subsectionfont=\palbolditalic at 8.5 pt
\font\subsubsectionfont=\palbold at 8.5pt
\font\paragraphfont=\palbolditalic at 8.5 pt
\let\subparagraphfont\subsubsectionfont
\fi
%% for banner
\font\sfb=\helveticabold at 6.5pt
\font\bigsfb=\helveticabold at 7.5pt
\font\tinytt=cmtt8 at 7pt
%% end fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[natbibapa]{apacite}
\bibliographystyle{apacite}
%\let\savethebibliography\thebibliography
\let\endsavethebibliography\endthebibliography
\let\saveurl\url
\def\thebibliography{
\def\doi##1{\href{https://doi.org/##1}{##1}}
\def\url##1{\href{##1}{\saveurl{##1}}}
\def\APACrefYearMonthDay##1##2##3{(##1)}
\renewcommand{\APACrefauthstyle}{\noindent\hskip-10pt\relax}%
\bgroup
\begin{savethebibliography}{}
\small
\linewidth=\fullpagewidth
\newdimen\bibindentwidth
\bibindentwidth=150pt %2.25in = 162pt
\leftskip=-\bibindentwidth
\advance\bibindentwidth12pt
\rightskip=\bibindentwidth
\columnsep=24pt
\parskip=0pt
\begin{multicols}{2}[\hbox to \textwidth{\hss\hbox to
\fullpagewidth{\sectionfont REFERENCES\hfill}}]%
\clubpenalty9000
\@clubpenalty\clubpenalty
\widowpenalty9000
}
\def\endthebibliography{\end{multicols}\end{savethebibliography}%
\egroup}

\newdimen\colorboxwidth
\colorboxwidth=1.35in
\advance\colorboxwidth-12pt

\def\ps@headings{
%%
\def\@oddhead{\iftitle
\iffinalfonts\else
\hbox to \textwidth{\hfill\hbox to0pt{\hss\thewatermark}}\fi
\else
%% ODD HEAD NOT TITLE PAGE
\vtop to 0pt{\vglue-36pt
\hbox to \textwidth{\hss\hbox to 7.5in{\runningheadfont\thetitle\ \ \
\ \runningheadrmfont\theauthorshortlist\hfill}}
\vskip3pt\hbox to \textwidth{\hss\color{cyan}\hbox to7.5in{\hrulefill}}
\vskip24pt
\vss}
\fi}
\let\@evenhead\@oddhead
\def\@oddfoot{
\iftitle\global\titlefalse
%\lower6pt
\hbox to\textwidth{\hss
\hbox to\fullpagewidth{%
\hskip-23pt\vtop to 0pt{\vss 
\fboxsep=10pt
\colorbox{mdcyan}{
\vbox to 10.25in{\hsize=142pt 
\advance\hsize-2\fboxsep
\baselineskip=7.5pt
\vskip-9pt
\hbox to\hsize{\hskip-13pt\includegraphics[width=144pt]{OPMI_logo}\hss} 
\vskip102pt
\sfb
 \raggedright
 \parindent=0pt
 \noindent\hbox to 121.3pt{\color{red}\bigsfb%
 a\,n\hfill o\,p\,e\,n\hfill a\,c\,c\,e\,s\,s\hfill \lower1.5pt\hbox{\includegraphics[width
 =.1in]{openaccess3}}\hfill j\,o\,u\,r\,n\,a\,l}
 \vskip24pt
 \includegraphics[width=121.3pt]{CrossMark}
 \vskip26pt\hyphenpenalty=10000
 {\sfb Citation:} \thecitation
\vfill
 {\sfb DOI:}\\ \thedoi
 \vfill
{\sfb Supplemental Materials:}\\[2pt]
\thesupplementslink
\vfill
 {\sfb Received:} \thereceived\\[2pt]
 {\sfb Accepted:} \theaccepted\\[2pt]
 {\sfb Published:} \thepublished
 \vfill 
 {\sfb Competing Interests:}
 \theconflict
 \vfill
 {\sfb Corresponding Author:}\theCorrespondingauthor
 \vskip6pt
{\color{cyan}\hbox to -24pt{}\hrule height 1pt width 122pt}
\vskip12pt
{\sfb Copyright:} {\footnotesize\copyright} \the\year\ \\[1pt]
Massachusetts Institute of Technology\\[1pt]
Published under a Creative Commons Attribution 4.0
International\\[1pt] (CC BY 4.0) license
\vfill
\vskip12pt
\fboxsep=6pt
\colorbox{dkcyan}{\hbox to 110pt{%
\hfill
\includegraphics[width=.5in]{colophon}
\raise 8pt\hbox{\color{white}\small\sf\ The MIT
Press}\hfill}}
}%% end vbox to 10.5 in
}%% end color box
%\vglue-23pt
}%% end vtop to 0pt
\hfill}%% end hbox to full page width
\hfill}%% end hbox to textwidth
\else
%%% ODD FOOT, NOT TITLE PAGE
\noindent\hskip-2.5in\vtop{\vbox to 0pt{\vss\vbox to 9in{\vss
\parskip=0pt\hsize=7.5in\color{cyan}
\vskip1pt%\hbox to\hsize{\hrulefill}\vskip-24pt
\color{dkcyan}
\runningfootfont OPEN MIND: Discoveries in
Cognitive Science\hfill %\color{black}
\dropfoliofont\the\c@page}}}\fi}
\let\@evenfoot\@oddfoot
}

\ps@headings

\def\bighrulefill{\leavevmode\leaders\hrule height 1pt\hfill\kern\z@}

\def\abstract{\vskip6pt
\global\c@footnote=0\relax%
\hbox to \textwidth{\color{cyan}\bighrulefill}
\section*{ABSTRACT}\raggedright
\noindent\ignorespaces}

\def\endabstract{\vskip1pt
\hbox to \textwidth{\color{cyan}\bighrulefill}
\vskip18pt}

\def\correspondingauthor#1#2{\def\theCorrespondingauthor{\\[1pt]#1\\[1pt]
\href{mailto:#2}{#2}}}

\fi %% end OpenMind Specs



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% +++
\ifCompPsych
 \usepackage[bookmarks=false,         % show bookmarks bar?
     pdfnewwindow=true,      % links in new window
     colorlinks=true,    % false: boxed links; true: colored links
     linkcolor=dkcyan,     % color of internal links
     citecolor=dkcyan,     % color of links to bibliography
     filecolor=dkcyan,  % color of file links
     urlcolor=dkcyan,      % color of external links
 ]{hyperref}

%%%%%%%%%%%%%
%% Fonts

\iffinalfonts %% ===>>>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Final Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}

%% caption
\def\captionnamefont{\fontsize{10}{11}
\fontspec{OptimaLTStd-Bold}}

\def\captiontextfont{\fontsize{9}{11}%
\fontspec{OptimaLTStd}}

\def\sectionfont{\fontsize{9}{12}%
\fontspec{OptimaLTStd-Bold}}%

\def\subsectionfont{\fontsize{8.5}{12}%
\fontspec{OptimaLTStd-BoldItalic}}%

\def\subsubsectionfont{\fontsize{8.5}{12}%
\fontspec{OptimaLTStd-Bold}}%

\def\paragraphfont{\fontsize{8.5}{12}%
\fontspec{OptimaLTStd-BoldItalic}}%

\let\subparagraphfont\subsubsectionfont

\def\Optima{\setmainfont[Ligatures=TeX, Mapping=tex-text,
BoldFont=OptimaLTStd-Bold,
ItalicFont=OptimaLTStd-Italic]
{OptimaLTStd}}

\def\optimatext{\normalsize\Optima}
\def\Optimatext{\normalsize\Optima}
\Optimatext % default fonts

%\def\journaltitlefont{\fontsize{22}{31}
%\fontspec{HelveticaNeueLTStd-Bd}}
\def\journaltitlefont{\fontsize{16}{22}
\fontspec{HelveticaNeueLTStd-Roman}}

\def\journalsubtitlefont{\fontsize{16}{22}
\fontspec{HelveticaNeueLTStd-Roman}
%\addfontfeature{LetterSpace=12}
}

\def\normalsf{\fontsize{11}{11}
\fontspec{HelveticaNeueLTStd-Roman}}

\def\verbatim@font{\fontspec{CourierStd}}
\font\runningheadfont=\palbolditalic at 10pt
\font\runningheadrmfont=\palroman at 8pt
\font\runningfootfont=\helveticaoblique at 9pt
\font\dropfoliofont=\helvetica at 11pt
\def\authorfont{\small\bf}
%%
\else
%%
\font\xjournaltitlefont=\helveticabold at 16pt
\font\xjournalsubtitlefont=\helveticabold at 16pt% 
\def\journaltitlefont{\xjournaltitlefont \baselineskip=22pt}
\let\journalsubtitlefont\journaltitlefont
\def\authorfont{\small\bf}
\font\foliofont=\helvetica at 8pt
\font\runningheadfont=\palbolditalic at 10pt
\font\runningheadrmfont=\palroman at 8pt
\font\runningfootfont=\helveticaoblique at 9pt
\font\dropfoliofont=\helvetica at 9pt
\font\sectionfont=\palbold at 9.5pt
\font\subsectionfont=\palbolditalic at 8.5 pt
\font\subsubsectionfont=\palbold at 8.5pt
\font\paragraphfont=\palbolditalic at 8.5 pt
\fi %% <<<=== end if final fonts
%% for banner
\font\sfb=\helveticabold at 6.5pt
\font\bigsfb=\helveticabold at 7.5pt
\font\logosfb=\helveticabold at 9pt
\font\tinytt=cmtt8 at 7pt
%% end fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newdimen\colorboxwidth
\colorboxwidth=1.35in
\advance\colorboxwidth-12pt

\def\ps@headings{
%%
\def\@oddhead{\iftitle
\iffinalfonts\else
\hbox to \textwidth{\hfill\hbox to0pt{\hss\thewatermark}}\fi
\else
%% ODD HEAD NOT TITLE PAGE
\vtop to 0pt{\vglue-36pt
\hbox to \textwidth{\hss\hbox to 7.5in{\runningheadfont\thetitle\ \ \
\ \runningheadrmfont\theauthorshortlist\hfill}}
\vskip3pt\hbox to \textwidth{\hss\color{cyan}\hbox to7.5in{\hrulefill}}
\vskip24pt
\vss}
\fi}
\let\@evenhead\@oddhead
\def\@oddfoot{
\iftitle\global\titlefalse
%\lower6pt
\hbox to\textwidth{\hss
\hbox to\fullpagewidth{%
\hskip-23pt\vtop to 0pt{\vss 
\fboxsep=10pt
\colorbox{mdcyan}{
\vbox to 10.25in{\hsize=142pt 
\advance\hsize-2\fboxsep
\baselineskip=7.5pt
\vskip-9pt
\vskip1in
\hbox to\hsize{%\hskip-13pt%\includegraphics[width=144pt]{OPMI_logo.jpg}
\hss\colorbox{white}{\sectionfont CPSY WordMark to Come}
\hss} 
\vskip6pt
\vskip1.25in
\vskip102pt
\sfb
 \raggedright
 \parindent=0pt
 \noindent\hbox to 121.3pt{\color{red}\bigsfb%
 a\,n\hfill o\,p\,e\,n\hfill a\,c\,c\,e\,s\,s\hfill \lower1.5pt\hbox{\includegraphics[width
 =.1in]{openaccess3}}\hfill j\,o\,u\,r\,n\,a\,l}
 \vskip24pt
 \includegraphics[width=121.3pt]{CrossMark}
 \vskip26pt\hyphenpenalty=10000
 {\sfb Citation:} \thecitation
\vfill
 {\sfb DOI:}\\ \thedoi
 \vfill
{\sfb Supporting Information:}\\[2pt]
\thesupportinginfo
\vfill
 {\sfb Received:} \thereceived\\[2pt]
 {\sfb Accepted:} \theaccepted\\[2pt]
 {\sfb Published:} \thepublished
 \vfill 
 {\sfb Competing Interests:}
 \theconflict
 \vfill
 {\sfb Corresponding Author:}\theCorrespondingauthor
 \vskip6pt
{\color{cyan}\hbox to -24pt{}\hrule height 1pt width 122pt}
\vskip12pt
{\sfb Copyright:} {\footnotesize\copyright} \the\year\ \\[1pt]
Massachusetts Institute of Technology\\[1pt]
Published under a Creative Commons Attribution 4.0
International\\[1pt] (CC BY 4.0) license
\vfill
\vskip12pt
\fboxsep=6pt
\colorbox{dkcyan}{\hbox to 110pt{%
\hfill
\includegraphics[width=.5in]{colophon}
\raise 8pt\hbox{\color{white}\small\sf\ The MIT
Press}\hfill}}
}%% end vbox to 10.5 in
}%% end color box
%\vglue-23pt
}%% end vtop to 0pt
\hfill}%% end hbox to full page width
\hfill}%% end hbox to textwidth
\else
%%% ODD FOOT, NOT TITLE PAGE
\noindent\hskip-2.5in\vtop{\vbox to 0pt{\vss\vbox to 9in{\vss
\parskip=0pt\hsize=7.5in\color{cyan}
\vskip1pt%\hbox to\hsize{\hrulefill}\vskip-24pt
\color{dkcyan}
\runningfootfont Computational Psychiatry
\hfill %\color{black}
\dropfoliofont\the\c@page}}}\fi}
\let\@evenfoot\@oddfoot
}

\ps@headings

\def\abstract{\vskip6pt
\global\c@footnote=0\relax%
\hbox to \textwidth{\color{cyan}\bighrulefill}
\section*{ABSTRACT}\raggedright
\noindent\ignorespaces}

\def\endabstract{\vskip1pt}


\def\correspondingauthor#1#2{\def\theCorrespondingauthor{\\[1pt]#1\\[1pt]
{#2}}}

\def\bighrulefill{\leavevmode\leaders\hrule height 1pt\hfill\kern\z@}


%% chicago 16 author-date bib style

\usepackage{natbib}
\bibliographystyle{mit-chicago}

%% This makes all bibitems have hang indent
\bibskip=-13pt  plus 2pt

%% can't use this definition of @lbibitem with apacite.bst, or it will kill the & between authors.
\def\@lbibitem[#1]#2{\if\relax\@extra@b@citeb\relax \else \@ifundefined{br@#2\@extra@b@citeb }{}
{\@namedef {br@#2}{\@nameuse {br@#2\@extra@b@citeb }}}\fi 
\@ifundefined {b@#2\@extra@b@citeb }{\def \NAT@num {}}{\NAT@parse {#2}}\def \NAT@tmp {#1}
\expandafter \let \expandafter \bibitemOpen \csname NAT@b@open@#2\endcsname 
\expandafter \let \expandafter \bibitemShut \csname NAT@b@shut@#2\endcsname 
\@ifnum {\NAT@merge >\@ne }{\NAT@bibitem@first@sw {\@firstoftwo }{\@ifundefined {NAT@b*@#2}
{\@firstoftwo }{\expandafter \def \expandafter \NAT@num \expandafter{\the \c@NAT@ctr }\@secondoftwo }}}
{\@firstoftwo }{\global \advance\c@NAT@ctr \@ne \@ifx {\NAT@tmp \@empty }
{\@firstoftwo}{\@secondoftwo }{\expandafter \def \expandafter \NAT@num\expandafter {\the \c@NAT@ctr }
\global \NAT@stdbsttrue }{}\bibitem@fin %\item [\hfil
\NAT@anchor{#2}{\NAT@num }%]
%
\parskip=0pt
\vskip\bibskip
\noindent\hskip-12pt
\global\let\NAT@bibitem@first@sw \@secondoftwo \NAT@bibitem@init }{\NAT@anchor{#2}{}
\NAT@bibitem@cont \bibitem@fin }\@ifx {\NAT@tmp \@empty}{\NAT@wrout {\the \c@NAT@ctr }{}{}{}{#2}}
{\expandafter \NAT@ifcmd\NAT@tmp (@)(@)\@nil {#2}}}

\long\def\savethebibliography#1{\bibfont %\list 
\def\makelabel#1{}% get rid of error message about no list
{\@biblabel {\the \c@NAT@ctr}}
{\@bibsetup {#1}\global \c@NAT@ctr \z@ }
\ifNAT@openbib \renewcommand\newblock {\par }\else \renewcommand
\newblock {\hskip .11em \@plus .33em  \@minus .07em}\fi 
\sloppy \clubpenalty 4000\widowpenalty 4000 \sfcode `\.\@m 
\let\NAT@bibitem@first@sw \@firstoftwo 
\let \citeN \cite \let \shortcite\cite \let\citeasnoun\cite
}

\let\thebibliography\savethebibliography
\let\endsavethebibliography\endthebibliography
\let\saveurl\url
\def\thebibliography#1{
\def\doi##1{\href{https://doi.org/##1}{##1}}
\def\url##1{\href{##1}{\saveurl{##1}}}
\bgroup
\linewidth=\fullpagewidth
\newdimen\bibindentwidth
\bibindentwidth=150pt %2.25in = 162pt
\leftskip=-\bibindentwidth
\advance\bibindentwidth12pt
\rightskip=\bibindentwidth
\columnsep=24pt
\parskip=0pt
\begin{savethebibliography}{}
\begin{multicols}{2}[\hbox to \textwidth{\hss\hbox to
\fullpagewidth{\sectionfont REFERENCES\hfill}}]%
\clubpenalty10000
\@clubpenalty\clubpenalty
\widowpenalty10000
}
\def\endthebibliography{\end{multicols}\end{savethebibliography}%
\egroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\jargon{\@ifnextchar[{\xjargon}{\yjargon}}

\def\yjargon#1#2{
\vadjust{\vtop to 0pt{\vskip-3.5pt\vskip-\baselineskip\noindent\hskip-.25in\llap{\vtop to 0pt{\small\raggedright\hsize 2in\noindent #1:\\
#2\vss}}\vss}}}

\def\xjargon[#1]#2#3{ \vadjust{\vtop to
0pt{\vskip#1\vskip-3.5pt\vskip-\baselineskip\noindent\hskip-.25in\llap{\vtop
to 0pt{\small\raggedright\hsize 2in\noindent #2:\\
#3\vss}}\vss}}}

\def\correspondingauthor#1#2{\def\theCorrespondingauthor{\\[1pt]#1\\[1pt]
\href{mailto:#2}{#2}}}

\fi %% end CompPsych

\def\authorsummary{\bgroup\section*{AUTHOR SUMMARY}\raggedright}

\def\endauthorsummary{\vskip1pt
\hbox to\textwidth{\color{cyan}\bighrulefill}
\egroup}


\@afterindentfalse\@afterheading


\def\widefigure#1#2{
\hbox
to\textwidth{\hss\includegraphics[width=#1]{#2}\hfill}
\let\caption\widecaption
}

\long\def\widetable{\setbox0=\vtop\bgroup\hsize=\fullpagewidth
\let\caption\widecaption
} 

\def\endwidetable{\egroup
\hbox
to\textwidth{\hss\copy0}}

\let\savecaption\caption
\long\def\widecaption#1{\hbox
to\textwidth{\hss\vtop{\hsize=\fullpagewidth \savecaption{#1}}}}

\usepackage{colortbl}
\usepackage{longtable}
\usepackage{amsbsy}
\def\arraystretch{1.1}

\usepackage{algorithm} %% wrapper
\let\savealgorithm\algorithm
\let\saveendalgorithm\endalgorithm
\def\algorithm{\vskip-\lastskip\vskip-12pt\savealgorithm}
\def\endalgorithm{\saveendalgorithm\vskip-12pt}
\usepackage{algorithmicx}
\usepackage{algpseudocode}


\def\code{\bgroup\begin{itemize}\item[]\footnotesize}
\def\endcode{\end{itemize}\egroup}

%% space following longtable:
\LTpost=-24pt

\renewcommand{\thealgorithm}{\vrule height 9pt depth 4pt width 0pt\arabic{algorithm}}

%% This definition allows for links and other commands that need to be \protect ed from
%% having a problem. it makes every caption the equivalent of \caption[]{caption text}
\def\@caption#1[#2]#3{\small\expandafter \ifx \csname if@capstart\expandafter \endcsname 
\csname iftrue\endcsname \global \let \@currentHref \hc@currentHref \else \hyper@makecurrent {\@captype }\fi 
\@ifundefined {NR@gettitle}{\def \@currentlabelname{\thesection\relax #2}}
{\NR@gettitle {#2}}\par 
%\addcontentsline {\csname ext@#1\endcsname }{#1}{\protect \numberline {\csname the#1\endcsname }{\ignorespaces #2}}
\begingroup \@parboxrestore \if@minipage \@setminipage \fi \normalsize 
\expandafter\ifx \csname if@capstart\expandafter \endcsname 
\csname iftrue\endcsname \global \@capstartfalse 
\@makecaption {\csname fnum@#1\endcsname }{\ignorespaces #3}
\else \@makecaption {\csname fnum@#1\endcsname }{\ignorespaces \ifHy@nesting 
\expandafter \hyper@@anchor \expandafter {\@currentHref }{#3}\else 
\Hy@raisedlink {\expandafter \hyper@@anchor \expandafter
{\@currentHref }{\relax }}#3\fi }\fi \par \endgroup}



\def\endtrivlist{%
  \if@inlabel
    \leavevmode
    \global \@inlabelfalse
  \fi
  \if@newlist
    \@noitemerr
    \global \@newlistfalse
  \fi
  \ifhmode\unskip \par\fi
%    \@endparenv
}


\endinput