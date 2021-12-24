%% 
%% This is file `iopart.cls'
%% 
%% This file is distributed in the hope that it will be useful, 
%% but WITHOUT ANY WARRANTY; without even the implied warranty of 
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
%% 
%% Licensed under the LPPL: http://www.latex-project.org/lppl.txt
%% Current Maintainer: IOP Publishing Ltd
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
%%   Right brace   \}     Tilde         \~}
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iopart}[1996/06/10 v0.0 IOP Journals LaTeX article class]
\newcommand\@ptsize{0}
\newif\if@restonecol
\newif\if@titlepage
\newif\ifiopams
\@titlepagefalse
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{2}} % No 11pt version
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\ExecuteOptions{letterpaper,final}
\ProcessOptions
\DeclareMathAlphabet{\bi}{OML}{cmm}{b}{it}
\DeclareMathAlphabet{\bcal}{OMS}{cmsy}{b}{n}
\input{iopart1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setlength\parindent{2em}
\setcounter{topnumber}{8}
\renewcommand\topfraction{1}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.99}
\setcounter{totalnumber}{8}
\renewcommand\textfraction{0.01}
\renewcommand\floatpagefraction{.8}
\setcounter{dbltopnumber}{6}
\renewcommand\dbltopfraction{1}
\renewcommand\dblfloatpagefraction{.8}
%
\pretolerance=5000
\tolerance=8000
%
% Headings for all pages apart from first
%
\def\ps@headings{\let\@oddfoot\@empty
      \let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\itshape\rightmark}%
      \def\@oddhead{{\itshape\leftmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \let\sectionmark\@gobble
      \let\subsectionmark\@gobble}
%
% Headings for first page
%
\def\ps@myheadings{\let\@oddfoot\@empty\let\@evenfoot\@empty
    \let\@oddhead\@empty\let\@evenhead\@empty
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble}
%
% \maketitle just ends page
%
\newcommand\maketitle{\newpage}
%
% Article titles
%
% Usage: \title[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\renewcommand{\title}{\@ifnextchar[{\@stitle}{\@ftitle}}
\def\@stitle[#1]#2{\markboth{#1}{#1}%
    \thispagestyle{myheadings}%
    \vspace*{3pc}{\exhyphenpenalty=10000\hyphenpenalty=10000 
    \Large\raggedright\noindent
    \bf#2\par}}
\def\@ftitle#1{\markboth{#1}{#1}%
    \thispagestyle{myheadings}%
    \vspace*{3pc}{\exhyphenpenalty=10000\hyphenpenalty=10000 
    \Large\raggedright\noindent
    \bf#1\par}}
%
% Can use \paper instead of \title
%
\let\paper=\title
%
% Generic title command for articles other than papers
%
% Usage: \article[Short title]{Article Type}{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\newcommand{\article}{\@ifnextchar[{\@sarticle}{\@farticle}}
\def\@sarticle[#1]#2#3{\markboth{#1}{#1}%
    \thispagestyle{myheadings}%
     \vspace*{.5pc}%
    {\parindent=\mathindent \bf #2\par}%
     \vspace*{1.5pc}%
    {\exhyphenpenalty=10000\hyphenpenalty=10000
     \Large\raggedright\noindent
     \bf#3\par}}%
\def\@farticle#1#2{\markboth{#2}{#2}%
    \thispagestyle{myheadings}%
     \vspace*{.5pc}%
    {\parindent=\mathindent \bf #1\par}%
     \vspace*{1.5pc}%
    {\exhyphenpenalty=10000\hyphenpenalty=10000
     \Large\raggedright\noindent
     \bf#2\par}}%
%
% Letters to the Editor
%
% Usage \letter{Full title}
% No short title is required for Letters
%
\def\letter#1{\article[Letter to the Editor]{Letter to the Editor}{#1}}
%
% Fast Track Communications (added by sxb 9 March 2011)
%
% Usage \ftc{Full title} - there's no short title
\def\ftc#1{\article[Fast Track Communication]{Fast Track Communication}{#1}}
%
%
% Review articles
%
% Usage: \review[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\def\review{\@ifnextchar[{\@sreview}{\@freview}}
\def\@sreview[#1]#2{\@sarticle[#1]{Review Article}{#2}}
\def\@freview#1{\@farticle{Review Article}{#1}}
%
% Topical Review
%
% Usage: \topical[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\def\topical{\@ifnextchar[{\@stopical}{\@ftopical}}
\def\@stopical[#1]#2{\@sarticle[#1]{Topical Review}{#2}}
\def\@ftopical#1{\@farticle{Topical Review}{#1}}
%
% Comments
%
% Usage: \comment[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\def\comment{\@ifnextchar[{\@scomment}{\@fcomment}}
\def\@scomment[#1]#2{\@sarticle[#1]{Comment}{#2}}
\def\@fcomment#1{\@farticle{Comment}{#1}}
%
% Rapid Communications
%
% Usage: \rapid[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\def\rapid{\@ifnextchar[{\@srapid}{\@frapid}}
\def\@srapid[#1]#2{\@sarticle[#1]{Rapid Communication}{#2}}
\def\@frapid#1{\@farticle{Rapid Communication}{#1}}
%
% Notes
%
% Usage: \note[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\def\note{\@ifnextchar[{\@snote}{\@fnote}}
\def\@snote[#1]#2{\@sarticle[#1]{Note}{#2}}
\def\@fnote#1{\@farticle{Note}{#1}}
%
% Preliminary Communications
%
% Usage: \prelim[Short title]{Full title}
% [Short title] is optional; use where title is too long
% or contains footnotes, 50 characters maximum 
%
\def\prelim{\@ifnextchar[{\@sprelim}{\@fprelim}}
\def\@sprelim[#1]#2{\@sarticle[#1]{Preliminary Communication}{#2}}
\def\@fprelim#1{\@farticle{Preliminary Communication}{#1}}
%
% List of authors
%
% Usage \author[Short form]{List of all authors}
% The short form excludes footnote symbols linking authors to addresses 
% and is used for running heads in printed version (but not on preprints)
%
\renewcommand{\author}{\@ifnextchar[{\@sauthor}{\@fauthor}}
\def\@sauthor[#1]#2{\markright{#1}    % for production only
   \vspace*{1.5pc}%
   \begin{indented}%
   \item[]\normalsize\bf\raggedright#2
   \end{indented}%
   \smallskip}
\def\@fauthor#1{%\markright{#1}         for production only
   \vspace*{1.5pc}%
   \begin{indented}%
   \item[]\normalsize\bf\raggedright#1
   \end{indented}%
   \smallskip}
%
% Affiliation (authors address)
%
% Usage: \address{Address of first author}
%        \address{Address of second author}
% Use once for each address, use symbols \dag \ddag \S \P $\|$
% to connect authors with addresses
%
\newcommand{\address}[1]{\begin{indented}
   \item[]\rm\raggedright #1
   \end{indented}}
%
% American Mathematical Society Classification Numbers
% Usage: \ams{57.XX, 58.XX}
%
\def\ams#1{\vspace{10pt}
     \begin{indented}
     \item[]\rm AMS classification scheme numbers: #1\par
     \end{indented}}
%
% A single Physics & Astronomy Classification Number
% Usage \pacno{31.10}
%
\def\pacno#1{\vspace{10pt}
     \begin{indented}
     \item[]\rm PACS number: #1\par
     \end{indented}}
%
% Physics & Astronomy Classification Numbers (more than one)
% Usage \pacs{31.10, 31.20T}
%
\def\pacs#1{\vspace{10pt}
     \begin{indented}
     \item[]\rm PACS numbers: #1\par
     \end{indented}}
%
% Submission details. If \jl command used journals name printed
% otherwise Institute of Physics Publishing 
%
\def\submitted{\vspace{28pt plus 10pt minus 18pt}
     \noindent{\small\rm Submitted to: {\it \journal}\par}}
%
\def\submitto#1{\vspace{28pt plus 10pt minus 18pt}
     \noindent{\small\rm Submitted to: {\it #1}\par}}
%
% For articles (other than Letters) not divided into sections
% Usage \nosections Start of text
%
\def\nosections{\vspace{30\p@ plus12\p@ minus12\p@}
    \noindent\ignorespaces}
%
% Acknowledgments (no heading if letter)
% Usage \ack for Acknowledgments, \ackn for Acknowledgement
%
\def\ack{\ifletter\bigskip\noindent\ignorespaces\else
    \section*{Acknowledgments}\fi}
\def\ackn{\ifletter\bigskip\noindent\ignorespaces\else
    \section*{Acknowledgment}\fi}
%
% Footnotes: symbols selected in order \dag (1), \ddag (2), \S (3), 
% $\|$ (4), $\P$ (5), $^+$ (6), $^*$ (7), \sharp (8), \dagger\dagger (9)
% unless optional argument of [<num>] use to specify required symbol, 
% 1=\dag, 2=\ddag, etc
% Usage: \footnote{Text of footnote}
%        \footnote[3]{Text of footnote}
%
\def\footnoterule{}%
\setcounter{footnote}{1}
\long\def\@makefntext#1{\parindent 1em\noindent 
 \makebox[1em][l]{\footnotesize\rm$\m@th{\fnsymbol{footnote}}$}%
 \footnotesize\rm #1}
\def\@makefnmark{\hbox{${\fnsymbol{footnote}}\m@th$}}
\def\@thefnmark{\fnsymbol{footnote}}
\def\footnote{\@ifnextchar[{\@xfootnote}{\stepcounter{\@mpfn}%
       \begingroup\let\protect\noexpand
       \xdef\@thefnmark{\thempfn}\endgroup
     \@footnotemark\@footnotetext}}
\def\@xfootnote[#1]{\setcounter{footnote}{#1}%
   \addtocounter{footnote}{-1}\footnote}
\def\@fnsymbol#1{\ifcase#1\or \dagger\or \ddagger\or \S\or
   \|\or \P\or ^{+}\or ^{\tsty *}\or \sharp
   \or \dagger\dagger \else\@ctrerr\fi\relax}
%
% IOP Journals
%
\newcounter{jnl}
\newcommand{\jl}[1]{\setcounter{jnl}{#1}}
\def\journal{\ifnum\thejnl=0 Institute of Physics Publishing\fi
        \ifnum\thejnl=1 J. Phys.\ A: Math.\ Gen.\ \fi
        \ifnum\thejnl=2 J. Phys.\ B: At.\ Mol.\ Opt.\ Phys.\ \fi
        \ifnum\thejnl=3 J. Phys.:\ Condens. Matter\ \fi
        \ifnum\thejnl=4 J. Phys.\ G: Nucl.\ Part.\ Phys.\ \fi
        \ifnum\thejnl=5 Inverse Problems\ \fi
        \ifnum\thejnl=6 Class. Quantum Grav.\ \fi
        \ifnum\thejnl=7 Network: Comput.\ Neural Syst.\ \fi
        \ifnum\thejnl=8 Nonlinearity\ \fi
        \ifnum\thejnl=9 J. Opt. B: Quantum Semiclass. Opt.\ \fi
        \ifnum\thejnl=10 Waves Random Media\ \fi
        \ifnum\thejnl=11 J. Opt. A: Pure Appl. Opt.\ \fi
        \ifnum\thejnl=12 Phys. Med. Biol.\ \fi
        \ifnum\thejnl=13 Modelling Simul.\ Mater.\ Sci.\ Eng.\ \fi
        \ifnum\thejnl=14 Plasma Phys. Control. Fusion\ \fi
        \ifnum\thejnl=15 Physiol. Meas.\ \fi
        \ifnum\thejnl=16 Combust. Theory Modelling\ \fi
        \ifnum\thejnl=17 High Perform.\ Polym.\ \fi
        \ifnum\thejnl=18 Public Understand. Sci.\ \fi
        \ifnum\thejnl=19 Rep.\ Prog.\ Phys.\ \fi
        \ifnum\thejnl=20 J.\ Phys.\ D: Appl.\ Phys.\ \fi
        \ifnum\thejnl=21 Supercond.\ Sci.\ Technol.\ \fi
        \ifnum\thejnl=22 Semicond.\ Sci.\ Technol.\ \fi
        \ifnum\thejnl=23 Nanotechnology\ \fi
        \ifnum\thejnl=24 Measur.\ Sci.\ Technol.\ \fi
        \ifnum\thejnl=25 Plasma.\ Sources\ Sci.\ Technol.\ \fi
        \ifnum\thejnl=26 Smart\ Mater.\ Struct.\ \fi
        \ifnum\thejnl=27 J.\ Micromech.\ Microeng.\ \fi
        \ifnum\thejnl=28 Distrib.\ Syst.\ Engng\ \fi
        \ifnum\thejnl=29 Bioimaging\ \fi
        \ifnum\thejnl=30 J.\ Radiol. Prot.\ \fi
        \ifnum\thejnl=31 Europ. J. Phys.\ \fi
        \ifnum\thejnl=32 J. Opt. A: Pure Appl. Opt.\ \fi
        \ifnum\thejnl=33 New. J. Phys.\ \fi}
%
% E-mail addresses (to provide links from headers)
%
\def\eads#1{\vspace*{5pt}\address{E-mail: #1}}
\def\ead#1{\vspace*{5pt}\address{E-mail: \mailto{#1}}}
\def\mailto#1{{\tt #1}}
%
% Switches
%
\newif\ifletter
%
\setcounter{secnumdepth}{3}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thesection       {\arabic{section}}
\renewcommand\thesubsection    {\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
\def\@chapapp{Section}

\newcommand\section{\@startsection {section}{1}{\z@}%
                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                   {2.3ex \@plus.2ex}%
                   {\reset@font\normalsize\bfseries\raggedright}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                   {-3.25ex\@plus -1ex \@minus -.2ex}%
                   {1.5ex \@plus .2ex}%
                   {\reset@font\normalsize\itshape\raggedright}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {-1em \@plus .2em}%
                                     {\reset@font\normalsize\itshape}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\reset@font\normalsize\itshape}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\reset@font\normalsize\itshape}}
\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \let\@svsec\@empty\else
     \refstepcounter{#1}\edef\@svsec{\csname the#1\endcsname. }\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6\relax
          \noindent{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
                    #7}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                             \protect\numberline{\csname the#1\endcsname}\fi
                       #7}}\fi
     \@xsect{#5}}
%
\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
   \ifdim \@tempskipa>\z@
     \begingroup #4\noindent{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
   \else \def\@svsechd{#4\hskip #1\relax #5}\fi
    \@xsect{#3}}

\setlength\leftmargini{2em}
\setlength\leftmarginii{2em}
\setlength\leftmarginiii{1.8em}
\setlength\leftmarginiv{1.6em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\setlength\leftmargin{\leftmargini}
\setlength\labelsep{0.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\roman{enumi}}
\renewcommand\theenumii{\alph{enumii}}
\renewcommand\theenumiii{\arabic{enumiii}}
\renewcommand\theenumiv{\Alph{enumiv}}
\newcommand\labelenumi{(\theenumi)}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{(\theenumiv)}
\renewcommand\p@enumii{(\theenumi)}
\renewcommand\p@enumiii{(\theenumi.\theenumii)}
\renewcommand\p@enumiv{(\theenumi.\theenumii.\theenumiii)}
\newcommand\labelitemi{$\m@th\bullet$}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\ast$}
\newcommand\labelitemiv{$\m@th\cdot$}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{abstract}{%
      \vspace{16pt plus3pt minus3pt}
      \begin{indented}
      \item[]{\bfseries \abstractname.}\quad\rm\ignorespaces} 
      {\end{indented}\if@titlepage\newpage\else\vspace{18\p@ plus18\p@}\fi}
\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item[]}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item[]}
               {\endlist}
\newenvironment{titlepage}
    {%
        \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \if@compatibility
        \setcounter{page}{0}
      \else
        \setcounter{page}{1}%
      \fi}%
    {\newpage\setcounter{page}{1}}
\def\appendix{\@ifnextchar*{\@appendixstar}{\@appendix}}
\def\@appendix{\eqnobysec\@appendixstar}
\def\@appendixstar{\@@par
 \ifnumbysec                         %  Added 30/4/94 to get Table A1,
 \@addtoreset{table}{section}        %  Table B1 etc if numbering by
 \@addtoreset{figure}{section}\fi    %  section
 \setcounter{section}{0}
 \setcounter{subsection}{0}
 \setcounter{subsubsection}{0}
 \setcounter{equation}{0}
 \setcounter{figure}{0}
 \setcounter{table}{0}
 \def\thesection{Appendix \Alph{section}}   
 \def\theequation{\ifnumbysec
      \Alph{section}.\arabic{equation}\else
      \Alph{section}\arabic{equation}\fi}  % Comment A\arabic{equation} maybe
 \def\thetable{\ifnumbysec                 % better? 15/4/95
      \Alph{section}\arabic{table}\else
      A\arabic{table}\fi}
 \def\thefigure{\ifnumbysec
      \Alph{section}\arabic{figure}\else
      A\arabic{figure}\fi}}
\def\noappendix{\setcounter{figure}{0}
     \setcounter{table}{0}
     \def\thetable{\arabic{table}}
     \def\thefigure{\arabic{figure}}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\arabic{equation}}
\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}{\footnotesize\rm\@float{figure}}%
    {\end@float\normalsize\rm}
\newenvironment{figure*}{\footnotesize\rm\@dblfloat{figure}}{\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}{\footnotesize\rm\@float{table}}%
   {\end@float\normalsize\rm}
\newenvironment{table*}{\footnotesize\rm\@dblfloat{table}}%
   {\end@dblfloat\normalsize\rm}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
%
% Added redefinition of \@caption so captions are not written to 
% aux file therefore less need to \protect fragile commands
%
\long\def\@caption#1[#2]#3{\par\begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
% 
\long\def\@makecaption#1#2{\vskip \abovecaptionskip 
 \begin{indented}
 \item[]{\bf #1.} #2
 \end{indented}\vskip\belowcaptionskip}
\let\@portraitcaption=\@makecaption

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\ifiopams
\renewcommand{\cal}{\protect\pcal}
\else
\newcommand{\cal}{\protect\pcal}
\fi
\newcommand{\pcal}{\@fontswitch{\relax}{\mathcal}}
\ifiopams
\renewcommand{\mit}{\protect\pmit}
\else
\newcommand{\mit}{\protect\pmit}
\fi
\newcommand{\pmit}{\@fontswitch{\relax}{\mathnormal}}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg {2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{\uppercase{\contentsname}}{\uppercase{\contentsname}}}%
    \@starttoc{toc}%
    }
\newcommand\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{\@secpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
      \fi
    \endgroup
  \fi}
\newcommand\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty{\@secpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand\l@subsection   {\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand\l@paragraph    {\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand\l@subparagraph {\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\uppercase{\listfigurename}}%
              {\uppercase{\listfigurename}}}%
    \@starttoc{lof}%
    }
\newcommand\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{\uppercase{\listtablename}}{\uppercase{\listtablename}}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\uppercase{\indexname}}%
                        {\uppercase{\indexname}}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem  {\par\hangindent 40\p@}
\newcommand\subitem   {\par\hangindent 40\p@ \hspace*{20\p@}}
\newcommand\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\today{\number\day\space\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

\newcommand{\Tables}{\clearpage\section*{Tables and table captions}
    \def\fps@table{hp}\noappendix}
\newcommand{\Figures}{\clearpage\section*{Figure captions}
    \def\fps@figure{hp}\noappendix}
%
\newcommand{\Figure}[1]{\begin{figure}
  \caption{#1}
  \end{figure}}
%
\newcommand{\Table}[1]{\begin{table}
  \caption{#1}
  \begin{indented}
  \lineup
  \item[]\begin{tabular}{@{}l*{15}{l}}}

\def\endTable{\end{tabular}\end{indented}\end{table}}
\let\endtab=\endTable
%
\newcommand{\fulltable}[1]{\begin{table}
  \caption{#1}
  \footnotesize
  \lineup
  \begin{tabular*}{\textwidth}{@{}l*{15}{@{\extracolsep{0pt plus 12pt}}l}}}
\def\endfulltable{\end{tabular*}\end{table}\normalsize}
%
%
\newcommand{\Bibliography}[1]{\section*{References}\par\numrefs{#1}}
\newcommand{\References}{\section*{References}\par\refs}

\def\thebibliography#1{\list
 {\hfil[\arabic{enumi}]}{\topsep=0\p@\parsep=0\p@
 \partopsep=0\p@\itemsep=0\p@
 \labelsep=5\p@\itemindent=-10\p@
 \settowidth\labelwidth{\footnotesize[#1]}%
 \leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \advance\leftmargin -\itemindent
 \usecounter{enumi}}\footnotesize
 \def\newblock{\ }
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist
\def\numrefs#1{\begin{thebibliography}{#1}}
\def\endnumrefs{\end{thebibliography}}
\let\endbib=\endnumrefs
%
\def\thereferences{\list{}{\topsep=0\p@\parsep=0\p@
 \partopsep=0\p@\itemsep=0\p@\labelsep=0\p@\itemindent=-18\p@
\labelwidth=0\p@\leftmargin=18\p@
}\footnotesize\rm
\def\newblock{\ }
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax
}
%
\let\endthereferences=\endlist
\newlength{\indentedwidth}
\newdimen\mathindent
\indentedwidth=\mathindent
%
% Macro to used for references in the Harvard system
%
\newenvironment{harvard}{\list{}{\topsep=0\p@\parsep=0\p@
\partopsep=0\p@\itemsep=0\p@\labelsep=0\p@\itemindent=-18\p@
\labelwidth=0\p@\leftmargin=18\p@
}\footnotesize\rm
\def\newblock{\ }
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}{\endlist}
%
\def\refs{\begin{harvard}}
\def\endrefs{\end{harvard}}
%
\newenvironment{indented}{\begin{indented}}{\end{indented}}
\newenvironment{varindent}[1]{\begin{varindent}{#1}}{\end{varindent}}
%
\def\indented{\list{}{\itemsep=0\p@\labelsep=0\p@\itemindent=0\p@
   \labelwidth=0\p@\leftmargin=\mathindent\topsep=0\p@\partopsep=0\p@
   \parsep=0\p@\listparindent=15\p@}\footnotesize\rm}

\let\endindented=\endlist 

\def\varindent#1{\setlength{\varind}{#1}%
   \list{}{\itemsep=0\p@\labelsep=0\p@\itemindent=0\p@
   \labelwidth=0\p@\leftmargin=\varind\topsep=0\p@\partopsep=0\p@
   \parsep=0\p@\listparindent=15\p@}\footnotesize\rm}

\let\endvarindent=\endlist 

\def\[{\relax\ifmmode\@badmath\else
 \begin{trivlist}
 \@beginparpenalty\predisplaypenalty
 \@endparpenalty\postdisplaypenalty
 \item[]\leavevmode
 \hbox to\linewidth\bgroup$ \displaystyle
 \hskip\mathindent\bgroup\fi}
\def\]{\relax\ifmmode \egroup $\hfil \egroup \end{trivlist}\else \@badmath \fi}
\def\equation{\@beginparpenalty\predisplaypenalty
 \@endparpenalty\postdisplaypenalty
\refstepcounter{equation}\trivlist \item[]\leavevmode
 \hbox to\linewidth\bgroup $ \displaystyle
\hskip\mathindent}
\def\endequation{$\hfil \displaywidth\linewidth\@eqnnum\egroup \endtrivlist}
%
\@namedef{equation*}{\[}
\@namedef{endequation*}{\]}
%
\def\eqnarray{\stepcounter{equation}\let\@currentlabel=\theequation
\global\@eqnswtrue
\global\@eqcnt\z@\tabskip\mathindent\let\\=\@eqncr
\abovedisplayskip\topsep\ifvmode\advance\abovedisplayskip\partopsep\fi
\belowdisplayskip\abovedisplayskip
\belowdisplayshortskip\abovedisplayskip
\abovedisplayshortskip\abovedisplayskip
$$\halign to
\linewidth\bgroup\@eqnsel$\displaystyle\tabskip\z@
 {##{}}$&\global\@eqcnt\@ne $\displaystyle{{}##{}}$\hfil
 &\global\@eqcnt\tw@ $\displaystyle{{}##}$\hfil
 \tabskip\@centering&\llap{##}\tabskip\z@\cr}
\def\endeqnarray{\@@eqncr\egroup
 \global\advance\c@equation\m@ne$$\global\@ignoretrue }
\mathindent = 6pc
%
\def\eqalign#1{\null\vcenter{\def\\{\cr}\openup\jot\m@th
  \ialign{\strut$\displaystyle{##}$\hfil&$\displaystyle{{}##}$\hfil
      \crcr#1\crcr}}\,}
%
\def\eqalignno#1{\displ@y \tabskip\z@skip
  \halign to\displaywidth{\hspace{5pc}$\@lign\displaystyle{##}$%
    \tabskip\z@skip
    &$\@lign\displaystyle{{}##}$\hfill\tabskip\@centering
    &\llap{$\@lign\hbox{\rm##}$}\tabskip\z@skip\crcr
    #1\crcr}}
%
\newif\ifnumbysec
\def\theequation{\ifnumbysec
      \arabic{section}.\arabic{equation}\else
      \arabic{equation}\fi}
\def\eqnobysec{\numbysectrue\@addtoreset{equation}{section}}

\newcounter{eqnval}

% 2012: if you have an eqn numbered by parts (eg eqn 6a, 6b) this allows
% you to refer to it by just the number (eg eqn 6) if the label is between
% the \multiparteqn and the \numparts
\def\multiparteqn{\addtocounter{equation}{1}
\eqnarray\nonumber
\endeqnarray

\vspace{-72pt}
}

\def\numparts{\addtocounter{equation}{1}%
     \setcounter{eqnval}{\value{equation}}%
     \setcounter{equation}{0}%
     \def\theequation{\ifnumbysec
     \arabic{section}.\arabic{eqnval}{\it\alph{equation}}%
     \else\arabic{eqnval}{\it\alph{equation}}\fi}}

\def\endnumparts{\def\theequation{\ifnumbysec
     \arabic{section}.\arabic{equation}\else
     \arabic{equation}\fi}%
     \setcounter{equation}{\value{eqnval}}}
%
\def\cases#1{%
     \left\{\,\vcenter{\def\\{\cr}\normalbaselines\openup1\jot\m@th%
     \ialign{\strut$\displaystyle{##}\hfil$&\tqs
     \rm##\hfil\crcr#1\crcr}}\right.}%
%
\newcommand{\e}{\mathrm{e}}
\newcommand{\rme}{\mathrm{e}}
\newcommand{\rmi}{\mathrm{i}}
\newcommand{\rmd}{\mathrm{d}}
\renewcommand{\qquad}{\hspace*{25pt}}
\newcommand{\tdot}[1]{\stackrel{\dots}{#1}}   % Added 1/9/94
\newcommand{\tqs}{\hspace*{25pt}}
\newcommand{\fl}{\hspace*{-\mathindent}}
\newcommand{\Tr}{\mathop{\mathrm{Tr}}\nolimits}
\newcommand{\tr}{\mathop{\mathrm{tr}}\nolimits}
\newcommand{\Or}{\mathord{\mathrm{O}}} %changed from \mathop 20/1/95
\newcommand{\lshad}{[\![}
\newcommand{\rshad}{]\!]}
\newcommand{\case}[2]{{\textstyle\frac{#1}{#2}}}
\def\pt(#1){({\it #1\/})}
\newcommand{\dsty}{\displaystyle}
\newcommand{\tsty}{\textstyle}
\newcommand{\ssty}{\scriptstyle}
\newcommand{\sssty}{\scriptscriptstyle}
\def\lo#1{\llap{${}#1{}$}}
\def\eql{\llap{${}={}$}}
\def\lsim{\llap{${}\sim{}$}}
\def\lsimeq{\llap{${}\simeq{}$}}
\def\lequiv{\llap{${}\equiv{}$}}
%
\newcommand{\eref}[1]{(\ref{#1})}
\newcommand{\sref}[1]{section~\ref{#1}}
\newcommand{\fref}[1]{figure~\ref{#1}}
\newcommand{\tref}[1]{table~\ref{#1}}
\newcommand{\Eref}[1]{Equation (\ref{#1})}
\newcommand{\Sref}[1]{Section~\ref{#1}}
\newcommand{\Fref}[1]{Figure~\ref{#1}}
\newcommand{\Tref}[1]{Table~\ref{#1}}

\newcommand{\opencircle}{\mbox{\Large$\circ\,$}}  % moved Large outside maths
\newcommand{\opensquare}{\mbox{$\rlap{$\sqcap$}\sqcup$}}
\newcommand{\opentriangle}{\mbox{$\triangle$}}
\newcommand{\opentriangledown}{\mbox{$\bigtriangledown$}}
\newcommand{\opendiamond}{\mbox{$\diamondsuit$}}
\newcommand{\fullcircle}{\mbox{{\Large$\bullet\,$}}} % moved Large outside maths
\newcommand{\fullsquare}{\,\vrule height5pt depth0pt width5pt}
\newcommand{\dotted}{\protect\mbox{${\mathinner{\cdotp\cdotp\cdotp\cdotp\cdotp\cdotp}}$}}
\newcommand{\dashed}{\protect\mbox{-\; -\; -\; -}}
\newcommand{\broken}{\protect\mbox{-- -- --}}
\newcommand{\longbroken}{\protect\mbox{--- --- ---}}
\newcommand{\chain}{\protect\mbox{--- $\cdot$ ---}}
\newcommand{\dashddot}{\protect\mbox{--- $\cdot$ $\cdot$ ---}}
\newcommand{\full}{\protect\mbox{------}}

\def\;{\protect\psemicolon}
\def\psemicolon{\relax\ifmmode\mskip\thickmuskip\else\kern .3333em\fi}
\def\lineup{\def\0{\hbox{\phantom{\footnotesize\rm 0}}}%
    \def\m{\hbox{$\phantom{-}$}}%
    \def\-{\llap{$-$}}}
%
%%%%%%%%%%%%%%%%%%%%%
% Tables rules      %
%%%%%%%%%%%%%%%%%%%%%

\newcommand{\boldarrayrulewidth}{1\p@} 
% Width of bold rule in tabular environment.

\def\bhline{\noalign{\ifnum0=`}\fi\hrule \@height  
\boldarrayrulewidth \futurelet \@tempa\@xhline}

