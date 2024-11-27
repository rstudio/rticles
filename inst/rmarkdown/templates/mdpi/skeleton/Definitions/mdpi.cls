%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%	MDPI class for LaTeX files	 12 September 2024
%% %%	For any information please send an e-mail to:
%% %%		latex@mdpi.com
%% %%
%% %%	Initial class provided by:
%% %%		Stefano Mariani 
%% %%   Modified by:
%% %%		Dietrich Rordorf 
%% %%		Peter Harremoes 
%% %%		Zeno Schumacher 
%% %%		Maddalena Giulini 
%% %%		Andres Gartmann 
%% %%		Dr. Janine Daum 
%% %%   Versions:
%% %%		v1.0 before Dr. Janine Daum
%% %%		v2.0 when Dr. Janine Daum started (March 2013)
%% %%		v3.0 layout change September 2015
%%%%		v4.0 layout change December 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Definitions/mdpi}[12/09/2024 MDPI paper class]

 %% PRELIMINARY DECLARATIONS
\LoadClass[10pt,a4paper]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{calc}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx,epstopdf}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{amssymb} % For math environment bold format
\RequirePackage[right]{lineno}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{mathpazo}
\RequirePackage{booktabs} % For \toprule etc. in tables
\RequirePackage{titlesec}
\RequirePackage{etoolbox} % For \AtBeginDocument etc.
\RequirePackage{tabto} % To use tab for alignment on first page
\RequirePackage{xcolor, colortbl} % To provide color for soul (for english editing), for adding cell color of table
\RequirePackage{soul} % To highlight text
\newcommand{\highlighting}[1]{\colorbox{yellow}{#1}}
\RequirePackage{multirow}
\RequirePackage{microtype} % For command \textls[]{}
\RequirePackage{tikz} % For \foreach used for Orcid icon
\RequirePackage{refcount} % To enable extracting the value of the counter "LastPage" 
\RequirePackage{changepage} % To adjust the width of the column for the title part and figures/tables (adjustwidth environment)
\RequirePackage{attrib} % For XML2PDF use \tag{} for equation
\RequirePackage{upgreek} % For making greek letters not italic
\RequirePackage{array} % For table array
\RequirePackage{tabularx}
\RequirePackage{pbox} % For biography environment
\RequirePackage{ragged2e} % For command \justifying
\RequirePackage[]{tocloft} % For dots in TOC. If subfigure package is loaded, the subfigure option needs to be added here to avoid clash: \RequirePackage[subfigure]{tocloft}
\RequirePackage{marginnote} % For left column
\reversemarginpar % To have the left column on the left side
\RequirePackage{marginfix} % For command \clearmargin for manually moving the left column to the next page
\RequirePackage{enotez} % For endnotes
\RequirePackage{xstring} % For citation in left column

%% OPTIONS
% For transition period to change back to continuous page numbers
\def\@continuouspages{}
\newcommand{\continuouspages}[1]{\gdef\@continuouspages{#1}}

%% To choose the journal
% All journals (website name, full name, short name, DOI abbreviation, and ISSN + choice of continuous page numbers) are defined in an extra file. 
\input{Definitions/journalnames}
\DeclareOption{journal}{\ClassWarning{mdpi}{You used an invalid journal name or you have not specified the journal. The first option of the documentclass command specifies the journal. The word 'journal' should be replaced by one of the journal names specified in template.tex (in the comment 'Choose between the following MDPI journal').}} 

%% To choose the type of manuscript
\DeclareOption{abstract}{\gdef\@arttype{Abstract}}
\DeclareOption{addendum}{\gdef\@arttype{Addendum}}
\DeclareOption{article}{\gdef\@arttype{Article}}
\DeclareOption{benchmark}{\gdef\@arttype{Benchmark}}
\DeclareOption{book}{\gdef\@arttype{Book}}
\DeclareOption{bookreview}{\gdef\@arttype{Book Review}}
\DeclareOption{briefcommunication}{\gdef\@arttype{Brief Communication}}
\DeclareOption{briefreport}{\gdef\@arttype{Brief Report}}
\DeclareOption{casereport}{\gdef\@arttype{Case Report}}
\DeclareOption{changes}{\gdef\@arttype{Changes}}
\DeclareOption{clinicopathologicalchallenge}{\gdef\@arttype{Clinicopathological Challenge}}
\DeclareOption{comment}{\gdef\@arttype{Comment}}
\DeclareOption{commentary}{\gdef\@arttype{Commentary}}
\DeclareOption{communication}{\gdef\@arttype{Communication}}
\DeclareOption{conceptpaper}{\gdef\@arttype{Concept Paper}}
\DeclareOption{conferenceproceedings}{\gdef\@arttype{Proceedings}}
\DeclareOption{correction}{\gdef\@arttype{Correction}}
\DeclareOption{conferencereport}{\gdef\@arttype{Conference Report}}
\DeclareOption{creative}{\gdef\@arttype{Creative}}
\DeclareOption{datadescriptor}{\gdef\@arttype{Data Descriptor}}
\DeclareOption{discussion}{\gdef\@arttype{Discussion}}
\DeclareOption{entry}{\gdef\@arttype{Entry}}
\DeclareOption{expressionofconcern}{\gdef\@arttype{Expression of Concern}}
\DeclareOption{extendedabstract}{\gdef\@arttype{Extended Abstract}}
\DeclareOption{editorial}{\gdef\@arttype{Editorial}}
\DeclareOption{essay}{\gdef\@arttype{Essay}}
\DeclareOption{erratum}{\gdef\@arttype{Erratum}}
\DeclareOption{fieldguide}{\gdef\@arttype{Field Guide}}
\DeclareOption{hypothesis}{\gdef\@arttype{Hypothesis}}
\DeclareOption{interestingimages}{\gdef\@arttype{Interesting Images}}
\DeclareOption{letter}{\gdef\@arttype{Letter}}
\DeclareOption{meetingreport}{\gdef\@arttype{Meeting Report}}
\DeclareOption{monograph}{\gdef\@arttype{Monograph}}
\DeclareOption{newbookreceived}{\gdef\@arttype{New Book Received}}
\DeclareOption{obituary}{\gdef\@arttype{Obituary}}
\DeclareOption{opinion}{\gdef\@arttype{Opinion}}
\DeclareOption{proceedingpaper}{\gdef\@arttype{Proceeding Paper}}
\DeclareOption{projectreport}{\gdef\@arttype{Project Report}}
\DeclareOption{reply}{\gdef\@arttype{Reply}}
\DeclareOption{retraction}{\gdef\@arttype{Retraction}}
\DeclareOption{review}{\gdef\@arttype{Review}}
\DeclareOption{perspective}{\gdef\@arttype{Perspective}}
\DeclareOption{protocol}{\gdef\@arttype{Protocol}}
\DeclareOption{shortnote}{\gdef\@arttype{Short Note}}
\DeclareOption{studyprotocol}{\gdef\@arttype{Study Protocol}}
\DeclareOption{supfile}{\gdef\@arttype{Supfile}}
\DeclareOption{systematicreview}{\gdef\@arttype{Systematic Review}}
\DeclareOption{technicalnote}{\gdef\@arttype{Technical Note}}
\DeclareOption{viewpoint}{\gdef\@arttype{Viewpoint}}
\DeclareOption{guidelines}{\gdef\@arttype{Guidelines}}
\DeclareOption{registeredreport}{\gdef\@arttype{Registered Report}}
\DeclareOption{tutorial}{\gdef\@arttype{Tutorial}}
% Urology article types
\DeclareOption{giantsinurology}{\gdef\@arttype{Giants in Urology}}
\DeclareOption{urologyaroundtheworld}{\gdef\@arttype{Urology around the World}}

%% To choose the status of the manuscript
\DeclareOption{submit}{\gdef\@status{submit}}
\DeclareOption{accept}{\gdef\@status{accept}}

%% To choose the whether there is one or more authors
\DeclareOption{oneauthor}{\gdef\@authornum{author}}
\DeclareOption{moreauthors}{\gdef\@authornum{authors}}

%% Add the chosen options to the class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Defaults
\ExecuteOptions{notspecified,10pt,a4paper,article,submit,oneauthor}

%% Process options
\ProcessOptions\relax

%% MORE DECLARATIONS

%%%% Maths environments
\RequirePackage{amsthm}
\newtheoremstyle{mdpi}% name
{12pt}% space above
{12pt}% space below
{\itshape}% body font
{}% indent amount 1
{\bfseries}% theorem head font
{.}% punctuation after theorem head
{.5em}% space after theorem head
{}% theorem head spec (can be left empty, meaning `normal')

\renewcommand{\qed}{\unskip\nobreak\quad\qedsymbol} %% This places the symbol right after the text instead of placing it at the end on the line.

\renewenvironment{proof}[1][\proofname]{\par %% \proofname allows to have "Proof of my theorem"
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries %% "Proof" is bold
    #1\@addpunct{.}]\ignorespaces %% Period instead of colon
}{%
  \popQED\endtrivlist\@endpefalse
}

 \theoremstyle{mdpi}
 \newcounter{theorem}
 \setcounter{theorem}{0}
 \newtheorem{Theorem}[theorem]{Theorem}
 
 \newcounter{lemma}
 \setcounter{lemma}{0}
 \newtheorem{Lemma}[lemma]{Lemma}
 
 \newcounter{corollary}
 \setcounter{corollary}{0}
 \newtheorem{Corollary}[corollary]{Corollary}
 
 \newcounter{proposition}
 \setcounter{proposition}{0}
 \newtheorem{Proposition}[proposition]{Proposition}
 
 \newcounter{characterization}
 \setcounter{characterization}{0}
 \newtheorem{Characterization}[characterization]{Characterization}
 
 \newcounter{property}
 \setcounter{property}{0}
 \newtheorem{Property}[property]{Property}
 
 \newcounter{problem}
 \setcounter{problem}{0}
 \newtheorem{Problem}[problem]{Problem}
 
 \newcounter{example}
 \setcounter{example}{0}
 \newtheorem{Example}[example]{Example}
 
 \newcounter{examplesanddefinitions}
 \setcounter{examplesanddefinitions}{0}
 \newtheorem{ExamplesandDefinitions}[examplesanddefinitions]{Examples and Definitions}
 
 \newcounter{remark}
 \setcounter{remark}{0}
 \newtheorem{Remark}[remark]{Remark}
 
 \newcounter{definition}
 \setcounter{definition}{0}
 \newtheorem{Definition}[definition]{Definition}
 
 \newcounter{hypothesis}
 \setcounter{hypothesis}{0}
 \newtheorem{Hypothesis}[hypothesis]{Hypothesis}

 \newcounter{notation}
 \setcounter{notation}{0}
 \newtheorem{Notation}[notation]{Notation}
 
 \newcounter{assumption}
 \setcounter{assumption}{0}
 \newtheorem{Assumption}[assumption]{Assumption}
 
 \newcounter{algorithm}
 \setcounter{algorithm}{0}
 \newtheorem{Algorithm}[algorithm]{Algorithm}
 
 % Define left/right mark in math environment
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}
 

%%%% References
\RequirePackage[sort&compress,sectionbib]{natbib} % Option sectionbib is for optionally organizing references using sections (author request)


%%%% Chicago style journals
\newcommand{\chicagostylejournals}{
	\ifthenelse{\equal{\@journal}{admsci}
		\OR \equal{\@journal}{arts}
		\OR \equal{\@journal}{econometrics}
		\OR \equal{\@journal}{economies}
		\OR \equal{\@journal}{genealogy}
		\OR \equal{\@journal}{histories}
		\OR \equal{\@journal}{humanities}
		\OR \equal{\@journal}{ijfs}
		\OR \equal{\@journal}{jintelligence}
		\OR \equal{\@journal}{journalmedia}
		\OR \equal{\@journal}{jrfm}
		\OR \equal{\@journal}{languages}
		\OR \equal{\@journal}{laws}
		\OR \equal{\@journal}{literature}
		\OR \equal{\@journal}{religions}
		\OR \equal{\@journal}{risks}
		\OR \equal{\@journal}{socsci}
		}
}

\chicagostylejournals{%
	\bibliographystyle{Definitions/chicago2}
	\bibpunct{(}{)}{;}{x}{}{,}%
	}{%
	\bibliographystyle{Definitions/mdpi}
	\bibpunct{[}{]}{,}{n}{}{,}%
	}%

\renewcommand\NAT@set@cites{%
  \ifNAT@numbers
    \ifNAT@super \let\@cite\NAT@citesuper
       \def\NAT@mbox##1{\unskip\nobreak\textsuperscript{##1}}%
       \let\citeyearpar=\citeyear
       \let\NAT@space\relax
       \def\NAT@super@kern{\kern\p@}%
    \else
       \let\NAT@mbox=\mbox
       \let\@cite\NAT@citenum
       \let\NAT@space\relax
       \let\NAT@super@kern\relax
    \fi
    \let\@citex\NAT@citexnum
    \let\@biblabel\NAT@biblabelnum
    \let\@bibsetup\NAT@bibsetnum
    \renewcommand\NAT@idxtxt{\NAT@name\NAT@spacechar\NAT@open\NAT@num\NAT@close}%
    \def\natexlab##1{}%
    \def\NAT@penalty{\penalty\@m}%
  \else
    \let\@cite\NAT@cite
    \let\@citex\NAT@citex
    \let\@biblabel\NAT@biblabel
    \let\@bibsetup\NAT@bibsetup
    \let\NAT@space\NAT@spacechar
    \let\NAT@penalty\@empty
    \renewcommand\NAT@idxtxt{\NAT@name\NAT@spacechar\NAT@open\NAT@date\NAT@close}%
    \def\natexlab##1{##1}%
  \fi}


%%%%% Hyperlinks
%% Define color for citations
\definecolor{bluecite}{HTML}{0875b7}

% After TeXLive 2021, \AddToHook{begindocument} is needed to make sure that hyperref is loaded last. \ifdef{\AddToHook{begindocument}}{ is needed for backwards-compatibility because \AddToHook{begindocument} did not yet exist in 2020.
% After TeXLive 2022, \AddToHook{begindocument/before}{} is needed and  \DeclareHookRule{begindocument}{hyperref}{before}{mdpi} needs to be added because of the new version of hyperref.
\newcommand{\hyperrefpackage}{
\ifthenelse{\equal{\@arttype}{Book} 
	\OR \equal{\@arttype}{Monograph}}{
	\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=black, 
	citecolor=black, 
	urlcolor=black, 
	hyperfootnotes=false, 
	pdfstartview={FitH},
	pdfpagemode=UseNone,
	pdfpagelabels]{hyperref}
	}{
	\ifthenelse{\equal{\@journal}{laws}}{
	\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=bluecite, 
	citecolor=bluecite, 
	urlcolor=bluecite, 
	hyperfootnotes=false, 
	pdfstartview={FitH},
	pdfpagemode= UseNone]{hyperref}
	}{
	\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=bluecite, 
	citecolor=bluecite, 
	urlcolor=bluecite, 
	hyperfootnotes=true, 
	pdfstartview={FitH},
	pdfpagemode= UseNone]{hyperref}
	} 
}
\RequirePackage[capitalise,noabbrev]{cleveref}
}
\ifdef{\AddToHook}{
\DeclareHookRule{begindocument}{hyperref}{before}{mdpi}
	\AddToHook{begindocument/before}{ 
		\hyperrefpackage
		}
	}{
	\hyperrefpackage
}
%% To have the possibility to change the urlcolor
\newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}} 

%% Cleveref definitions
\newcommand{\cleverefDefinitions}{
	\crefname{figure}{Figure}{Figures}
	\crefname{table}{Table}{Tables}
	\crefname{section}{Section}{Sections}
	\crefname{appendix}{Appendix}{Appendices}
	\crefname{scheme}{Scheme}{Schemes}
	\crefname{chart}{Chart}{Charts}
	\crefname{paragraph}{Section}{Sections}
	\crefrangelabelformat{figure}{##3##1##4--##5##2##6} % double # for nesting inside \newcommand
	\crefrangelabelformat{table}{##3##1##4--##5##2##6}
	\crefrangelabelformat{section}{##3##1##4--##5##2##6}	
	\crefrangelabelformat{appendix}{##3##1##4--##5##2##6}
	\crefrangelabelformat{scheme}{##3##1##4--##5##2##6}
	\crefrangelabelformat{chart}{##3##1##4--##5##2##6}
}

\newcommand{\crefrangeconjunction}{--}
\newcommand{\fig}[1]{Figure~\ref{#1}}
\newcommand{\tabref}[1]{Table~\ref{#1}}
\newcommand{\sect}[1]{Section~\ref{#1}}
\newcommand{\app}[1]{Appendix~\ref{#1}}
\newcommand{\sche}[1]{Scheme~\ref{#1}}
\newcommand{\cchart}[1]{Chart~\ref{#1}}
\newcommand{\equ}[1]{\ref{#1}}
\newcommand{\boxref}[1]{Box~\ref{#1}}%


%%%% Metadata
\newcommand{\org@maketitle}{}% LATEX-Check
\let\org@maketitle\maketitle
\def\maketitle{%
	\hypersetup{
		pdftitle={\@Title},
		pdfsubject={\@abstract},
		pdfkeywords={\@keyword},
		pdfauthor={\@AuthorNames}
	}%
	\org@maketitle
}


%%%%% Endnotes
\setenotez{backref=true}
\DeclareInstance{enotez-list}{custom}{paragraph}{
	format=\fontsize{9}{11}\selectfont\leftskip0.76cm,
	number=\textsuperscript{#1} \hspace{4.7mm},
	notes-sep=0pt
}


%%%% Footnotes, for journal Laws
\RequirePackage{scrextend}
\setlength{\skip\footins}{0.6cm} % Increase space between text and footnote
\setlength{\footnotesep}{8pt} % Increase space between line and footnote
\deffootnote{1.5em}{0em}{\textsuperscript{\thefootnotemark}\quad} % Remove indent


%%%% URL
\RequirePackage{url}
\urlstyle{same}
% Line breaks in URL
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlDigits}


%%%% Widows & orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000


%%%% To avoid "Output-loop.." compile bug
\maxdeadcycles=10000


%%%% Front matter
% Command for checking for a question mark or exclamation mark in title
\def\instring#1#2{TT\fi\begingroup\edef\x{\endgroup\noexpand\in@{#1}{#2}}\x\ifin@}

\newcommand{\firstargument}{}
\newcommand{\Title}[1]{\gdef\@Title{#1}}%
\def\@TitleCitation{}
\newcommand{\TitleCitation}[1]{\gdef\@TitleCitation{#1}}%
\def\@Author{}
\newcommand{\Author}[1]{\gdef\@Author{#1}}%
\def\@AuthorNames{}
\newcommand{\AuthorNames}[1]{\gdef\@AuthorNames{#1}}%
\def\@AuthorCitation{}
\newcommand{\AuthorCitation}[1]{\gdef\@AuthorCitation{#1}}%
\newcommand{\firstpage}[1]{\gdef\@firstpage{#1}}
\newcommand{\doinum}[1]{\gdef\@doinum{#1}}
\newcommand{\hreflink}[1]{\gdef\@hreflink{#1}}
\newcommand{\papercitation}{%
	\chicagostylejournals{%
		\@AuthorCitation%
		\IfEndWith{\meaning\@AuthorCitation}{.}{ }{. }% Remove period if author name ends with "."
		{\@pubyear}. %
		\@TitleCitation% 
		\IfEndWith{\meaning\@TitleCitation}{?}{ }{% 
			\IfEndWith{\meaning\@TitleCitation}{!}{ }{%
				\IfEndWith{\meaning\@TitleCitation}{.}{ }{. }%
				}%
			}% Remove period if title ends with "?" or "!" or "..."
		\textit{\@journalfull} %
		\@pubvolume: %
		}{%
		\@AuthorCitation%
		\IfEndWith{\meaning\@AuthorCitation}{.}{ }{. }% Remove period if author name ends with "."
		\@TitleCitation% 
		\IfEndWith{\meaning\@TitleCitation}{?}{ }{% 
			\IfEndWith{\meaning\@TitleCitation}{!}{ }{%
				\IfEndWith{\meaning\@TitleCitation}{.}{ }{. }%
				}%
			}% Remove period if title ends with "?" or "!" or "..."
		\textit{\@journalshort} %
		\textbf{\@pubyear}, %
		\textit{\@pubvolume},%
		}
	\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
		\@articlenumber.
		}{%
		\@firstpage\ifnumcomp{\getpagerefnumber{LastPage}}{=}{\@firstpage}{}{--\pageref*{LastPage}}. %
		}
	\changeurlcolor{black}%
	\href{https://doi.org/\@doinum}%
	{\@hreflink}
}
% DOI number
% Create command to add a leading zero if 1 digit
\newcommand\twodigits[1]{%
	\ifnum#1<10 %
		0\number#1
   	\else
		\number#1
	\fi
}

% Create command to add a leading zero if less then 5 digits
\newcommand\fivedigits[1]{%
	\ifnum#1<10 %
		000\number#1
	\else
		\ifnum#1<100 %
			00\number#1
		\else
			\ifnum#1<1000 %
				0\number#1
			\else
				\ifnum#1<10000 %
					\number#1
				\else
					\ifnum#1<100000 %
						\number#1
					\else
						error
					\fi
				\fi
			\fi
		\fi
	\fi
}



\ifthenelse{\equal{\@journal}{molbank}
	\OR \equal{\@journal}{chemproc}
	\OR \equal{\@journal}{engproc}
	\OR \equal{\@journal}{environsciproc}
	\OR \equal{\@journal}{materproc}
	\OR \equal{\@journal}{blsf}
	\OR \equal{\@journal}{msf}
	\OR \equal{\@journal}{psf}
	\OR \equal{\@journal}{csmf}
	}{
	\doinum{10.3390/\@articlenumber}
	}{
	\doinum{10.3390/\@doiabbr\@pubvolume\twodigits\@issuenum\fivedigits\@articlenumber}
}

% For \@pubvolume, \@issuenum, and \@articlenumber: create command to cut leading zeros
\newcommand\cutdigits[1]{%
	\ifnum#1>0 %
		\number#1 
	\else
		\ifnum#1<10000 %
			\number#1
		\else             
			error
		\fi
	\fi
}

\newcommand{\pubvolume}[1]{\gdef\@pubvolume{\cutdigits{#1}}}
\newcommand{\pubyear}[1]{\gdef\@pubyear{#1}}
\newcommand{\copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\newcommand{\address}[2][]{\renewcommand{\firstargument}{#1}\gdef\@address{#2}}
\newcommand{\corresfirstargument}{}
\def\@corres{}
\newcommand{\corres}[2][]{\renewcommand{\corresfirstargument}{#1}\gdef\@corres{#2}} 
\def\@conference{}
\newcommand{\conference}[1]{\gdef\@conference{#1}}%
\def\@abstract{}
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\def\@externaleditor{}
\newcommand{\externaleditor}[1]{\gdef\@externaleditor{#1}}
\def\@LSID{}
\newcommand{\LSID}[1]{\gdef\@LSID{#1}}
\def\@datereceived{}
\newcommand{\datereceived}[1]{\gdef\@datereceived{#1}} 
\def\@daterevised{}
\newcommand{\daterevised}[1]{\gdef\@daterevised{#1}} 
\def\@dateaccepted{}
\newcommand{\dateaccepted}[1]{\gdef\@dateaccepted{#1}} 
\newcommand{\datepublished}[1]{\gdef\@datepublished{#1}} 
\def\@datecorrected{}
\newcommand{\datecorrected}[1]{\gdef\@datecorrected{#1}}
\def\@dateretracted{}
\newcommand{\dateretracted}[1]{\gdef\@dateretracted{#1}}
\def\@pacs{}
\newcommand{\PACS}[1]{\gdef\@pacs{#1}} 
\def\@msc{}
\newcommand{\MSC}[1]{\gdef\@msc{#1}} 
\def\@jel{}
\newcommand{\JEL}[1]{\gdef\@jel{#1}}
\def\@keyword{}
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}
\def\@dataset{}
\newcommand{\dataset}[1]{\gdef\@dataset{#1}}
\def\@datasetlicense{}
\newcommand{\datasetlicense}[1]{\gdef\@datasetlicense{#1}}
\def\@featuredapplication{}
\newcommand{\featuredapplication}[1]{\gdef\@featuredapplication{#1}}
\def\@keycontribution{}
\newcommand{\keycontribution}[1]{\gdef\@keycontribution{#1}}
\def\@issuenum{}
\newcommand{\issuenum}[1]{\gdef\@issuenum{\cutdigits{#1}}}
\def\@firstnote{}
\newcommand{\firstnote}[1]{\gdef\@firstnote{#1}}
\def\@secondnote{}
\newcommand{\secondnote}[1]{\gdef\@secondnote{#1}}%
\def\@thirdnote{}
\newcommand{\thirdnote}[1]{\gdef\@thirdnote{#1}}%
\def\@fourthnote{}
\newcommand{\fourthnote}[1]{\gdef\@fourthnote{#1}}%
\def\@fifthnote{}
\newcommand{\fifthnote}[1]{\gdef\@fifthnote{#1}}%
\def\@sixthnote{}
\newcommand{\sixthnote}[1]{\gdef\@sixthnote{#1}}%
\def\@seventhnote{}
\newcommand{\seventhnote}[1]{\gdef\@seventhnote{#1}}%
\def\@eighthnote{}
\newcommand{\eighthnote}[1]{\gdef\@eighthnote{#1}}%
\def\@simplesumm{}
\newcommand{\simplesumm}[1]{\gdef\@simplesumm{#1}}
\newcommand{\articlenumber}[1]{
	\ifthenelse{\equal{\@journal}{molbank}}{
		\gdef\@articlenumber{#1}%
		}{
		\gdef\@articlenumber{\cutdigits{#1}}%
		}
	}

\def\@externalbibliography{}
\newcommand{\externalbibliography}[1]{\gdef\@externalbibliography{#1}}
\def\@reftitle{}
\newcommand{\reftitle}[1]{\gdef\@reftitle{#1}}
\def\@longauthorlist{}
\newcommand{\longauthorlist}[1]{\gdef\@longauthorlist{#1}}
\def\@encyclopediadef{}
\newcommand{\encyclopediadef}[1]{\gdef\@encyclopediadef{#1}}
\def\@addhighlights{}
\newcommand{\addhighlights}[1]{\gdef\@addhighlights{#1}}
\def\@CorrStatement{}
\newcommand{\CorrStatement}[1]{\gdef\@CorrStatement{#1}}
\newcommand{\textcorrstatement}{\textbf{Correction Statement:} This article has been republished with a minor change. The change does not affect the scientific content of the article and further details are available within the backmatter of the website version of this article.}

%% ORCID
% Make Orcid icon
\newcommand{\orcidicon}{\includegraphics[width=0.32cm]{Definitions/logo-orcid.pdf}}

% Define link and button for each author
\foreach \x in {A, ..., Z}{%
\expandafter\xdef\csname orcid\x\endcsname{\noexpand\href{https://orcid.org/\csname orcidauthor\x\endcsname}{\noexpand\orcidicon}}
}


%%%% Journal name for the header
\newcommand{\journalname}{\@journalshort}

%%%% Header and footer on first page
%% The plain page style needs to be redefined because with \maketitle in the article class, LaTeX applies the the plain page style automatically to the first page.
\ifthenelse{\equal{\@journal}{preprints} %
		\OR \equal{\@arttype}{Book}
		\OR \equal{\@arttype}{Monograph}}{%
	\fancypagestyle{plain}{%
		\fancyhf{}
        		\fancyfoot[C]{\footnotesize\thepage}	
		}
	}{%
	\ifthenelse{\equal{\@arttype}{Supfile}}{
		\fancypagestyle{plain}{
			\fancyhf{}
			\fancyhead[R]{
				\footnotesize %
				S\thepage{} of S\pageref*{LastPage}%
				\\\rule{\fulllength}{0.4pt}%
				}%
			\fancyhead[L]{
				\footnotesize %
				\ifthenelse{\equal{\@status}{submit}}{%
					Version {\@ \today} submitted to {\em \journalname}%
					}{%
					{\em \journalname} %
					{\bfseries \@pubyear}, %
					{\em \@pubvolume}, %
					\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
						\@articlenumber%
						}{%
						S\@firstpage\ifnumcomp{\getpagerefnumber{LastPage}}{=}{\@firstpage}{}{--S\pageref*{LastPage}}%
						}%
					. {\changeurlcolor{black}%
        					\url{https://doi.org/\@doinum}}%
					}%
					\\\vspace{-2pt}\rule{\fulllength}{0.4pt}%
				}%
			}%
		}{
		\fancypagestyle{plain}{
		\renewcommand{\footrulewidth}{0.4pt}
			\fancyhead{\null\vspace{8pt}}
			\fancyfoot[L]{
			\fontsize{8}{8}\selectfont
			\ifthenelse{\equal{\@status}{submit}}{%
				Version {\@ \today} submitted to {\em \journalname}%
				}{%
				{\em\journalname\ }{\bfseries\@pubyear}, {\em \@pubvolume}, %
				\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
					\@articlenumber. %
					}{%
					\@firstpage\ifnumcomp{\getpagerefnumber{LastPage}}{=}{\@firstpage}{}{--\pageref*{LastPage}}. %
					}%
					{\changeurlcolor{black}%
					\url{https://doi.org/\@doinum}
					}
				}%
			}
			\fancyfoot[R]{
			\fontsize{8}{8}\selectfont
			{\changeurlcolor{black}%
			\url{https://www.mdpi.com/journal/\@journal}}%
			}
			}
		}%
	}%	


%%%% Maketitle part 1: Logo, Arttype, Title, Author
\renewcommand{\@maketitle}{
	\ifthenelse{\equal{\@arttype}{Book}
		\OR \equal{\@arttype}{Monograph}}{}{
		\ifthenelse{\equal{\@leftcolumnsplit}{\@empty}}{% Default option for the left column
			\marginnote[\contentleftcolumn]{}[\MyLen] % Bottom aligned
			}{%
		}
		\begin{adjustwidth}{-\extralength}{}
	}
	\begin{flushleft}
	\ifthenelse{\equal{\@arttype}{Supfile}}{%
		\fontsize{18}{18}\selectfont
		\raggedright
		\hyphenpenalty=10000
		\tolerance=1000
		\noindent\textbf{Supplementary Materials: \@Title}%
		\par
		\vspace{12pt}
		\fontsize{10}{10}\selectfont
		\noindent\boldmath\bfseries{\@Author}
		}{%
		\ifthenelse{\equal{\@arttype}{Book}
			\OR \equal{\@arttype}{Monograph}}{}{%
			\vspace*{-1.75cm}
		}
		{%0
		\ifthenelse{\equal{\@journal}{preprints}
			\OR \equal{\@arttype}{Book}
			\OR \equal{\@arttype}{Monograph}}{}{%
				\ifthenelse{\equal{\@status}{submit}}{%	
					\hfill \href{https://www.mdpi.com}{%
					\includegraphics[height=1cm]{Definitions/logo-mdpi.eps}}%
					}{
					\href{https://www.mdpi.com/journal/\@journal}{
					\includegraphics[height=1.2cm]{Definitions/\@journal-logo.eps}}%
					\hfill
					\ifthenelse{\equal{\@journal}{siuj}}{%
						\href{https://www.mdpi.com}{\includegraphics[height=1cm]{Definitions/logo-mdpi-siuj.eps}}
						}{
						\ifthenelse{\equal{\@journal}{scipharm}}{%
							\href{https://www.mdpi.com}{\includegraphics[height=1cm]{Definitions/logo-mdpi-scipharm.eps}}%
							}{%
							\href{https://www.mdpi.com}{\includegraphics[height=1cm]{Definitions/logo-mdpi.eps}}%
							}%
						}%
					}%
					\par
					\vspace{-8 pt}
					\rule{\fulllength}{0.4pt}%
			}%
		\par
		}%0
		{%1
    		\vspace{14pt}
    		\fontsize{10}{10}\selectfont
		\ifthenelse{\equal{\@arttype}{Book}
			\OR \equal{\@arttype}{Monograph}}{}{
			\textit{\@arttype}%
			}%	
 	   	\par%
    		}%1
    		{%2
  	  	\fontsize{18}{18}\selectfont
		\hyphenpenalty=10000
		\tolerance=1000
   	 	\ifthenelse{\equal{\@arttype}{Monograph}}{}{
   	 	       \boldmath\bfseries{\@Title}%
		       }%
   	 	\par
   	 	\vspace{12pt}
   	 	}%2
		\ifthenelse{\equal{\@longauthorlist}{\@empty}}{%
			}{%
			\end{flushleft}%
			\end{adjustwidth}%
			\vspace{-2.5pt}
		}
   		{%3
		\hyphenpenalty=10000
		\tolerance=1000
    		\boldmath\bfseries{\@Author}
    		\par
		\vspace{12pt}
    		}%3
		}%
	\ifthenelse{\equal{\@longauthorlist}{\@empty}}{%
		\end{flushleft}%
		}{%
	}%
	\ifthenelse{\equal{\@arttype}{Book}
		\OR \equal{\@arttype}{Monograph}}{}{%
		\ifthenelse{\equal{\@longauthorlist}{\@empty}}{%
			\end{adjustwidth}%
			}{%
		}
	}
		\ifthenelse{\equal{\@leftcolumnsplit}{\@empty}}{% Left column split
			}{
			\marginnote[\contentleftcolumn]{}% Alignment with the affiliations
		}
	\ifthenelse{\equal{\@arttype}{Monograph}}{\vspace{-2cm}}{}	
	}

%%%% Commands for hanging indent
\newcommand{\dist}{1.7em}
\newcommand{\hang}{\hangafter=1\hangindent=\dist\noindent}


%%% Left column on first page (= "left column" = "leftcol")

% Split content into five parts
\newcommand{\leftcolFont}{%
	\linespread{1.71} 
	\fontsize{7}{7}\selectfont
	\justify
	\hyphenpenalty=10000
	\tolerance=1000
}

%% Part 1: Check-for-updates logo + citation
\newcommand{\leftcolUpdateCitation}{
	\leftcolFont
	\ifthenelse{\equal{\@status}{submit}}{
		}{%
		\href{https://www.mdpi.com/article/\@doinum?type=check_update&version=1}{\includegraphics[height=.6cm]{Definitions/logo-updates.eps}}\\
		}%
	\raggedright
	\textbf{Citation:}\papercitation
}

%% Part 2: External editor
\newcommand{\leftcolExternalEditor}{
	\ifthenelse{\equal{\@externaleditor}{\@empty}}{%
		}{%
		\leftcolFont
		\raggedright
		\@externaleditor
		\ifthenelse{\equal{\@status}{submit}}{%
			\vspace{-2pt}
			}{%
			\vspace{-1pt}
			}
	}
}	

% Part 3: Dates
\newcommand{\leftcolDates}{
\ifthenelse{\equal{\@journal}{preprints}}{%
	}{%
	\leftcolFont
	\ifthenelse{\equal{\@journal}{proceedings}
		\OR \equal{\@journal}{chemproc}
		\OR \equal{\@journal}{engproc}
		\OR \equal{\@journal}{environsciproc}
		\OR \equal{\@journal}{materproc}
		\OR \equal{\@journal}{blsf}
		\OR \equal{\@journal}{msf}
		\OR \equal{\@journal}{psf}
		\OR \equal{\@journal}{csmf}}{%
			Published: \@datepublished\\\vspace{-12pt}
			}{%
			Received: \@datereceived\\
			\ifthenelse{\equal{\@daterevised}{\@empty}}{%
				}{%
				Revised: \@daterevised\\%
				}
			Accepted: \@dateaccepted\\
			Published: \@datepublished
			\ifthenelse{\equal{\@datecorrected}{\@empty}}{%
				}{%
			\newline Corrected: \@datecorrected
			}
			\ifthenelse{\equal{\@dateretracted}{\@empty}}{%
				}{%
			\newline Retracted: \@dateretracted
			}
		}
	}
}

% Part 3a: Correction statement
\newcommand{\leftcolumnCorrstatement}{%
	\ifthenelse{\equal{\@CorrStatement}{yes}}{%
		\leftcolFont%
		\textcorrstatement%
		}{%
	}%
}

% Part 4: Copyright
\newcommand{\leftcolumnCright}{
	\leftcolFont
	\cright
}
	
% Content of the left column. The marginnote with this content will be placed it at the very top of the first page to have a fixed reference point
\newcommand{\contentleftcolumn}{ 
\ifthenelse{\equal{\@arttype}{Supfile}}{}{
	\leftcolUpdateCitation\vspace{-2pt} 	%1
	\leftcolExternalEditor 			%2
	\leftcolDates\vspace{-2pt} 			%3
	\ifthenelse{\equal{\@status}{submit}}{%
		\vspace{-8pt}
		}{}
	\leftcolumnCorrstatement 			%3a
	\vspace{6pt}\leftcolumnCright 		%4
}
}

% Placing on the left column
\newlength{\MyLen} % For length of the left column content
\newsavebox{\MyBox} % A box is needed to measure the length (= height) of the left column content

\newcommand{\calculateMyLen}{ % The calculation needs to be done after begin document, therefore this command is executed at \AtBeginDocument
	\savebox{\MyBox}{ % All this savebox and parbox is apparently needed to measure the length (= height) of the text
		\parbox[l]{\leftcolumnlength}{ %This is the width of the left column, defined above at "Dimensions" and "Layout"
			\contentleftcolumn
		}
	}
	\settototalheight{\MyLen}{\usebox{\MyBox}} % Use the length (= height) of the box to assign this value to \MyLen (this can be queried in .tex by \the\MyLen)
	\setlength{\MyLen}{\textheight-\MyLen-12pt} % Change \MyLen to be \textheight minus \MyLen so that the resulting value can be used to alig the left column to the bottom of \textheight. Then substract 12pt to make the bottom alignment
}

% Left column split options for long titles/author lists
% Make new command for deciding for the split option
\def\@leftcolumnsplit{}
\newcommand{\leftcolumnsplit}[1]{\gdef\@leftcolumnsplit{#1}}

% Split option 1	
\newcommand{\OptionOneA}{
	\leftcolUpdateCitation\vspace{-2pt} %1
	\leftcolExternalEditor %2
	\leftcolDates\vspace{-2pt} %3
}
		
\newcommand{\OptionOneB}{
	\leftcolumnCright %4
}

% Split option 2	
\newcommand{\OptionTwoA}{
	\leftcolUpdateCitation\vspace{-2pt} %1
	\leftcolExternalEditor\vspace{-10pt} %2
}

\newcommand{\OptionTwoB}{
	\leftcolDates\vspace{-2pt} %3
	\vspace{6pt}\leftcolumnCright %4
}

% Split option 3
\newcommand{\OptionThreeA}{
	\leftcolUpdateCitation %1
}

\newcommand{\OptionThreeB}{
	\leftcolExternalEditor %2
	\leftcolDates\vspace{-2pt} %3
	\vspace{6pt}\leftcolumnCright %4
}

%%%% Maketitle part 2
\newcommand{\maketitlen}{ 
	\ifthenelse{\equal{\@arttype}{Book}
	\OR \equal{\@arttype}{Monograph}}{\vspace{12pt}}{%
	\begin{flushleft}
	\begin{spacing}{1.35}
	\hyphenpenalty=10000
	\tolerance=1000
	\fontsize{8}{8}\selectfont
	{%
	\ifthenelse{\equal{\firstargument}{1}}{}{%
	\hang}\@address
	\par
	}%
	{%
	\ifthenelse{\equal{\@authornum}{author}}{}{%
	\ifthenelse{\equal{\@corres}{\@empty}}{}{%
	\hang\textbf{*} \tabto{\dist} \@corres}
	\par
	}
	}%
	{%
	\ifthenelse{\equal{\@conference}{\@empty}}{}{%
	\hang$^{\dagger}$ \tabto{\dist} This paper is an extended version of our paper published in\space \@conference.}
	\par
	}%
	{%
	\ifthenelse{\equal{\@firstnote}{\@empty}}{}{%
	\hang\ifthenelse{\equal{\@conference}{\@empty}}{$^\dagger$}{$^\ddagger$} \tabto{\dist} \@firstnote}	
	\par
	}%
	{%
	\ifthenelse{\equal{\@secondnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\ddagger}$}{$^{\S}$} \tabto{\dist} \@secondnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@thirdnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\S}$}{$^{\|}$} \tabto{\dist} \@thirdnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@fourthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\|}$}{$^\P$} \tabto{\dist} \@fourthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@fifthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\P}$}{**} \tabto{\dist} \@fifthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@sixthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{**}{$^{\dagger\dagger}$} \tabto{\dist} \@sixthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@seventhnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\dagger\dagger}$}{$^{\ddagger\ddagger}$} \tabto{\dist} \@seventhnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@eighthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$^{\ddagger\ddagger}$}{***} \tabto{\dist} \@eighthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@LSID}{\@empty}}{}{%
	\vskip12pt \@LSID}
	\par
	}%
	\end{spacing}
	\end{flushleft}
}
}

%%%% Abstract, keywords, journal data, PACS, MSC, JEL
\newcommand{\abstractkeywords}{
\fontsize{9}{12.4}\selectfont
\vspace{-8pt}
% For journal Applied Sciences:
\ifthenelse{\equal{\@featuredapplication}{\@empty}}{
	}{%
	\noindent\textbf{Featured Application:\space\@featuredapplication}
	\vspace{12pt}
	\par
}	
%
%10
\ifthenelse{\equal{\@simplesumm}{\@empty}}{}{
	\noindent\textbf{Simple Summary:\space}\@simplesumm
	\vspace{12pt}
	\par
}
\ifthenelse{\equal{\@addhighlights}{\@empty}}{}{
	\noindent\textbf{Highlights:\\\vspace{-12pt}}\addhighlights % redefined in .tex to use itemize
	\vspace{12pt}
	\par
}
\ifthenelse{\equal{\@abstract}{\@empty}}{}{
	\noindent\textbf{Abstract:\space}\@abstract
	\vspace{12pt}
	\par
}
\ifthenelse{\equal{\@encyclopediadef}{\@empty}}{}{
	\noindent\textbf{Definition:\space}\@encyclopediadef
	\vspace{12pt}
	\par
}
%10
% For journal Data:
\ifthenelse{\equal{\@dataset}{\@empty}}{}{
	\noindent\textbf{Dataset:\space}\@dataset
	\vspace{12pt}
	\par
}
%
%For journal Data:
\ifthenelse{\equal{\@datasetlicense}{\@empty}}{}{
	\noindent\textbf{Dataset License:\space}\@datasetlicense
	\vspace{12pt}
	\par
}
%
%11
\ifthenelse{\equal{\@keyword}{\@empty}}{}{
	\noindent\textbf{Keywords:\space}\@keyword
	\vspace{12pt}
	\par
}
%11
%For journal Toxins:
\ifthenelse{\equal{\@keycontribution}{\@empty}}{}{
	\noindent\textbf{Key Contribution:\space}\@keycontribution
	\vspace{12pt}
	\par
}
%11
%12
\ifthenelse{\equal{\@pacs}{\@empty}}{}{
	\noindent\textbf{PACS:\space}\@pacs
	\vspace{12pt}
	\par
}
%12
%13
\ifthenelse{\equal{\@msc}{\@empty}}{}{
	\noindent\textbf{MSC:\space}\@msc
	\vspace{12pt}
	\par
}
%13
%14
\ifthenelse{\equal{\@jel}{\@empty}}{}{
	\noindent\textbf{JEL Classification:\space}\@jel
	\vspace{12pt}
	\par
}
%14
\vspace{4pt}
\ifthenelse{\equal{\@arttype}{Book}
\OR \equal{\@arttype}{Monograph}}{}{\hrule}
\vspace{12pt}
\normalsize
}


%%%% Print maketitle and abstractkeywords
\ifthenelse{\equal{\@arttype}{Supfile}}{
	\AfterEndPreamble{
		\maketitle
		\let\maketitle\relax
		\ifthenelse{\equal{\@status}{submit}}{\linenumbers}{}
		}%
	}{
	\AfterEndPreamble{
		\maketitle
		\let\maketitle\relax
		\maketitlen
		\let\maketitlen\relax
		\ifthenelse{\equal{\@status}{submit}}{\linenumbers}{}
		\abstractkeywords
	}%
}
	
\AtBeginDocument{
	\calculateMyLen
	\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
	\DeclareSymbolFontAlphabet{\mathbb}{AMSb}
	\cleverefDefinitions
}


%%%% Font size in Tables and watermark in arttype retraction
\AtEndPreamble{
	\def\@tablesize{}
	\newcommand{\tablesize}[1]{\gdef\@tablesize{#1}}
	\let\oldtabularx\tabularx
	\renewcommand{\tabularx}{\ifthenelse{\equal{\@tablesize}{\@empty}}{\small}{\@tablesize}\oldtabularx}
	\printretraction
}


%%%% Table of contents
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % Dots between section title and page number
\renewcommand{\numberline}[1]{#1.~\space} % Increase space between number and title


%%%% Section headings
\setcounter{secnumdepth}{4} % Default: 3 in the article class. To get paragraphs numbered and counted, increase the default value of secnumdepth to 4

\ifthenelse{\equal{\@arttype}{Monograph}}{
	\titleformat {\section} [block] {\raggedright \fontsize{18}{18}\selectfont\bfseries} {\thesection.\space} {0pt} {}
	\titlespacing {\section} {0pt} {12pt} {8pt}
	}{
	\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {\thesection.\space} {0pt} {}
	\titlespacing {\section} {0pt} {12pt} {3pt}
}

\titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {\thesubsection.\space} {0pt} {}
\titlespacing {\subsection} {0pt} {12pt} {3pt}

\titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {\thesubsubsection.\space} {0pt} {}
\titlespacing {\subsubsection} {0pt} {12pt} {3pt}

\titleformat {\paragraph} [block] {\raggedright \fontsize{10}{10}\selectfont} {} {0pt} {}
\titlespacing {\paragraph} {0pt} {12pt} {3pt}


%%%% Special section title style for back matter
\newcommand{\supplementary}[1]{
\par\vspace{6pt}\noindent{\fontsize{9}{11.5}\selectfont\textbf{Supplementary Materials:} {#1}\par}}

\newcommand{\authorcontributions}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Author Contributions:} {#1}\par}}

\newcommand{\funding}[1]{
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Funding:} {#1}\par}}

\newcommand{\institutionalreview}[1]{
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Institutional Review Board Statement:} {#1}\par}}

\newcommand{\informedconsent}[1]{
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Informed Consent Statement:} {#1}\par}}

\newcommand{\dataavailability}[1]{
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Data Availability Statement:} {#1}\par}}

\newcommand{\publicinvolvement}[1]{% For journal Nursing Reports
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Public Involvement Statement:} {#1}\par}}

\newcommand{\guidelinesstandards}[1]{% For journal Nursing Reports
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Guidelines and Standards Statement:} {#1}\par}}

\newcommand{\acknowledgments}[1]{
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Acknowledgments:} {#1}\par}}

\newcommand{\conflictsofinterest}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Conflicts of Interest:} {#1}\par}}

\newcommand{\entrylink}[1]{% For journal Encyclopedia
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Entry Link:} {#1}\par}}

\newcommand{\useofartificialintelligence}[1]{% For journal Nursing Reports
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Use of Artificial Intelligence:} {#1}\par}}

\newcommand{\reviewreports}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{Review Reports:} {#1}\par}}

\newcommand{\abbreviations}[2]{\vspace{12pt}\noindent{\selectfont\textbf{#1}}{%
\par\vspace{3pt}\hspace{-0.85cm}{\fontsize{9}{11.2}\selectfont #2}\par}}

% Standby command for adding paragraph in back matter part
\newcommand{\specialsection}[2]{%
\vspace{12pt}\noindent{\selectfont\textbf{#1}\par\vspace{6pt}\noindent {\fontsize{9}{9}\selectfont #2}\par}}

% Command for author's biography
\newcommand{\bio}[2]{%
\noindent{#1}\hspace{1.1cm}\noindent {\fontsize{9}{11.2}\selectfont \pbox[b]{13.86cm}{#2}}\par\vspace{6pt}}

% Use for special paragraph requirement in back matter
\newcommand{\backnotes}[2]{
\vspace{6pt}\noindent{\fontsize{9}{11.2}\selectfont\textbf{#1:} {#2}\par}}


%%%%% Defines the appendix
\def\@appendixtitles{}
\newcommand{\appendixtitles}[1]{\gdef\@appendixtitles{#1}}

\def\@appendixsections{}
\newcommand{\appendixsections}[1]{\gdef\@appendixsections{#1}}

\def\@appendixstart{}
\newcommand{\appendixstart}[1]{\gdef\@appendixstart{#1}}

\renewcommand{\appendixstart}{%
\setcounter{section}{0}%
\setcounter{subsection}{0}%
\setcounter{subsubsection}{0}%
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{scheme}{0}
\setcounter{chart}{0}
\setcounter{boxenv}{0}
\setcounter{equation}{0}
\setcounter{theorem}{0}
\setcounter{lemma}{0}
\setcounter{corollary}{0}
\setcounter{proposition}{0} 
\setcounter{characterization}{0} 
\setcounter{property}{0} 
\setcounter{problem}{0} 
\setcounter{example}{0} 
\setcounter{examplesanddefinitions}{0} 
\setcounter{remark}{0} 
\setcounter{definition}{0} 
\setcounter{hypothesis}{0}
\setcounter{notation}{0}
\setcounter{algorithm}{0}
}

\renewcommand{\appendix}{%
%
\gdef\thesection{\@Alph\c@section}%
\gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%

\titleformat {\section} [block] {\raggedright\bfseries} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesection.%
		}{%
		\appendixname~\thesection~%
		}
	} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {3pt}
%
\titleformat {\subsection} [block] {\raggedright\itshape} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesubsection.%
		}{%
		\appendixname~\thesubsection%
		}
	} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {3pt}
%
\titleformat {\subsubsection} [block] {\raggedright\selectfont} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesubsubsection.%
		}{%
		\appendixname~\thesubsubsection%
		}
	} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {3pt}
%
\gdef\theHsection{\@Alph\c@section.}% for hyperref
\gdef\theHsubsection{\@Alph\c@section.\@arabic\c@subsection}% for hyperref
\csname appendixmore\endcsname
\renewcommand{\thefigure}{A\arabic{figure}}
\renewcommand{\thetable}{A\arabic{table}}
\renewcommand{\thescheme}{A\arabic{scheme}}
\renewcommand{\thechart}{A\arabic{chart}}
\renewcommand{\theboxenv}{A\arabic{boxenv}}
\renewcommand{\theequation}{A\arabic{equation}}
\renewcommand{\thetheorem}{A\arabic{theorem}}
\renewcommand{\thelemma}{A\arabic{lemma}}
\renewcommand{\thecorollary}{A\arabic{corollary}}
\renewcommand{\theproposition}{A\arabic{proposition}} 
\renewcommand{\thecharacterization}{A\arabic{characterization}}
\renewcommand{\theproperty}{A\arabic{property}}
\renewcommand{\theproblem}{A\arabic{problem}}
\renewcommand{\theexample}{A\arabic{example}}
\renewcommand{\theexamplesanddefinitions}{A\arabic{examplesanddefinitions}}
\renewcommand{\theremark}{A\arabic{remark}}
\renewcommand{\thedefinition}{A\arabic{definition}}
\renewcommand{\thehypothesis}{A\arabic{hypothesis}}
\renewcommand{\thenotation}{A\arabic{notation}}
\renewcommand{\thealgorithm}{A\arabic{algorithm}}
}


%%%% Dimensions
%% Width of left column = marginparwidth
\newlength{\leftcolumnlength}
\setlength{\leftcolumnlength}{4.1cm}

%% Width of left column plus marginsep
\newlength{\extralength}
\setlength{\extralength}{4.61cm} % = 0.51 cm + 4.1 cm (= marginparwidth + marginparsep)

%% Width of the page minus the margins
\newlength{\fulllength}
\setlength{\fulllength}{21 cm - 1.27 cm - 1.27 cm}

%%%% Layout
\ifthenelse{\equal{\@arttype}{Book}
\OR \equal{\@arttype}{Monograph}}{%%
	\RequirePackage[left=2.05cm,
					right=2.05cm,
					top=1.8cm,
					bottom=0.75cm,
					paperwidth=170mm,
					paperheight=244mm,
					footskip=20pt,
					headsep=24pt,
					%includehead, 
					includefoot]{geometry}
	}{
	\RequirePackage[left=5.87cm, %1.27 cm + 0.51 cm + 4.1 cm = 5.87 cm (= 1.27 cm + marginparwidth + marginparsep)
				marginparwidth=4.1cm,
				marginparsep=0.51cm,
				right=1.27cm,
				top=1.8cm,
				bottom=0.75cm,
				footskip=48pt,
				headsep=24pt,
				includehead,
				includefoot]{geometry}
}

\fancyheadoffset[L]{\extralength} % Header into the margin
\ifthenelse{\equal{\@arttype}{Book}
\OR \equal{\@arttype}{Monograph}}{%
	}{%
	\fancyfootoffset[L]{\extralength}%
} % Footer into the margin

\linespread{1.05} 
\setlength{\parindent}{0.75cm}

%%%% Commands for landscape page
\newcommand{\startlandscape}{
	\clearpage
	\paperwidth=\pdfpageheight
	\paperheight=\pdfpagewidth
	\pdfpageheight=\paperheight
	\pdfpagewidth=\paperwidth
	\newgeometry{layoutwidth=297mm, layoutheight=210 mm, left=1.27cm, right=1.27cm, top=1.8cm, bottom=0.6cm, includehead, includefoot}
	\fancyheadoffset{0pt}
	\captionsetup{margin={4.6cm,0cm}}
	}

\newcommand{\finishlandscape}{
	\clearpage
	\paperwidth=\pdfpageheight
	\paperheight=\pdfpagewidth
	\pdfpageheight=\paperheight
	\pdfpagewidth=\paperwidth
	\restoregeometry
	\fancyheadoffset[L]{\extralength}
	\captionsetup{margin={0cm,0cm}}
}


%%%% Figures and tables
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[]{listing}
\DeclareFloatingEnvironment[name=Box]{boxenv}	
\DeclareFloatingEnvironment[]{chart}
\DeclareFloatingEnvironment[]{scheme}
\DeclareFloatingEnvironment[]{figurewide}

\RequirePackage{caption} 
\captionsetup[figure]{position=bottom, 	labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, singlelinecheck=off, justification=justified}

\captionsetup[scheme]{position=bottom,	labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, singlelinecheck=off, justification=justified}

\captionsetup[listing]{position=top, 		labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, singlelinecheck=off, justification=justified}

\captionsetup[chart]{position=bottom, 	labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, singlelinecheck=off, justification=justified}

\captionsetup[table]{position=top, 		labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, singlelinecheck=off, justification=justified}

\captionsetup[boxenv]{position=top, 		labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, singlelinecheck=off, justification=justified}


%% For table footnotes
\newsavebox{\@justcentbox}
\newcommand{\justifyorcenter}[1]{
\sbox \@justcentbox{#1}
\ifdim \wd \@justcentbox >\hsize #1
\else \centerline{#1} \fi
}

%% For text alignment in tables
\renewcommand\tabularxcolumn[1]{m{#1}} % vertical centering
\newcolumntype{C}{>{\centering\arraybackslash}X} % centered text in C columns
\newcolumntype{L}{>{\raggedright\arraybackslash}X} % centered text in L columns

%%%% Bullet lists
\setitemize{topsep=3pt,parsep=0pt,itemsep=0pt,leftmargin=*,labelsep=5.5mm,align=parleft}
\setenumerate{topsep=3pt,parsep=0pt,itemsep=0pt,leftmargin=*,labelsep=5.5mm,align=parleft}
\setlist[description]{itemsep=0mm}


%%%% Quote environment
\renewenvironment{quote}{
	\list{}{
		\listparindent=0pt
		\leftmargin=0.75cm
		\rightmargin=0.75cm
		\topsep=3pt
		\parsep=3pt
	}%
	\item\relax
	}
	{\endlist}

%%%% Supplementary file
\ifthenelse{\equal{\@arttype}{Supfile}}{
	\renewcommand{\thefigure}{S\arabic{figure}}%
	\renewcommand{\thetable}{S\arabic{table}}%
	}{}%

%% Link to supplementary material: www.mdpi.com/ISSN-number/volume-number/issue-number/article-number	
\newcommand{\linksupplementary}[1]{\url{https://www.mdpi.com/article/\@doinum/#1}}


%%%% Header and footer (all pages except the first)
\renewcommand\headrule{} %% set line (from fancyhdr) in header to nothing

\pagestyle{fancy}
\lhead{
	\ifthenelse{\equal{\@journal}{preprints}%
	\OR \equal{\@arttype}{Book}
	\OR \equal{\@arttype}{Monograph}}{%
		}{%
		\fontsize{8}{8}\selectfont%
		\ifthenelse{\equal{\@status}{submit}}{%
			Version {\@ \today} submitted to {\em \journalname}%
			}{%
			\ifthenelse{\equal{\@arttype}{Supfile}}{%
			{\em \journalname} {\bfseries \@pubyear}, {\em \@pubvolume}, %
			\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
				\@articlenumber. %
				}{%
				S\@firstpage\ifnumcomp{\getpagerefnumber{LastPage}}{=}{\@firstpage}{}{--S\pageref*{LastPage}}. %
				}%
			{\changeurlcolor{black}%
        			\url{https://doi.org/\@doinum}}%
			}{%
			{\null\vspace{2pt}\em\journalname\ }{\bfseries\@pubyear}, {\em \@pubvolume}%
			\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
				, \@articlenumber%
				}{}%
			}%
			}\\%
			\rule{\fulllength}{0.4pt}%
		}%
	}
	
\rhead{%
\ifthenelse{\equal{\@arttype}{Book}
\OR \equal{\@arttype}{Monograph}}{}{%
	\ifthenelse{\equal{\@arttype}{Supfile}}{%
		\fontsize{8}{8}\selectfont S\thepage{} of S\pageref*{LastPage}%
		}{%
		\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
			\fontsize{8}{8}\selectfont\thepage{} of \pageref*{LastPage}%
			}{%
			\fontsize{8}{8}\selectfont\thepage%
		}%
		}\\%
		\rule{\fulllength}{0.4pt}%
	}%
}

\cfoot{
	\ifthenelse{\equal{\@arttype}{Book}
	\OR \equal{\@arttype}{Monograph}
	}{%
		\fontsize{8}{8}\selectfont\thepage
		}{%
	}
}


%%%% Article type "Retraction"
\def\@retractiondate{}% Date that the retraction notice was published
\newcommand{\retractiondate}[1]{\gdef\@retractiondate{#1}}
\def\@retractionnoticeyear{}% Year in which the retraction notice was published
\newcommand{\retractionnoticeyear}[1]{\gdef\@retractionnoticeyear{#1}}
\def\@retractionnoticevolume{} % Volume in which the retraction notice was published
\newcommand{\retractionnoticevolume}[1]{\gdef\@retractionnoticevolume{#1}}
\def\@retractionnoticeidnumber{}% Article Number in which the retraction notice was published
\newcommand{\retractionnoticeidnumber}[1]{\gdef\@retractionnoticeidnumber{#1}}
\def\@retractionnoticedoi{}  % DOI published retraction notice
\newcommand{\retractionnoticedoi}[1]{\gdef\@retractionnoticedoi{#1}}
\newcommand{\printretraction}{
\ifthenelse{\equal{\@retractiondate}{\@empty}}{}{%
	\RequirePackage{draftwatermark}
	\SetWatermarkText{RETRACTED}
	\SetWatermarkScale{0.8}
	\fancypagestyle{plain}{
	\fancyhf{}
	\fancyfoot[L]{
		\footnotesize%
		\st{\mbox{\textit{\journalname} \textbf{\@pubyear}, \textit\@pubvolume, }}%
		\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
			\st{\@articlenumber}%
			}{%
			\st{\@firstpage}\ifnumcomp{\getpagerefnumber{LastPage}}{=}{\@firstpage}{}{\st{--\mbox{\pageref*{LastPage}}}}%
			}%
		\st{. {\changeurlcolor{black}%
		\href{https://doi.org/\@doinum}%
		{https://doi.org/\@doinum}}}%
		\\This paper has been retracted. A retraction notice was published on \@retractiondate{} %
		in \textit{\@journalfull} \textbf{\@retractionnoticeyear}, \textit{\@retractionnoticevolume}, \@retractionnoticeidnumber. https://doi.org/\@retractionnoticedoi
	}%
	\fancyfoot[R]{
		\footnotesize%
		{\changeurlcolor{black}%
		\href{https://www.mdpi.com/journal/\@journal}%
		{www.mdpi.com/journal/\@journal}}%
	}%
	\renewcommand{\footrulewidth}{0.4pt}%
	}
   }
}

%%%% Bibliography
\renewcommand\bibname{References} % Backwards compatibility for book production
\renewcommand\@biblabel[1]{#1.\hfill}
\def\thebibliography#1{
\emergencystretch 2em
\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {} {0pt} {}
\ifthenelse{\equal{\@arttype}{Book} \OR \equal{\@arttype}{Monograph}}{}{%JD% to remove the sectin from the TOC in books
	\section{\@reftitle}
}
\fontsize{9}{11}\selectfont
\list{{\arabic{enumi}}}{\def\makelabel##1{\hss{##1}}
\topsep=0\p@
\parsep=0\p@
\partopsep=0\p@
\itemsep=0\p@
\labelsep=1.5mm
\chicagostylejournals{%
	\ifthenelse{\equal{\@externalbibliography}{\@empty}}{%
		\itemindent=-7.7mm
		}{%
		\itemindent=-3.3mm}%
		}{%
	\itemindent=0\p@}
\settowidth\labelwidth{\footnotesize[#1]}%
\leftmargin\labelwidth
\advance\leftmargin\labelsep
%\advance\leftmargin -\itemindent
\usecounter{enumi}}
%\def\newblock{\ }
%\sloppy\clubpenalty4000\widowpenalty4000
%\sfcode`\.=1000\relax
}
\let\endthebibliography=\endlist

%%%% Publisher's note
\newcommand{\PublishersNote}{
\null\par\noindent\fontsize{9}{11}\selectfont\textbf{Disclaimer/Publisher's Note:} The statements, opinions and data contained in all publications are solely those of the individual author(s) and contributor(s) and not of MDPI and/or the editor(s). MDPI and/or the editor(s) disclaim responsibility for any injury to people or property resulting from any ideas, methods, instructions or products referred to in the content.
}

%%%% Long society owner names
\newcommand{\longsociety}{
	\ifthenelse{\equal{\@societyowner}{EUROTURBO}
		\OR \equal{\@societyowner}{Lithuanian University of Health Sciences}
		\OR \equal{\@societyowner}{\"{O}sterreichische Pharmazeutische Gesellschaft}
		\OR \equal{\@societyowner}{International Society for Neonatal Screening}
		\OR \equal{\@societyowner}{University Association of Education and Psychology}
		\OR \equal{\@societyowner}{European Society of Dermatopathology}
		\OR \equal{\@societyowner}{Swiss Federation of Clinical Neuro-Societies}
		\OR \equal{\@societyowner}{International Society for Photogrammetry and Remote Sensing}
		}
}

%%%% Copyright info
\newcommand{\cright}{%
        \ifthenelse{\equal{\@arttype}{Supfile}}{%
		}{%
		\ifthenelse{\equal{\@status}{submit}}{%
		\fontdimen2\font=1.2pt
			\textbf{Copyright: }\copyright{} {\@ \the\year} by the \@authornum.\linebreak%
			Submitted to {\em\journalname} for %
			possible open access publication %
			under the terms and conditions of the Creative Commons Attri- bution %
			\ifthenelse{\equal{\@journal}{ijtpp}}{(CC BY-NC-ND)}{(CC BY)} %
			license %
			\ifthenelse{\equal{\@journal}{ijtpp}}{%
			\changeurlcolor{black}%
			(\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{https://creative}\linebreak\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{commons.org/licenses/by-nc-nd/4.0/).}%
			}{%
			\changeurlcolor{black}%
			(\href{https://creativecommons.org/licenses/by/4.0/}{https://}\linebreak\href{https://creativecommons.org/licenses/by/4.0/}{creativecommons.org/licenses/by/}\linebreak 4.0/).%
			}
			}{%
			\href{https://creativecommons.org/}{%
				\ifthenelse{\equal{\@journal}{ijtpp}}{%
					\includegraphics[width=2 cm]{Definitions/logo-ccby-nc-nd.eps}%
					}{%
					\includegraphics[width=2 cm]{Definitions/logo-ccby.eps}
					}
				}\\
				{\justifying\textbf{Copyright:} \copyright \ {\@copyrightyear} by the \@authornum.\linebreak%
                          \ifthenelse{\equal{\@societyowner}{}}{}{%
                          Published by MDPI on behalf of the \textls[-15]{\@societyowner}.}
				Licensee MDPI, Basel, Switzerland.\longsociety{ }{\linebreak}%
				This article is an open access article %
				distributed under the terms and \longsociety{}{\linebreak}% 
				conditions of the Creative Commons Attribution %
				\ifthenelse{\equal{\@journal}{ijtpp}}{(CC BY-NC-ND)}{(CC BY)} %
				license %
				\ifthenelse{\equal{\@journal}{ijtpp}}{%
				\changeurlcolor{black}%
				\linebreak
				\href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{(https://creativecommons.org/}\linebreak \href{https://creativecommons.org/licenses/by-nc-nd/4.0/}{licenses/by-nc-nd/4.0/}).%
				}{%
				\changeurlcolor{black}%
				\longsociety{(\url{https://creativecommons.org/licenses/by/4.0/}).}{
				(\href{https://creativecommons.org/licenses/by/4.0/}{https://} \href{https://creativecommons.org/licenses/by/4.0/}{creativecommons.org/licenses/by/}\linebreak 4.0/).
				           }
                                }%
				}
			}
		}
	}

	
%%%% For tables XML2PDF
\RequirePackage{seqsplit} % Use for split table column
  \newlength{\cellWidtha}
  \newlength{\cellWidthb}
  \newlength{\cellWidthc}
  \newlength{\cellWidthd}
  \newlength{\cellWidthe}
  \newlength{\cellWidthf}
  \newlength{\cellWidthg}
  \newlength{\cellWidthh}
  \newlength{\cellWidthi}
  \newlength{\cellWidthj}
  \newlength{\cellWidthk}
  \newlength{\cellWidthl}
  \newlength{\cellWidthm}
  \newlength{\cellWidthn}
  \newlength{\cellWidtho}
  \newlength{\cellWidthp}
  \newlength{\cellWidthq}
  \newlength{\cellWidthr}
  \newlength{\cellWidths}
  \newlength{\cellWidtht}
  \newlength{\cellWidthu}
  \newlength{\cellWidthv}
  \newlength{\cellWidthw}
  \newlength{\cellWidthx}
  \newlength{\cellWidthy}
  \newlength{\cellWidthz}
  \newlength{\cellWidthA}
  \newlength{\cellWidthB}
  \newlength{\cellWidthC}
  \newlength{\cellWidthD}
  \newlength{\cellWidthE}
  \newlength{\cellWidthF}
  \newlength{\cellWidthG}
  \newlength{\cellWidthH}
  \newlength{\cellWidthI}
  \newlength{\cellWidthJ}
  \newlength{\cellWidthK}
  \newlength{\cellWidthL}
  \newlength{\cellWidthM}
  \newlength{\cellWidthN}
  \newlength{\cellWidthO}
  \newlength{\cellWidthP}
  \newlength{\cellWidthQ}
  \newlength{\cellWidthR}
  \newlength{\cellWidthS}
  \newlength{\cellWidthT}
  \newlength{\cellWidthU}
  \newlength{\cellWidthV}
  \newlength{\cellWidthW}
  \newlength{\cellWidthX}
  \newlength{\cellWidthY}
  \newlength{\cellWidthZ}
 \newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp} % For table column setting in XML2PDF

\endinput