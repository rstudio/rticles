%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JASA.cls Version 1.1                          %%
%%                                               %%
%% Most recent revisions, Oct 10, 2019           %%
%%                                               %%
%% Copyright 2017, 2018, 2019                    %%
%% Acoustical Society of America                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% JASA.cls
%% Developed and maintained by Amy Hendrickson
%% TeXnology Inc
%% http://www.texnology.com
%% amyh@texnology.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\currversion{1.1}

%%
%%    These files are distributed
%%    WITHOUT ANY WARRANTY; without even the implied warranty of
%%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}%
%%
%%%     date            = "2/15/2017",
%%%     author          = "Amy Hendrickson (mailto:amyh@texnology.com)"

%%% This work may be distributed and/or modified under the
%%% conditions of the LaTeX Project Public License, either version 1.3c
%%% of this license or (at your option) any later version.
%%% The latest version of this license is in
%%%  http://www.latex-project.org/lppl.txt
%%% and version 1.3 or later is part of all distributions of LaTeX
%%% version 2005/12/01 or later.
%
%%% This work has the LPPL maintenance status `maintained'.
%
%%% The Current Maintainer of this work is Arthur Newhall <anewhall@whoi.edu>
%%% This work consists of the file JASAnew.cls

%%%     copyright       = "Copyright (C) 2017 Acoustical Society of America
%%%
%%%                        This work may be distributed and/or modified under the
%%%                        conditions of the LaTeX Project Public License, either version 1.3
%%%                        of this license or (at your option) any later version.
%%%                        The latest version of this license is in
%%%                        http://www.latex-project.org/lppl.txt
%%%                        and version 1.3 or later is part of all distributions of LaTeX
%%%                        version 2003/12/01 or later.
%%%
%%%                        This work has the LPPL maintenance status "maintained".
%%%
%%%                        The Current Maintainer of this work is the Acoustical Society of America.
%%%
%%%                        This work consists of all files listed in the document README.
%%%
%%%     address         = "Acoustical Society of America,
%%%                        USA",
%%%     telephone       = "+1 ???",
%%%     FAX             = "",
%%%     email           = "anewhall@whoi.edu
%%%     codetable       = "ISO/ASCII",
%%%     keywords        = "latex, JASATeXnew, journal",
%%%     supported       = "yes",
%%%     abstract        = "formatter for JASA journal submissions",
%%%  }

\ProvidesClass{JASA}%%%
 [2019/09/09 Version 1.1, document class]%
{}
\ClassInfo{JASA}{%
^^J
Written by Amy Hendrickson, amyh@texnology.com, http://www.texnology.com
^^J
^^J
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make sure authors are using RevTeX4-1
 \IfFileExists{revtex4-1.cls}{
    \def\@revtex@cls{revtex4-1}
  }{
\typeout{^^J^^J Please update your system to include
revtex4-1.cls^^J^^J
We recommend downloading a current version of TeX Live, MacTeX,
or MikTeX to have all the current files}\stop
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options. Document style options, and additional feature options.

% These are the General document style options, 2 choices

%% For Submission of your paper:
%   preprint	: onecolumn, doublespace, 12pt fonts

%% For checking to see how many pages your paper will have when published
%% (approximately)
%   reprint	: twocolumn, single space, optional 12pt fonts

% Default document style option:
% preprint

\newif\ifmanuscript
\newif\iftwelvepoint
\newif\ifdoublespace
\newif\if@two@col
\newif\ifnumlines

%% Manuscript is double spaced and single columned.
\DeclareOption{preprint}{\global\manuscripttrue\twelvepointtrue
\@two@colfalse\doublespacetrue}%

%% Preprints are single spaced and double columned.
\newif\ifpreprint
\DeclareOption{reprint}{\global\manuscriptfalse\twelvepointfalse
\doublespacefalse\global\timestrue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional feature options:

%      times	: uses times font as the default
%      trackchanges : required to see the revision mark up and print output
%      12pt ; for authors to check length of paper
%      authoryearcite ; for setting citations and bib entries to author/year style

%% add line numbers to reprint
\newif\ifturnonlinenumbers
\DeclareOption{TurnOnLineNumbers}{\global\turnonlinenumberstrue}
%% in case someone forgets to put in the caps:
\DeclareOption{turnonlinenumbers}{\global\turnonlinenumberstrue}

\newif\iftimes
\DeclareOption{times}{\global\timestrue}

\newif\iftrack
\DeclareOption{trackchanges}{\global\tracktrue}

\DeclareOption{12pt}{\global\twelvepointtrue}

\newif\ifauthoryear
\DeclareOption{author-year}{%
\global\authoryeartrue}

\DeclareOption{NumberedRefs}{%
\global\authoryearfalse}

%% in case someone forgets to capitalize:
\DeclareOption{numberedrefs}{%
\global\authoryearfalse}

\global\authoryeartrue

\newif\ifgrouped
\DeclareOption{authaffil}{%
\global\groupedtrue}


%% End Options

%% manuscript is default style
\ExecuteOptions{preprint}

\ProcessOptions

%%
%%%%%%%%%%%%%
%% Passing options to revtex while loading:
  \ifmanuscript %% preprint style
        \LoadClass[onecolumn, amsmath, amssymb, preprint,
	aip,floatfix]{revtex4-1}
  \else % reprint style
%% no track changes allowed in Reprint style
\iftrack
\global\trackfalse
\typeout{^^J^^J Invalid Option! Track Changes not allowed in Reprint Style!^^J^^J}
\stop
\fi
       \LoadClass[twocolumn, amsmath,
       amssymb,reprint,aip,floatfix]{revtex4-1}
  \fi


%%%%%%%%%%%%%
%
\ifauthoryear
\setcitestyle{authoryear,round,aysep={,},yysep={,},citesep={;}}
% changes formatting style from numeric brackets to author/year, with semicolon separating citations.
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load packages
\usepackage{graphicx}% Include figure files
\usepackage{dcolumn}% Align table columns on decimal point
\usepackage{bm}% bold math
\usepackage{amsmath,amsfonts}% popular packages from the American Mathematical Society
\usepackage{latexsym}%
\usepackage{lineno}
\usepackage{array}
\usepackage{adjustbox}

\usepackage{soul}

%% for editing changes
\usepackage{xcolor}
\definecolor{asalinkcolor}{cmyk}{1,.5,0,0}

 \usepackage[bookmarks=false,         % show bookmarks bar?
     pdfnewwindow=true,      % links in new window
     colorlinks=true,    % false: boxed links; true: colored links
     linkcolor=asalinkcolor,     % color of internal links
     citecolor=asalinkcolor,     % color of links to bibliography
     filecolor=asalinkcolor,  % color of file links
     urlcolor=asalinkcolor,      % color of external links
final=true
 ]{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Font families
%% modification of bk10.clo, and bk12.clo, standard LaTeX distribution
%%
%% Implements doublespace used in `manuscript' option
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% preprint is 12pt, reprint is 10pt, unless 12pt option is used

