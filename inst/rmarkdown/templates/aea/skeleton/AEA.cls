%% AEA.cls: American Economic Association Article Document Class
%% ===========================================================================
\def\lastrev{2011/07/24}
%% Author: 
%%    Dr. Melissa Rice, Ph.D.
%%    Full Moon Technical Solutions, LLC
%%    14202 60th Ave NW
%%    Stanwood, WA 98292-4808,  USA
%%    melissa@fmtek.net
%%    voice: +1 (360) 654-0709 Pacific Time Zone (GMT-7 or -8)
%%    cell:  +1 (425) 923-7713
%%
%% Copyright 2007-2011 Melissa Rice, Full Moon Technical Solutions, LLC (dba FMTek, LLC)
%% 

% ==============================================================================
%                                                           Class ID and Options
% ==============================================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{AEA}[\lastrev \space American Economic Association Article Classes]
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage[leqno]{amsmath}

% default settings
\@twosidefalse  
\@twocolumnfalse
\newif\if@restonecol
\newif\if@PP \@PPfalse
\newif\if@JEL \@JELfalse
\newif\if@JEP \@JEPfalse
\newif\if@AEJ \@AEJfalse
\newif\if@draftmode \@draftmodefalse
\newif\if@reviewmode \@reviewmodefalse
\def\droparg#1{} 


% Journal Options
\def\@issueName{No Journal Selected}

\DeclareOption{AER}{
  % AER is the default if no journal is specified
  \def\@issueName{THE AMERICAN ECONOMIC REVIEW}
  \@twosidetrue  
  \@twocolumnfalse
}

\DeclareOption{PP}{
  \def\@issueName{PAPERS AND PROCEEDINGS}
  \@twosidetrue  
  \@twocolumntrue
  \@PPtrue
}

\DeclareOption{JEL}{
  \def\@issueName{JOURNAL OF ECONOMIC LITERATURE}
  \@twosidetrue  
  \@twocolumntrue
  \@JELtrue
}

\DeclareOption{JEP}{
  \def\@issueName{JOURNAL OF ECONOMIC PERSPECTIVES}
  \@twosidetrue  
  \@twocolumnfalse
  \@JEPtrue
}

\DeclareOption{AEJ}{
  \def\@issueName{AMERICAN ECONOMIC JOURNAL}
  \@twosidetrue  
  \@twocolumnfalse
  \@AEJtrue
}

% double spacing and other options
\def\@spacingStretch{1}
\def\spacingStretch#1{\gdef\@spacingStretch{#1}}
\def\@draftSpacing{1}
\def\draftSpacing#1{\gdef\@draftSpacing{#1}}
\def\setDocumentSpacing{\let\@currsize\normalsize
  \if@draftmode\spacingStretch{\@draftSpacing}\fi
  \setstretch{\@spacingStretch}
}
\AtBeginDocument{\setDocumentSpacing
  \if@draftmode\overfullrule=3pt\else\overfullrule=0pt\fi
%  As of July 2011 the authors are no longer concealed in the review copy
%  \if@reviewmode
%    \def\author#1{\gdef\@author{Author Undisclosed}}
%  \fi
  \@ifundefined{harvardand}{}{\renewcommand{\harvardand}{and}}
} 

% Draft options 
\DeclareOption{draftmode}{
  \def\mode{draft}
  \@draftmodetrue
}
\DeclareOption{reviewmode}{
  \def\mode{review}
  \@twocolumnfalse
  \spacingStretch{1.5}
  \@reviewmodetrue
}
\DeclareOption{finalmode}{
  \def\mode{final}
  \spacingStretch{1}
}

% Default Options
\ExecuteOptions{AER,finalmode}
\ProcessOptions

\typeout{Journal Selected: \@issueName}
\typeout{Mode Selected: \mode}

\long\def\acknowledgement#1\end{\endgroup\xacknowledgement{#1}\droparg}
\long\def\xacknowledgement#1{\if@reviewmode\else\if@JEP\par\noindent\rule{4pt}{4pt}\ 
  #1\par\vskip\baselineskip\else\par \textbf{Please put acknowledgements in the author footnote in this style.}\par\fi\fi}
 
% ==============================================================================
%                                                                          Fonts
% ==============================================================================
\DeclareFontFamily{T1}{cmr}{}
\DeclareFontShape{T1}{cmr}{m}{n}{%
      <5><6><7><8><9>gen*dcr%
      <10><10.7><11>dcr10%
      <12><14><15><16>dcr12%
      <20>dcr17}{}
\DeclareFontShape{T1}{cmr}{m}{sl}{%
      <5><6><7><8>dcsl8%
      <9>dcsl9%
      <10><10.7><11>dcsl10%
      <12><144><15><16>dcsl12%
      <20>dcsl17%
      }{}
\DeclareFontShape{T1}{cmr}{m}{it}{%
      <5><6>dcti7%
      <7><8><9>gen*dcti%
      <10><10.7><11>dcti10%
      <12><14><15><16>dcti12%
      <20>dcti17%
      }{}
