%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%	MDPI class for LaTeX files	 15.2.2019 b
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
%% %%		v3.0 after layout change (September 2015)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% IDENTIFICATION
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdpi}[15/02/2019 MDPI paper class]

%%%% Copyright and citebox
 \AtEndDocument{\par \cright}
 
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
\RequirePackage{lineno}
\RequirePackage{float}
\RequirePackage{amsmath}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{mathpazo}
\RequirePackage{booktabs} % For \toprule etc. in tables
\RequirePackage[largestsep]{titlesec}
\RequirePackage{etoolbox} % For \AtBeginDocument etc.
\RequirePackage{tabto} % To use tab for alignment on first page
\RequirePackage[table]{xcolor} % To provide color for soul (for english editing) and provide coloring for tables (author request)
\RequirePackage{soul} % To highlight text
\newcommand{\highlight}[1]{\colorbox{yellow}{#1}}
\RequirePackage{multirow}
\RequirePackage{microtype} % For command \textls[]{}
\RequirePackage{tikz} % For \foreach used for Orcid icon
\RequirePackage{totcount} % To enable extracting the value of the counter "page" 

 
%% OPTIONS
%% To choose the journal
% All journals (website name, full name, short name, DOI abbreviation, and ISSN) are defined in an extra file. 
% This is the same as for mdpi.cls.
\input{journalnames}
\DeclareOption{journal}{\ClassWarning{mdpi}{You used an invalid journal name or you have not specified the journal. The first option of the documentclass command specifies the journal. The word 'journal' should be replaced by one of the journal names specified in template.tex (in the comment 'Choose between the following MDPI journal').}} 

%% To choose the type of manuscript
\DeclareOption{abstract}{\gdef\@arttype{Abstract}}
\DeclareOption{addendum}{\gdef\@arttype{Addendum}}
\DeclareOption{article}{\gdef\@arttype{Article}}
\DeclareOption{benchmark}{\gdef\@arttype{Benchmark}}
\DeclareOption{book}{\gdef\@arttype{Book}}
\DeclareOption{bookreview}{\gdef\@arttype{Book Review}}
\DeclareOption{briefreport}{\gdef\@arttype{Brief Report}}
\DeclareOption{casereport}{\gdef\@arttype{Case Report}}
\DeclareOption{changes}{\gdef\@arttype{Changes}}
\DeclareOption{comment}{\gdef\@arttype{Comment}}
\DeclareOption{commentary}{\gdef\@arttype{Commentary}}
\DeclareOption{communication}{\gdef\@arttype{Communication}}
\DeclareOption{conceptpaper}{\gdef\@arttype{Concept Paper}}
\DeclareOption{conferenceproceedings}{\gdef\@arttype{Proceedings}}
\DeclareOption{correction}{\gdef\@arttype{Correction}}
\DeclareOption{conferencereport}{\gdef\@arttype{Conference Report}}
\DeclareOption{expressionofconcern}{\gdef\@arttype{Expression of Concern}}
\DeclareOption{extendedabstract}{\gdef\@arttype{Extended Abstract}}
\DeclareOption{meetingreport}{\gdef\@arttype{Meeting Report}}
\DeclareOption{creative}{\gdef\@arttype{Creative}}
\DeclareOption{datadescriptor}{\gdef\@arttype{Data Descriptor}}
\DeclareOption{discussion}{\gdef\@arttype{Discussion}}
\DeclareOption{editorial}{\gdef\@arttype{Editorial}}
\DeclareOption{essay}{\gdef\@arttype{Essay}}
\DeclareOption{erratum}{\gdef\@arttype{Erratum}}
\DeclareOption{hypothesis}{\gdef\@arttype{Hypothesis}}
\DeclareOption{interestingimages}{\gdef\@arttype{Interesting Images}}
\DeclareOption{letter}{\gdef\@arttype{Letter}}
\DeclareOption{meetingreport}{\gdef\@arttype{Meeting Report}}
\DeclareOption{newbookreceived}{\gdef\@arttype{New Book Received}}
\DeclareOption{obituary}{\gdef\@arttype{Obituary}}
\DeclareOption{opinion}{\gdef\@arttype{Opinion}}
\DeclareOption{projectreport}{\gdef\@arttype{Project Report}}
\DeclareOption{reply}{\gdef\@arttype{Reply}}
\DeclareOption{retraction}{\gdef\@arttype{Retraction}}
\DeclareOption{review}{\gdef\@arttype{Review}}
\DeclareOption{perspective}{\gdef\@arttype{Perspective}} 
\DeclareOption{protocol}{\gdef\@arttype{Protocol}} 
\DeclareOption{shortnote}{\gdef\@arttype{Short Note}}
\DeclareOption{supfile}{\gdef\@arttype{Supfile}}
\DeclareOption{technicalnote}{\gdef\@arttype{Technical Note}}
\DeclareOption{viewpoint}{\gdef\@arttype{Viewpoint}}

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
 
%%%% Hyphenation
\RequirePackage[none]{hyphenat}
\sloppy

%%%% References
\RequirePackage[sort&compress,sectionbib]{natbib} % option sectionbib is for optionally organizing references using sections (author request)

\ifthenelse{\equal{\@journal}{admsci}
\OR \equal{\@journal}{arts}
\OR \equal{\@journal}{econometrics}
\OR \equal{\@journal}{economies}
\OR \equal{\@journal}{genealogy}
\OR \equal{\@journal}{humanities}
\OR \equal{\@journal}{ijfs}
\OR \equal{\@journal}{jrfm}
\OR \equal{\@journal}{languages}
\OR \equal{\@journal}{laws}
\OR \equal{\@journal}{religions}
\OR \equal{\@journal}{risks}
\OR \equal{\@journal}{socsci}}{%
	\bibliographystyle{chicago2}
	\bibpunct{(}{)}{;}{x}{}{}%
	}{%
	\bibliographystyle{mdpi}
	\bibpunct{[}{]}{,}{n}{}{}%
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

\ifthenelse{\equal{\@arttype}{Book}}{
	\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=black, 
	citecolor=black, 
	urlcolor=black, 
	hyperfootnotes=false, 
	pdfstartview={FitH},
	pdfpagemode=UseNone]{hyperref}
	}{
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
} 

%% To have the possibility to change the urlcolor
\newcommand{\changeurlcolor}[1]{\hypersetup{urlcolor=#1}} 

%% Metadata
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

%%%% Footnotes
\RequirePackage[hang]{footmisc}
\setlength{\skip\footins}{1.2cm}
\setlength{\footnotemargin}{5mm}
\def\footnoterule{\kern-14\p@
\hrule \@width 2in \kern 11.6\p@}

%%%% URL
\RequirePackage{url}
\urlstyle{same}
\g@addto@macro{\UrlBreaks}{\UrlOrds} 

%%%% Widows & orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

%%%% Front matter
\newcommand{\firstargument}{}
\newcommand{\Title}[1]{\gdef\@Title{#1}}%
\newcommand{\Author}[1]{\gdef\@Author{#1}}%
\def\@AuthorNames{}
\newcommand{\AuthorNames}[1]{\gdef\@AuthorNames{#1}}%
\newcommand{\firstpage}[1]{\gdef\@firstpage{#1}}
\newcommand{\doinum}[1]{\gdef\@doinum{#1}}

% DOI number
\newcommand\twodigits[1]{%
\ifnum#1<10
0\number#1
   \else
\number#1
\fi
}

\newcommand\fourdigits[1]{%
\ifnum#1<10 000\number#1 
  \else
     \ifnum#1<100 00\number#1
        \else
           \ifnum#1<1000 0\number#1
              \else
                  \ifnum#1<10000 \number#1
                   \else                   
                     error
               \fi
            \fi
         \fi
  \fi
}


\ifthenelse{\equal{\@journal}{molbank}}{
	\doinum{10.3390/\@articlenumber}
	}{
	\doinum{10.3390/\@doiabbr\@pubvolume\twodigits\@issuenum\fourdigits\@articlenumber}
}


\newcommand{\pubvolume}[1]{\gdef\@pubvolume{#1}}
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
\newcommand{\history}[1]{\gdef\@history{#1}} 
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
\newcommand{\issuenum}[1]{\gdef\@issuenum{#1}}
\def\@updates{}
\newcommand{\updates}[1]{\gdef\@updates{#1}}

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
\newcommand{\articlenumber}[1]{\gdef\@articlenumber{#1}}

\def\@externalbibliography{}
\newcommand{\externalbibliography}[1]{\gdef\@externalbibliography{#1}}

\def\@reftitle{}
\newcommand{\reftitle}[1]{\gdef\@reftitle{#1}}

% For transition period to change back to continuous page numbers
\def\@continuouspages{}
\newcommand{\continuouspages}[1]{\gdef\@continuouspages{#1}}


%% ORCID
% Make Orcid icon
\newcommand{\orcidicon}{\includegraphics[width=0.32cm]{logo-orcid.pdf}}

% Define link and button for each author
\foreach \x in {A, ..., Z}{%
\expandafter\xdef\csname orcid\x\endcsname{\noexpand\href{https://orcid.org/\csname orcidauthor\x\endcsname}{\noexpand\orcidicon}}
}

%%%% Journal name for the header
\newcommand{\journalname}{\@journalshort}
    

\regtotcounter{page} % to enable extracting the value of the counter "page" using the totcount package

%%%% Header and footer on first page
%% The plain page style needs to be redefined because with \maketitle in the article class, LaTeX applies the the plain page style automatically to the first page.
\ifthenelse{\equal{\@journal}{preprints} %
		\OR \equal{\@arttype}{Book}}{%
	\fancypagestyle{plain}{%
		\fancyhf{}
		\ifthenelse{\equal{\@arttype}{Book}}{
        			\fancyfoot[C]{\footnotesize\thepage}
     	   		}{%
			}		
		}
	}{%
	\ifthenelse{\equal{\@arttype}{Supfile}}{
		\fancypagestyle{plain}{
			\fancyhf{}
			\fancyhead[R]{
				\footnotesize %
				S\thepage{} of S\pageref*{LastPage}%
				}%
			\fancyhead[L]{
				\footnotesize %
				\ifthenelse{\equal{\@status}{submit}}{%
					Version {\@ \today} submitted to {\em\journalname}%
					}{%
					{\em \journalname} %
					{\bfseries \@pubyear}, %
					{\em \@pubvolume}, %
					\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
						\@firstpage --\pageref*{LastPage}%
						}{%
						\@articlenumber%
						}%
					; doi:{\changeurlcolor{black}%
        					\href{http://dx.doi.org/\@doinum}%
        					{\@doinum}}%
					}%
				}%
			}%
		}{
		\fancypagestyle{plain}{
			\fancyhf{}
			\fancyfoot[L]{
				\footnotesize%
 	 				\ifthenelse{\equal{\@status}{submit}}{%
					Submitted to {\em\journalname}, %
					pages \thepage \ -- \color{black}{\pageref*{LastPage}}%
					}{
					{\em \journalname}\ %
					{\bfseries \@pubyear}, %
					{\em \@pubvolume}, %
					\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
						\@articlenumber%
						}{%
						\@firstpage\ifnumcomp{\totvalue{page}-1}{=}{\@firstpage}{}{--\pageref*{LastPage}}%
						}%
						; doi:{\changeurlcolor{black}%
        					\href{http://dx.doi.org/\@doinum}%
        					{\@doinum}}%
					}%
				}%
			\fancyfoot[R]{
 				\footnotesize%
				{\changeurlcolor{black}%
				\href{http://www.mdpi.com/journal/\@journal}%
				{www.mdpi.com/journal/\@journal}}%
				}%
			\fancyhead{}
		 	\renewcommand{\headrulewidth}{0.0pt}%
			}
		}%
	}%	

%%%% Maketitle part 1: Logo, Arttype, Title, Author
\renewcommand{\@maketitle}{
	\begin{flushleft}
	\ifthenelse{\equal{\@arttype}{Supfile}}{%
		\fontsize{18}{18}\selectfont
		\raggedright
		\noindent\textbf{Supplementary Materials: \@Title}%
		\par
		\vspace{12pt}
		\fontsize{10}{10}\selectfont
		\noindent\boldmath\bfseries{\@Author}
		}{%
		\ifthenelse{\equal{\@arttype}{Book}}{}{%
			\vspace*{-1.75cm}
			}
		{%0
		\ifthenelse{\equal{\@journal}{preprints}
			\OR \equal{\@arttype}{Book}}{}{%
				\ifthenelse{\equal{\@status}{submit}}{%	
					\hfill \href{http://www.mdpi.com}{%
					\includegraphics[height=1cm]{logo-mdpi.pdf}}\vspace{0.5cm}%
					}{
					\href{http://www.mdpi.com/journal/\@journal}{
					\includegraphics[height=1.2cm]{\@journal-logo.eps}}%
					\hfill
					\ifthenelse{\equal{\@journal}{proceedings}}{
						\href{http://www.mdpi.com/journal/\@journal}{
						\includegraphics[height=1.2cm]{logo-conference.eps}
						\hfill}
						}{}
					\ifthenelse{\equal{\@journal}{scipharm}}{%
						\href{http://www.mdpi.com}{\includegraphics[height=1cm]{logo-mdpi-scipharm.eps}}%
						}{%
						\href{http://www.mdpi.com}{\includegraphics[height=1cm]{logo-mdpi.pdf}}%
						}%
					}%
			}%
		\par
		}%0
		{%1
    		\vspace{14pt}
    		\fontsize{10}{10}\selectfont
		\ifthenelse{\equal{\@arttype}{Book}}{}{
			\textit{\@arttype}%
			}%	
 	   	\par%
    		}%1
    		{%2
   	 	\vspace{-1pt}
  	  	\fontsize{18}{18}\selectfont
   	 	\boldmath\bfseries{\@Title}
   	 	\par
   	 	\vspace{15pt}
   	 	}%2
   		{%3
    		\boldmath\bfseries{\@Author}
    		\par
    		\vspace{-4pt}
    		}%3
		}
	\end{flushleft}%
	}

% Commands for hanging indent
\newcommand{\dist}{1.7em}
\newcommand{\hang}{\hangafter=1\hangindent=\dist\noindent}

%%%% Maketitle part 2
\newcommand{\maketitlen}{ 
\ifthenelse{\equal{\@arttype}{Book}}{\vspace{12pt}}{
	\begin{flushleft}
	\begin{spacing}{1.35}
	\leftskip0.2cm
	\fontsize{9}{9}\selectfont
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
	\hang$\dagger$ \tabto{\dist} This paper is an extended version of our paper published in\space \@conference.}
	\par
	}%
	{%
	\ifthenelse{\equal{\@firstnote}{\@empty}}{}{%
	\hang\ifthenelse{\equal{\@conference}{\@empty}}{$\dagger$}{$\ddagger$} \tabto{\dist} \@firstnote}	
	\par
	}%
	{%
	\ifthenelse{\equal{\@secondnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\ddagger$}{\S} \tabto{\dist} \@secondnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@thirdnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{\S}{$\|$} \tabto{\dist} \@thirdnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@fourthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\|$}{\P} \tabto{\dist} \@fourthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@fifthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{\P}{**} \tabto{\dist} \@fifthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@sixthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{**}{$\dagger\dagger$} \tabto{\dist} \@sixthnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@seventhnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\dagger\dagger$}{$\ddagger\ddagger$} \tabto{\dist} \@seventhnote}
	\par
	}%
	{%
	\ifthenelse{\equal{\@eighthnote}{\@empty}}{}{%
	\hang \ifthenelse{\equal{\@conference}{\@empty}}{$\ddagger\ddagger$}{***} \tabto{\dist} \@eighthnote}
	\par
	}%
	\vspace{6pt}
	\ifthenelse{\equal{\@updates}{\@empty}}{
        	\ifthenelse{\equal{\@externaleditor}{\@empty}}{}{\@externaleditor}
        		\par
        		\ifthenelse{\equal{\@LSID}{\@empty}}{}{\@LSID}
        		\par
        		\ifthenelse{\equal{\@status}{submit}}{
        			Version {\@ \today} submitted to \journalname
        			}{
        			\mbox{\@history}
			}
        	}{
        	\parbox[tb]{.79\textwidth}{
        		\ifthenelse{\equal{\@externaleditor}{\@empty}}{}{\@externaleditor}
        		\par
        		\ifthenelse{\equal{\@LSID}{\@empty}}{}{\@LSID}
        		\par
        		\ifthenelse{\equal{\@status}{submit}}{
        			Version {\@ \today} submitted to \journalname
        			}{
        			\mbox{\@history}
			}
        		}
        	\parbox[b]{.19\textwidth}{
        		\hfill
        		\ifthenelse{\equal{\@updates}{\@empty}}{
        			}{
        			\href{http://www.mdpi.com/\@ISSN/\@pubvolume/\@issuenum/\@articlenumber?type=check_update&version=1}{\includegraphics[height=.6cm]{logo-updates.pdf}}%
        			}%
        		}%
		}
	\par
	\vspace{-4pt}%
	\end{spacing}
	\end{flushleft}
}
}

%%%% Abstract, keywords, journal data, PACS, MSC, JEL
\newcommand{\abstractkeywords}{
\vspace{-8pt}
{% For journal Applied Sciences:
\ifthenelse{\equal{\@featuredapplication}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{Featured Application:\space\@featuredapplication}
\vspace{12pt}
\par
\endgroup}
}%
{%10
\begingroup
\leftskip0.2cm 
\ifthenelse{\equal{\@simplesumm}{\@empty}}{}{
\noindent\textbf{Simple Summary:\space}\@simplesumm
\vspace{12pt}
\par
}
\ifthenelse{\equal{\@abstract}{\@empty}}{}{
\noindent\textbf{Abstract:\space}\@abstract
\vspace{12pt}
\par
}
\endgroup
}%10
{% For journal Data:
\ifthenelse{\equal{\@dataset}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{Dataset:\space}\@dataset
\vspace{12pt}
\par
\endgroup}
}%
{%For journal Data:
\ifthenelse{\equal{\@datasetlicense}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{Dataset License:\space}\@datasetlicense
\vspace{12pt}
\par
\endgroup}
}%
{%11
\begingroup
\leftskip0.2cm
\ifthenelse{\equal{\@keyword}{\@empty}}{}{
\noindent\textbf{Keywords:\space}\@keyword
\vspace{12pt}
\par
}
\endgroup
}%11
{%For journal Toxins:
\begingroup
\leftskip0.2cm
\ifthenelse{\equal{\@keycontribution}{\@empty}}{}{
\noindent\textbf{Key Contribution:\space}\@keycontribution
\vspace{12pt}
\par
}
\endgroup
}%11
{%12
\ifthenelse{\equal{\@pacs}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{PACS:\space}\@pacs
\vspace{12pt}
\par
\endgroup}
}%12
{%13
\ifthenelse{\equal{\@msc}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{MSC:\space}\@msc
\vspace{12pt}
\par
\endgroup}
}%13
{%14
\ifthenelse{\equal{\@jel}{\@empty}}{}{
\begingroup
\leftskip0.2cm
\noindent\textbf{JEL Classification:\space}\@jel
\vspace{12pt}
\par
\endgroup}
}%14
\vspace{4pt}
\ifthenelse{\equal{\@arttype}{Book}}{}{\hrule}
\vspace{12pt}
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
	\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
	\DeclareSymbolFontAlphabet{\mathbb}{AMSb}
	}

%%%% Font size in Tables
\AtEndPreamble{
	\def\@tablesize{}
	\newcommand{\tablesize}[1]{\gdef\@tablesize{#1}}
	\let\oldtabular\tabular
	\renewcommand{\tabular}{\ifthenelse{\equal{\@tablesize}{\@empty}}{\small}{\@tablesize}\oldtabular}
}

%%%% Section headings
\setcounter{secnumdepth}{4} %i.e., section numbering depth, which defaults to 3 in the article class. To get paragraphs numbered and counted, increase the default value of secnumdepth to 4

\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {\thesection.\space} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {6pt}

\titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {\thesubsection.\space} {0pt} {}
\titlespacing {\subsection} {0pt} {12pt} {6pt}

\titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {\thesubsubsection.\space} {0pt} {}
\titlespacing {\subsubsection} {0pt} {12pt} {6pt}

\titleformat {\paragraph} [block] {\raggedright \fontsize{10}{10}\selectfont} {} {0pt} {}
\titlespacing {\paragraph} {0pt} {12pt} {6pt}

%%%% Special section title style for back matter
\newcommand{\supplementary}[1]{
\par\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Supplementary Materials:} {#1}\par}}

\newcommand{\acknowledgments}[1]{
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Acknowledgments:} {#1}\par}}

\newcommand{\authorcontributions}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Author Contributions:} {#1}\par}}

\newcommand{\funding}[1]{
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Funding:} {#1}\par}}

\newcommand{\conflictsofinterest}[1]{%
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Conflicts of Interest:} {#1}\par}}

\newcommand{\conflictofinterest}[1]{% Backwards compatibility for book prodcution
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Conflicts of Interest:} {#1}\par}}

\newcommand{\conflictofinterests}[1]{% Backwards compatibility for book prodcution
\vspace{6pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Conflicts of Interest:} {#1}\par}}

\newcommand{\sampleavailability}[1]{%
\vspace{12pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Sample Availability:} {#1}\par}}

\newcommand{\reviewreports}[1]{%
\vspace{12pt}\noindent{\fontsize{9}{9}\selectfont\textbf{Review Reports:} {#1}\par}}

\newcommand{\abbreviations}[1]{%
\vspace{12pt}\noindent{\selectfont\textbf{Abbreviations}\par\vspace{6pt}\noindent {\fontsize{9}{9}\selectfont #1}\par}}

%%%%% Defines the appendix
\def\@appendixtitles{}
\newcommand{\appendixtitles}[1]{\gdef\@appendixtitles{#1}}

\def\@appendixsections{}
\newcommand{\appendixsections}[1]{\gdef\@appendixsections{#1}}

\renewcommand{\appendix}{%
\setcounter{section}{0}%
\setcounter{subsection}{0}%
\setcounter{subsubsection}{0}%
%
\gdef\thesection{\@Alph\c@section}%
\gdef\thesubsection{\@Alph\c@section.\@arabic\c@subsection}%
%	
\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesection.%
		}{%
		\appendixname~\thesection~%
		}
	} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {6pt}
%
\titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesubsection.%
		}{%
		\appendixname~\thesubsection%
		}
	} {0pt} {}
\titlespacing {\subsection} {0pt} {12pt} {6pt}
%
\titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {%
	\ifthenelse{\equal{\@appendixtitles}{yes}}{%
		\appendixname~\thesubsubsection.%
		}{%
		\appendixname~\thesubsubsection%
		}
	} {0pt} {}
\titlespacing {\subsubsection} {0pt} {12pt} {6pt}
%
\gdef\theHsection{\@Alph\c@section.}% for hyperref
\gdef\theHsubsection{\@Alph\c@section.\@arabic\c@subsection}% for hyperref
\csname appendixmore\endcsname
\renewcommand{\thefigure}{A\arabic{figure}}
\setcounter{figure}{0}
\renewcommand{\thetable}{A\arabic{table}}
\setcounter{table}{0}
\renewcommand{\thescheme}{A\arabic{scheme}}
\setcounter{scheme}{0}
\renewcommand{\thechart}{A\arabic{chart}}
\setcounter{chart}{0}
\renewcommand{\theboxenv}{A\arabic{boxenv}}
\setcounter{boxenv}{0}
\renewcommand{\theequation}{A\arabic{equation}}
\setcounter{equation}{0}
\renewcommand{\thetheorem}{A\arabic{theorem}}
\setcounter{theorem}{0}
\renewcommand{\thelemma}{A\arabic{lemma}}
\setcounter{lemma}{0}
\renewcommand{\thecorollary}{A\arabic{corollary}}
\setcounter{corollary}{0}
\renewcommand{\theproposition}{A\arabic{proposition}} 
\setcounter{proposition}{0} 
\renewcommand{\thecharacterization}{A\arabic{characterization}}
\setcounter{characterization}{0} 
\renewcommand{\theproperty}{A\arabic{property}}
\setcounter{property}{0} 
\renewcommand{\theproblem}{A\arabic{problem}}
\setcounter{problem}{0} 
\renewcommand{\theexample}{A\arabic{example}}
\setcounter{example}{0} 
\renewcommand{\theexamplesanddefinitions}{A\arabic{examplesanddefinitions}}
\setcounter{examplesanddefinitions}{0} 
\renewcommand{\theremark}{A\arabic{remark}}
\setcounter{remark}{0} 
\renewcommand{\thedefinition}{A\arabic{definition}}
\setcounter{definition}{0} 
\renewcommand{\thehypothesis}{A\arabic{hypothesis}}
\setcounter{hypothesis}{0}
\renewcommand{\thenotation}{A\arabic{notation}}
\setcounter{notation}{0}
}

%%%% Layout
\ifthenelse{\equal{\@arttype}{Book}}{%%
	\RequirePackage[left=2.05cm,
					right=2.05cm,
					top=2.05cm,
					bottom=2.05cm,
					paperwidth=170mm,
					paperheight=244mm,
					includehead, 
					includefoot]{geometry}
	}{
	\RequirePackage[left=2.7cm,
				right=2.7cm,
				top=1.8cm,
				bottom=1.5cm,
				includehead,
				includefoot]{geometry}
	}

\linespread{1.13} 
\setlength{\parindent}{0.75cm}

%%%% Figures and tables
\RequirePackage{newfloat}
\DeclareFloatingEnvironment[]{listing}
\DeclareFloatingEnvironment[name=Box]{boxenv}	
\DeclareFloatingEnvironment[]{chart}
\DeclareFloatingEnvironment[]{scheme}

\RequirePackage{caption} 
\captionsetup[figure]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, justification=justified}

\captionsetup[scheme]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, justification=justified}

\captionsetup[listing]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17},  aboveskip=6pt, justification=justified}

\captionsetup[chart]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=-6pt, justification=justified}

\captionsetup[table]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, justification=justified}

\captionsetup[boxenv]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt,justification=justified}



%% For table footnotes
\newsavebox{\@justcentbox}
\newcommand{\justifyorcenter}[1]{
\sbox \@justcentbox{#1}
\ifdim \wd \@justcentbox >\hsize #1
\else \centerline{#1} \fi
}

%%%% Bullet lists
\newlength{\wideitemsep}
\setlength{\wideitemsep}{.5\itemsep}
\addtolength{\wideitemsep}{-7pt}
\let\olditem\item
\renewcommand{\item}{\setlength{\itemsep}{\wideitemsep}\olditem}

%%%% Quote environment
\patchcmd{\quote}{\rightmargin}{\leftmargin 0.75cm \rightmargin}{}{}

%%%% Supplementary file
\ifthenelse{\equal{\@arttype}{Supfile}}{
	\renewcommand{\thefigure}{S\arabic{figure}}%
	\renewcommand{\thetable}{S\arabic{table}}%
	}{}%

%% Link to supplementary material: www.mdpi.com/ISSN-number/volume-number/issue-number/article-number	
\newcommand{\linksupplementary}[1]{\url{http://www.mdpi.com/\@ISSN/\@pubvolume/\@issuenum/\@articlenumber/#1}}

%%%% Header and footer (all pages except the first)
\renewcommand\headrule{} %% set line (from fancyhdr) in header to nothing
\pagestyle{fancy}
\lhead{
	\ifthenelse{\equal{\@journal}{preprints}%
	\OR \equal{\@arttype}{Book}}{%
		}{%
		\fontsize{8}{8}\selectfont%
		\ifthenelse{\equal{\@status}{submit}}{%
			Version {\@ \today} submitted to {\em \journalname}%
			}{%
			\ifthenelse{\equal{\@arttype}{Supfile}}{%
			{\em \journalname} {\bfseries \@pubyear}, {\em \@pubvolume} %
			%\ifthenelse{\equal{\@articlenumber}{}}{%
			%\@firstpage --\pageref*{LastPage}%
			%}{\@articlenumber}%
			; doi:{\changeurlcolor{black}%
        					\href{http://dx.doi.org/\@doinum}%
        					{\@doinum}}%
			}{%
			{\em\journalname\ }{\bfseries\@pubyear}, {\em \@pubvolume}%
			\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
			, \@articlenumber%
			}{%
			}%
			}%
			}%
		}%
	}
	
\rhead{%
\ifthenelse{\equal{\@arttype}{Book}}{}{%
	\ifthenelse{\equal{\@arttype}{Supfile}}{%
		\fontsize{8}{8}\selectfont S\thepage{} of S\pageref*{LastPage}%
		}{%
		\ifthenelse{\equal{\@continuouspages}{\@empty}}{%
			\fontsize{8}{8}\selectfont\thepage{} of \pageref*{LastPage}%
			}{%
			\fontsize{8}{8}\selectfont\thepage%{} of \pageref*{LastPage}%
		}%
		}%
	}%
}

\cfoot{
	\ifthenelse{\equal{\@arttype}{Book}}{%
		\fontsize{8}{8}\selectfont\thepage
		}{%
	}
}


%%%% Bibliography
\renewcommand\bibname{References} % Backwards compatibility for book production
\renewcommand\@biblabel[1]{#1.\hfill}
\def\thebibliography#1{
\linespread{1.44} 
\section*{\@reftitle}
\addcontentsline{toc}{section}{References}
\fontsize{9}{9}\selectfont
\list{{\arabic{enumi}}}{\def\makelabel##1{\hss{##1}}
\topsep=0\p@
\parsep=5\p@
\partopsep=0\p@
\itemsep=0\p@
\labelsep=1.5mm
\ifthenelse{\equal{\@journal}{admsci}
\OR \equal{\@journal}{arts}
\OR \equal{\@journal}{econometrics}
\OR \equal{\@journal}{economies}
\OR \equal{\@journal}{genealogy}
\OR \equal{\@journal}{humanities}
\OR \equal{\@journal}{ijfs}
\OR \equal{\@journal}{jrfm}
\OR \equal{\@journal}{languages}
\OR \equal{\@journal}{laws}
\OR \equal{\@journal}{religions}
\OR \equal{\@journal}{risks}
\OR \equal{\@journal}{socsci}}{%
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

%%%% Copyright info
\newcommand{\cright}{%
        \ifthenelse{\equal{\@arttype}{Supfile} \OR \equal{\@journal}{preprints}}{%
		}{%
		\vspace{12pt}
		\noindent
		\linespread{1.44} 
		\fontsize{9}{9}\selectfont 
		\ifthenelse{\equal{\@status}{submit}}{
			\noindent \copyright{} {\@ \the\year} by the \@authornum. %
			Submitted to {\em \journalname} for %
			possible open access publication %
			under the terms and conditions of the Creative Commons Attribution %
			\ifthenelse{\equal{\@journal}{ijtpp}}{NonCommercial NoDerivatives (CC BY-NC-ND)}{(CC BY)} %
			license %
			\ifthenelse{\equal{\@journal}{ijtpp}}{
			(\changeurlcolor{black}%
			\href{https://creativecommons.org/licenses/by-nc-nd/4.0/.}%
			{https://creativecommons.org/licenses/by-nc-nd/4.0/}).%
			}{%
			(\changeurlcolor{black}%
			\href{http://creativecommons.org/licenses/by/4.0/.}%
			{http://creativecommons.org/licenses/by/4.0/}).}
			}{
			\begin{minipage}{.2\textwidth}
				\hspace{-1.2mm}%
				\vspace{2mm}%
				\href{http://creativecommons.org/}{%
				\ifthenelse{\equal{\@journal}{ijtpp}}{%
					\includegraphics[width=0.94\textwidth]{logo-ccby-nc-nd.eps}%
					}{%
					\includegraphics[width=0.94\textwidth]{logo-ccby.pdf}
					}
				}
			\end{minipage}%
			\begin{minipage}{.79\textwidth}
				\copyright \ {\@copyrightyear} by the \@authornum. %
				Licensee MDPI, Basel, Switzerland. %
				This article is an open access article %
				distributed under the terms and conditions %
				of the Creative Commons Attribution %
				\ifthenelse{\equal{\@journal}{ijtpp}}{NonCommercial NoDerivatives (CC BY-NC-ND)}{(CC BY)} %
				license %
				\ifthenelse{\equal{\@journal}{ijtpp}}{
				(\changeurlcolor{black}%
				\href{https://creativecommons.org/licenses/by-nc-nd/4.0/.}%
				{https://creativecommons.org/licenses/by-nc-nd/4.0/}).%
				}{%
				(\changeurlcolor{black}%
				\href{http://creativecommons.org/licenses/by/4.0/.}%
				{http://creativecommons.org/licenses/by/4.0/}).}
				\end{minipage}
			}
		}
	}
	

\endinput