%% Modified bk12.clo

%% for section heads
\newcommand\bigsmall{\@setfontsize\bigsmall{9.5pt}{12}}

\iftwelvepoint
\renewcommand\normalsize{%
\ifdoublespace % manuscript
   \@setfontsize\normalsize\@xiipt{20}%
\else
   \@setfontsize\normalsize\@xiipt{13}%
\fi %% end doublespace/no double space
   \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize

%% for section heads
\renewcommand\bigsmall{\@setfontsize\bigsmall{9.5pt}{12}}

\renewcommand\small{%
\ifdoublespace % manuscript
   \@setfontsize\small\@xipt{20}%
\else
   \@setfontsize\small\@xipt{13.6}%
\fi
%% end doublespace/no double space
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 9\p@ \@plus3\p@ \@minus5\p@
               \parsep 4.5\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand\footnotesize{%
\ifdoublespace % manuscriptstyle
   \@setfontsize\footnotesize\@xpt{18}
\else
   \@setfontsize\footnotesize\@xpt\@xiipt
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\ifdoublespace % manuscript style
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{14}}
\renewcommand\tiny{\@setfontsize\tiny\@vipt{10}}
\renewcommand\large{\@setfontsize\large\@xivpt{18}}
\renewcommand\Large{\@setfontsize\Large\@xviipt{22}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
\renewcommand\huge{\@setfontsize\huge\@xxvpt{30}}
\else
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\renewcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\renewcommand\large{\@setfontsize\large\@xivpt{22}}
\renewcommand\Large{\@setfontsize\Large\@xviipt{24}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xxpt{28}}
\renewcommand\huge{\@setfontsize\huge\@xxvpt{30}}
\newcommand\titlefont{\@setfontsize\titlefont{17pt}{18}}

\fi
\let\Huge=\huge
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\else %% not twelvepoint, now tenpoint
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% no doublespace here, because the only doublespace is in `manuscript style' which is 12pt

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{11.5}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize


\renewcommand\small{%
   \@setfontsize\small\@ixpt{12}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize\@viiipt{9}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

%% Standard 10pt font sizes
\renewcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand\large{\@setfontsize\large\@xiipt{14}}
\renewcommand\Large{\@setfontsize\Large\@xivpt{18}}
\renewcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\titlefont{\@setfontsize\titlefont{17pt}{18}}
\renewcommand\huge{\@setfontsize\huge\@xxpt{25}}
\renewcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

\fi

\newcommand\xsmall{\@setfontsize\xsmall\@ixpt{11}}

%% End font sizes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}



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


%%%%%%%%%%%%%%%%%%%%%%%%%
%% Track Changes
%% Amy Hendrickson, Feb 2016, revised Sept 2019

\providecolor{trackcolor}{rgb}{1,0,0}

\newcount\refchangenumber

\def\added{\@ifnextchar[{\xadded}{\yadded}}

\long\def\xadded[#1]#2{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}([#1] Added: #2)}%%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Added: [#1]
\textcolor{trackcolor}{#2}, }\else#2\fi}

\long\def\yadded#1{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}(Added: #1)}%%
\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Added:
\textcolor{trackcolor}{#1}, }\else#1\fi}

\def\deleted{\@ifnextchar[{\xdeleted}{\ydeleted}}

\long\def\xdeleted[#1]#2{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}([#1] Deleted: \st{#2})}%%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Deleted: [#1]
\textcolor{trackcolor}{\st{#2}}, }\else \fi}

\long\def\ydeleted#1{%
\iftrack{\global\advance\refchangenumber by 1\relax%
\ifnumlines
\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
\color{trackcolor}(Deleted: \st{#1})}%%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Deleted:
\textcolor{trackcolor}{\st{#1}}, }\else\fi}


\def\replaced{\@ifnextchar[{\xreplaced}{\yreplaced}}

\long\def\xreplaced[#1]#2#3{%
\iftrack
\global\advance\refchangenumber by 1
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackcolor}([#1] Replaced: \st{#2}}
{\color{black}replaced with:} {\color{trackcolor} #3)}%
\expandafter\gdef\csname
changenum\the\refchangenumber\endcsname{Replaced: [#1]
{\color{trackcolor}\st{#2}} {\color{black} replaced with:}
{\color{trackcolor}#3}, }\else#3\fi}

\long\def\yreplaced#1#2{%
\iftrack
\global\advance\refchangenumber by 1
\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
{\color{trackcolor}(Replaced: \st{#1}}
{\color{black}replaced with:} {\color{trackcolor} #2)}%
\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Replaced:
{\color{trackcolor}\st{#1}} {\color{black} replaced with:}
{\color{trackcolor}#2}, }\else#2\fi}


\global\@mparswitchfalse
\def\explain#1{
\iftrack\marginpar{\vskip26pt\vtop to 0pt{\hsize30pt\hyphenpenalty10000
\noindent\baselineskip10pt{\color{red}{\boldmath$\leftarrow$}\\
\raggedright
\footnotesize\sf\baselineskip10pt
\relax#1\vskip1sp}\vss}}\fi}

\newcount\listchangenum

\def\listofchanges{\iftrack
%\clearpage
\ifnum\refchangenumber>0
\ifnumlines\nolinenumbers\fi
\vskip36pt
\hrule
\noindent{\vrule height 14pt width0pt depth 6pt\large\bf List of Changes}
\hrule
\vskip18pt
\nobreak
{\parskip=4pt \parindent-18pt \leftskip=18pt
\loop
\vskip-1pt\relax
\global\advance\listchangenum by 1\relax
\expandafter\ifx\csname changenum\the\listchangenum\endcsname\relax
\else
\csname changenum\the\listchangenum\endcsname\ on page
\pageref{\the\listchangenum}%
\ifnumlines
\setbox0=\hbox{\lineref{\the\listchangenum}}%
\ifdim\wd0>20pt%
\else%
, line\
\lineref{\the\listchangenum}%
\fi\fi.
\repeat}
\fi\fi
%\thispagestyle{empty}
\vfill
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Figlines for positioning multiple illustrations in
%% one figure environment.

\long\def\figline#1{\vskip6pt\noindent\hbox to\hsize{#1}\vskip6pt}

\long\def\figcolumn#1{\bgroup
\let\fig\columnfig
\vskip2pt\relax#1\egroup\vskip2pt}
\let\savelabel\label


\long\def\narrowcaption#1#2{\hfill$\vcenter to 0pt
{\vss\hsize=#1
\let\small\xsmall\caption{#2}\vskip2\baselineskip\vss}$\def\@currentlabel{\the\c@figure}}

\def\boxedfig#1#2#3{\hfill\fbox{\vbox{\parskip=0pt\relax\baselineskip=12pt
\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\hsize=#2
\c@figureplusone=\c@figure
\global\advance\c@figureplusone by 1
\gdef\@currentlabelname{figure}
\gdef\@currentlabel{\the\c@figureplusone#3}
\gdef\@currentHref{figure.\the\c@figureplusone}
\centerline{#3}}}}\hfill}

\newcount\c@figureplusone

\def\fig#1#2#3{\ $\vcenter{\parskip=0pt\baselineskip=12pt
\relax\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\hsize=#2
\c@figureplusone=\c@figure
\global\advance\c@figureplusone by 1
\gdef\@currentlabelname{figure}
\gdef\@currentlabel{\the\c@figureplusone#3}
\gdef\@currentHref{figure.\the\c@figureplusone}
\centering
\relax #3\vskip1sp\vskip1sp}}$\
}


\def\columnfig#1#2#3{%
\vtop{\vskip3pt\baselineskip=12pt
\parskip=0pt
\centerline{\includegraphics[width=#2]{#1}}\def\three{#3}
\ifx\three\empty \else
\vskip1pt
\centerline{\vrule height 12pt width0pt depth 8pt
\footnotesize
\c@figureplusone=\c@figure
\global\advance\c@figureplusone by 1
\gdef\@currentlabelname{figure}
\gdef\@currentlabel{\the\c@figureplusone#3}
\gdef\@currentHref{figure.\the\c@figureplusone}
\hsize=#2
#3}\fi}\vskip3pt}

\def\leftfig#1#2#3{\vbox{\parskip=0pt\relax\baselineskip=12pt\relax\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\gdef\@currentlabel{\the\c@figure}
\hsize=#2
\centering
\c@figureplusone=\c@figure
\global\advance\c@figureplusone by 1
\gdef\@currentlabelname{figure}
\gdef\@currentlabel{\the\c@figureplusone#3}
\gdef\@currentHref{figure.\the\c@figureplusone}
#3\vskip1sp\vskip1sp}}\hfill}

\def\rightfig#1#2#3{\hfill\vbox{\parskip=0pt\relax\baselineskip=12pt\relax\hsize=#2
\includegraphics[width=#2]{#1}\vskip3pt\vtop{\gdef\@currentlabel{\the\c@figure}
\hsize=#2
\c@figureplusone=\c@figure
\global\advance\c@figureplusone by 1
\gdef\@currentlabelname{figure}
\gdef\@currentlabel{\the\c@figureplusone#3}
\gdef\@currentHref{figure.\the\c@figureplusone}
\centering#3\vskip1sp}}}

\def\rotatefig#1#2#3#4{\hfill\vbox{\centering\parskip=0pt\relax\baselineskip=12pt\hsize=#3
\includegraphics[width=#3,angle=#1]{#2}\vskip3pt\vtop{\centering
\gdef\@currentlabel{\the\c@figure}
\footnotesize
\hsize=#3
\c@figureplusone=\c@figure
\global\advance\c@figureplusone by 1
\gdef\@currentlabelname{figure}
\gdef\@currentlabel{\the\c@figureplusone#4}
\gdef\@currentHref{figure.\the\c@figureplusone}
#4\vskip1pt
}}\hfill}

\def\sidebysidefigures#1#2/#3#4{\figline{%
\vbox{\hsize=.5\textwidth
\centerline{\includegraphics[width=.45\textwidth]{#1}}\vskip-\baselineskip
\centerline{\vtop{\hsize=.45\textwidth\caption{#2}}}}
\vbox{\hsize=.5\textwidth
\centerline{\includegraphics[width=.45\textwidth]{#3}}\vskip-\baselineskip
\centerline{\vtop{\hsize=.45\textwidth\caption{#4}}}}%
}}


%%%%%%%%%% End Fig line Macros %%%%%%%%%%

%% Section heads rewritten for preprint
\def\section{\@startsection {section}{1}{\z@ }{0.8cm \@plus .5ex \@minus .2ex}{0.5cm}
{\boldmath\normalfont \small \bfseries }}

\def\sectionfont{\small\bfseries}
\def\subsection{\@startsection {subsection}{2}{\z@ }{.8cm \@plus .5ex \@minus .2ex}{.5cm}
{\boldmath\normalfont \small \bfseries }}

\def\subsubsection{\@startsection {subsubsection}{3}{\z@ }{.8cm
\@plus 1ex \@minus .2ex}{.5cm} {\boldmath\normalfont \small \bfseries\itshape }}

\def\paragraph{\@startsection {paragraph}{4}{\parindent }{\z@ }{-1em}{\normalfont \normalsize
\itshape }}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% used for both preprint and reprint:
\newcount\currentpage
\def\setpagenumber#1{\ifmanuscript\else\global\currentpage=#1\relax\fi}

%% not for author use:
% \def\volume#1{\def\thevolume{#1}}
% \def\volnumber#1{\def\thevolnumber{#1}}

\let\savedocument\document
\def\document{\savedocument\ifnum\currentpage>0\setcounter{page}{\the\currentpage}\fi}

\def\shorttitle#1{\def\theshorttitle{#1}}
\let\theshorttitle\relax

\def\runningfootauthor#1{\def\therunningfootauthor{#1 \etal}}
\let\therunningfootauthor\relax

\def\editorinitials#1{\def\theeditor{#1}}
\editorinitials{XYZ}

\def\DOInumber#1{\def\theDOI{/#1}}
\def\theDOI{(DOI number)}

\def\copyrightyear#1{\def\thecopyrightyear{#1}}

\def\copyrightinfo#1{\def\thecopyrightinfo{#1}}

\advance\textheight -12pt

\def\acknowledgments{\section*{Acknowledgments}}
\def\endacknowledgments{\vskip12pt}

\def\frontmatter@abstractfont{%
\global\numlinestrue
\linenumbers
\normalsize
 \adjust@abstractwidth
}%

\newif\iftitle
\global\titletrue


%% this was under \ifmanuscript
\long\def\maketitle{\let \Hy@saved@footnotemark \@footnotemark
\let \Hy@saved@footnotetext \@footnotetext
\let \@footnotemark \H@@footnotemark \let \@footnotetext
\H@@footnotetext
\@ifnextchar [\Hy@maketitle@optarg {\HyOrg@maketitle
\Hy@maketitle@end
}\ifmanuscript\linenumbers\else\ifturnonlinenumbers
\linenumbersep=4pt
\linenumbers\fi\fi}

\ifmanuscript
\def\ps@titlepage{
\def \@oddhead {\iftitle\global\titlefalse\hfill\thepreprint\global\let\thepreprint\relax
\else\hfill\@runningtitle \fi}
\let \@evenhead \@oddhead
\def \@oddfoot {\hb@xt@ \z@ {\byrevtex \hss }\hfil \preprintsty@sw {\thepage }{}\quad \checkindate \hfil }
\let \@evenfoot \@oddfoot }

\thispagestyle{titlepage}
\pagestyle{titlepage}



\AtBeginDocument{\global\reprintcolumnwidth=246pt
 %%  in response to feedback asking for \columnwidth to be the
                         %%  same with preprint and reprint styles; author should use \reprintcolumnwidth.
\def\arraystretch{1.2}\ifgrouped\clo@groupedaddress\fi}

\def\@ssect@ltx#1#2#3#4#5#6[#7]#8{%
  \def\H@svsec{\phantomsection}%
  \@tempskipa #5\relax
  \@ifdim{\@tempskipa>\z@}{%
    \begingroup
      \interlinepenalty \@M
      #6{%
       \@ifundefined{@hangfroms@#1}{\@hang@froms}{\csname @hangfroms@#1\endcsname}%
       {\hskip#3\relax\H@svsec}{\ifnum#2=1\noindent\hskip-\parindent\fi#8}%
      }%
      \@@par
    \endgroup
    \@ifundefined{#1smark}{\@gobble}{\csname #1smark\endcsname}{#7}%
    \addcontentsline{toc}{#1}{\protect\numberline{}#8}%
  }{%
    \def\@svsechd{%
      #6{%
       \@ifundefined{@runin@tos@#1}{\@runin@tos}{\csname @runin@tos@#1\endcsname}%
       {\hskip#3\relax\H@svsec}{#8}%
      }%
      \@ifundefined{#1smark}{\@gobble}{\csname #1smark\endcsname}{#7}%
      \addcontentsline{toc}{#1}{\protect\numberline{}#8}%
    }%
  }%
  \@xsect{#5}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% These commands are for reprint +++

\else


\def\frontmatter@authorformat{%
 \frontmatter@@indent
 \sffamily
\advance\baselineskip\p@
\parskip8pt\relax %11.5\p@\relax
}%

%% Section heads rewritten for Reprint

\def\section{\@startsection {section}{1}{\z@ }{16pt}
{7pt}
{\noindent\boldmath \bigsmall \bfseries\sffamily }}

\def\sectionfont{\bigsmall\bfseries\sffamily}

\def\subsection{\@startsection {subsection}{2}{\z@ }{16pt}{7pt}
{\noindent\boldmath\bigsmall\normalfont  \bfseries\sffamily }}

\def\subsubsection{\@startsection {subsubsection}{3}{\z@ }{14pt
minus 2pt}{6pt} {\noindent\boldmath\normalsize\normalfont
%\small
\bfseries\itshape\sffamily }}

\def\paragraph{\@startsection {paragraph}{4}{\parindent }{3pt}{-18pt}{\small
%\bfseries
\itshape
\sffamily }}

\parskip=0pt
\parindent=18pt
\def\@seccntformat#1{\csname the#1\endcsname.\hskip2pt\relax}

%% a bit more vertical space between horizontal lines, makes table more readable
\AtBeginDocument{\def\arraystretch{1.2}\ifgrouped\clo@groupedaddress\fi}

%%%%%%%% Adjustments to aip.rtx %%%%%%%%%%%%%%%

\def\frontmatter@title@above{\addvspace{6\p@}}%
\def\frontmatter@title@format{%
 \preprintsty@sw{}{\titlefont}%
\spaceskip=8pt plus 6pt
 \bfseries
 \raggedright
 \parskip\z@skip
\advance\rightskip .7in
}%
\def\frontmatter@title@below{\addvspace{12\p@}}%

\def\frontmatter@affiliationfont{%
% \frontmatter@@indent
 \preprintsty@sw{}{\small}%
 \it
\rightskip=1in
}%


%% abstract
\def\adjust@abstractwidth{%
 \parindent0pt\relax
\advance\rightskip1in
 \advance\leftskip.5in\relax
 \@totalleftmargin\leftskip
 \@afterheading\@afterindentfalse
}%


\def\frontmatter@abstractfont{%
\normalsize
 \adjust@abstractwidth
}%


%% default values
\copyrightinfo{Acoustical Society of America.}
\copyrightyear{\the\year}

%% need all this just to get line in below abstract!
\def\titleblock@produce{%
 \begingroup
  \ltx@footnote@pop
  \def\@mpfn{mpfootnote}%
  \def\thempfn{\thempfootnote}%
  \c@mpfootnote\z@
  \let\@makefnmark\frontmatter@makefnmark
  \frontmatter@setup
  \thispagestyle{titlepage}\label{FirstPage}%
  \frontmatter@title@produce
  \groupauthors@sw{%
   \frontmatter@author@produce@group
  }{%
   \frontmatter@author@produce@script
  }%
  \frontmatter@RRAPformat{%
   \expandafter\produce@RRAP\expandafter{\@date}%
   \expandafter\produce@RRAP\expandafter{\@received}%
   \expandafter\produce@RRAP\expandafter{\@revised}%
   \expandafter\produce@RRAP\expandafter{\@accepted}%
   \expandafter\produce@RRAP\expandafter{\@published}%
  }%
  \frontmatter@abstract@produce
 \vskip-4pt
 \noindent\normalsize\hskip.5in\hbox to 402pt{{\it\copyright\thecopyrightyear\
 \thecopyrightinfo}\qquad
 [\href{https://doi.org\theDOI}{https://doi.org\theDOI}]\hfill}
\vskip9pt
\noindent\normalsize\hskip.5in\hbox to402pt{[\theeditor]\hfill Pages:
\@startpage--\pageref{finalpage}}\vskip20pt
  \@ifx@empty\@pacs{}{%
   \@pacs@produce\@pacs
  }%
  \@ifx@empty\@keywords{}{%
   \@keywords@produce\@keywords
  }%
  \par
  \frontmatter@finalspace
 \endgroup
\pagestyle{reprint}
}%


\long\def\make@footnotetext#1{%
  \set@footnotefont
  \set@footnotewidth
  \@parboxrestore
  \protected@edef\@currentlabel{%
   \csname p@\@mpfn\endcsname\@thefnmark
  }%
  \color@begingroup
   \@makefntext{%
    \rule\z@\footnotesep\ignorespaces#1%
    \@finalstrut\strutbox\vadjust{\vskip\z@skip}%
   }%
  \color@endgroup
 \minipagefootnote@drop
}%

\def\footnoterule{\dimen@ \skip \footins
\divide \dimen@ \tw@ \kern -\dimen@ \hrule width120pt\kern \dimen@}

\advance\textheight 24pt


\def\ps@titlepage{
\def\@oddhead{\hfill}\let\@evenhead\@oddhead
\def\@evenfoot{{\footnotesize\sf\ifodd\c@page\else\the\c@page\qquad\fi
J. Acoust. Soc. Am.\ \ /\ \ \today
\hfill
\@shorttitle \ifodd\c@page\qquad\the\c@page\fi}}
\let\@oddfoot\@evenfoot
}


\pagestyle{titlepage}
\thispagestyle{titlepage}
\fi


\def\etal{{\footnotesize\sffamily\itshape et al.}}



%% to avoid an error, hope this doesn't cause problems...
\def\select@language#1{}


\let\saveenddocument\enddocument

\def\enddocument{%
\listofchanges
\ifmanuscript\else
%\newpage
\phantomsection
\ \label{finalpage}%% to be able to hyperlink to final page
\fi
\eject
\saveenddocument
}%


\let\undefinedpagestyle\relax



\def\preprint#1{\def\thepreprint{#1}}
\let\thepreprint\relax

% get rid of error message
\ifauthoryear
\let\NAT@force@numbers\relax
\fi

%%%%%%%%%%%%
\newcounter{multimedia}

\long\def\multimedia#1#2{\vskip12pt\global\advance\c@multimedia by 1
\phantomsection
{\leftskip18pt
\noindent\hskip-18pt\href{{#1}}{Mm.\ \the\c@multimedia.\ \ }%
\xdef\@currentlabel{\the\c@multimedia}%
#2\vskip12pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% bibliography, endnotes if authoryear

\let\savethebibliography\thebibliography
\def\@theenmark{0}

\ifauthoryear
\bibliographystyle{jasaauthyear2}
\def\bibhang{8pt}
\let\bibsection\relax
\def\thebibliography#1{\theendnotes\
\savethebibliography{#1}
\global\advance\c@NAT@ctr by \@theenmark
}
\def\endthebibliography{
 \edef\@currentlabel{\arabic{NAT@ctr}}%
 \label{LastBibItem}%
\relax}
\else
\bibliographystyle{jasanum2}
\def\@bibstyle{jasanum2}%apsrev4-1}%
\def\thebibliography#1{\savethebibliography{#1}\advance\parskip3pt\relax}
\def\endthebibliography{ \edef\@currentlabel{\arabic{NAT@ctr}}%
 \label{LastBibItem}\relax}
\fi


\ifauthoryear
\usepackage{endnotes}
\def\enoteformat{\vskip3pt\rightskip=0pt \leftskip=3pt
\parindent=0pt
\leavevmode\llap{\hbox{$^{\@theenmark}$}}}

\def\@makeenmark{\hbox{\expandafter\hyperlink{end\@theenmark}{$^{\@theenmark}$}}}

\def\theendnotes{\immediate\closeout\@enotes \global\@enotesopenfalse
  \begingroup
    \makeatletter
    \def\@doanenote##1##2>{\def\@theenmark{##1}\par\begingroup
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark} %DW
\hypertarget{end\@theenmark}{}
        \enoteformat}
    \def\@endanenote{\par\endgroup}%
    \def\ETC.{\errmessage{Some long endnotes will be truncated; %
                            use BIGLATEX to avoid this}%
          \def\ETC.{\relax}}
    \enoteheading
    \enotesize
    \@input{\jobname.ent}%
  \endgroup}

\let\footnote\endnote
\fi

\def\enoteheading{\vskip24pt}

\def\notesname{}

\widowpenalty10000
\clubpenalty10000

\textfloatsep=12pt

\def\dodoi#1{doi: \href{https://doi.org/#1}{\nolinkurl{#1}}}
\def\dourl#1{\href{http://#1}{\nolinkurl{#1}}}




\def\appendixname{APPENDIX}


\def\@appendixcntformat#1{\appendixname\ \csname
thesection\endcsname: }%

\def\appendixsection{\x@startsection {section}{1}{\z@ }{0.8cm \@plus
1ex \@minus .2ex}{0.5cm}  {\sectionfont}}

%% this is a fix for people with hyperref older than 2011, to prevent an error
\expandafter\ifx\csname Hy@AlphNoErr\endcsname\relax
\def\Hy@AlphNoErr#1{\ifnum \value {#1}>26 Alph\number \value{#1}
\else  \ifnum \value {#1}<1 Alph\number \value {#1}
\else \Alph {#1}\fi \fi}%
\fi

\def\appendix{%
\let\@sectioncntformat\@appendixcntformat
\let\section\appendixsection
\@ifundefined{chapter}{\gdef \theHsection {\Hy@AlphNoErr {section}}}
{\gdef \theHchapter {\Hy@AlphNoErr {chapter}}}
\xdef \Hy@chapapp {\Hy@appendixstring }\HyOrg@appendix}


\def\x@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\x@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\eatone#1{}

\def\catchlabel#1{\gdef\savecatchlabel{\label{#1}}}

\def\x@sect#1#2#3#4#5#6[#7]#8{%
\let\savecatchlabel\relax
\global\setbox0=\hbox{\let\label\catchlabel#8}
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@appendixcntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec
}%
%%  make appendix title be uppercase:
{\expandafter\ifx\csname savecatchlabel\endcsname\relax
\else\let\label\eatone
         \interlinepenalty \@M \uppercase{#8}\fi}
\@@par}%
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
  \@xsect{#5}
\expandafter\ifx\csname savecatchlabel\endcsname\relax\else
\def\@currentlabelname{Appendix}
\savecatchlabel\fi
}

\def\@sect@ltx#1#2#3#4#5#6[#7]#8{%
  \@ifnum{#2>\c@secnumdepth}{%
    \def\H@svsec{\phantomsection}%
    \let\@svsec\@empty
  }{%
    \H@refstepcounter{#1}%
    \def\H@svsec{%
     \phantomsection
    }%
    \protected@edef\@svsec{{#1}}%
    \@ifundefined{@#1cntformat}{%
     \prepdef\@svsec\@seccntformat
    }{%
     \expandafter\prepdef
     \expandafter\@svsec
                 \csname @#1cntformat\endcsname
    }%
  }%
  \@tempskipa #5\relax
  \@ifdim{\@tempskipa>\z@}{%
    \begingroup
      \interlinepenalty \@M
      #6{%
       \@ifundefined{@hangfrom@#1}{\@hang@from}{\csname @hangfrom@#1\endcsname}%
       {\hskip#3\relax\H@svsec}{\@svsec}{#8}%
      }%
      \@@par
    \endgroup
    \@ifundefined{#1mark}{\@gobble}{\csname #1mark\endcsname}{#7}%
    \addcontentsline{toc}{#1}{%
      \@ifnum{#2>\c@secnumdepth}{%
       \protect\numberline{}%
      }{%
       \protect\numberline{\csname the#1\endcsname}%
      }%
      #8}%
  }{%
    \def\@svsechd{%
      #6{%
       \@ifundefined{@runin@to@#1}{\@runin@to}{\csname @runin@to@#1\endcsname}%
%% added period below for paragraph
       {\hskip#3\relax\H@svsec}{\@svsec}{#8.}%
      }%
      \@ifundefined{#1mark}{\@gobble}{\csname #1mark\endcsname}{#7}%
      \addcontentsline{toc}{#1}{%
        \@ifnum{#2>\c@secnumdepth}{%
         \protect\numberline{}%
        }{%
         \protect\numberline{\csname the#1\endcsname}%
        }%
        #8}%
    }%
  }%
  \@xsect{#5}%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is to make ) after email but not after affiliation markers.

\def\frontmatter@makefnmark{%
 \@textsuperscript{%
  \normalfont\@thefnmark%(
\ifemail)\global\emailfalse\fi%
}%
}%

\newif\ifemail
\renewcommand*\email[1][]{\begingroup\global\emailtrue\sanitize@url\@email{#1}}%

\def\@email#1#2{%
 \endgroup
 \@AF@join{#1%$^{)}$
\href{mailto:#2}{#2}}%
}%

%% Authors should use \citep. This will make the results the same
%% if they forget.

\let\cite\citep
\advance\belowcaptionskip12pt

\def\endruledtabular{\vskip9pt}

\newdimen\reprintcolumnwidth
\global\reprintcolumnwidth=246pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\nofloatfigure{\@ifnextchar[\xnofloatfigure\ynofloatfigure}

\def\xnofloatfigure[#1]{\vskip12pt\bgroup
\global\advance\c@figure by 1
\def\@captype{figure}%
\def\@currentlabel{\the\c@figure}%
\def\@currentlabelname{figure}
\def\@currentHref{figure*.\the\c@figure}
\expandafter \hyper@@anchor \expandafter {\@currentHref }{\relax }{}
%%
\long\def\caption##1{\vskip1sp\leftskip=0pt\relax\rightskip=0pt\relax
\parfillskip=0pt plus 1fil
\small
\vskip\abovecaptionskip\noindent
FIG.~\the\c@figure.\ ##1\vskip\belowcaptionskip}%
\noindent\ignorespaces
}

\def\ynofloatfigure{\vskip12pt\bgroup
\global\advance\c@figure by 1
\def\@captype{figure}%
\def\@currentlabel{\the\c@figure}%
\def\@currentlabelname{figure}
\def\@currentHref{figure*.\the\c@figure}
\expandafter \hyper@@anchor \expandafter {\@currentHref }{\relax }{}
%%
\long\def\caption##1{\vskip1sp\leftskip=0pt\relax\rightskip=0.0pt
\relax\parfillskip=0pt plus 1fil
\small\vskip\abovecaptionskip\noindent
FIG.~\the\c@figure.\ ##1\vskip\belowcaptionskip}%
\noindent\ignorespaces
}

\def\endnofloatfigure{\egroup\vskip12pt}

\newcommand*{\citen}[1]{%
 \begingroup%
   \romannumeral-`\x % remove space at the beginning of \setcitestyle
   \setcitestyle{numbers}%
   \cite{#1}%
 \endgroup%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is to make ) after thanks but not after affiliation or email markers.

\def\frontmatter@makefnmark{%
 \@textsuperscript{%
  \normalfont\@thefnmark%(
\ifthanks)%\global\thanksfalse
\fi%
}%
}%

\newif\ifthanks
\renewcommand*\thanks[1][]{\begingroup
\global\thankstrue\sanitize@url\@thanks{#1}}%

%% This is at the bottom of the page
\def\@thanks#1#2{\endgroup
 \@AF@join{#1%$^{)}$
{#2}}%
}

\def\altaffiliation#1{\thanks{#1}}
\def\altaffil#1{\thanks{#1}}


\endinput

Change Log
Sept 25, 2019
1) Change revtex4-2 to 4-1 to accomodate EM uptake.
Probably temporary

August/September 16, 2019

1) revtex4.2 changed to revtex4-2

2) \def\dodoi#1{doi: \href{http://dx.doi.org/#1}{\nolinkurl{#1}}}
changed to
\def\dodoi#1{doi: \href{https://doi.org/#1}{\nolinkurl{#1}}}
to match the RevTeX4-2 convention.

3) New commands: \begin{nofloatfigure}...\end{nofloatfigure}
which allows long captions to continue onto next page or column.
The figure will print whereever it is typed in. Label will be
hyperlinked as it would with
\begin{figure}\caption{\label{text}}\end{figure}

4) sidebysidefigure now uses: \sidebysidefigure{#1}{#2}/{#3}{#4}

5) Fixes to all the figure commands so that we can label and
reference separate parts of the figure, ie, figure 1(a) etc.
Includes \narrowcaption, \boxedfig, \fig, \columnfig,
\leftfig, \rightfig, \rotatefig, \sidebysidefigures.

6) Added \citen{} to make numerical citation >> not << be
superscripted.