\def\@xhline{\ifx\@tempa\hline\vskip \doublerulesep\fi
      \ifnum0=`{\fi}}

%
% Rules for tables with extra space around
%
\newcommand{\br}{\ms\bhline\ms}
\newcommand{\mr}{\ms\hline\ms}
%
\newcommand{\centre}[2]{\multispan{#1}{\hfill #2\hfill}}
\newcommand{\crule}[1]{\multispan{#1}{\hspace*{\tabcolsep}\hrulefill
  \hspace*{\tabcolsep}}}
\newcommand{\fcrule}[1]{\ifnum\thetabtype=1\multispan{#1}{\hrulefill
  \hspace*{\tabcolsep}}\else\multispan{#1}{\hrulefill}\fi}
%
% Extra spaces for tables and displayed equations
%
\newcommand{\ms}{\noalign{\vspace{3\p@ plus2\p@ minus1\p@}}}
\newcommand{\bs}{\noalign{\vspace{6\p@ plus2\p@ minus2\p@}}}
\newcommand{\ns}{\noalign{\vspace{-3\p@ plus-1\p@ minus-1\p@}}}
\newcommand{\es}{\noalign{\vspace{6\p@ plus2\p@ minus2\p@}}\displaystyle}%
%
\newcommand{\etal}{{\it et al\/}\ }
\newcommand{\dash}{------}
\newcommand{\nonum}{\par\item[]}                %\par added 1/9/93
\newcommand{\mat}[1]{\underline{\underline{#1}}}
%
% abbreviations for IOPP journals
%
\newcommand{\CQG}{{\it Class. Quantum Grav.} }
\newcommand{\CTM}{{\it Combust. Theory Modelling\/} }
\newcommand{\DSE}{{\it Distrib. Syst. Engng.\/} }
\newcommand{\EJP}{{\it Eur. J. Phys.} } 
\newcommand{\JNE}{{\it J. Neural Eng.} } %added 30/11/2004 GMD
\newcommand{\PB}{{\it Phys. Biol.} } %added 30/11/2004 GMD
\newcommand{\SMS}{{\it Smart Mater. Struct.} } %added 30/11/2004 GMD
\newcommand{\HPP}{{\it High Perform. Polym.} }              % added 4/5/93
\newcommand{\IP}{{\it Inverse Problems\/} }
\newcommand{\JHM}{{\it J. Hard Mater.} }                    % added 4/5/93
\newcommand{\JO}{{\it J. Opt.} }
\newcommand{\JOA}{{\it J. Opt. A: Pure Appl. Opt.} }
\newcommand{\JOB}{{\it J. Opt. B: Quantum Semiclass. Opt.} }
\newcommand{\JPA}{{\it J. Phys. A: Math. Gen.} } % superseded by \jpa below
\newcommand{\JPB}{{\it J. Phys. B: At. Mol. Phys.} }      %1968-87
\newcommand{\jpb}{{\it J. Phys. B: At. Mol. Opt. Phys.} } %1988 and onwards
\newcommand{\JPC}{{\it J. Phys. C: Solid State Phys.} }   %1968--1988
\newcommand{\JPCM}{{\it J. Phys.: Condens. Matter\/} }    %1989 and onwards
\newcommand{\JPD}{{\it J. Phys. D: Appl. Phys.} }
\newcommand{\JPE}{{\it J. Phys. E: Sci. Instrum.} }
\newcommand{\JPF}{{\it J. Phys. F: Met. Phys.} }
\newcommand{\JPG}{{\it J. Phys. G: Nucl. Phys.} }         %1975--1988
\newcommand{\jpg}{{\it J. Phys. G: Nucl. Part. Phys.} }   %1989 and onwards
\newcommand{\JMM}{{\it J. Micromech. Microeng.\/} }
\newcommand{\MSMSE}{{\it Modelling Simul. Mater. Sci. Eng.} } % sxb changed to 'Simul' 15 Mar 2011
\newcommand{\MST}{{\it Meas. Sci. Technol.} }                 %1990 and onwards
\newcommand{\NET}{{\it Network: Comput. Neural Syst.} }
\newcommand{\NJP}{{\it New J. Phys.} }
\newcommand{\NL}{{\it Nonlinearity\/} }
\newcommand{\NT}{{\it Nanotechnology} }
\newcommand{\PAO}{{\it Pure Appl. Optics\/} }
\newcommand{\PM}{{\it Physiol. Meas.} }                        % added 4/5/93
\newcommand{\PMB}{{\it Phys. Med. Biol.} }
\newcommand{\PPCF}{{\it Plasma Phys. Control. Fusion\/} }      % added 4/5/93
\newcommand{\PSST}{{\it Plasma Sources Sci. Technol.} }
\newcommand{\PUS}{{\it Public Understand. Sci.} }
\newcommand{\QO}{{\it Quantum Opt.} }
\newcommand{\QSO}{{\em Quantum Semiclass. Opt.} }
\newcommand{\RPP}{{\it Rep. Prog. Phys.} }
\newcommand{\SLC}{{\it Sov. Lightwave Commun.} }               % added 4/5/93 
\newcommand{\SST}{{\it Semicond. Sci. Technol.} }
\newcommand{\SUST}{{\it Supercond. Sci. Technol.} }
\newcommand{\WRM}{{\it Waves Random Media\/} }
%
% Other commonly quoted journals
%
\newcommand{\AC}{{\it Acta Crystallogr.} }
\newcommand{\AM}{{\it Acta Metall.} }
\newcommand{\AP}{{\it Ann. Phys., Lpz.} }
\newcommand{\APNY}{{\it Ann. Phys., NY\/} }
\newcommand{\APP}{{\it Ann. Phys., Paris\/} }
\newcommand{\CJP}{{\it Can. J. Phys.} }
\newcommand{\JAP}{{\it J. Appl. Phys.} }
\newcommand{\JCP}{{\it J. Chem. Phys.} }
\newcommand{\JJAP}{{\it Jpn. J. Appl. Phys.} }
\newcommand{\JP}{{\it J. Physique\/} }
\newcommand{\JPhCh}{{\it J. Phys. Chem.} }
\newcommand{\JMMM}{{\it J. Magn. Magn. Mater.} }
\newcommand{\JMP}{{\it J. Math. Phys.} }
\newcommand{\JOSA}{{\it J. Opt. Soc. Am.} }
\newcommand{\JPSJ}{{\it J. Phys. Soc. Jpn.\/} }
\newcommand{\JQSRT}{{\it J. Quant. Spectrosc. Radiat. Transfer\/} }
\newcommand{\NC}{{\it Nuovo Cimento\/} }
\newcommand{\NIM}{{\it Nucl. Instrum. Methods\/} }
\newcommand{\NP}{{\it Nucl. Phys.} }
\newcommand{\PL}{{\it Phys. Lett.} }
\newcommand{\PR}{{\it Phys. Rev.} }
\newcommand{\PRL}{{\it Phys. Rev. Lett.} }
\newcommand{\PRS}{{\it Proc. R. Soc.} }
\newcommand{\PS}{{\it Phys. Scr.} }
\newcommand{\PSS}{{\it Phys. Status Solidi\/} }
\newcommand{\PTRS}{{\it Phil. Trans. R. Soc.} }
\newcommand{\RMP}{{\it Rev. Mod. Phys.} }
\newcommand{\RSI}{{\it Rev. Sci. Instrum.} }
\newcommand{\SSC}{{\it Solid State Commun.} }
\newcommand{\ZP}{{\it Z. Phys.} }
\newcommand{\GRG}{{\it Gen. Rel. Grav.} }
\newcommand{\PF}{{\it Phys. Fluids\/} }
\newcommand{\SPJ}{{\it Sov. Phys.--JETP\/} }
%
% More journals added 8 Mar 2011, below (sxb)
%
\newcommand{\jpa}{{\it J. Phys. A: Math. Theor.} }
\newcommand{\BF}{{\it Biofabrication\/} }
\newcommand{\BB}{{\it Bioinspir. Biomim.} }
\newcommand{\BMM}{{\it Biomed. Mater.} }
\newcommand{\CSD}{{\it Comput. Sci. Disc.} }
\newcommand{\ERL}{{\it Environ. Res. Lett.} }
\newcommand{\JBR}{{\it J. Breath Res.} }
\newcommand{\JGE}{{\it J. Geophys. Eng.} }
\newcommand{\JOPT}{{\it J. Opt.} }
\newcommand{\JRP}{{\it J. Radiol. Prot.} }
\newcommand{\MET}{{\it Metrologia\/} }
\newcommand{\NF}{{\it Nucl. Fusion\/} }
\newcommand{\PED}{{\it Phys. Educ.} }
%
% More journals added 6 Feb 2014, below (sxb)
%
\newcommand{\TDM}{{\it 2D Mater.} }
\newcommand{\MRE}{{\it Mater. Res. Express\/} }
\newcommand{\MAF}{{\it Methods Appl. Fluoresc.} }
\newcommand{\TMR}{{\it Transl. Mater. Res.} }
\newcommand{\STMP}{{\it Surf. Topogr.: Metrol. Prop.} }
%
% The following journals are externally-edited and the usual IOP Publishing
% submission guidelines do *not* apply if you're submitting to them.
%
\newcommand{\AJ}{{\it AJ\/} }
\newcommand{\APJ}{{\it ApJ\/} }
\newcommand{\APJL}{{\it ApJL\/} }
\newcommand{\APJS}{{\it ApJS\/} }
\newcommand{\ANSN}{{\it Adv. Nat. Sci: Nanosci. Nanotechnol.} }
\newcommand{\CJCP}{{\it Chin. J. Chem. Phys.} }
\newcommand{\CPB}{{\it Chinese Phys. B\/} }
\newcommand{\CPC}{{\it Chinese Phys. C\/} }
\newcommand{\CPL}{{\it Chinese Phys. Lett.} }
\newcommand{\CTP}{{\it Commun. Theor. Phys.} }
\newcommand{\EPL}{{\it EPL\/} }
\newcommand{\FDR}{{\it Fluid Dyn. Res.} }
\newcommand{\IZV}{{\it Izv. Math.} }
\newcommand{\JOS}{{\it J. Semicond.} }
\newcommand{\PHU}{{\it Phys.-Usp.} }
\newcommand{\PST}{{\it Plasma Sci. Technol.} }
\newcommand{\QEL}{{\it Quantum Electron.} }
\newcommand{\RAA}{{\it Res. Astron. Astrophys.} }
\newcommand{\RCR}{{\it Russ. Chem. Rev.} }
\newcommand{\RMS}{{\it Russ. Math. Surv.} }
\newcommand{\MSB}{{\it Sb. Math.} }
\newcommand{\SFC}{{\it Science Foundation in China\/} }
\newcommand{\STAM}{{\it Sci. Technol. Adv. Mater.} }
\newcommand{\LP}{{\it Laser Phys.} }
\newcommand{\LPL}{{\it Laser Phys. Lett.} }
\newcommand{\APEX}{{\it Appl. Phys. Express\/} }
%
% SISSA journals
%
\newcommand{\JCAP}{{\it JCAP\/} }
\newcommand{\JHEP}{{\it J. High Energy Phys.\/} }
\newcommand{\JSTAT}{{\it J. Stat. Mech.} }
\newcommand{\JINST}{{\it JINST\/} }
%
% These are the IOP Conference Series journals: again, if you're
% submitting to one of these journals you shouldn't be using iopart.cls
%
\newcommand{\JPCS}{{\it J. Phys.: Conf. Ser.} }
\newcommand{\EES}{{\it IOP Conf. Ser.: Earth Environ. Sci.} }
\newcommand{\MSE}{{\it IOP Conf. Ser.: Mater. Sci. Eng.} }

% 2012 new option for twocolumn output
\def\ioptwocol{\setlength\hoffset{-0.5in}\setlength\voffset{-0.5in}\setlength\textwidth{6.75in}
\setlength\columnsep{0.2in}\setlength\textheight{9.25in}\mathindent=0in\twocolumn}
%
%
\pagestyle{headings}
\pagenumbering{arabic}      % Arabic page numbers
\raggedbottom
\onecolumn
\endinput
%% 
%% End of file `iopart.cls'.