\DeclareFontShape{T1}{cmr}{m}{sc}{%
      <5><6><7><8><9><10><10.7><11>dccsc10%
      <12><14><15><16>dccsc12%
      <20>dccsc17%
      }{}
\DeclareFontShape{T1}{cmr}{m}{ui}{%
      <5><6>dcu7%
      <7><8><9>gen*dcu%
      <10><10.7><11>dcu10%
      <12><14><15><16>dcu12%
      <20>dcu17%
      }{}
\DeclareFontShape{T1}{cmr}{b}{n}{%
      <5><6><7><8><9>gen*dcb%
      <10><10.7><11>dcb10%
      <12><14><15><16>dcb12%
      <20>dcb17%
      }{}
\DeclareFontFamily{T1}{cmss}{}
\DeclareFontShape{T1}{cmss}{m}{n}{%
      <5><6><7><8>dcss8%
      <9>dcss9%
      <10><10.7><11>dcss10%
      <12><14><15><16>dcss12%
      <20>dcss17%
      }{}
\DeclareFontShape{T1}{cmss}{m}{it}%
      {<->sub*cmss/m/sl}{}
\DeclareFontShape{T1}{cmss}{m}{sl}{%
      <5><6><7><8>dcssi8%
      <9>dcssi9%
      <10><10.7><11>dcssi10%
      <12><14><15><16>dcssi12%
      <20>dcssi17%
      }{}
\DeclareFontShape{T1}{cmss}{bx}{n}{%
      <5><6><7><8><9><10><10.7><11><12><14><15><16><20>dcssbx10%
      }{}


\newcommand\FivePtType{\@setfontsize\FivePtType\@vpt\@vipt}
\newcommand\SixPtType{\@setfontsize\SixPtType\@vipt\@viipt}
\newcommand\EightPtClose{\@setfontsize\EightPtClose\@viiipt{9}}
\newcommand\EightPtType{\@setfontsize\EightPtType\@viiipt{10}}
\newcommand\NinePtClose{\@setfontsize\NinePtClose\@ixpt{10}}
\newcommand\NinePtType{\@setfontsize\NinePtType\@ixpt{11}}
\newcommand\TenPtClose{\@setfontsize\TenPtClose\@xpt\@xipt}
\newcommand\TenPtType{\@setfontsize\TenPtType\@xpt\@xiipt}
\newcommand\TenPtJEL{\@setfontsize\TenPtJEL{10.5}{12}}
\newcommand\TenPtPlusType{\@setfontsize\TenPtPlusType{10.7}{12.5}}
\newcommand\TenPtLoose{\@setfontsize\TenPtLooseType\@xpt{13}}
\newcommand\ElevenPtClose{\@setfontsize\ElevenPtClose\@xipt{12}}
\newcommand\ElevenPtType{\@setfontsize\ElevenPtType\@xipt{13}}
\newcommand\ElevenPtLoose{\@setfontsize\ElevenPtLoose\@xipt{14}}
\newcommand\TwelvePtClose{\@setfontsize\TwelvePtClose\@xiipt{13}}
\newcommand\TwelvePtType{\@setfontsize\TwelvePtType\@xiipt{14.4}}
\newcommand\FourteenPtType{\@setfontsize\FourteenPtType{14}{16.8}}
\newcommand\FourteenPtLoose{\@setfontsize\FourteenPtLoose{14}{18}}
\newcommand\FifteenPtType{\@setfontsize\FifteenPtType{15}{18}}
\newcommand\SixteenPtType{\@setfontsize\SixteenPtType{16}{19.2}}
\newcommand\SixteenPtClose{\@setfontsize\SixteenPtCLose{16}{18}}
\newcommand\TwentyPtType{\@setfontsize\TwentyPtType{20}{24}}
\newcommand\TwentyFourPtTight{\@setfontsize\TwentyFourPtTight{24}{24}}


\newcommand\small{\EightPtType}
\newcommand\scriptsize{\NinePtType}
\newcommand\tiny{\FivePtType}
\newcommand\large{\TenPtType}
\newcommand\Large{\ElevenPtType}
\newcommand\LARGE{\TwelvePtType}
\newcommand\huge{\FourteenPtType}
\newcommand\Huge{\SixteenPtType}