7) Long figure caption, accomodated with \begin{nofloatfigure}...
\end{nofloatfigure} which prints where it is typed in and
will continue over columns or pages as necessary.
References will be hyperlinked as they would with
\begin{figure}\caption{\label{text}}\end{figure}

8) Figline now allows labels, entered after \fig{}..
\figline{\fig{fig here}{letter}\label{figlabel}}
This will allow authors to label
and reference separate parts of the figure, ie, figure 1(a) etc.
Includes \narrowcaption, \boxedfig, \fig, \columnfig,
\leftfig, \rightfig, \rotatefig, \sidebysidefigures.

9)Track changes, fixed bug in \deleted[]{}, and made deleted
work correctly in abstract.

Tip: Here's how to embed citations within \replaced{}{}:
\replaced{\hbox{\citep{xyz}}{\hbox{\citep{zyx}}

10) Changed \setcitestyle to include \yysep={,}:
\setcitestyle{authoryear,round,aysep={,},yysep={,},citesep={;}}
which makes comma appear between multiple mentions of author in
single citation, ie
(Jones, A., 2017a,b,c,d). (avoids superscripted commas when not
using authref style.)

Also, when using jasaauthyear2.bst, we were getting an extra
space before the final period when formatting Technical Report
in bibliography. Fixed.

11) New field for jasanum2.bst, jasaauthyear2.bst .
newspaper entry, matching specs for each.
Samples found in bibsamp1 and bibsamp2.


12)Problem with label in appendix section head, fixed.

13) Change to jasanum2.bst, in response to author suggestion,
so there will not be a problem when field entry is not found.

14) Added \altaffiliation{}, will work like Jasa-EL

Use like this:
\affiliation{Department1,  University1, City, State ZipCode,
Country}\altaffil{Alternate Department, University, City, State
ZipCode, Country}

15) Changes to .bst files:

A) Changes to jasaauthyear2.bst in response to bibsamp1-feedback:

Added `reprinted' to format.in.ed.booktitle

Got rid of 2001 in sampbib.bib to fix ISO4020 bib item

Changed note field in sampbib.bib in K. Smith entry, to simply: in press

Changed note field in sampbib.bib for A. Tolstoy to end the same as Smith

B) Changes to jasanum2.bst in response to bibsamp2-feedback

 Change to FUNCTION {output.nonnull} to accomodate empty fields.
 Change to FUNCTION {standards} to add comma after author.
 Checked format of newspaper entries.




























