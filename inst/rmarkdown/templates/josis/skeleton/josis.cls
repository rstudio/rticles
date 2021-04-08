%% josis.cls 1.4   2016-09-15    JoSIS style file
%------------------------------------------------------------------
% Filename: josis.cls
%
% This documentclass is intended for typesetting articles for the
%
%                        Journal of Spatial Information Science.
%
% See http://josis.org for further details.
%
% Search for ``%%% PART'' to find the main parts of this class file.
% 
% The class was developed by Matt Duckham (http://www.duckham.org) 
% in substantial part based on the toc (Theory of Computing) 
% document class. For more information see:
%  
%             http://theoryofcomputing.org
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Declare class and load external packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Need this version of LaTeX atleast (for ClassWarning commands)
\NeedsTeXFormat{LaTeX2e}[1994/06/01] 
\ProvidesClass{josis}[2009/08/12 v1.1 Journal of Spatial Information Science]

% Type area sizes
%\DeclareOption{demy}
%   {\setlength\textwidth  {115mm}%
%    \setlength\textheight {170mm}}
%\DeclareOption{royal}
%   {\setlength\textwidth  {115mm}%
%    \setlength\textheight {190mm}}
%\DeclareOption{quarto}
%   {\setlength\textwidth  {135mm}%
%    \setlength\textheight {202mm}}
%\DeclareOption{crown}
%   {\setlength\textwidth  {140mm}%
%    \setlength\textheight {220mm}}

% Load article class and handle options.
\ProcessOptions\relax
\LoadClass[10pt,twoside,letterpaper,onecolumn]{article}

% Load required packages
\RequirePackage{palatino}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{url}
%\RequirePackage[cross,letter,center]{crop}
\RequirePackage[letter,center]{crop}
%\RequirePackage{geometry}

\RequirePackage{authblk}
\renewcommand{\Affilfont}{\small}

% Load cclicenses package
% Note that this package is included in the josis/latex distribution
\RequirePackage{cclicenses}


\urlstyle{rm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% IF macro
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rather than load the whole ifthen package, we'll use the following macro.
%
% Check if the two arguments expand to the same thing
% MAGIC happens in the \edef which expands #1 and #2 completely first
% Mainly used to check equality of strings
\newcommand{\ifex}[2]{%
   \edef\josis@tmpa{#1}%
   \edef\josis@tmpb{#2}%
   \ifx\josis@tmpa\josis@tmpb
}

  \setlength{\itemsep}{1pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Define the layout of the page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set page and margin lengths

%% Lulu: Crown Quarto Color, Perfect Bound (18.91cm x 24.589cm)
\setlength{\paperwidth}{18.91cm} % set size for latex
\setlength{\paperheight}{24.589cm}
\special{papersize=18.91cm,24.589cm} % set size for ghostscript
%\setlength{\paperwidth}{7.5in} % set size for latex
%\setlength{\paperheight}{10in}
%\special{papersize=7.5in,10in} % set size for ghostscript
%``\typearea[6mm]{1}%% 6 mm for spine

%\setlength{\voffset}{45pt}
%\setlength{\hoffset}{-40pt}
\setlength\textwidth  {140mm}%
\setlength\textheight {200mm}
%\setlength{\headheight}{24pt}
%\setlength{\headsep}{24pt}
%\setlength{\footskip}{30pt}
%\setlength{\textheight}{578.5pt}
%\setlength{\marginparwidth}{62.27pt}

% Compute side margins to center text horizontally in page.
\newlength{\josis@hpadding}
\setlength{\josis@hpadding}{\paperwidth}
\addtolength{\josis@hpadding}{-2in}
\addtolength{\josis@hpadding}{-\textwidth}
\setlength{\evensidemargin}{.5\josis@hpadding}
\setlength{\oddsidemargin}{.5\josis@hpadding}
\addtolength{\evensidemargin}{-0.1in}
\addtolength{\oddsidemargin}{0.1in}

% Compute top margin to center virtual header/footer textbox.
\newlength{\josis@documentheight}
\newlength{\josis@vpadding}
\setlength{\josis@documentheight}{\textheight}
\addtolength{\josis@documentheight}{\footskip}
\addtolength{\josis@documentheight}{\headsep}
\addtolength{\josis@documentheight}{\headheight}
\setlength{\josis@vpadding}{\paperheight}
\addtolength{\josis@vpadding}{-\josis@documentheight}
\addtolength{\josis@vpadding}{-2in}
\setlength{\topmargin}{.5\josis@vpadding}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Values of parameters specific to the journal 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\josis@journalname{Journal of Spatial Information Science}
\newcommand\josis@journaladdress{www.josis.org}
\newcommand{\josis@cclicenseurl}{http://creativecommons.org/licenses/by/3.0/}

% Initialize properties to default value
\newcommand{\josis@year}{\@empty}
\newcommand{\josis@volume}{\@empty}
\newcommand{\josis@number}{\@empty}
\newcommand{\josis@received}{\@empty}
\newcommand{\josis@accepted}{\@empty}
\newcommand{\josis@returned}{\@empty}
\newcommand{\josis@revised}{\@empty}
\newcommand{\josis@declaredfirstpage}{\@empty}
\newcommand{\josis@declaredlastpage}{\@empty}
\newcommand{\josis@doi}{\@empty}
\newcommand{\josis@url}{\@empty}

%%% The rest of this part establises the hookds for the \josisdetails command.
\define@key{josisdet}{year}{\renewcommand{\josis@year}{#1}}
\define@key{josisdet}{volume}{\renewcommand{\josis@volume}{#1}}
\define@key{josisdet}{number}{\renewcommand{\josis@number}{#1}}
\define@key{josisdet}{doi}{\renewcommand{\josis@doi}{#1}}
\define@key{josisdet}{received}{\renewcommand{\josis@received}{#1}}
\define@key{josisdet}{accepted}{\renewcommand{\josis@accepted}{#1}}
\define@key{josisdet}{returned}{\renewcommand{\josis@returned}{#1}}
\define@key{josisdet}{revised}{\renewcommand{\josis@revised}{#1}}
\define@key{josisdet}{firstpage}{\renewcommand{\josis@declaredfirstpage}{#1}}
\define@key{josisdet}{lastpage}{\renewcommand{\josis@declaredlastpage}{#1}}
\define@key{josisdet}{doi}{\renewcommand{\josis@doi}{#1}}
\define@key{josisdet}{url}{\renewcommand{\josis@url}{#1}}

% argument is a comma seperated list of the type "volume=6,year=8,..."
% If we have details of section we are interested in, process it
\newcommand{\josisdetails}[1]{\setkeys{josisdet}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Default values for Article META Information 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\josis@copyrightauthor{by the author(s)}
\newcommand\josis@runningauthor{}
\newcommand\josis@runningtitle{}

% Define parameter passing functions for author metadata.
\newcommand*{\runningauthor}[1]{%
    \renewcommand\josis@runningauthor{#1}}
\newcommand*{\runningtitle}[1]{%
    \renewcommand\josis@runningtitle{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Keywords definition
\newcommand{\keywords}[1]{\gdef\@keywords{#1}}
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}

% Abstract environment redefined
\renewenvironment{abstract}{
      \vskip 1em\hrule\vskip 1em
      \@beginparpenalty\@lowpenalty
\noindent {\bfseries Abstract:}}%
     {\vskip 1em \noindent {\bfseries Keywords:} \@keywords \par\vskip 1em \hrule\par\vskip 1em\thispagestyle{titlepage}}

% Banner layout 
\newcommand{\josis@bannerjournalname}%
          {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{sc}{\josis@journalname}}

\newcommand{\josis@bannertexta}{\josis@bannerjournalname}

% Comment out for papers under review
\newcommand{\josis@bannerpubdata}
           {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{n}\selectfont
            {Number \josis@number\ (\josis@year), 
              pp. \josis@declaredfirstpage--\josis@declaredlastpage}}

% Comment out for papers with publication data
%\renewcommand{\josis@bannerpubdata}%
 %          {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{n}\selectfont%
%            {Number \josis@number\ (Article forthcoming)}}%


% \newcommand{\josis@bannerpubdata}{Article submitted for review}

\newcommand\josis@bannertextb%
           {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{it}
            \selectfont{\josis@bannerpubdata}}

\newcommand\josis@bannertextc%
           {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{rm}
            \selectfont{doi:\josis@doi}}

\newlength{\josis@bannerwidth}
\setlength{\josis@bannerwidth}{\textwidth}
\newcommand{\josis@banner}{%
  \begin{minipage}{\josis@bannerwidth}%
    \josis@bannertexta\\ \josis@bannertextb \hfill \josis@bannertextc \\
  \end{minipage}}

% Define the date box. If \josis@received is
% undefined, this will simply print
% the current date, as does the article class.
\newcommand\josis@reviseddatelayout{\ifex\josis@revised\@empty{}\else{revised: \josis@revised; accepted: \josis@accepted}\fi}
\newcommand\josis@datelayout%
{\fontsize{8}{10}\usefont{OT1}{ptm}{m}{sl}\selectfont%
  \ifex{\josis@received}{\@empty}{\@date}%
  \else%
  {{Received: \josis@received; %
	returned: \josis@returned; %
   \josis@reviseddatelayout.}}%
  \fi}

\def\@maketitle{%
  \newpage 
  \begin{center}%
    \josis@banner%
  \end{center}%
  \null
  \articletype
  \vskip 2em%
  \begin{center}%
    \let \footnote \thanks
    {\Huge \@title \par}%
    \vskip 1.5em%
    {\Large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
       \@author %\\ \@affiliation
      \end{tabular}\par}%
    \vskip 0.5em%
    {\josis@datelayout}%
  \end{center}%
  \par}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% This defines the footer running citation. We must produce two versions of it, the one without links is used
%% to determines spacing; the other is actually used for layout.
\newcommand\josis@runningcitation%
{\textsc{\josis@journalname}}

\newcommand\josis@runningcitation@nolink%
{\textsc{\josis@journalname}}

% Header layout wrapper.
\newcommand\josis@headerlayout[1]
   {\fontsize{8}{10}\usefont{OT1}{ptm}{m}{sc}\selectfont{#1}}
\newcommand\josis@footerlayout[1]
   {\fontsize{8}{10}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}

% Copyright
\newcommand{\josis@crlayout}[1]{\fontsize{6}{7}\usefont{OT1}{ptm}{m}{n}\selectfont{#1}}
\newcommand{\josis@ccicon@text}[1]{\josis@crlayout{$\bigcirc$\hspace{-6.6pt}\raisebox{.5pt}{\tiny{cc}}\hspace{1.5pt}}}
\newcommand{\josis@cclogo@eps}[1]{\raisebox{-.5#1}{\includegraphics[height=#1]{josis_large}}}
\newcommand{\josis@ccicon@eps}[1]{\raisebox{-.5#1}{\includegraphics[height=#1]{josis_small}}}

% Set up title page style.
\newcommand{\ps@titlepage}{%
  \renewcommand{\@oddhead}{\hfil\josis@cclogo@eps{40pt}}%
  \renewcommand{\@evenhead}{\@empty}%
  \renewcommand{\@oddfoot}{\small\copyright\ \josis@copyrightauthor\hfil Licensed under Creative Commons Attribution 3.0 License \cc }%
  \renewcommand{\@evenfoot}{\small\copyright\ \josis@copyrightauthor\hfil Licensed under Creative Commons Attribution 3.0 License \cc }%
}

% Set up the 2ff. page style.
\renewcommand{\ps@headings}{%
\renewcommand{\@oddhead}
             {\hfil\josis@headerlayout{\josis@runningtitle}\hfil\fontsize{9}{11}\usefont{OT1}{ptm}{m}{rm}\selectfont\thepage}%    
\renewcommand{\@evenhead}
             {\fontsize{9}{11}\usefont{OT1}{ptm}{m}{rm}\selectfont\thepage\hfil\josis@headerlayout{\josis@runningauthor}\hfil}%
\renewcommand{\@oddfoot}
             {\hfil\josis@footerlayout{JOSIS, \josis@runningcitation}}%
\renewcommand{\@evenfoot}
             {\josis@ccicon@eps{11pt}\ \ \ \href{http://www.josis.org}{www.josis.org}\hfil}%
}

%% Determine actual footer height.
\newlength\josis@footerheight
\settoheight\josis@footerheight{\josis@footerlayout{\josis@runningcitation@nolink}}

% Define the default page style to be headings.
\pagestyle{headings}
\pagenumbering{arabic}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Predefined Abbreviations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ie}{i.\,e.}
\newcommand{\eg}{e.\,g.}
\newcommand{\Eg}{E.\,g.}
\newcommand{\phd}{Ph.\,D.}
\newcommand{\msc}{M.\,S.}
\newcommand{\bsc}{B.\,S.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Article types
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\articletype}{\textsc{Research Article}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Header and footer initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\renewcommand\josis@runningcitation%
%{\ifex\josis@number\@empty
%  {Article submitted for review}
% \else
%  {Number \josis@number\ (\josis@year),
%    pp. \josis@declaredfirstpage--\josis@declaredlastpage}
% \fi
%}

\renewcommand\josis@runningcitation%
{\ifex\josis@number\@empty
  	{Article submitted for review}
 \else
  {\ifex\josis@year\@empty 
  	{Number \josis@number\ (Article forthcoming)} 
  	\else {Number \josis@number\ (\josis@year),  pp. \josis@declaredfirstpage--\josis@declaredlastpage} \fi }
 \fi
}

% Numbering within articles for long form articles.
%{\numberwithin{equation}{chapter}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% PART: Macros for compact list environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ----------------------------------------------------
%% Copyright (c) 1993 Hydro-Quebec [EMAIL PROTECTED]
%% ----------------------------------------------------

%% Bring items closer together in list environments 
% Prevent infinite loops
\let\orig@Itemize =\itemize         
\let\orig@Enumerate =\enumerate
\let\orig@Description =\description
% Zero the vertical spacing parameters
\def\Nospacing{\itemsep=0pt\topsep=0pt\partopsep=0pt%
\parskip=0pt\parsep=0pt}

% Small text in tables
\renewenvironment{table}{\@float{table}[htb]\small}{\end@float}


\def\noitemsep{
% Redefine the environments in terms of the original values
\renewenvironment{itemize}{\orig@Itemize\Nospacing}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate\Nospacing}{\endlist}
\renewenvironment{description}{\orig@Description\Nospacing}%
{\endlist}
}

\def\doitemsep{
% Redefine the environments to the original values
\renewenvironment{itemize}{\orig@Itemize}{\endlist}
\renewenvironment{enumerate}{\orig@Enumerate}{\endlist}
\renewenvironment{description}{\orig@Description}{\endlist}
}

%%%% fin macro %%%%
\noitemsep  