% default footnotesize
\newcommand\footnotesize{%
  \TenPtClose%
  \abovedisplayskip 8\p@ \@plus2\p@ \@minus3\p@
  \abovedisplayshortskip \z@ \@plus1\p@
  \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
  \def\@listi{\leftmargin\leftmargini
    \topsep 3\p@ \@plus1\p@ \@minus1\p@
    \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}

% AER fonts and default settings
\if@reviewmode
\renewcommand\normalsize{%
  \TwelvePtType
  \abovedisplayskip 12\p@ \@plus1\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 6\p@ \@plus2\p@ \@minus2\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\renewcommand\footnotesize{%
  \TenPtClose%
  \abovedisplayskip 8\p@ \@plus2\p@ \@minus3\p@
  \abovedisplayshortskip \z@ \@plus1\p@
  \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
  \def\@listi{\leftmargin\leftmargini
    \topsep 3\p@ \@plus1\p@ \@minus1\p@
    \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}
\def\titlesize{\FourteenPtType} 
\def\authorsize{\TwelvePtType} 
\def\captionsize{\TenPtType}
\def\headsize{\TenPtType}
\def\sectionsize{\TwelvePtType}
\def\subsectionsize{\sectionsize}
\def\abstractbodysize{\TwelvePtType}
\def\notesize{\TenPtType}
\else  
\renewcommand\normalsize{%
  \ElevenPtType
  \abovedisplayskip 11\p@ \@plus1\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 5\p@ \@plus2\p@ \@minus2\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\renewcommand\footnotesize{%
  \EightPtClose%
  \abovedisplayskip 7\p@ \@plus2\p@ \@minus3\p@
  \abovedisplayshortskip \z@ \@plus1\p@
  \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
  \def\@listi{\leftmargin\leftmargini
    \topsep 3\p@ \@plus1\p@ \@minus1\p@
    \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
    \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}
\def\titlesize{\FourteenPtLoose} 
\def\authorsize{\ElevenPtType} 
\def\captionsize{\EightPtClose}
\def\headsize{\EightPtType}
\def\sectionsize{\TenPtLoose}
\def\subsectionsize{\ElevenPtType}
\def\abstractbodysize{\ElevenPtClose}
\def\notesize{\EightPtClose}
\fi  

\if@PP
  \renewcommand\normalsize{%
    \TenPtPlusType
    \abovedisplayskip 11\p@ \@plus1\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus2\p@
    \belowdisplayshortskip 5\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\footnotesize{%
    \EightPtType%
    \abovedisplayskip 7\p@ \@plus2\p@ \@minus3\p@
    \abovedisplayshortskip \z@ \@plus1\p@
    \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
    \def\@listi{\leftmargin\leftmargini
      \topsep 3\p@ \@plus1\p@ \@minus1\p@
      \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
      \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\small{\EightPtType}
  \renewcommand\scriptsize{\NinePtType}
  \renewcommand\tiny{\FivePtType}
  \renewcommand\large{\TenPtType}
  \renewcommand\Large{\ElevenPtType}
  \renewcommand\LARGE{\TwelvePtType}
  \renewcommand\huge{\FourteenPtType}
  \renewcommand\Huge{\SixteenPtType}
  \def\titlesize{\FifteenPtType} 
  \def\authorsize{\TenPtType} 
  \def\headsize{\EightPtType}
  \def\sectionsize{\TenPtType}
  \def\abstractbodysize{\TenPtClose}
  \def\notesize{\EightPtClose}
\fi

\if@JEL
  \renewcommand\normalsize{%
    \TenPtJEL
    \abovedisplayskip 12\p@ \@plus1\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus2\p@
    \belowdisplayshortskip 5\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\footnotesize{%
    \EightPtClose%
    \abovedisplayskip 7\p@ \@plus2\p@ \@minus3\p@
    \abovedisplayshortskip \z@ \@plus1\p@
    \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
    \def\@listi{\leftmargin\leftmargini
      \topsep 3\p@ \@plus1\p@ \@minus1\p@
      \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
      \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\small{\EightPtType}
  \renewcommand\scriptsize{\NinePtType}
  \renewcommand\tiny{\FivePtType}
  \renewcommand\large{\TenPtType}
  \renewcommand\Large{\ElevenPtType}
  \renewcommand\LARGE{\TwelvePtType}
  \renewcommand\huge{\FourteenPtType}
  \renewcommand\Huge{\SixteenPtType}
  \def\titlesize{\TwentyFourPtTight} 
  \def\authorsize{\ElevenPtLoose} 
  \def\headsize{\EightPtType}
  \def\captionsize{\NinePtClose}
  \def\sectionsize{\TenPtJEL}
  \def\subsectionsize{\TenPtJEL}
  \def\abstractbodysize{\TenPtJEL}
  \def\notesize{\EightPtClose} % no table notes in this style, officially
\fi

\if@JEP
  \renewcommand\normalsize{%
    \TenPtLoose
    \abovedisplayskip 13\p@ \@plus1\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus2\p@
    \belowdisplayshortskip 5\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\footnotesize{%
    \EightPtType%
    \abovedisplayskip 7\p@ \@plus2\p@ \@minus3\p@
    \abovedisplayshortskip \z@ \@plus1\p@
    \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
    \def\@listi{\leftmargin\leftmargini
      \topsep 3\p@ \@plus1\p@ \@minus1\p@
      \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
      \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\small{\EightPtType}
  \renewcommand\scriptsize{\NinePtType}
  \renewcommand\tiny{\FivePtType}
  \renewcommand\large{\TenPtType}
  \renewcommand\Large{\ElevenPtType}
  \renewcommand\LARGE{\TwelvePtType}
  \renewcommand\huge{\FourteenPtType}
  \renewcommand\Huge{\SixteenPtType}
  \def\titlesize{\TwentyPtType} 
  \def\authorsize{\SixteenPtClose} 
  \def\headsize{\EightPtType}
  \def\captionsize{\TenPtLoose}
  \def\sectionsize{\TwelvePtClose}
  \def\subsectionsize{\TenPtLoose}
  \def\abstractbodysize{\TenPtClose} % no abstract for this journal
  \def\notesize{\EightPtType}
\fi

\if@AEJ
  \renewcommand\normalsize{%
    \ElevenPtType
    \abovedisplayskip 13\p@ \@plus1\p@ \@minus4\p@
    \abovedisplayshortskip \z@ \@plus2\p@
    \belowdisplayshortskip 5\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
  \normalsize
  \renewcommand\footnotesize{%
    \EightPtClose%
    \abovedisplayskip 7\p@ \@plus2\p@ \@minus3\p@
    \abovedisplayshortskip \z@ \@plus1\p@
    \belowdisplayshortskip 3\p@ \@plus1\p@ \@minus1\p@
    \def\@listi{\leftmargin\leftmargini
      \topsep 3\p@ \@plus1\p@ \@minus1\p@
      \parsep 1\p@ \@plus0.5\p@ \@minus0.5\p@
      \itemsep \parsep}%
    \belowdisplayskip \abovedisplayskip
  }
  \renewcommand\small{\EightPtType}
  \renewcommand\scriptsize{\NinePtType}
  \renewcommand\tiny{\FivePtType}
  \renewcommand\large{\TenPtType}
  \renewcommand\Large{\ElevenPtType}
  \renewcommand\LARGE{\TwelvePtType}
  \renewcommand\huge{\FourteenPtType}
  \renewcommand\Huge{\SixteenPtType}
  \def\titlesize{\FourteenPtLoose} 
  \def\authorsize{\ElevenPtType} 
  \def\headsize{\EightPtType}
  \def\captionsize{\EightPtClose}
  \def\sectionsize{\TenPtLoose}
  \def\subsectionsize{\ElevenPtType}
  \def\abstractbodysize{\ElevenPtClose}
  \def\notesize{\EightPtClose}
\fi

\normalsize

% obsolete markup
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

% ==============================================================================
%                                                                         Layout
% ==============================================================================

% paper size
\setlength\paperheight{11in}
\setlength\paperwidth{8.5in}

% AER is default
% margins 
\setlength\textwidth{135.5mm}
\setlength\textheight{200mm}
\setlength\topmargin{-10pt}
\setlength\oddsidemargin{14mm}
\setlength\evensidemargin{\oddsidemargin}
\setlength\headheight{24pt}
\setlength\headsep   {14pt}
\setlength\topskip   {11.74pt}
\setlength\maxdepth{.5\topskip}
\setlength\footskip{15pt}
% two column settings
\setlength\columnsep{\z@}
\setlength\columnseprule{\z@}
% line and paragraph stuff
\setlength\parskip{0\p@ \@plus1\p@}
\setlength\parindent{10pt}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
% skips
\def\abovetitleskip{-26pt}


\if@PP
  % margins
  \setlength\textwidth{151mm}
  \setlength\textheight{229mm}
  \setlength\topmargin{-14mm}
  \setlength\oddsidemargin{7mm}
  \setlength\evensidemargin{\oddsidemargin}
  \setlength\headheight{24pt}
  \setlength\headsep   {14pt}
  \setlength\topskip   {11.74pt}
  \setlength\maxdepth{.5\topskip}
  \setlength\footskip{15pt}
  % two column settings
  \setlength\columnsep{6.5mm}
  \setlength\columnseprule{\z@}
\fi

\if@JEL
  % margins
  \setlength\textwidth{141.8mm}
  \setlength\textheight{200mm}
  \setlength\topmargin{-10pt}
  \setlength\oddsidemargin{12mm}
  \setlength\evensidemargin{\oddsidemargin}
  \setlength\headheight{24pt}
  \setlength\headsep   {14pt}
  \setlength\topskip   {11.74pt}
  \setlength\maxdepth{.5\topskip}
  \setlength\footskip{15pt}
  % two column settings
  \setlength\columnsep{18\p@}
  \setlength\columnseprule{\z@}
\fi

\if@JEP
  % margins
  \setlength\textwidth{127mm}
  \setlength\textheight{202mm}
  \setlength\topmargin{-10pt}
  \setlength\oddsidemargin{18.6mm}
  \setlength\evensidemargin{\oddsidemargin}
  \setlength\headheight{24pt}
  \setlength\headsep   {14pt}
  \setlength\topskip   {11.74pt}
  \setlength\maxdepth{.5\topskip}
  \setlength\footskip{15pt}
  \setlength\parindent{2em}
\fi

% skips
\def\abovetitleskip{-26pt}

% penalties
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\if@draftmode
   \def\@issueName{}
\fi

% head and foot
\def\ps@titlepage{
  \leftskip=6pt\rightskip=\leftskip
  \def\@oddfoot{\hfil{\small\textit{\thepage}}\hfil}
  \let\@evenfoot\@oddfoot
  \let\@oddhead\@empty
  \let\@evenhead\@empty
}
\def\ps@headings{
  \leftskip=0pt\rightskip=0pt
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \def\@oddhead{{\small\textit{\MakeUppercase{VOL. \@pubVolume\ \ NO. \@pubIssue\hfil\@shortTitle\hfil\thepage}}}}
  \def\@evenhead{{\small\textit{\MakeUppercase{\thepage\hfil\@issueName\hfil\@pubMonth\ \@pubYear}}}}
}

\if@JEP
\def\ps@headings{
  \leftskip=0pt\rightskip=0pt
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  \def\@oddhead{{\small\textit{\MakeUppercase{\hfil\@shortTitle\hfil\thepage}}}}
  \def\@evenhead{{\small\textit{\MakeUppercase{\thepage\hfil\@issueName\hfil}}}}
}
\fi

\pagestyle{headings}
\thispagestyle{titlepage}
\pagenumbering{arabic}

% justification
\if@twoside
  \flushbottom
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

% margin notes ??? do we want these at all?
\setlength\marginparsep {0\p@}
\setlength\marginparpush{0\p@}
\setlength\marginparwidth {0\p@}
\if@twoside
  \@mparswitchfalse 
\else
  \@mparswitchtrue % margin notes to the outside 
\fi



% ==============================================================================
%                                                      PDF Document Info Section
% ==============================================================================

% Note: file location is produced in review mode anyway, despite code below.

\def\extendedVersion{TeX: AEA.cls \lastrev \ (\mode mode) \ \@issueName}

\@ifundefined{pdfinfo}{}{\pdfinfo{ /Creator (\extendedVersion)}}

% As of July 2011 the authors are no longer concealed in the review copy
%\@ifundefined{pdfinfo}{}{
%\if@reviewmode
%\pdfinfo
%{ /Title ()
%/Location ()
%/Creator (\extendedVersion)}
%\else
%\pdfinfo
%{ /Creator (\extendedVersion)}
%\fi}

% ==============================================================================
%                                                                    Frontmatter
% ==============================================================================

% document variables
\def\issueName#1{\gdef\@issueName{#1}}

% blank
\long\gdef\@blank{}

% JEL Classifications
\long\gdef\@JEL{}
\long\def\JEL#1{\long\gdef\@JEL{#1}}

% Keywords
\long\gdef\@Keywords{}
\long\def\Keywords#1{\long\gdef\@Keywords{#1}}

% Publication Data
\long\gdef\@pubYear{Year}
\long\def\pubYear#1{\long\gdef\@pubYear{#1}}

\long\gdef\@pubMonth{Month}
\long\def\pubMonth#1{\long\gdef\@pubMonth{#1}}

\long\gdef\@pubVolume{Volume}
\long\def\pubVolume#1{\long\gdef\@pubVolume{#1}}

\long\gdef\@pubIssue{Issue}
\long\def\pubIssue#1{\long\gdef\@pubIssue{#1}}

% draft date (revision date in draft mode)
\def\draftDate{\if@draftmode\vspace{12pt}\begin{center}Draft: \@date\end{center}\par
\else\relax\fi}

% abstract
\def\droparg#1{} 
\long\def\abstract#1\end{\endgroup\xabstract{#1}\droparg}
\long\gdef\@abstract{Your abstract here, please.}
\long\def\xabstract#1{\long\gdef\@abstract{#1}}

\def\@shortTitle{\@title}
\def\shortTitle#1{\gdef\@shortTitle{#1}}

% frontmatter

\newcommand\maketitle{
  {\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@2.0em{%
                \hss\@textsuperscript{\normalfont\@thefnmark\rule{0.5em}{0pt}}}##1}%
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
    \@thanks
  }
  \setcounter{footnote}{0}%
  \renewcommand\thefootnote{\@arabic\c@footnote}%
}

% Frontmatter for AER (default) 
\newlength\abstractIndent
\newlength\abstractWidth
\setlength{\abstractIndent}{36pt}
\setlength{\abstractWidth}{\textwidth}
\addtolength{\abstractWidth}{-2\abstractIndent}
\newcommand\@maketitle{%
  \pagestyle{headings}
  \thispagestyle{titlepage}
  \begin{@twocolumnfalse}
    \begin{center}%
      \null\vskip\abovetitleskip
      {\titlesize\sffamily\textbf{\@title} \par}%
      \vskip 16pt%
      {\authorsize\textit{By \ }\textsc{\@author}\par}
      \draftDate
      \vskip 24pt%
    \end{center}%
  \gdef\@JELKey{
    \ifx\@JEL\@blank\else \par JEL: \@JEL\par \fi
    \ifx\@Keywords\@blank\else Keywords: \@Keywords\par \fi}
% these lines not indented to prevent unwanted space	  
\noindent{\abstractbodysize\itshape\hspace{\abstractIndent}
\parbox{\abstractWidth}{\noindent\@abstract\@JELKey\par}}
    \vskip 24pt%
  \end{@twocolumnfalse}
  \par
}

\if@PP
  \renewcommand\@maketitle{%
    \pagestyle{headings}
    \thispagestyle{titlepage}
    \begin{@twocolumnfalse}
      \begin{center}%
        \null\vskip\abovetitleskip
        {\titlesize\sffamily\textbf{\@title} \par}%
        \vskip 16pt%
        {\authorsize\textit{By \ }\textsc{\@author}\par}
        \draftDate
        \vskip 24pt%
      \end{center}%
      \vskip 24pt%
    \end{@twocolumnfalse}
    \par
  }
\fi

\if@JEL
  \setlength{\abstractIndent}{36pt}
  \setlength{\abstractWidth}{\textwidth}
  \addtolength{\abstractWidth}{-2\abstractIndent}
  \renewcommand\@maketitle{%
    \pagestyle{headings}
    \thispagestyle{titlepage}
    \begin{@twocolumnfalse}
      \begin{center}%
        \null\vskip\abovetitleskip
        {\titlesize\sffamily\textbf{\@title} \par}%
        \vskip 16pt%
        {\authorsize\textsc{\@author}\par}
        \draftDate
        \vskip 24pt%
      \end{center}%
  \gdef\@JELKey{
    \ifx\@JEL\@blank\else \par JEL: \@JEL\par \fi
    \ifx\@Keywords\@blank\else Keywords: \@Keywords\par \fi}	  
% these two lines not indented to prevent unwanted space	  
\noindent{\abstractbodysize\itshape\hspace{\abstractIndent}
\parbox{\abstractWidth}{\noindent\@abstract\@JELKey\par}}
      \vskip 24pt%
    \end{@twocolumnfalse}
    \par
  }
\fi

\if@JEP
  \renewcommand\@maketitle{%
    \pagestyle{headings}
    \thispagestyle{titlepage}
    \begin{@twocolumnfalse}
      \null\vskip\abovetitleskip
      {\noindent\titlesize\sffamily\textbf{\@title} \par}%
      \vskip 16pt%
      {\noindent\authorsize \@author\par}
      \draftDate
      \vskip 24pt%
    \end{@twocolumnfalse}
    \par
  }
\fi



% ==============================================================================
%                                                                     Sectioning
% ==============================================================================

\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

% AER section numbering
\setcounter{secnumdepth}{2}
\renewcommand\thepart{\@Roman\c@part}
\renewcommand\thesection{\@Roman\c@section}
\renewcommand\thesubsection{\@Alph\c@subsection}
\renewcommand\thesubsubsection{\@arabic\c@subsubsection}
\renewcommand\theparagraph{\thesubsubsection}
\renewcommand\thesubparagraph{\thesubsubsection}
\renewcommand\p@subsection{\thesection.}
\renewcommand\p@subsubsection{\thesubsection.}
\renewcommand\p@paragraph{\thesubsubsection.}
\renewcommand\p@subparagraph{\theparagraph.}
\def\@seccntformat#1{\csname the#1\endcsname.\quad}

\if@PP
  \setcounter{secnumdepth}{2}
  \renewcommand\thepart{\@Roman\c@part}
  \renewcommand\thesection{\@Roman\c@section}
  \renewcommand\thesubsection{\@Alph\c@subsection}
  \renewcommand\thesubsubsection{\@arabic\c@subsubsection}
  \renewcommand\theparagraph{\thesubsubsection}
  \renewcommand\thesubparagraph{\thesubsubsection}
  \def\@seccntformat#1{\csname the#1\endcsname.\quad}
\fi

\if@JEL
  \setcounter{secnumdepth}{2}
  \renewcommand\thepart{\@Roman\c@part}
  \renewcommand\thesection{\@arabic\c@section}
  \renewcommand\thesubsection{\@arabic\c@subsection}
  \renewcommand\thesubsubsection{\@arabic\c@subsubsection}
  \renewcommand\theparagraph{\thesubsubsection}
  \renewcommand\thesubparagraph{\thesubsubsection}
  \def\@seccntformat#1{\csname the#1\endcsname.\quad}
\fi

\if@JEP
  \setcounter{secnumdepth}{-2}
  \renewcommand\thepart{\@Roman\c@part}
  \renewcommand\thesection{\@Roman\c@section}
  \renewcommand\thesubsection{\@Alph\c@subsection}
  \renewcommand\thesubsubsection{\@arabic\c@subsubsection}
  \renewcommand\theparagraph{\thesubsubsection}
  \renewcommand\thesubparagraph{\thesubsubsection}
  \def\@seccntformat#1{\csname the#1\endcsname.\quad}
\fi

\if@AEJ
  \setcounter{secnumdepth}{2}
  \renewcommand\thepart{\@Roman\c@part}
  \renewcommand\thesection{\@Roman\c@section}
  \renewcommand\thesubsection{\@Alph\c@subsection}
  \renewcommand\thesubsubsection{\@arabic\c@subsubsection}
  \renewcommand\theparagraph{\thesubsubsection}
  \renewcommand\thesubparagraph{\thesubsubsection}
  \def\@seccntformat#1{\csname the#1\endcsname.\quad}
\fi


% AER section skips
\def\abovesectionskip{11pt \@plus 2pt \@minus 2pt}
\def\belowsectionskip{11pt \@plus 2pt \@minus 2pt}
\def\abovesubsectionskip{\abovesectionskip}
\def\belowsubsectionskip{\belowsectionskip}
\def\abovesubsubsectionskip{\abovesectionskip}
\def\belowsubsubsectionskip{\belowsectionskip}
\def\subsubsectionindent{\z@}
\def\headingsuffix{}

\if@PP
  \def\abovesectionskip{11pt \@plus 2pt \@minus 2pt}
  \def\belowsectionskip{11pt \@plus 2pt \@minus 2pt}
  \def\subsubsectionindent{\z@}
\fi

\if@JEL
  \def\abovesectionskip{6pt \@plus 2pt \@minus 2pt}
  \def\belowsectionskip{6pt \@plus 2pt \@minus 2pt}
  \def\subsubsectionindent{\z@}
\fi

\if@JEP
  \def\abovesectionskip{26pt \@plus 4pt \@minus 4pt}
  \def\belowsectionskip{13pt \@plus 2pt \@minus 2pt}
  \def\abovesubsectionskip{13pt \@plus 2pt \@minus 2pt}
  \def\belowsubsectionskip{0pt \@plus 1pt \@minus 1pt}
  \def\abovesubsubsectionskip{13pt \@plus 2pt \@minus 2pt}
  \def\belowsubsubsectionskip{-0.01pt \@plus -0.1pt \@minus -0.1pt}
  \def\subsubsectionindent{\parindent}
\fi

\if@AEJ
  \def\abovesectionskip{13pt \@plus 2pt \@minus 2pt}
  \def\belowsectionskip{13pt \@plus 2pt \@minus 2pt}
  \def\belowsubsubsectionskip{-0.01pt \@plus -0.1pt \@minus -0.1pt}
  \def\subsubsectionindent{\z@}
\fi


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
       \Large\bfseries \partname\nobreakspace\thepart
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
      \@svsec #8\headingsuffix}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}%
}
	 
	 
\newcommand\section{%
\@startsection{section}{1}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\bfseries\sectionsize\center}}

\newcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
{\abovesubsectionskip}%
{\belowsubsectionskip}%
{\itshape\sectionsize\center}}

\newcommand\subsubsection{%
\def\headingsuffix{. ---\ }
\@startsection{subsubsection}{3}{\subsubsectionindent}%
{\abovesubsubsectionskip}%
{\belowsubsubsectionskip}%
{\scshape\sectionsize\center}}


% paragraph and subparagraph are not used - they are included for compatibility with hyperref.
%\newcommand\paragraph{%
%\@startsection{paragraph}{4}{\z@}%
%{\abovesectionskip}%
%{\belowsectionskip}%
%{\sectionsize\itshape\center}}

%\newcommand\subparagraph{%
%\@startsection{subparagraph}{4}{\z@}%
%{\abovesectionskip}%
%{\belowsectionskip}%
%{\sectionsize\upshape\center}}

\newcommand\paragraph{\subsubsection}
\newcommand\subparagraph{\subsubsection}

\def\appendixsectionstyle{\scshape\sectionsize\center}
\def\appendixsubsectionstyle{\itshape\sectionsize\center}
\def\captionstyle{\scshape}

\if@JEL
\renewcommand\section{%
\@startsection{section}{1}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\itshape\sectionsize\center}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\itshape}}
\def\captionstyle{\scshape}
\fi

\if@JEP
\renewcommand\section{%
\@startsection{section}{1}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\bfseries\sectionsize}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\bfseries\subsectionsize}}
\def\captionstyle{\bfseries\subsectionsize}
\fi

% ==============================================================================
%                                                          Package Compatibility
% ==============================================================================

\newcommand\tableofcontents{} 
% for compatibility with packages that overload this command

% ==============================================================================
%                                                                   Environments
% ==============================================================================

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
  {\list{}{\rightmargin\leftmargin}%
   \item\relax}
  {\endlist}



% ==============================================================================
%                                                                          Lists
% ==============================================================================

\setlength\partopsep{2\p@ \@plus1\p@ \@minus 1\p@}
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
\newcommand\labelenumi{\theenumi)}
\newcommand\labelenumii{\theenumii)}
\newcommand\labelenumiii{\theenumiii)}
\newcommand\labelenumiv{\theenumiv)}
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


% ==============================================================================
%                                                                      Equations
% ==============================================================================

\def\@eqnnum{\typeout{Equation: \theequation}\hb@xt@.01\p@{}%
                      \rlap{\normalfont\normalcolor
                        \hskip -\displaywidth(\theequation)}}

% ==============================================================================
%                                                            Minipage and Floats
% ==============================================================================


\setlength\floatsep{15\p@ \@plus 2\p@ \@minus 3\p@}
\setlength\textfloatsep{15\p@ \@plus 2\p@ \@minus 3\p@}
\setlength\intextsep{15\p@ \@plus 2\p@ \@minus 3\p@}
\setlength\dblfloatsep{15\p@ \@plus 2\p@ \@minus 3\p@}
\setlength\dbltextfloatsep{15\p@ \@plus 2\p@ \@minus 3\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure.\nobreakspace}
\newenvironment{figure}[1][h]
               {\@float{figure}[#1]\begin{center}}
               {\end{center}\end@float}
\newenvironment{figure*}[1][h]
               {\@dblfloat{figure}[#1]\begin{center}}
               {\end{center}\end@dblfloat}
\if@PP % mlr 2010.04.27 P&P authors making figures/tables too small so force to full column
  \renewenvironment{figure}[1][tp]
    {\@dblfloat{figure}[#1]\begin{center}}
    {\end{center}\end@dblfloat}
\fi
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable---}
\newenvironment{table}[1][h]
               {\@float{table}[#1]\begin{center}}
               {\end{center}\end@float}
\newenvironment{table*}[1][h]
               {\@dblfloat{table}[#1]\begin{center}}
               {\end{center}\end@dblfloat}
\if@PP % mlr 2010.04.27 P&P authors making figures/tables too small so force to full column
  \renewenvironment{table}[1][tp]
    {\@dblfloat{table}[#1]\begin{center}}
    {\end{center}\end@dblfloat}
\fi
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{7\p@}
\setlength\belowcaptionskip{7\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\captionstyle\captionsize #1#2}%
  \ifdim \wd\@tempboxa >\hsize
    {\captionstyle\captionsize #1#2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\newenvironment{widefigure}{\begin{figure*}}{\end{figure*}}
\newenvironment{widetable}{\begin{table*}}{\end{table*}}

\newenvironment{tablenotes}[1][Note]{\begin{minipage}[t]{\linewidth}\notesize{\itshape#1: }}{\end{minipage}}
\newenvironment{figurenotes}[1][Note]{\begin{minipage}[t]{\linewidth}\notesize{\itshape#1: }}{\end{minipage}}

% ==============================================================================
%                                                                      Footnotes
% ==============================================================================

%\def\thanks#1{\footnote{#1}}
%\setlength\footnotesep{1\p@ \@plus\p@} % ??? Missing Begin Document Error. Why?
\setlength{\skip\footins}{15\p@ \@plus 2\p@ \@minus 2\p@}

\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width\z@
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@2.0em{\hss\@makefnmark}#1\hskip 1em}



% ==============================================================================
%                                                                     Backmatter
% ==============================================================================

% Appendix
\def\@startappsection#1#2#3#4#5#6{%
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
  \@dblarg{\@appsect{#1}{#2}{#3}{#4}{#5}{#6}}}
\def\@appsect#1#2#3#4#5#6[#7]#8{%
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
        \@hangfrom{\hskip #3\relax}%
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

\newcommand\appendixname{APPENDIX}

\def\appendix{\if@twocolumn\@restonecoltrue\onecolumn\fi
\setcounter{secnumdepth}{2}
\setcounter{section}{0}
\setcounter{figure}{0}
\numberwithin{figure}{section}
\setcounter{table}{0}
\numberwithin{table}{section}
\setcounter{equation}{0}
\numberwithin{equation}{section}
\renewcommand\thesection{\@Alph\c@section}
\renewcommand\thesubsection{\thesection\@arabic\c@subsection}
\renewcommand\theequation {\thesection\@arabic\c@equation}
\renewcommand\thefigure{\thesection\@arabic\c@figure}
\renewcommand\thetable{\thesection\@arabic\c@table}
\renewcommand\section{%
\@startappsection{section}{1}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\appendixsectionstyle}}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
{\abovesectionskip}%
{\belowsectionskip}%
{\appendixsubsectionstyle}}
}


% references
\newcommand\refname{REFERENCES}
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
  {\if@JEP\subsection*{\MakeUppercase{\refname}}\else\section*{\MakeUppercase{\refname}}\fi%
    \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
    \list{}%
      {\settowidth\labelwidth{}%
       \leftmargin\labelwidth
	   \itemsep 1pt
	   \parsep 1pt
       \advance\leftmargin\labelsep
       \@openbib@code
       \usecounter{enumiv}%
       \let\p@enumiv\@empty
       \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty8000%
    \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}
\newcommand\newblock{\hskip .11em\@plus0.33em\@minus.07em}
\let\@openbib@code\@empty

% ==============================================================================
%                                                                  Theorem-Likes
% ==============================================================================

\def\@begintheorem#1#2{\trivlist
   \item[\hskip \labelsep{\MakeUppercase{#1}\ #2: }]\itshape}
\def\@opargbegintheorem#1#2#3{\trivlist
      \item[\hskip \labelsep{\MakeUppercase{#1}\ #2\ (#3): }]\itshape}

\newenvironment{proof}[1][PROOF]{\noindent\MakeUppercase{#1:}\par }{\par\par}

% ==============================================================================
%                                                                 SW Adjustments
% ==============================================================================

\AtBeginDocument{
  \def\QTR#1{\csname #1\endcsname}
}


% ==============================================================================
%                                                                  Miscellaneous
% ==============================================================================

\setlength\overfullrule{0pt}
\setlength\overfullrule{5pt}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

% ==============================================================================
% ==============================================================================
\endinput
% End of file AEA.cls
