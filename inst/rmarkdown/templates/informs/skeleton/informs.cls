%% Updated to handle e-companions (EC) (see corresponding templates)
%% 12/04/2007 fixed error in \quote
%% 11/11/2010 added template disclaimer in \theARTICLETOP
%% 12/20/2010 reworked type sizes ("per popular demand"); \OneAndAHalfSizedXI - default
%% 02/23/2012 Fixed typo in "@otatefalse" (s/b "@rotatefalse")
%% 08/09/2012 Fixed typo in a message "mansucript" (s/b "manuscript")
%% 03/09/2015 quick adjustment for use in SERV and STSC
%% 11/05/2020 quick adjustment for use in IJDS
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{informs4}
  [2015/03/09 v0.97
   LaTeX document class for articles submitted to INFORMS]

\RequirePackage{amsmath,amssymb,ifthen,url,graphicx,color,array,theorem}

%%%=============================================================================
%%% A simplified reloading scheme for Computer Modern fonts
%% Variation of `ot1cmr.fd',
\DeclareFontFamily{OT1}{cmr}{\hyphenchar\font45 }
\DeclareFontShape{OT1}{cmr}{m}{n}{<-10>gen*cmr<10->cmr10}{}
\DeclareFontShape{OT1}{cmr}{m}{sl}{<->cmti10}{} % slanted type discouraged
\DeclareFontShape{OT1}{cmr}{m}{it}{<5><6><7>cmti7<8>cmti8<9>cmti9<10->cmti10}{}
\DeclareFontShape{OT1}{cmr}{m}{sc}{<5->cmcsc10}{}
\DeclareFontShape{OT1}{cmr}{m}{ui}{<->cmu10}{}
%%%%%%%% bold extended series
\DeclareFontShape{OT1}{cmr}{bx}{n}{<5><6><7><8><9>gen*cmbx<10->cmbx10}{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}{<->cmbxti10}{}  % slanted type discouraged
\DeclareFontShape{OT1}{cmr}{bx}{it}{<->cmbxti10}{}
\DeclareFontShape{OT1}{cmr}{bx}{ui}{<->ssub*cmr/m/ui}{}
\DeclareFontShape{OT1}{cmtt}{m}{n}{<5><6><7><8>cmtt8<9>cmtt9<10->cmtt10}{}
%%%%%% make sure subst shapes are available
\DeclareFontShape{OT1}{cmtt}{m}{it}{<->cmitt10}{}
\DeclareFontShape{OT1}{cmtt}{m}{sl}{<->cmitt10}{} % slanted type discouraged
\DeclareFontShape{OT1}{cmtt}{m}{sc}{<->cmtcsc10}{}
\DeclareFontShape{OT1}{cmtt}{m}{ui}{<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmtt}{bx}{n}{<->ssub*cmtt/m/n}{}
\DeclareFontShape{OT1}{cmtt}{bx}{it}{<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmtt}{bx}{ui}{<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmss}{m}{n}{<->cmss10}{}
% Font undefined, therefore substituted
\DeclareFontShape{OT1}{cmss}{m}{it}{<->cmssi10}{}
\DeclareFontShape{OT1}{cmss}{m}{sl}{<->cmssi10}{}
%%%%%%% Font/shape undefined, therefore substituted
\DeclareFontShape{OT1}{cmss}{m}{sc}{<->sub*cmr/m/sc}{}
%%%%%%% Font/shape undefined, therefore substituted
\DeclareFontShape{OT1}{cmss}{m}{ui}{<->sub*cmr/m/ui}{}
%%%%%%%% semibold condensed series
\DeclareFontShape{OT1}{cmss}{sbc}{n}{<->cmssdc10}{}
%%%%%%%%% bold extended series
\DeclareFontShape{OT1}{cmss}{bx}{n}{<->cmssbx10}{}
%%%%%%% Font/shape undefined, therefore substituted
\DeclareFontShape{OT1}{cmss}{bx}{ui}{<->sub*cmr/bx/ui}{}
\DeclareFontShape{OML}{cmm}{m}{it}{<5><6><7><8><9>gen*cmmi<10->cmmi10}{}
\DeclareFontShape{OML}{cmm}{b}{it}{<5><6><7><8><9>gen*cmmib<10->cmmib10}{}
\DeclareFontShape{OML}{cmm}{bx}{it}{<->ssub*cmm/b/it}{}
%%%%%%%%%%%%%%%%%%-AMS-msam+msbm fonts
\DeclareFontFamily{U}{msa}{}
\DeclareFontShape{U}{msa}{m}{n}{<-> msam10}{}
\DeclareFontFamily{U}{msb}{}
\DeclareFontShape{U}{msb}{m}{n}{<-> msbm10}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOldFontCommand{\RMrm}{\rmfamily\mdseries\upshape}{\mathrm}
\DeclareOldFontCommand{\RMit}{\rmfamily\mdseries\itshape}{\mathit}
\DeclareOldFontCommand{\RMbf}{\rmfamily\bfseries\upshape}{\mathbf}
\DeclareOldFontCommand{\RMbi}{\rmfamily\bfseries\itshape}{\mathbi}
%
\def\thit{\it}% Theorem italic does not exist in CM
%
\DeclareOldFontCommand{\RMsf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\RMsfi}{\normalfont\sffamily\itshape}{\mathsfi}
\DeclareOldFontCommand{\RMtt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\RMsc}{\normalfont\scshape}{\@nomath\sc}
%
\def\ROMAN{%
\let\rm=\RMrm
\let\it=\RMit
\let\bf=\RMbf
\let\bi=\RMbi
\let\sf=\RMsf
\let\sfi=\RMsfi
\let\tt=\RMtt
\let\sc=\RMsc
}
\ROMAN % default
\DeclareOldFontCommand{\SFrm}{\sffamily\mdseries\upshape}{\mathrm}
\DeclareOldFontCommand{\SFit}{\sffamily\mdseries\itshape}{\mathit}
\DeclareOldFontCommand{\SFbf}{\sffamily\bfseries\upshape}{\mathbf}
%
\def\SANS{%
  \let\rm=\SFrm
  \let\it=\SFit
  \let\bf=\SFbf
  \sffamily\mdseries\upshape\selectfont
}
\def\cal#1{\mathcal{#1}}% CMM
%
%************************-b-bold math letters
%%% Adding bold symbols
\DeclareSymbolFont{boperators}   {OT1}{cmr} {bx}{n}
\DeclareSymbolFont{bletters}     {OML}{cmm} {b}{it}
\DeclareSymbolFont{bsymbols}     {OMS}{cmsy}{b}{n}
%
\DeclareMathSymbol{\BFa}{\mathalpha}{boperators}{`a}
\DeclareMathSymbol{\BFb}{\mathalpha}{boperators}{`b}
\DeclareMathSymbol{\BFc}{\mathalpha}{boperators}{`c}
\DeclareMathSymbol{\BFd}{\mathalpha}{boperators}{`d}
\DeclareMathSymbol{\BFe}{\mathalpha}{boperators}{`e}
\DeclareMathSymbol{\BFf}{\mathalpha}{boperators}{`f}
\DeclareMathSymbol{\BFg}{\mathalpha}{boperators}{`g}
\DeclareMathSymbol{\BFh}{\mathalpha}{boperators}{`h}
\DeclareMathSymbol{\BFi}{\mathalpha}{boperators}{`i}
\DeclareMathSymbol{\BFj}{\mathalpha}{boperators}{`j}
\DeclareMathSymbol{\BFk}{\mathalpha}{boperators}{`k}
\DeclareMathSymbol{\BFl}{\mathalpha}{boperators}{`l}
\DeclareMathSymbol{\BFm}{\mathalpha}{boperators}{`m}
\DeclareMathSymbol{\BFn}{\mathalpha}{boperators}{`n}
\DeclareMathSymbol{\BFo}{\mathalpha}{boperators}{`o}
\DeclareMathSymbol{\BFp}{\mathalpha}{boperators}{`p}
\DeclareMathSymbol{\BFq}{\mathalpha}{boperators}{`q}
\DeclareMathSymbol{\BFr}{\mathalpha}{boperators}{`r}
\DeclareMathSymbol{\BFs}{\mathalpha}{boperators}{`s}
\DeclareMathSymbol{\BFt}{\mathalpha}{boperators}{`t}
\DeclareMathSymbol{\BFu}{\mathalpha}{boperators}{`u}
\DeclareMathSymbol{\BFv}{\mathalpha}{boperators}{`v}
\DeclareMathSymbol{\BFw}{\mathalpha}{boperators}{`w}
\DeclareMathSymbol{\BFx}{\mathalpha}{boperators}{`x}
\DeclareMathSymbol{\BFy}{\mathalpha}{boperators}{`y}
\DeclareMathSymbol{\BFz}{\mathalpha}{boperators}{`z}
\DeclareMathSymbol{\BFA}{\mathalpha}{boperators}{`A}
\DeclareMathSymbol{\BFB}{\mathalpha}{boperators}{`B}
\DeclareMathSymbol{\BFC}{\mathalpha}{boperators}{`C}
\DeclareMathSymbol{\BFD}{\mathalpha}{boperators}{`D}
\DeclareMathSymbol{\BFE}{\mathalpha}{boperators}{`E}
\DeclareMathSymbol{\BFF}{\mathalpha}{boperators}{`F}
\DeclareMathSymbol{\BFG}{\mathalpha}{boperators}{`G}
\DeclareMathSymbol{\BFH}{\mathalpha}{boperators}{`H}
\DeclareMathSymbol{\BFI}{\mathalpha}{boperators}{`I}
\DeclareMathSymbol{\BFJ}{\mathalpha}{boperators}{`J}
\DeclareMathSymbol{\BFK}{\mathalpha}{boperators}{`K}
\DeclareMathSymbol{\BFL}{\mathalpha}{boperators}{`L}
\DeclareMathSymbol{\BFM}{\mathalpha}{boperators}{`M}
\DeclareMathSymbol{\BFN}{\mathalpha}{boperators}{`N}
\DeclareMathSymbol{\BFO}{\mathalpha}{boperators}{`O}
\DeclareMathSymbol{\BFP}{\mathalpha}{boperators}{`P}
\DeclareMathSymbol{\BFQ}{\mathalpha}{boperators}{`Q}
\DeclareMathSymbol{\BFR}{\mathalpha}{boperators}{`R}
\DeclareMathSymbol{\BFS}{\mathalpha}{boperators}{`S}
\DeclareMathSymbol{\BFT}{\mathalpha}{boperators}{`T}
\DeclareMathSymbol{\BFU}{\mathalpha}{boperators}{`U}
\DeclareMathSymbol{\BFV}{\mathalpha}{boperators}{`V}
\DeclareMathSymbol{\BFW}{\mathalpha}{boperators}{`W}
\DeclareMathSymbol{\BFX}{\mathalpha}{boperators}{`X}
\DeclareMathSymbol{\BFY}{\mathalpha}{boperators}{`Y}
\DeclareMathSymbol{\BFZ}{\mathalpha}{boperators}{`Z}
%
\DeclareMathSymbol{\BFzero}{\mathalpha}{boperators}{`0}
\DeclareMathSymbol{\BFone}{\mathalpha}{boperators}{`1}
\DeclareMathSymbol{\BFtwo}{\mathalpha}{boperators}{`2}
\DeclareMathSymbol{\BFthree}{\mathalpha}{boperators}{`3}
\DeclareMathSymbol{\BFfour}{\mathalpha}{boperators}{`4}
\DeclareMathSymbol{\BFfive}{\mathalpha}{boperators}{`5}
\DeclareMathSymbol{\BFsix}{\mathalpha}{boperators}{`6}
\DeclareMathSymbol{\BFseven}{\mathalpha}{boperators}{`7}
\DeclareMathSymbol{\BFeight}{\mathalpha}{boperators}{`8}
\DeclareMathSymbol{\BFnine}{\mathalpha}{boperators}{`9}
%
\DeclareMathSymbol{\BFalpha}{\mathord}{bletters}{"0B}
\DeclareMathSymbol{\BFbeta}{\mathord}{bletters}{"0C}
\DeclareMathSymbol{\BFgamma}{\mathord}{bletters}{"0D}
\DeclareMathSymbol{\BFdelta}{\mathord}{bletters}{"0E}
\DeclareMathSymbol{\BFepsilon}{\mathord}{bletters}{"0F}
\DeclareMathSymbol{\BFzeta}{\mathord}{bletters}{"10}
\DeclareMathSymbol{\BFeta}{\mathord}{bletters}{"11}
\DeclareMathSymbol{\BFtheta}{\mathord}{bletters}{"12}
\DeclareMathSymbol{\BFiota}{\mathord}{bletters}{"13}
\DeclareMathSymbol{\BFkappa}{\mathord}{bletters}{"14}
\DeclareMathSymbol{\BFlambda}{\mathord}{bletters}{"15}
\DeclareMathSymbol{\BFmu}{\mathord}{bletters}{"16}
\DeclareMathSymbol{\BFnu}{\mathord}{bletters}{"17}
\DeclareMathSymbol{\BFxi}{\mathord}{bletters}{"18}
\DeclareMathSymbol{\BFpi}{\mathord}{bletters}{"19}
\DeclareMathSymbol{\BFrho}{\mathord}{bletters}{"1A}
\DeclareMathSymbol{\BFsigma}{\mathord}{bletters}{"1B}
\DeclareMathSymbol{\BFtau}{\mathord}{bletters}{"1C}
\DeclareMathSymbol{\BFupsilon}{\mathord}{bletters}{"1D}
\DeclareMathSymbol{\BFphi}{\mathord}{bletters}{"1E}
\DeclareMathSymbol{\BFchi}{\mathord}{bletters}{"1F}
\DeclareMathSymbol{\BFpsi}{\mathord}{bletters}{"20}
\DeclareMathSymbol{\BFomega}{\mathord}{bletters}{"21}
\DeclareMathSymbol{\BFvarepsilon}{\mathord}{bletters}{"22}
\DeclareMathSymbol{\BFvartheta}{\mathord}{bletters}{"23}
\DeclareMathSymbol{\BFvarpi}{\mathord}{bletters}{"24}
\DeclareMathSymbol{\BFvarrho}{\mathord}{bletters}{"25}
\DeclareMathSymbol{\BFvarsigma}{\mathord}{bletters}{"26}
\DeclareMathSymbol{\BFvarphi}{\mathord}{bletters}{"27}
\DeclareMathSymbol{\BFGamma}{\mathalpha}{boperators}{"00}
\DeclareMathSymbol{\BFDelta}{\mathalpha}{boperators}{"01}
\DeclareMathSymbol{\BFTheta}{\mathalpha}{boperators}{"02}
\DeclareMathSymbol{\BFLambda}{\mathalpha}{boperators}{"03}
\DeclareMathSymbol{\BFXi}{\mathalpha}{boperators}{"04}
\DeclareMathSymbol{\BFPi}{\mathalpha}{boperators}{"05}
\DeclareMathSymbol{\BFSigma}{\mathalpha}{boperators}{"06}
\DeclareMathSymbol{\BFUpsilon}{\mathalpha}{boperators}{"07}
\DeclareMathSymbol{\BFPhi}{\mathalpha}{boperators}{"08}
\DeclareMathSymbol{\BFPsi}{\mathalpha}{boperators}{"09}
\DeclareMathSymbol{\BFOmega}{\mathalpha}{boperators}{"0A}
\DeclareMathSymbol{\BFimath}{\mathord}{bletters}{"7B}
\DeclareMathSymbol{\BFjmath}{\mathord}{bletters}{"7C}
\DeclareMathSymbol{\BFell}{\mathord}{bletters}{"60}
\DeclareMathSymbol{\BFwp}{\mathord}{bletters}{"7D}
\DeclareMathSymbol{\BFnabla}{\mathord}{bsymbols}{"72}
%
\DeclareSymbolFontAlphabet{\BFcal}{bsymbols}
%
\DeclareMathSymbol{\BFcalA}{\mathalpha}{bsymbols}{`A}
\DeclareMathSymbol{\BFcalB}{\mathalpha}{bsymbols}{`B}
\DeclareMathSymbol{\BFcalC}{\mathalpha}{bsymbols}{`C}
\DeclareMathSymbol{\BFcalD}{\mathalpha}{bsymbols}{`D}
\DeclareMathSymbol{\BFcalE}{\mathalpha}{bsymbols}{`E}
\DeclareMathSymbol{\BFcalF}{\mathalpha}{bsymbols}{`F}
\DeclareMathSymbol{\BFcalG}{\mathalpha}{bsymbols}{`G}
\DeclareMathSymbol{\BFcalH}{\mathalpha}{bsymbols}{`H}
\DeclareMathSymbol{\BFcalI}{\mathalpha}{bsymbols}{`I}
\DeclareMathSymbol{\BFcalJ}{\mathalpha}{bsymbols}{`J}
\DeclareMathSymbol{\BFcalK}{\mathalpha}{bsymbols}{`K}
\DeclareMathSymbol{\BFcalL}{\mathalpha}{bsymbols}{`L}
\DeclareMathSymbol{\BFcalM}{\mathalpha}{bsymbols}{`M}
\DeclareMathSymbol{\BFcalN}{\mathalpha}{bsymbols}{`N}
\DeclareMathSymbol{\BFcalO}{\mathalpha}{bsymbols}{`O}
\DeclareMathSymbol{\BFcalP}{\mathalpha}{bsymbols}{`P}
\DeclareMathSymbol{\BFcalQ}{\mathalpha}{bsymbols}{`Q}
\DeclareMathSymbol{\BFcalR}{\mathalpha}{bsymbols}{`R}
\DeclareMathSymbol{\BFcalS}{\mathalpha}{bsymbols}{`S}
\DeclareMathSymbol{\BFcalT}{\mathalpha}{bsymbols}{`T}
\DeclareMathSymbol{\BFcalU}{\mathalpha}{bsymbols}{`U}
\DeclareMathSymbol{\BFcalV}{\mathalpha}{bsymbols}{`V}
\DeclareMathSymbol{\BFcalW}{\mathalpha}{bsymbols}{`W}
\DeclareMathSymbol{\BFcalX}{\mathalpha}{bsymbols}{`X}
\DeclareMathSymbol{\BFcalY}{\mathalpha}{bsymbols}{`Y}
\DeclareMathSymbol{\BFcalZ}{\mathalpha}{bsymbols}{`Z}
%************************-e-bold math letters
%
\DeclareMathSizes{8.0}{8.0}{5.0}{5.0}%
\DeclareMathSizes{9.0}{9.0}{6.0}{5.0}%
\DeclareMathSizes{10.0}{10.0}{6.5}{5.0}% footnotes; references; quotes; tables
\DeclareMathSizes{11.0}{11.0}{7.0}{6.0}% appendix (in most cases)
\DeclareMathSizes{12.0}{12.0}{8.0}{6.0}% regular text; \subsubsection (and below)
\DeclareMathSizes{13.0}{13.0}{9.0}{7.0}% \subsection size
\DeclareMathSizes{14.0}{14.0}{9.0}{7.0}% \section size
\DeclareMathSizes{20.0}{20.0}{14.0}{10.0}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-e-from-ffi-ti01(modified)

%%%=============================================================================
%%% CROPMARKS
\newdimen\markwidth
\newdimen\blth
\newdimen\marklength
\newdimen\markdistance
\newdimen\trimwidth
\newdimen\trimheight
\newdimen\auxaaa
\newdimen\auxbbb
\newdimen\auxccc
\newdimen\auxddd
\markwidth=.5pt %0.4 truept % Thickness of the mark line
\blth=0.2pt
\marklength=20 truept % Length of the mark line
\markdistance=3 truept % Distance of the real corner to the beg. of the mark
\auxaaa\marklength\advance\auxaaa\markdistance
\def\oddevenswitch{\ifodd\c@page \auxbbb=\oddsidemargin
 \else\auxbbb=\evensidemargin\fi}%
\def\PagePositionCropYes#1#2#3#4#5#6#7#8{%
  \oddsidemargin=#1%
  \evensidemargin=#2%
  \topmargin=#3%
  \headheight=#4%
  \trimwidth=#5%
  \trimheight=#6%
  \hoffset=#7%
  \voffset=#8%
%%%
 \def\CROPMARKS{\oddevenswitch
 \hbox to0pt{\kern-\auxbbb
   \vbox to0bp{\kern-\topmargin\kern-\headheight
   \hbox to\trimwidth{%
     \koo{-\auxaaa}{-\markwidth}{\VRHDW{\markwidth}{0pt}{\marklength}}%
     \koo{-\markwidth}{-\auxaaa}{\VRHDW{0pt}{\marklength}{\markwidth}}%
     \hfill
     \koo{\markdistance}{-\markwidth}{\VRHDW{\markwidth}{0pt}{\marklength}}%
     \koo{0pt}{-\auxaaa}{\VRHDW{0pt}{\marklength}{\markwidth}}}%
   \nointerlineskip\vskip\trimheight
   \nointerlineskip
   \hbox to\trimwidth{%
     \koo{-\auxaaa}{0pt}{\VRHDW{0pt}{\markwidth}{\marklength}}%
     \koo{-\markwidth}{\markdistance}{\VRHDW{0pt}{\marklength}{\markwidth}}%
     \hfill
     \koo{\markdistance}{0pt}{\VRHDW{0pt}{\markwidth}{\marklength}}%
     \koo{0pt}{\markdistance}{\VRHDW{0pt}{\marklength}{\markwidth}}}%
   \vss}\hss}}%
}%

\def\PagePositionCropNo#1#2#3#4#5#6#7#8{%
  \oddsidemargin=#1%  % [3] inner margin / gutter
  \evensidemargin=#2% % [4] outside margin
  \topmargin=#3%      % [5] \rhsink = \topmargin + \headheight (=12pt here)
  \headheight=#4%     % [6] VERY IMPORTANT! (see above)
  \trimwidth=#5%      % [7]
  \trimheight=#6%     % [8]
  \hoffset=#7%        % = -1in to move the area in the upper left corner
  \voffset=#8%        % = -1in to move the area in the upper left corner
%%%
\def\CROPMARKS{}%
}%

\def\PagePositionBoxYes#1#2#3#4#5#6#7#8{%
  \oddsidemargin=#1%  % [3] inner margin / gutter
  \evensidemargin=#2% % [4] outside margin
  \topmargin=#3%      % [5] \rhsink = \topmargin + \headheight (=12pt here)
  \headheight=#4%     % [6] VERY IMPORTANT! (see above)
  \trimwidth=#5%      % [7]
  \trimheight=#6%     % [8]
  \hoffset=#7%        % = -1in to move the area in the upper left corner
  \voffset=#8%        % = -1in to move the area in the upper left corner
%%%
 \def\CROPMARKS{\oddevenswitch
 \hbox to0pt{\kern-\auxbbb
   \vbox to0bp{\kern-\topmargin\kern-\headheight
   \hbox to\trimwidth{%
     \auxccc=\trimwidth \advance\auxccc by 2\blth
     \auxddd=\trimheight \advance\auxddd by 2\blth
     \koo{-\blth}{0pt}{\zeroLL{\VRHDW{\blth}{0pt}{\auxccc}}}%
     \koo{-\blth}{-\blth}{\zeroUL{\VRHDW{\auxddd}{0pt}{\blth}}}%
     \koo{\trimwidth}{-\blth}{\zeroUL{\VRHDW{\auxddd}{0pt}{\blth}}}%
     \koo{-\blth}{\trimheight}{\zeroUL{\VRHDW{\blth}{0pt}{\auxccc}}}\hss}%
   \vss}\hss}}%
}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end_CROPMARKS

\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage\@titlepagefalse
\newif\if@nameyear\@nameyearfalse
%%% PAPER SIZE
\DeclareOption{letterpaper}
   {\setlength\paperheight{11in}\setlength\paperwidth{8.5in}}
\DeclareOption{nameyear}{\@nameyeartrue}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
%%% TRIM options
\DeclareOption{draft}{\setlength\overfullrule{5pt}%
  \AtBeginDocument{\PagePositionCropYes
    {72bp}{72bp}{36bp}{28bp}
    {8.5in}{11in}{-1in}{-1in}}}
\DeclareOption{final}{\setlength\overfullrule{0pt}%
  \AtBeginDocument{\PagePositionCropNo
    {72bp}{72bp}{36bp}{28bp}
    {8.5in}{11in}{-1in}{-1in}}}
\DeclareOption{finalbox}{\setlength\overfullrule{0pt}%
  \AtBeginDocument{\PagePositionBoxYes
    {72bp}{72bp}{36bp}{28bp}
    {8.5in}{11in}{-1in}{-1in}}}
%%% end_TRIM options
\newcounter{nowappendix}
\setcounter{nowappendix}{0}%
%%% Journal options (Exactly ONE must be declared as option)
\newif\if@DECA\@DECAfalse
\newif\if@IJOC\@IJOCfalse
\newif\if@INTE\@INTEfalse
\newif\if@ISRE\@ISREfalse
\newif\if@MNSC\@MNSCfalse
\newif\if@MKSC\@MKSCfalse
\newif\if@MOOR\@MOORfalse
\newif\if@MSOM\@MSOMfalse
\newif\if@OPRE\@OPREfalse
\newif\if@ORSC\@ORSCfalse
\newif\if@TRSC\@TRSCfalse
\newif\if@ITED\@ITEDfalse
\newif\if@SERV\@SERVfalse
\newif\if@STSC\@STSCfalse
\newif\if@IJDS\@IJDSfalse
\DeclareOption{deca}{\@DECAtrue}
\DeclareOption{ijoc}{\@IJOCtrue}
\DeclareOption{inte}{\@INTEtrue}
\DeclareOption{isre}{\@ISREtrue}
\DeclareOption{mnsc}{\@MNSCtrue}
\DeclareOption{mksc}{\@MKSCtrue}
\DeclareOption{moor}{\@MOORtrue}
\DeclareOption{msom}{\@MSOMtrue}
\DeclareOption{opre}{\@OPREtrue}
\DeclareOption{orsc}{\@ORSCtrue}
\DeclareOption{trsc}{\@TRSCtrue}
\DeclareOption{ited}{\@ITEDtrue}
\DeclareOption{serv}{\@SERVtrue}
\DeclareOption{stsc}{\@STSCtrue}
\DeclareOption{ijds}{\@IJDStrue}

%
\newif\if@COPYEDIT\@COPYEDITfalse
\DeclareOption{copyedit}{\@COPYEDITtrue}
%
\newif\if@BLINDREV\@BLINDREVfalse
\DeclareOption{blindrev}{\@BLINDREVtrue}
%
\newif\if@NONBLINDREV\@NONBLINDREVfalse
\DeclareOption{nonblindrev}{\@NONBLINDREVtrue}
%
\newif\if@BIGACK\@BIGACKfalse
\def\bigack{\@BIGACKtrue}
%
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
\ExecuteOptions{letterpaper,twoside,onecolumn,final}
\ProcessOptions
%****************************************************************************

%%%%%%%%%%%%%%%%%FFF

%%%\input{04set01.sty} % general settings of most parameters
%%%%%%%%%%%%%%%%%%%%%%-b-Standard sizes and their versions
\newdimen\@bls \@bls=13.2pt
\newdimen\@em \@em=11pt

\def\fs.#1.#2.{\fontsize{#1}{#2}\selectfont}%

\def\Dskips#1#2#3#4{\abovedisplayskip #1em \@plus#2em \@minus#3em
   \abovedisplayshortskip \z@ \@plus#2em
   \belowdisplayshortskip #4em \@plus#2em \@minus#2em
   \belowdisplayskip \abovedisplayskip}%
% standard 10pt is \Dskips{10}{3}{5}{6}%
\Dskips{1.0}{0.3}{0.5}{0.6}%


\newcommand\TEN{\relax}%
\newcommand\NIN{\relax}%
\newcommand\EGT{\relax}%
%\newcommand\normalsize{\relax}%
\newcommand\small{\relax}%
\newcommand\footnotesize{\relax}%

\def\SingleSpacedXI{%
\renewcommand\TEN{\normalsizeXInoCE}%
\renewcommand\NIN{\smallXnoCE}%
\renewcommand\EGT{\footnotesizeIXnoCE}%
\renewcommand\normalsize{\normalsizeXInoCE}%
\renewcommand\small{\smallXnoCE}%
\renewcommand\footnotesize{\footnotesizeIXnoCE}%
\normalsizeXInoCE
}

\def\DoubleSpacedXI{%
\renewcommand\TEN{\normalsizeXIyesCE}%
\renewcommand\NIN{\smallXyesCE}%
\renewcommand\EGT{\footnotesizeIXyesCE}%
\renewcommand\normalsize{\normalsizeXIyesCE}%
\renewcommand\small{\smallXyesCE}%
\renewcommand\footnotesize{\footnotesizeIXyesCE}%
\normalsizeXIyesCE
}

\def\SingleSpacedXII{%
\renewcommand\TEN{\normalsizeXIInoCE}%
\renewcommand\NIN{\smallXnoCE}%
\renewcommand\EGT{\footnotesizeIXnoCE}%
\renewcommand\normalsize{\normalsizeXIInoCE}%
\renewcommand\small{\smallXnoCE}%
\renewcommand\footnotesize{\footnotesizeIXnoCE}%
\normalsizeXIInoCE
}

\def\DoubleSpacedXII{%
\renewcommand\TEN{\normalsizeXIIyesCE}%
\renewcommand\NIN{\smallXyesCE}%
\renewcommand\EGT{\footnotesizeIXyesCE}%
\renewcommand\normalsize{\normalsizeXIIyesCE}%
\renewcommand\small{\smallXyesCE}%
\renewcommand\footnotesize{\footnotesizeIXyesCE}%
\normalsizeXIIyesCE
}

\def\OneAndAHalfSpacedXII{%
\renewcommand\TEN{\AAnormalsizeXII}%
\renewcommand\NIN{\AAsmallX}%
\renewcommand\EGT{\AAfootnotesizeIX}%
\renewcommand\normalsize{\AAnormalsizeXII}%
\renewcommand\small{\AAsmallX}%
\renewcommand\footnotesize{\AAfootnotesizeIX}%
\AAnormalsizeXII
}

\def\OneAndAHalfSpacedXI{%
\renewcommand\TEN{\AAnormalsizeXI}%
\renewcommand\NIN{\AAsmallX}%
\renewcommand\EGT{\AAfootnotesizeIX}%
\renewcommand\normalsize{\AAnormalsizeXI}%
\renewcommand\small{\AAsmallX}%
\renewcommand\footnotesize{\AAfootnotesizeIX}%
\AAnormalsizeXI
}

\def\TableSpaced{%
\renewcommand\TEN{\TABLEnormalsizeXI}%
\renewcommand\NIN{\TABLEsmallX}%
\renewcommand\EGT{\TABLEfootnotesizeIX}%
\renewcommand\normalsize{\TABLEnormalsizeXI}%
\renewcommand\small{\TABLEsmallX}%
\renewcommand\footnotesize{\TABLEfootnotesizeIX}%
\TABLEnormalsizeXI
}

\newcommand\AAnormalsizeXII{%
   \@setfontsize\normalsizeXI{12}{20.7}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip20.7pt plus 1pt minus 1pt
\@bls=20.7pt\@em=12pt
\relax}

\newcommand\AAnormalsizeXI{%
   \@setfontsize\normalsizeXI{11}{12.66}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip19pt plus 1pt minus 1pt
\@bls=19pt\@em=11pt
\relax}

\newcommand\AAsmallX{%
   \@setfontsize\smallX{10}{11.5}%
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
     \topsep 0\p@ \parsep 2\p@ \itemsep \parsep}%
   \baselineskip17.25pt plus 1pt minus 1pt
\@bls=17.25pt\@em=10pt
\relax}

\newcommand\AAfootnotesizeIX{%
   \@setfontsize\footnotesizeIX\@ixpt\@xipt
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
      \topsep 0\p@ \parsep 0\p@ \itemsep \parsep}%
   \baselineskip15.5pt plus 1pt minus 1pt
\@bls=15.5pt\@em=9pt
\relax}

\newcommand\normalsizeXIInoCE{%
   \@setfontsize\normalsizeXI{12}{13.80}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip13.80pt plus 0.6pt minus 0.4pt
\@bls=13.80pt\@em=12pt
\relax}

\newcommand\normalsizeXInoCE{%
   \@setfontsize\normalsizeXI{11}{12.66}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip12.66pt plus 0.6pt minus 0.4pt
\@bls=12.66pt\@em=11pt
\relax}

\newcommand\smallXnoCE{%
   \@setfontsize\smallX{10}{11.5}%
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
     \topsep 0\p@ \parsep 2\p@ \itemsep \parsep}%
   \baselineskip11.5pt plus 0.5pt minus 0.35pt
\@bls=11.5pt\@em=10pt
\relax}

\newcommand\footnotesizeIXnoCE{%
   \@setfontsize\footnotesizeIX{9}{10.35}%
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
      \topsep 0\p@ \parsep 0\p@ \itemsep \parsep}%
   \baselineskip10.35pt plus 0.4pt minus 0.3pt
\@bls=10.35pt\@em=9pt
\relax}

\newcommand\normalsizeXIIyesCE{%
   \@setfontsize\normalsizeXI{12}{27.6}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip27.6pt plus 1pt minus 2pt
\@bls=27.6pt\@em=12pt
\relax}

\newcommand\normalsizeXIyesCE{%
   \@setfontsize\normalsizeXI{11}{25.32}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip25.32pt plus 1pt minus 2pt
\@bls=25.32pt\@em=11pt
\relax}

\newcommand\smallXyesCE{%
   \@setfontsize\smallX{10}{23}%
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
     \topsep 0\p@ \parsep 2\p@ \itemsep \parsep}%
   \baselineskip23pt plus 1pt minus 1pt
\@bls=23pt\@em=10pt
\relax}

\newcommand\footnotesizeIXyesCE{%
   \@setfontsize\footnotesizeIX{9}{20.7}
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
      \topsep 0\p@ \parsep 0\p@ \itemsep \parsep}%
   \baselineskip20.7pt plus 1pt minus 1pt
\@bls=20.7pt\@em=9pt
\relax}

\newcommand\TABLEnormalsizeXI{%
   \@setfontsize\normalsizeX{10}{12}%
   \Dskips{1.0}{0.3}{0.5}{0.6}%
   \let\@listi\@listI
   \baselineskip12pt plus 0.6pt minus 0.4pt
\@bls=12pt\@em=10pt
\relax}

\newcommand\TABLEsmallX{%
   \@setfontsize\smallX{9}{11}%
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
     \topsep 0\p@ \parsep 2\p@ \itemsep \parsep}%
   \baselineskip11pt plus 0.5pt minus 0.35pt
\@bls=11pt\@em=9pt
\relax}

\newcommand\TABLEfootnotesizeIX{%
   \@setfontsize\footnotesizeIX{8}{10}%
   \Dskips{0.8}{0.3}{0.5}{0.6}%
   \def\@listi{\leftmargin\leftmargini
      \topsep 0\p@ \parsep 0\p@ \itemsep \parsep}%
   \baselineskip10pt plus 0.4pt minus 0.3pt
\@bls=10pt\@em=8pt
\relax}



\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\newcommand\large{\@setfontsize\large\@xivpt{18}}
\newcommand\Large{\@setfontsize\Large\@xviipt{22}}
\newcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
\newcommand\huge{\@setfontsize\huge\@xxvpt{30}}
\let\Huge=\huge

%\def\TEN{\normalsizeXI}%
%\def\NIN{\smallX}%
%\def\EGT{\footnotesizeIX}%
%
%\def\normalsize{\normalsizeXI}%
%\def\small{\smallX}%
%\def\footnotesize{\footnotesizeIX}%


\if@COPYEDIT
\DoubleSpacedXI
\else
\SingleSpacedXI
\fi

\OneAndAHalfSpacedXI % 12/20/2010

%%%%%%%%%%%%%%%%%%%%%%-e-Standard sizes and their versions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%-b-KOO
\long\def\koo#1#2#3{\vbox to0pt{\hsize0pt\kern #2\hbox to0pt{\kern
#1{#3}\hss}\vss}}
\long\def\zeroCC#1{\vbox to0pt{\vss\hbox to0pt{\hss #1\hss}\vss}}
\long\def\zeroLC#1{\vbox to0pt{\vss\hbox to0pt{\hss #1\hss}}}
\long\def\zeroUC#1{\vbox to0pt{\hbox to0pt{\hss #1\hss}\vss}}
\long\def\zeroLR#1{\vbox to0pt{\vss\hbox to0pt{\hss #1}}}
\long\def\zeroCR#1{\vbox to0pt{\vss\hbox to0pt{\hss #1}\vss}}
\long\def\zeroUR#1{\vbox to0pt{\hbox to0pt{\hss #1}\vss}}
\long\def\zeroLL#1{\vbox to0pt{\vss\hbox to0pt{#1\hss}}}
\long\def\zeroCL#1{\vbox to0pt{\vss\hbox to0pt{#1\hss}\vss}}
\long\def\zeroUL#1{\vbox to0pt{\hbox to0pt{#1\hss}\vss}}
\def\VRHDW#1#2#3{\vrule height #1 depth #2 width #3}
\def\HRHDW#1#2#3{\hrule height #1 depth #2 width #3}
\def\HD#1#2{\vrule height #1pt depth #2pt width 0pt\relax}
%%%%%%%%%%%%%%%%%%%%%%-e-KOO

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%-b-Center etc redefined
% No extra space above and below
\newenvironment{Center}{\parskip0pt\topsep0pt
  \partopsep0pt\parsep0pt\begin{center}}{\end{center}}
\newenvironment{Flushleft}{\parskip0pt\topsep0pt
  \partopsep0pt\parsep0pt\begin{flushleft}}{\end{flushleft}}
\newenvironment{Flushright}{\parskip0pt\topsep0pt
  \partopsep0pt\parsep0pt\begin{flushright}}{\end{flushright}}
%%%%%%%%%%%%%%%%%%%%%%-e-Center etc redefined

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%-b-Standard sizes and penalties
%\newdimen\@bls
%\@bls=\baselineskip
\bigskipamount=\@bls \@plus 0.333\@bls \@minus 0.333\@bls
\medskipamount=0.5\bigskipamount
\smallskipamount=0.25\bigskipamount
\setlength\maxdepth{4pt}
\setlength\marginparwidth{\z@}
\setlength\marginparsep{1pc}
\columnseprule \z@
%
\newbox\tempbox % for figs and tables
\newdimen\tempdim
\newdimen\tempdimht
%
%\def\FNRULE{\koo{0pt}{-9pt}{\zeroLL{\VRHDW{0.5pt}{0pt}{20pc}}}}%
\setlength\footnotesep{12\p@}
\setlength{\skip\footins}{18\p@ \@plus 6\p@ \@minus 6\p@}
\setlength\floatsep    {18\p@ \@plus 10\p@ \@minus 2\p@}
\setlength\textfloatsep{18\p@ \@plus 10\p@ \@minus 2\p@}
\setlength\intextsep   {18\p@ \@plus 10\p@ \@minus 2\p@}
\setlength\dblfloatsep    {18\p@ \@plus 10\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{18\p@ \@plus 10\p@ \@minus 2\p@}
\setlength\@fptop{0\p@}%%{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@}%%%{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\lineskip{0\p@}
\setlength\normallineskip{0\p@}
\lineskiplimit0pt
\renewcommand\baselinestretch{}
\setlength\parskip{\z@}
%
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty    % Before a list or paragraph environment.
\@endparpenalty   -\@lowpenalty    % After a list or paragraph environment.
\@itempenalty     -\@lowpenalty    % Between list items.
%%% FLOATS %%
\setcounter{topnumber}{5}
\def\topfraction{1.0}%%{0.99}
\def\textfraction{0}%%{0.05}
\def\floatpagefraction{0.9}
\setcounter{bottomnumber}{5}
\def\bottomfraction{1.0}%%{0.99}
\setcounter{totalnumber}{10}
\def\dbltopfraction{1.0}%%{0.99}
\def\dblfloatpagefraction{0.8}
\setcounter{dbltopnumber}{5}
%
%%%-b-PENALTIES
\if@COPYEDIT
\clubpenalty 50
\widowpenalty 50
\predisplaypenalty=100
\interdisplaylinepenalty=0
\displaywidowpenalty=200
\else
\clubpenalty 10000
\widowpenalty 10000
\predisplaypenalty=10000
\interdisplaylinepenalty=100
\displaywidowpenalty 1500
\fi
\postdisplaypenalty 0 %%%500
\interlinepenalty 0
\brokenpenalty 500 % Plain default = 100
\adjdemerits=100 % Plain default = 10000
\linepenalty=10
\doublehyphendemerits=10000
\finalhyphendemerits=5000
\hyphenpenalty=50
\exhyphenpenalty=50
\binoppenalty=150 % 700
\relpenalty=100 % 500
\interfootnotelinepenalty=100
\nulldelimiterspace=1.2pt
\lefthyphenmin=3
\righthyphenmin=3
\emergencystretch=2pc
%
\newdimen\adim
%
%\setlength\arraycolsep{5\p@}
%\setlength\tabcolsep{6\p@}
\arraycolsep 1.8pt
\tabcolsep 4pt
\arrayrulewidth .4pt
\doublerulesep 2pt
\tabbingsep\labelsep
%
\def\thefootnote{\arabic{footnote}}
%
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\jot=0.3em %(LaTeX standard)% in prod. 0.6em
\topsep10\p@ \@plus2\p@ \@minus5\p@
%%%%%%%%%%%%%%%%%%%%%%-e-Standard sizes and penalties

\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{{Figure\hskip0.3em\thefigure}}%% may be redefined by the particular style
\newenvironment{figure}
  {\let\@makecaption\@makefigurecaption\@float{figure}}
  {\end@float}
\newenvironment{figure*}
  {\let\@makecaption\@makefigurecaption\@dblfloat{figure}}
  {\end@dblfloat}
%
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table\hskip0.3em\thetable}%% may be redefined by the particular style
\newenvironment{table}
  {\let\@makecaption\@maketablecaption\@float{table}}
  {\end@float}
\newenvironment{table*}
  {\let\@makecaption\@maketablecaption\@dblfloat{table}}
  {\end@dblfloat}

\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
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
      \setlength\@tempdima{3em}%
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
%
% This is to hide footnote rule
\renewcommand\footnoterule{}
%  \kern-3\p@\hrule\@width.4\columnwidth\hrule\@width.175\columnwidth\kern2.6\p@% was
%
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\partname{Part}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}%     <-- to be adjusted per journal
\newcommand\tablename{Table}%       <-- to be adjusted per journal
\newcommand\refname{References}%    <-- to be adjusted per journal
\newcommand\appendixname{Appendix}% <-- to be adjusted per journal
%\newcommand\abstractname{Abstract:}
%
\newcommand\today{}
\edef\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
%
\def\copyright{\raisebox{0.06em}{\textcopyright}}
%
\newcommand{\up}{\VRHDW{1.5em}{0em}{0em}}% for tables (8/10 makes 1em = 8pt)
\newcommand{\down}{\VRHDW{0em}{0.625em}{0em}}%
\def\updown{\up\down}
%
% tightness of math; \mathNN is the LaTeX default (too loose); \mathN is new INFORMS default
\def\mathT{\thickmuskip2mu \thinmuskip1mu \medmuskip=1.5mu\relax}
\let\mathtight=\mathT % pure synonym to \mathT
\let\tightmath=\mathT % pure synonym to \mathT
\def\mathN{\thickmuskip3.5mu plus 2mu\thinmuskip2.5mu\medmuskip=3mu plus 2mu minus 1.5mu\relax}
\def\mathNN{\thickmuskip=5mu plus 5mu\thinmuskip=3mu\medmuskip=4mu plus 2mu minus 4mu\relax}
\mathN %% <-- INFORMS default (tighter than the regular \mathNN)
%
%%% some abbreviations:
\def\0{\phantom{0}}%
\def\Bull{\unskip\hskip0.5em{\textbullet}\hskip0.5em\relax}
\def\COLON{{:}\ }
\def\DS{\displaystyle}
\def\EQNpagebreak{\removelastskip\hrule height0pt\eject}
\def\halmos{\mbox{\quad$\square$}}
\def\Halmos{\mbox{\quad$\square$}}% \square <--> \blackbox (?)
\def\qed{\quad Q.E.D.}
\def\LM{\leavevmode}%
\def\NNN{\nonumber}%
\def\PD{\partial}%
\def\argmax{\mathop{\rm arg\,max}}%
\def\argmin{\mathop{\rm arg\,min}}%
\def\RB#1#2{\raisebox{#1pt}[0pt][0pt]{\tabcolsep0pt\begin{tabular}[b]{c}#2\end{tabular}}}
\def\RBL#1#2{\raisebox{#1pt}[0pt][0pt]{\tabcolsep0pt\begin{tabular}[b]{l}#2\end{tabular}}}
\def\RBX#1#2{\raisebox{#1}[0pt][0pt]{#2}}
\def\SPN{\spaceskip 0.33em plus 0.167em minus 0.09em\relax}% normal values
\def\SPTT{\spaceskip 0.25em plus 0.14em minus 0.06em\relax}
\def\SPT{\spaceskip 0.3em plus 0.16em minus 0.09em\relax}
\def\TS{\textstyle}
\def\bee{\begin{eqnarray}}%
\def\bees{\begin{eqnarray*}}%
\def\be{\begin{equation}}%
\def\eee{\end{eqnarray}}%
\def\eees{\end{eqnarray*}}%
\def\ee{\end{equation}}%
\def\epb{\EQNpagebreak}
\def\hph#1{\hphantom{#1}}
\def\PHE{\hphantom{{}={}}}% useful in alignments
\def\h{\hbox}
\def\mc#1{\multicolumn{1}{c}{#1}}%
\def\mcc#1#2{\multicolumn{#1}{c}{#2}}%
\def\mcr{\\[-0.3em]\\}%%{\\[-0.6em]\\}
\def\mccz#1#2{\multicolumn{#1}{c}{\hbox to 0pt{\hss #2\hss}}}%
\def\mcz#1{\multicolumn{1}{c}{\hbox to 0pt{\hss #1\hss}}}
\def\n{\nobreak}
\def\vs#1{\vadjust{\vspace{#1pt}}}
\def\vvSP#1{\HD{0}{#1}\pagebreak}
\def\vvp{\vadjust{\vfill\pagebreak}}
\def\xxx{\end{document}}
\long\def\IGNORE#1{}
\long\def\IGNORETHIS#1{}%
\def\RAGG{\rightskip0pt plus 1fil}%
\def\HET{\hsize=\textwidth}% for tables and figures 2-col in [b]
\def\BBB{\break}%
\def\PPPP{\pagebreak}%

%%%%%%%% common but adjustable per journal style:
\parindent 1em
%%%\setlength\headheight{60pt} %<-- set by icrops1.sty
\headsep14pt
\topskip 10pt %%
\footskip 0pt % 36pt
\textheight 648pt
\textwidth 6.5in
\columnsep 1.5pc\columnseprule 0pt

\newenvironment{extract}{\begin{list}{}{\NIN
  \topsep\medskipamount
  \leftmargin 1em \rightmargin 1em \parsep 0pt \itemsep 0pt
  \itemindent 0pt \listparindent 1em}\item[]}%
  {\end{list}}

\newcommand\@makefntext[1]{\parindent 1em\noindent\ignorespaces{\@makefnmark}\,#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-article-opening-etc

\newif\iftitle
\global\titlefalse

\def\JOURNAL#1{\gdef\theJOURNAL{#1}}\def\theJOURNAL{Journal Name}%
\def\VOLUME#1{\gdef\theVOLUME{#1}}\def\theVOLUME{00}%
\def\NO#1{\gdef\theNO{#1}}\def\theNO{0}%
\def\ISSUE#1{\gdef\theISSUE{#1}}\def\theISSUE{0000}% default
\def\MONTH#1{\gdef\theMONTH{#1}}\def\theMONTH{Xxxxx}%
\def\YEAR#1{\gdef\theYEAR{#1}}\def\theYEAR{0000}% default
\def\ISSN#1{\gdef\theISSN{#1}}\def\theISSN{0000-0000}% default
\def\EISSN#1{\gdef\theEISSN{#1}}\def\theEISSN{0000-0000}% default
\def\DOI#1{\gdef\theDOI{#1}}\def\theDOI{10.1287/xxxx.0000.0000}% default
\def\FIRSTPAGE#1{\gdef\theFIRSTPAGE{#1}}\def\theFIRSTPAGE{000}%
\def\LONGFIRSTPAGE#1{\gdef\theLONGFIRSTPAGE{#1}}\def\theLONGFIRSTPAGE{0001}% default
\def\LASTPAGE#1{\gdef\theLASTPAGE{#1}}\def\theLASTPAGE{000}%
\def\SHORTYEAR#1{\gdef\theSHORTYEAR{#1}}\def\theSHORTYEAR{00}% default
\def\PAGERANGE#1{\gdef\thePAGERANGE{#1}}\def\thePAGERANGE{}%
\def\TITLE#1{\gdef\theTITLE{#1}}\def\theTITLE{}%{Article Title}%
\def\RUNAUTHOR#1{\gdef\theRUNAUTHOR{#1}}\def\theRUNAUTHOR{Author}% default
\def\RUNTITLE#1{\gdef\theRUNTITLE{#1}}\def\theRUNTITLE{Article Short Title}% default
\def\ECRUNAUTHOR#1{\gdef\theECRUNAUTHOR{#1}}\def\theECRUNAUTHOR{\theRUNAUTHOR}% default
\def\ECRUNTITLE#1{\gdef\theECRUNTITLE{#1}}\def\theECRUNTITLE{\theRUNTITLE}% default
\def\ECTYPE#1{\gdef\theECTYPE{#1}}\def\theECTYPE{e-companion to\enspace}% default
\def\ECAUpunct#1{\gdef\theECAUpunct{#1}}\def\theECAUpunct{:\space}% default


\def\LRHFirstLine#1{\gdef\theLRHFirstLine{#1}}\def\theLRHFirstLine{}%
\def\LRHSecondLine#1{\gdef\theLRHSecondLine{#1}}\def\theLRHSecondLine{}%
\def\RRHFirstLine#1{\gdef\theRRHFirstLine{#1}}\def\theRRHFirstLine{}%
\def\RRHSecondLine#1{\gdef\theRRHSecondLine{#1}}\def\theRRHSecondLine{}%

\def\ECLRHFirstLine#1{\gdef\theECLRHFirstLine{#1}}\def\theECLRHFirstLine{}%
\def\ECLRHSecondLine#1{\gdef\theECLRHSecondLine{#1}}\def\theECLRHSecondLine{}%
\def\ECRRHFirstLine#1{\gdef\theECRRHFirstLine{#1}}\def\theECRRHFirstLine{}%
\def\ECRRHSecondLine#1{\gdef\theECRRHSecondLine{#1}}\def\theECRRHSecondLine{}%

\def\LRFFirstLine#1{\gdef\theLRFFirstLine{#1}}\def\theLRFFirstLine{}%
\def\LRFSecondLine#1{\gdef\theLRFSecondLine{#1}}\def\theLRFSecondLine{}%
\def\RRFFirstLine#1{\gdef\theRRFFirstLine{#1}}\def\theRRFFirstLine{}%
\def\RRFSecondLine#1{\gdef\theRRFSecondLine{#1}}\def\theRRFSecondLine{}%

\if@BLINDREV
\long\def\ARTICLEAUTHORS#1{\gdef\theARTICLEAUTHORS{%
  \begin{Center}\HOOKa\vspace*{0pt}{\fs.12.12.\bf (Authors' names blinded for peer review)}\vspace*{0pt}\end{Center}}}%
\else
\long\def\ARTICLEAUTHORS#1{\gdef\theARTICLEAUTHORS{%
  \begin{Center}\HOOKa\vspace*{0pt}#1\vspace*{0pt}\end{Center}}}%
\fi
\def\theARTICLEAUTHORS{}%

\long\def\ABSTRACT#1{\long\gdef\theABSTRACT{#1}}\def\theABSTRACT{}%

\def\SEPBAR{$\mskip2.5mu|\mskip2.5mu$}

\def\SUBJECTCLASSname{{\it Subject classifications\/}{\kern0.7pt}:\enskip}
\def\AREAOFREVIEWname{{\it Area of review\/}{\kern0.7pt}:\enskip}
\def\HISTORYname{{\it History\/}{\kern0.7pt}:\enskip}
\def\MSCCLASSname{{\it MSC2000 subject classification\/}{\kern0.7pt}:\enskip}
\def\ORMSCLASSname{{\it OR/MS subject classification\/}{\kern0.7pt}:\enskip}
\def\KEYWORDSname{{\it Key words\/}{\kern0.7pt}:\enskip}

\def\HISTORY#1{\gdef\theHISTORY{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\HISTORYname #1\endgraf}}\def\theHISTORY{}%
\def\AREAOFREVIEW#1{\gdef\theAREAOFREVIEW{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\AREAOFREVIEWname #1\endgraf}}\def\theAREAOFREVIEW{}%
\def\SUBJECTCLASS#1{\gdef\theSUBJECTCLASS{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\SUBJECTCLASSname #1\endgraf}}\def\theSUBJECTCLASS{}%
\def\MSCCLASS#1{\gdef\theMSCCLASS{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\MSCCLASSname #1\endgraf}}\def\theMSCCLASS{}%
\def\ORMSCLASS#1{\gdef\theORMSCLASS{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\ORMSCLASSname #1\endgraf}}\def\theORMSCLASS{}%
\def\KEYWORDS#1{\gdef\theKEYWORDS{\endgraf\rightskip0pt plus 20pc
  \noindent\hangindent1em\KEYWORDSname #1\endgraf}}\def\theKEYWORDS{}%
\def\thePAGERANGE{pp.~\theFIRSTPAGE--\theLASTPAGE}% default
\def\theRUNPAGERANGE{pp.~\theFIRSTPAGE--\theLASTPAGE}% default

%%% pagestyles revised:

\def\setoddRF{\hfil} \def\setevenRF{\hfil} % Running feet empty

\def\setoddRH{\hbox to \textwidth{\fs.7.8.\tabcolsep0pt
  \begin{tabular*}{\textwidth}[b]{l@{\extracolsep\fill}r}
  {\theRRHFirstLine}&\\ {\theRRHSecondLine}&  \raisebox{0pt}[0pt][0pt]{\fs.10.10.\thepage}\\[-4pt]
  \rlap{\VRHDW{0.5pt}{0pt}{\textwidth}}&\\
  \end{tabular*}}}
\def\setevenRH{\hbox to \textwidth{\fs.7.8.\tabcolsep0pt
  \begin{tabular*}{\textwidth}[b]{l@{\extracolsep\fill}r}
  &{\theLRHFirstLine}\\ \raisebox{0pt}[0pt][0pt]{\fs.10.10.\thepage}&{\theLRHSecondLine}\\[-4pt]
  \rlap{\VRHDW{0.5pt}{0pt}{\textwidth}}&\\
  \end{tabular*}}}

\RRHFirstLine{\bf\theRUNAUTHOR:\enskip {\it\theRUNTITLE}}% default
\RRHSecondLine{\fs.7.9.{\theJOURNAL} \theVOLUME(\theNO), \theRUNPAGERANGE,
  \copyright\,{\theYEAR}\ INFORMS}% default
\LRHFirstLine{\bf\theRUNAUTHOR:\enskip {\it\theRUNTITLE}}% default
\LRHSecondLine{\fs.7.9.{\theJOURNAL} \theVOLUME(\theNO), \theRUNPAGERANGE,
  \copyright\,{\theYEAR}\ INFORMS}% default

\def\setoddECRH{\hbox to \textwidth{\fs.7.8.\tabcolsep0pt
  \begin{tabular*}{\textwidth}[b]{l@{\extracolsep\fill}r}
  {\theECRRHFirstLine}&\\ {\theECRRHSecondLine}&  \raisebox{0pt}[0pt][0pt]{\fs.10.10.\thepage}\\[-4pt]
  \rlap{\VRHDW{0.5pt}{0pt}{\textwidth}}&\\
  \end{tabular*}}}
\def\setevenECRH{\hbox to \textwidth{\fs.7.8.\tabcolsep0pt
  \begin{tabular*}{\textwidth}[b]{l@{\extracolsep\fill}r}
  &{\theECLRHFirstLine}\\ \raisebox{0pt}[0pt][0pt]{\fs.10.10.\thepage}&{\theECLRHSecondLine}\\[-4pt]
  \rlap{\VRHDW{0.5pt}{0pt}{\textwidth}}&\\
  \end{tabular*}}}

\ECRRHFirstLine{\relax}% default
\ECRRHSecondLine{\fs.7.9.{\rm \theECTYPE}{\bf\theECRUNAUTHOR\theECAUpunct}{\it\theECRUNTITLE}}% default
\ECLRHFirstLine{\relax}% default
\ECLRHSecondLine{\fs.7.9.{\rm \theECTYPE}{\bf\theECRUNAUTHOR\theECAUpunct}{\it\theECRUNTITLE}}% default


\if@BLINDREV
\RRHFirstLine{\bf Authors' names blinded for peer review}% default
\RRHSecondLine{\fs.7.9.\rm Article submitted to {\it\theJOURNAL}; manuscript no. {\theMANUSCRIPTNO}}% default
\LRHFirstLine{\bf Authors' names blinded for peer review}% default
\LRHSecondLine{\fs.7.9.\rm Article submitted to {\it\theJOURNAL}; manuscript no. {\theMANUSCRIPTNO}}% default
\fi

\if@NONBLINDREV
\RRHFirstLine{\bf\theRUNAUTHOR:\enskip {\it\theRUNTITLE}}% default
\RRHSecondLine{\fs.7.9.\rm Article submitted to {\it\theJOURNAL}; manuscript no. {\theMANUSCRIPTNO}}% default
\LRHFirstLine{\bf\theRUNAUTHOR:\enskip {\it\theRUNTITLE}}% default
\LRHSecondLine{\fs.7.9.\rm Article submitted to {\it\theJOURNAL}; manuscript no. {\theMANUSCRIPTNO}}% default
\fi

\let\savesetoddRF=\setoddRF
\let\savesetevenRF=\setevenRF
\let\savesetoddRH=\setoddRH
\let\savesetevenRH=\setevenRH

%%\def\ThePage{\thepage}%

\def\ps@headings{%
    \def\@oddfoot{\setoddRF}%
    \def\@evenfoot{\setevenRF}%
    \def\@oddhead{\CROPMARKS\setoddRH}%
    \def\@evenhead{\CROPMARKS\setevenRH}%
    \let\@mkboth\markboth}

\def\ps@ECheadings{%
    \def\@oddfoot{\relax}%
    \def\@evenfoot{\relax}%
    \def\@oddhead{\CROPMARKS\setoddECRH}%
    \def\@evenhead{\CROPMARKS\setevenECRH}%
    \let\@mkboth\markboth}

%----- first page

\def\setfirstoddFOOT{%
  \raisebox{-24pt}[0pt][0pt]{\hbox to \textwidth{\hfill\fs.8.8.\thepage\hfill}}%
  \global\titlefalse}%

\def\setfirstevenFOOT{%
  \raisebox{-24pt}[0pt][0pt]{\hbox to \textwidth{\hfill\fs.8.8.\thepage\hfill}}%
  \global\titlefalse}%

\def\ps@firstpage{%
  \iftitle\global\titlefalse\let\@mkboth\markboth
  \def\@oddfoot{\setfirstoddFOOT}%
  \def\@evenfoot{\setfirstevenFOOT}%
  \def\@evenhead{\CROPMARKS\hfil}%
  \def\@oddhead{\CROPMARKS\hfil}%
  \def\sectionmark##1{}%
  \def\subsectionmark##1{}%
  \fi
}%

\def\ARTICLEfirstpage{\global\titletrue\thispagestyle{firstpage}}

\newdimen\adim

\long\def\dropcap#1{\setbox0=\hbox{\fs.24.26.#1\kern1pt}%
  \adim\wd0\hangindent\wd0\hangafter-2\noindent
  \kern-\wd0\smash{\if@COPYEDIT\lower13pt\else\lower10pt\fi\copy0}\relax}

%---- \maketitle and \@maketitle
\def\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{{\ifnum\c@footnote=1{*}\else
           \@textsuperscript{{\normalfont\@thefnmark}}\fi}}%
    \long\def\@makefntext##1{\noindent
      \ifnum\c@footnote=1\hbox{*\,}\else
      \hbox{\@textsuperscript{\normalfont\@thefnmark}\,}\fi
      \EGT ##1}%
    \let \footnote \thanks
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
  \endgroup
  \setcounter{footnote}{0}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \global\let\maketitle\relax\global\let\@maketitle\relax\parindent1em\normalsize}

\def\@maketitle{%
  \newpage
  \theARTICLETOP
  \theARTICLETITLE
  \theARTICLEAUTHORS
  \theARTICLEABSTRACT
  \theARTICLERULE
}

%%%%%%%%%%%% first page details
\def\TITLEfont{\rm}% default
\def\AUTHORfont{\rm}% default
\def\AFFfont{\rm}% default

\newdimen\ABSwidth
\ABSwidth=\textwidth \advance\ABSwidth-3pc
\def\ABSfont{\small}% default

%% journal-dependent
\def\TITLEfont{\fs.20.24.\rm}% default
\def\AUTHORfont{\fs.11.13.\rm}% default
\def\AFFfont{\fs.8.10.\rm}% default

\def\theARTICLETITLE{%
  \HOOKtop
  \begin{Center}
  \vspace*{0pt}%
  \TITLEfont\HD{24}{0}\theTITLE\HD{0}{15}%
  \end{Center}}

\def\EMAIL#1{#1}% use within AFF
\def\URL#1{#1}% use within AFF
%\def\EMAIL#1{\href{mailto:#1}{#1}}% when hyperref is used
%\def\URL#1{\href{#1}{#1}}         % when hyperref is used

\def\AUTHOR#1{%
  \begin{Center}
  \AUTHORfont\HD{15}{0}#1\HD{0}{6}\relax
  \end{Center}}
\def\AFF#1{%
  \begin{Center}
  \AFFfont{#1}\relax
  \vskip1.6pt
  \end{Center}}

\def\ARTICLERULE#1{\gdef\theARTICLERULE{#1}}%
% default is to have a rule
\def\theARTICLERULE{%
  \begin{Center}
  \vspace*{12pt}
  \VRHDW{1pt}{0pt}{\textwidth}
  \vspace*{4pt}
  \HOOKc
  \end{Center}}

\def\ACKname#1{\gdef\theACKname{#1}}\def\theACKname{Acknowledgments}%

\if@BIGACK
\long\def\ACKNOWLEDGMENT#1{\vskip12pt plus 3pt minus 2pt
  \noindent{\TEN\bf\theACKname}\endgraf\noindent{\TEN #1\endgraf}\endgraf}
\else
\long\def\ACKNOWLEDGMENT#1{\vskip12pt plus 3pt minus 2pt
  \noindent{\fs.13.15.\bf\theACKname}\endgraf\noindent{\NIN #1\endgraf}\endgraf}
\fi

\if@BLINDREV
\long\def\ACKNOWLEDGMENT#1{}%
\fi

\@BIGACKfalse

\if@MOOR
\long\def\ACKNOWLEDGMENT#1{\section*{\bf\theACKname.}{#1\endgraf}\endgraf}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% -b-VARIOUS-TOOLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-b-dcolumn
%%%%%%%%%% dcolumn.sty - first original then modified
%% File: dcolumn.dtx Copyright (C) 1992-1996 David Carlisle
%\NeedsTeXFormat{LaTeX2e}
%\ProvidesPackage{dcolumn}
%          [1996/02/28 v1.03 decimal alignment package (DPC)]
%%%\RequirePackage{array}
\def\sfdc{\SFrm}
\def\DC@#1#2#3{%
  \uccode`\~=`#1\relax
  \m@th
  \afterassignment\DC@x\count@#3\relax{#1}{#2}}
\def\DC@x#1\relax#2#3{%
  \ifnum\z@>\count@
    \expandafter\DC@centre
  \else
    \expandafter\DC@right
  \fi
  {#2}{#3}{#1}}
\def\DC@centre#1#2#3{%
  \let\DC@end\DC@endcentre
  \uppercase{\def~}{$\egroup\setbox\tw@=\hbox\bgroup$\sfdc{#2}}%
  \setbox\tw@=\hbox{${\phantom{\sfdc{#2}}}$}%
  \setbox\z@=\hbox\bgroup$\sfdc\mathcode`#1="8000 }
\def\DC@endcentre{$\egroup
    \ifdim \wd\z@>\wd\tw@
      \setbox\tw@=\hbox to\wd\z@{\unhbox\tw@\hfill}%
    \else
      \setbox\z@=\hbox to\wd\tw@{\hfill\unhbox\z@}\fi
    \box\z@\box\tw@}
\def\DC@right#1#2#3{%
  \ifx\relax#3\relax
    \hfill
    \let\DC@rl\bgroup
  \else
    \edef\DC@rl{to\the\count@\dimen@ii\bgroup\hss}%
    \count@\@gobble#3\relax
  \fi
  \let\DC@end\DC@endright
  \uppercase{\def~}{$\egroup\setbox\tw@\hbox to\dimen@\bgroup$\sfdc{#2}}%
   \setbox\z@\hbox{$\sfdc 1$}\dimen@ii\wd\z@
   \dimen@\count@\dimen@ii
   \setbox\z@\hbox{$\sfdc{#2}$}\advance\dimen@\wd\z@
   \setbox\tw@\hbox to\dimen@{}%
   \setbox\z@\hbox\DC@rl$\sfdc\mathcode`#1="8000 }
\def\DC@endright{$\hfil\egroup\box\z@\box\tw@}
\def\DC@endright{$\egroup\box\z@\box\tw@}
\newcolumntype{D}[3]{>{\DC@{#1}{#2}{#3}}c<{\DC@end}}
%
% modified version
%
\def\DCFF@#1#2#3#4{%
  \let\sfdc=#4%
  \uccode`\~=`#1\relax
  \m@th
  \afterassignment\DCFF@x\count@#3\relax{#1}{#2}}
\def\DCFF@x#1\relax#2#3{%
  \ifnum\z@>\count@
    \expandafter\DCFF@centre
  \else
    \expandafter\DCFF@right
  \fi
  {#2}{#3}{#1}}
\def\DCFF@centre#1#2#3{%
  \let\DCFF@end\DCFF@endcentre
  \uppercase{\def~}{$\egroup\setbox\tw@=\hbox\bgroup$\sfdc{#2}}%
  \setbox\tw@=\hbox{${\phantom{\sfdc{#2}}}$}%
  \setbox\z@=\hbox\bgroup$\sfdc\mathcode`#1="8000 }
\def\DCFF@endcentre{$\egroup
    \ifdim \wd\z@>\wd\tw@
      \setbox\tw@=\hbox to\wd\z@{\unhbox\tw@\hfill}%
    \else
      \setbox\z@=\hbox to\wd\tw@{\hfill\unhbox\z@}\fi
    \box\z@\box\tw@}
\def\DCFF@right#1#2#3{%
  \ifx\relax#3\relax
    \hfill
    \let\DCFF@rl\bgroup
  \else
    \edef\DCFF@rl{to\the\count@\dimen@ii\bgroup\hss}%
    \count@\@gobble#3\relax
  \fi
  \let\DCFF@end\DCFF@endright
  \uppercase{\def~}{$\egroup\setbox\tw@\hbox to\dimen@\bgroup$\sfdc{#2}}%
   \setbox\z@\hbox{$\sfdc 1$}\dimen@ii\wd\z@
   \dimen@\count@\dimen@ii
   \setbox\z@\hbox{$\sfdc{#2}$}\advance\dimen@\wd\z@
   \setbox\tw@\hbox to\dimen@{}%
   \setbox\z@\hbox\DCFF@rl$\sfdc\mathcode`#1="8000 }
\def\DCFF@endright{$\hfil\egroup\box\z@\box\tw@}
\def\DCFF@endright{$\egroup\box\z@\box\tw@}
\newcolumntype{F}[4]{>{\DCFF@{#1}{#2}{#3}{#4}}c<{\DCFF@end}}

\newcolumntype{d}[1]{D{.}{.}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-e-dcolumn

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-b-Extended \cline
%% \Cline takes 4 arguments
%% #1 = from col.; #2 = to col.; #3 = kern on the left; #4 = kern on the right
%%%%%%%%%%%%%%%%%%%%% MODIFICATION:
\newdimen \clineHT
\newdimen \clineDP
\def\Cline#1#2#3#4{\omit\@multicnt#1\advance\@multispan\m@ne
  \ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi\@multicnt#2%
  \advance\@multicnt-#1\advance\@multispan\@ne
  \hskip#3{\leaders\hrule\@height\arrayrulewidth\hfill}\hskip#4\cr
  \noalign{\vskip-\arrayrulewidth}}
%% \Clinev has #5 for additional vertical skip after it is done
\def\Clinev#1#2#3#4#5{\omit\@multicnt#1%
  \advance\@multispan\m@ne\ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  \@multicnt#2\advance\@multicnt-#1\advance\@multispan\@ne
  \hskip#3{\leaders\hrule\@height\arrayrulewidth\hfill}\hskip#4\cr
  \noalign{\vskip-\arrayrulewidth\vskip #5}}
%% \ClineVV has #5 for vertical offset of the cline (plus is down)
\def\ClineVV#1#2#3#4#5{%
  \noalign{\vskip #5}%
  \omit\@multicnt#1%
  \advance\@multispan\m@ne\ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  \@multicnt#2\advance\@multicnt-#1\advance\@multispan\@ne
  \hskip#3{\leaders \hrule\@height\arrayrulewidth \hfill}\hskip#4\cr
  \noalign{\vskip-#5\vskip-\arrayrulewidth}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-e-Extended \cline

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% -e-VARIOUS-TOOLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%-e-04set01.sty
%%%\endinput
%%%=============================================================================

%--------------------------------------------------------
\def\Trivlist{\parskip0pt\topsep=0pt\parsep0pt\partopsep0pt\@nmbrlistfalse
  \@trivlist \labelwidth\z@ \leftmargin\z@
  \itemindent\z@ \def\makelabel##1{##1}}

\def\endTrivlist{\if@newlist\@noitemerr\fi
   \if@inlabel\indent\fi
   \ifhmode\unskip \par\fi
   \if@noparlist \else
      \ifdim\lastskip >\z@ \@tempskipa\lastskip \vskip -\lastskip
         \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
         \vskip\@tempskipa
   \fi\@endparenv\fi}
%--------------------------------------------------------

%%% Undoing the general version
\def\thebibliography{}
\def\endthebibliography{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% New numeric bibliography environment (works with \cite) (no NATBIB)
\renewenvironment{thebibliography}[1]
    {\subsection*{\hspace*{0pt}References}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\fs.9.10.\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \labelsep5pt
            \advance\leftmargin\labelsep
            \itemsep 2pt plus 2pt minus 0.5pt
            %%\@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \def\newblock{\relax}%
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% For NATBIB use
\def\NatBibNumeric{%
 \renewenvironment{thebibliography}[1]{%
  \bibsection\parindent \z@\bibpreamble\bibfont\list
   {\@biblabel{\arabic{NAT@ctr}}}{%
   \setlength{\labelsep}{5pt}\@bibsetup{##1}\setcounter{NAT@ctr}{0}}%
    \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
 }{\def\@noitemerr{%
  \PackageWarning{natbib}
     {Empty `thebibliography' environment}}%
  \endlist\vskip-\lastskip}%
}

\if@MOOR
\def\NatBibNumeric{%
 \renewenvironment{thebibliography}[1]{%
  \section*{\hspace*{-10pt}References}\parindent \z@\bibpreamble\bibfont\list
   {\@biblabel{\arabic{NAT@ctr}}}{%
   \setlength{\labelsep}{5pt}\@bibsetup{##1}\setcounter{NAT@ctr}{0}}%
    \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
 }{\def\@noitemerr{%
  \PackageWarning{natbib}
     {Empty `thebibliography' environment}}%
  \endlist\vskip-\lastskip}%
}%
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------

\def\mcr{\\[-.6em] \\ }
\newenvironment{pMatrix}[1]{\bgroup\arraycolsep.5em
  \left(\kern-.2em\begin{array}{#1}}{\end{array}\kern-.2em\right)\egroup}
\newenvironment{bMatrix}[1]{\bgroup\arraycolsep.5em
  \left[\kern-.2em\begin{array}{#1}}{\end{array}\kern-.2em\right]\egroup}
\newenvironment{vMatrix}[1]{\bgroup\arraycolsep.5em
  \left|\kern-.2em\begin{array}{#1}}{\end{array}\kern-.2em\right|\egroup}
\newenvironment{Matrix}[1]{\bgroup\arraycolsep.5em
  \begin{array}{#1}}{\end{array}\egroup}
\newenvironment{Array}[1]{\bgroup\arraycolsep0.139em
  \begin{array}{#1}}{\end{array}\egroup}

%--------------------------------------------------------

\def\up{\HD{13}{0}}% for tables
\def\down{\HD{0}{5}}%


\skip\footins=12pt plus 8.1pt minus 5pt
%
\def\EquationsNumberedThrough{%
\def\theequation{\arabic{equation}}%
\def\ECEquationsNumberedThrough{%
\setcounter{equation}{0}\let\oldtheequation=\theequation\def\theequation{EC.\oldtheequation}%
}%
\def\ECHowEquations{\ECEquationsNumberedThrough}%
}
%
\def\EquationsNumberedBySection{%
\@addtoreset{equation}{section}%
\def\theequation{\thesection.\arabic{equation}}%
\def\ECEquationsNumberedBySection{%
\setcounter{equation}{0}\let\oldtheequation=\theequation\def\theequation{EC.\oldtheequation}%
}%
\def\ECHowEquations{\ECEquationsNumberedBySection}%
}
%
\EquationsNumberedThrough % default: 1, 2, 3,

\arraycolsep 1.8pt
\tabcolsep 4pt
\arrayrulewidth .4pt
\doublerulesep 2pt
\tabbingsep\labelsep

%--------------------------------------------------------

%%%=============================================================================
%%% LISTS %%
\newdimen\labelwidthi
\newdimen\labelwidthii
\newdimen\labelwidthiii
\newdimen\labelwidthiv
\def\normal@labelsep{0.5em}
\labelsep\normal@labelsep
\settowidth{\labelwidthi}{\rm(iii)}
\settowidth{\labelwidthii}{\rm(d)}
\settowidth{\labelwidthiii}{\rm(iii)}
\settowidth{\labelwidthiv}{\rm(M)}
\leftmargini\labelwidthi    \advance\leftmargini\labelsep
\leftmarginii\labelwidthii  \advance\leftmarginii\labelsep
\leftmarginiii\labelwidthiii \advance\leftmarginiii\labelsep
\leftmarginiv\labelwidthiv  \advance\leftmarginiv\labelsep
\def\setleftmargin#1#2{\settowidth{\@tempdima}{#2}\labelsep\normal@labelsep
  \csname labelwidth#1\endcsname\@tempdima
  \@tempdimb\@tempdima \advance\@tempdimb\labelsep
  \csname leftmargin#1\endcsname\@tempdimb}
\def\@listI{\leftmargin\leftmargini
  \labelwidth\labelwidthi \labelsep\normal@labelsep
  \topsep \z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\labelwidthii \labelsep\normal@labelsep
  \topsep\z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\labelwidthiii \labelsep\normal@labelsep
  \topsep\z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\labelwidthiv \labelsep\normal@labelsep
  \topsep\z@ \partopsep\z@ \parsep\z@ \itemsep\z@
  \listparindent 1em}
\let\@listi\@listI
\@listi
\def\left@label#1{{#1}\hss}
\def\right@label#1{\hss\llap{#1}}
\def\thick@label#1{\hspace\labelsep #1}
\newcount\@maxlistdepth
\@maxlistdepth=4
%
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\def\labelitemi{$\bullet$}          \def\labelitemii{$\cdot$}
\def\labelenumi{(\theenumi)}        \def\theenumi{\arabic{enumi}}
\def\labelenumii{(\alph{enumii})}   \def\theenumii{\theenumi\alph{enumii}}
\def\labelenumiii{(\roman{enumiii})}\def\theenumiii{\theenumii.\roman{enumiii}}
\def\labelenumiv{(\Alph{enumiv})}   \def\theenumiv{\theenumiii.\Alph{enumiv}}
\def\OLDenumerate{%
  \ifnum \@enumdepth >\@maxlistdepth
    \@toodeep
  \else
    \advance\@enumdepth \@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \list{\csname label\@enumctr\endcsname}%
       {\usecounter{\@enumctr}
    \leftmargin16pt
       \let\makelabel=\right@label}
  \fi}
\def\OLDitemize{%
  \ifnum \@itemdepth >\@maxlistdepth
    \@toodeep
  \else
    \advance\@itemdepth \@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
     \setleftmargin{i}{--}%
     \setleftmargin{ii}{$\cdot$}%
    \list{\csname\@itemitem\endcsname}%
       {\let\makelabel\right@label}
  \fi}
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@
  \itemindent \z@
  \listparindent\z@
  \rightmargin 1em
  \leftmargin \rightmargin}\item[]}
\let\endverse\endlist
\def\quotation{\list{}{\itemindent\z@
 \leftmargin 1em \rightmargin 1em
  \parsep \z@ }\item[]}
\let\endquotation=\endlist
\def\quote{\list{}{\itemindent\z@
   \leftmargin 1em \rightmargin 1em}%
\item[]}
\let\endquote=\endlist
\def\descriptionlabel#1{\hspace\labelsep \itshape #1}
\def\description{\list{}{\labelwidth\z@
  \leftmargin \z@ \itemindent \z@ %-\leftmargin
  \let\makelabel\descriptionlabel}}
\let\enddescription\endlist
%%%%%%%%%%%%%%-e-04listcl.sty
%%%\endinput
%%%%%%%%%%%%%% -b-newlst1 (enumerate, henumerate, ...)
\def\labelitemi{{\makebox[0.5em][s]{\hss\textbullet\hss}}}
\def\labelitemii{{\makebox{\normalfont---\hspace*{-0.35em}}}}
\def\labelitemiii{{\makebox{\normalfont\textasteriskcentered}}}
\def\labelitemiv{{\makebox{\normalfont\textperiodcentered}}}

\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\renewcommand\labelenumi{{\rm\theenumi.}}
\renewcommand\labelenumii{{\rm(\theenumii)}}
\renewcommand\labelenumiii{{\rm\theenumiii.}}
\renewcommand\labelenumiv{{\rm\theenumiv.}}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\newcommand*\descrlabel[1]{\hspace\labelsep\normalfont #1}

%=====================================================================
\def\descr{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \list{}
    {\DescrListParams}%
  \fi}

\def\DescrListParams{%
\leftmargin\z@ \labelwidth\z@
\ifnum \@itemdepth=1\itemindent1em
\else  \ifnum \@itemdepth=2\itemindent2em
\else \itemindent\labelsep\advance\itemindent3em \fi\fi
\let\makelabel\descrlabel}

\let\enddescr=\endlist
%=====================================================================

\def\hdescr{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \list{}
    {\HDescrListParams}%
  \fi}

\def\HDescrListParams{%
\leftmargin\z@ \parsep\z@ \itemsep\z@ \parskip\z@ \topsep\z@ \partopsep\z@ \labelsep0.5em \labelwidth\z@
\ifnum \@itemdepth=1 \leftmargin1em \itemindent-1em
\else \ifnum \@itemdepth=2 \leftmargin1em \itemindent-1em
\else \leftmargin1em \itemindent-1em \fi\fi
\let\makelabel\descrlabel}

\let\endhdescr=\endlist
%=====================================================================

\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\EnumListParams}%
  \fi}

\def\EnumListParams{%
\usecounter\@enumctr%
\leftmargin\z@ \parsep\z@ \itemsep\z@ \parskip\z@ \topsep\z@ \partopsep\z@ \labelsep0.5em \labelwidth\z@
\ifnum \@enumdepth=1\itemindent=1.5em
\else  \ifnum \@enumdepth=2\itemindent=2.777em
\else  \ifnum \@enumdepth=3\itemindent=3.777em
\else  \itemindent=4.277em \fi\fi\fi
\def\makelabel##1{{##1}}}

\let\endenumerate =\endlist
%=====================================================================

\def\enumitemize{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        {\makebox[0.5em][s]{\hss\textbullet\hss}}%\csname label\@enumctr\endcsname
        {\EnumitemizeListParams}%
  \fi}

\def\EnumitemizeListParams{%
\usecounter\@enumctr%
\leftmargin\z@ \parsep\z@ \itemsep\z@ \parskip\z@ \topsep\z@ \partopsep\z@ \labelsep0.5em \labelwidth\z@
\ifnum \@enumdepth=1\itemindent=1.5em
\else  \ifnum \@enumdepth=2\itemindent=2.777em
\else  \ifnum \@enumdepth=3\itemindent=3.777em
\else  \itemindent=4.277em \fi\fi\fi
\def\makelabel##1{{##1}}}

\let\endenumitemize =\endlist
%=====================================================================

\def\henumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\HenumListParams}%
  \fi}

\def\HenumListParams{%
\usecounter\@enumctr%
\leftmargin\z@ \parsep\z@ \itemsep\z@ \parskip\z@ \topsep\z@ \partopsep\z@ \labelsep0.5em
\ifnum \@enumdepth=1\leftmargin=1.277em
\else  \ifnum \@enumdepth=2\leftmargin=1.8em
\else  \ifnum \@enumdepth=3\leftmargin=1.65em
\else  \leftmargin=1.55em\fi\fi\fi
\def\makelabel##1{\hss\llap{##1}}}

\let\endhenumerate=\endlist
%=====================================================================

\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\ItemizeListParams}%
  \fi}

\def\ItemizeListParams{%
\leftmargin\z@ \parsep0\z@ \itemsep\z@ \parskip\z@ \topsep\z@ \partopsep\z@ \labelsep0.5em \labelwidth\z@
\ifnum \@itemdepth=1 \itemindent1.5em
\else \ifnum \@itemdepth=2 \itemindent2.5em
\else \ifnum \@itemdepth=3 \itemindent3.5em
\else \itemindent4.5em \fi\fi\fi
\def\makelabel##1{{##1}}}

\let\enditemize =\endlist
%=====================================================================

\def\hitemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\HitemizeListParams}%
  \fi}

\def\HitemizeListParams{%
\leftmargin\z@ \parsep\z@ \itemsep\z@ \parskip\z@ \topsep\z@ \partopsep\z@ \labelsep0.5em \labelwidth\z@
\ifnum \@itemdepth=1 \leftmargin 1em \itemindent-0.5em
\else \ifnum \@itemdepth=2 \leftmargin1.15em \itemindent-0.65em
\else \ifnum \@itemdepth=3 \leftmargin1em \itemindent -0.5em
\else \leftmargin1em \itemindent-0.5em \fi\fi\fi
\def\makelabel##1{{##1}}}

\let\endhitemize =\endlist
%=====================================================================
%%% -e-newlst1
%%%=============================================================================


%%%\input{04thmo01.sty}% theorems
%%%=============================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-b-04thmo01.sty (derived from THEOREM for MOOR)
%%%\RequirePackage{theorem}

\gdef\th@TH{%
  \def\theorem@headerfont{\normalfont\TheoremHeaderFont}%
  \theorempreskipamount=6pt plus 3pt minus 2pt \theorempostskipamount=6pt plus 3pt minus 2pt
  \if@MOOR\labelsep1em\else\labelsep0.5em\fi
  \def\@begintheorem##1##2{\normalfont\TheoremTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep
          \theorem@headerfont ##1\ ##2.]}%
  \def\@opargbegintheorem##1##2##3{\normalfont\TheoremTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep
          \theorem@headerfont ##1\ ##2\ {\bf(##3)}.]}}

\gdef\th@THkey{%
  \def\theorem@headerfont{\normalfont\TheoremHeaderFont}%
  \theorempreskipamount=6pt plus 3pt minus 2pt \theorempostskipamount=6pt plus 3pt minus 2pt
  \if@MOOR\labelsep1em\else\labelsep0.5em\fi
  \def\@begintheorem##1##2{\normalfont\TheoremTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep
          \theorem@headerfont ##1\ ##2.]}%
  \def\@opargbegintheorem##1##2##3{\normalfont\TheoremTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep
          \theorem@headerfont {##3}]}}

\gdef\th@EX{%
  \def\theorem@headerfont{\normalfont\ExampleHeaderFont}%
  \if@OPRE
  \theorempreskipamount=6pt plus 3pt minus 2pt \theorempostskipamount=6pt plus 3pt minus 2pt
  \else
  \theorempreskipamount=0pt\theorempostskipamount=0pt
  \fi
  \if@MOOR\labelsep1em\else\labelsep0.5em\fi
  \def\@begintheorem##1##2{\normalfont\ExampleTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep \theorem@headerfont ##1\ ##2.]}%
  \def\@opargbegintheorem##1##2##3{\normalfont\ExampleTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep \theorem@headerfont ##1\ ##2\ {(##3)}.]}}

\gdef\th@EXkey{%
  \def\theorem@headerfont{\normalfont\ExampleHeaderFont}%
  \if@OPRE
  \theorempreskipamount=6pt plus 3pt minus 2pt \theorempostskipamount=6pt plus 3pt minus 2pt
  \else
  \theorempreskipamount=0pt\theorempostskipamount=0pt
  \fi
  \if@MOOR\labelsep1em\else\labelsep0.5em\fi
  \def\@begintheorem##1##2{\normalfont\ExampleTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep \theorem@headerfont ##1\ ##2.]}%
  \def\@opargbegintheorem##1##2##3{\normalfont\ExampleTextFont
        \item[\if@OPRE\else\hspace*{1em}\fi\hskip\labelsep \theorem@headerfont {##3}]}}

\def\TheoremHeaderFont{\mdseries\scshape}
\def\TheoremTextFont{\thit}
\def\ExampleHeaderFont{\mdseries\scshape}
\def\ExampleTextFont{\rm}

%% Use for proper proofs that end with extra space (regardless of the use
%% or non-use of \qed (=the black box)
\def\proof#1{\Trivlist\item[\hspace*{1em}\hskip\labelsep{\it #1\enskip }]\ignorespaces}
\def\endproof{\endTrivlist\addvspace{0pt}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-e-04thmo01.sty
%%%\endinput
%%%=============================================================================

\JOURNAL{}%{Journal Name Option Missing!}

\def\theARTICLETOP{%
  \vspace*{-57pt}
  \begin{Center}
  \parbox[t][60pt][t]{\textwidth}{%
  \theARTICLETOPLEFT\hfill\theARTICLETOPRIGHT}\\[10pt]
  \parbox{36pc}{\fs.10.11.\bf\textcolor{red}{Authors are encouraged to submit new papers to INFORMS journals by means of
a style file template, which includes the journal title. However, use of a
template does not certify that the paper has been accepted for publication
in the named journal. INFORMS journal templates are for the exclusive
purpose of submitting to an INFORMS journal and should not be used to
distribute the papers in print or online or to submit the papers to another
publication.}}
\vspace*{12pt}
  \end{Center}}

% default values
\def\HOOKtop{\vspace*{0pt}}%
\def\HOOKa{\vspace*{0pt}}%
\def\HOOKb{\vspace*{0pt}}%
\def\HOOKc{\vspace*{0pt}}%

\def\MANUSCRIPTNO#1{\gdef\theMANUSCRIPTNO{#1}}%
  \def\theMANUSCRIPTNO{(Please, provide the manuscript number!)}%{Manuscript number}%

%
\long\def\theARTICLETOPLEFT{{\tabcolsep0pt\fs.8.10.%
\begin{tabular}[t]{l}\null\quad\null\\[0pt]
  \fs.10.10.{\bfseries\sffamily\MakeUppercase{\theJOURNAL}}\\[1pt]
  Vol.~\theVOLUME, No.~\theNO, \theMONTH~\theYEAR, \thePAGERANGE\\
  {\sc issn}\,\theISSN\SEPBAR{\sc eissn}\,\theEISSN\SEPBAR
  \theSHORTYEAR\SEPBAR\theISSUE\SEPBAR\theLONGFIRSTPAGE
\end{tabular}}}%
\def\theARTICLETOPRIGHT{{\tabcolsep0pt\fs.8.10.%
\begin{tabular}[t]{r}\null\quad\null\\[0pt]
  {\fs.16.16.\bfseries\sffamily INFORMS}\\[1pt]
  {\sc doi}\,\theDOI\\
  \copyright\,\theYEAR~INFORMS\end{tabular}}}%
%

\if@BLINDREV
%
\long\def\theARTICLETOPLEFT{{\tabcolsep0pt\fs.12.14.\bf
\begin{tabular}{l}\HD{25}{0}Submitted to {\bi\theJOURNAL}\\
manuscript {\theMANUSCRIPTNO}\end{tabular}}}%
\def\theARTICLETOPRIGHT{}%
%
%\def\theHISTORY{}%
\fi

\if@NONBLINDREV
%
\long\def\theARTICLETOPLEFT{{\tabcolsep0pt\fs.12.14.\bf
\begin{tabular}{l}\HD{25}{0}Submitted to {\bi\theJOURNAL}\\
manuscript {\theMANUSCRIPTNO}\end{tabular}}}%
\def\theARTICLETOPRIGHT{}%
%
\fi

\def\ABSfont{\EGT}

\def\theARTICLEABSTRACT{%
  \begin{Center}
  \HOOKb
  \vspace*{18pt}
  \begin{minipage}{\ABSwidth}\parindent1em
    \ABSfont
    \noindent\theABSTRACT\endgraf
    \vskip5pt
    \theKEYWORDS
    \theSUBJECTCLASS
    \theAREAOFREVIEW
    \theMSCCLASS
    \theORMSCLASS
    \if@BLINDREV\else\theHISTORY\fi
  \end{minipage}%
  \vspace*{0pt}
  \end{Center}}

%SSSSSSS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%\input{04scmo01.sty}
%%%=============================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-b-04scmo01.sty (sectioning in MOOR)
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart         {\@Roman\c@part}
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%-------------------------------------------------
\def\@startsection#1#2#3#4#5#6{%
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
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
%-------------------------------------------------
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
%%%    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
    \protected@edef\@svsec{\ifnum \c@nowappendix=1
       \ifnum#2=1\@appseccntformat{#1}\else\@seccntformat{#1}\fi
       \else\@seccntformat{#1}\fi}%
%%%%%\edef\@svsec{\indent\ifnum \c@nowappendix=1 \ifnum#2=1{Appendix~}\fi\fi
%%%%%     \csname the#1\endcsname \ifnum#2=1.\fi \hskip 5pt }\fi
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
%-------------------------------------------------
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
%-------------------------------------------------
\def\@seccntformat#1{{\upshape\csname the#1\endcsname.}\hskip1.0em }
\def\@appseccntformat#1{{\upshape Appendix~\csname the#1\endcsname:}\hskip1.0em }
\if@OPRE
\def\@seccntformat#1{{\upshape\csname the#1\endcsname.}\enskip }
\def\@appseccntformat#1{{\upshape Appendix~\csname the#1\endcsname:}\enskip }
\fi
\if@MOOR
\def\@seccntformat#1{{\upshape\csname the#1\endcsname.}\enskip }
\def\@appseccntformat#1{{\upshape Appendix~\csname the#1\endcsname:}\enskip }
\fi
%-------------------------------------------------
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
%-------------------------------------------------

\def\section{\@startsection{section}{1}{\z@}{-15pt plus -5pt minus -4pt}{0.01pt}%
    {\fs.13.15.\bf\RAGG}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-12pt plus -4pt minus -2pt}{0.01pt}
    {\fs.11.{13.6}.\bf\RAGG}}
\def\subsubsection{\@startsection{subsubsection}{3}{10pt}{6pt plus 3pt minus 2pt}{-5pt}
    {\fs.11.{13.6}.\bf}}
\def\paragraph{\@startsection{paragraph}{4}{10pt}{0.1pt plus 0.1pt minus 0.1pt}{-0.5em}%
    {\fs.11.{13.6}.\it}}
\def\subparagraph{\@startsection{subparagraph}{5}{10pt}{0.1pt plus 0.1pt minus 0.1pt}{-1em}%
    {\fs.11.{13.6}.\it}}

%% EC subtitle (what it really is: Proofs, Technical Appendix, ...)
\def\ECHead#1{\par\noindent{\raggedright\fs.15.18.\bf #1\endgraf}}

%\def\section{\@startsection{section}{1}{0pt}{-12pt plus -9pt minus -4pt}{0.01pt}{\fs.13.15.\bf}}%
%\def\subsection{\@startsection{subsection}{2}{0pt}{-12pt plus -6pt minus -2pt}{3pt}{\fs.12.14.\bf}}%
%\def\subsubsection{\@startsection{subsubsection}{3}{0pt}{6pt plus 5pt minus 1pt}{-1em}{\TEN\bf}}%
%\def\paragraph{\@startsection{paragraph}{4}{1.0em}{-0.01pt}{-1em}{\bi}}%
%\def\subparagraph{\@startsection{subparagraph}{5}{1.0em}{-0.01pt}{-1em}{\it}}%

\if@OPRE
\def\section{\@startsection {section}{1}{\z@}{-13pt plus -6pt minus -3pt}{4pt}%
  {\fs.13.15.\sffamily\bfseries\RAGG}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{-13pt plus -6pt minus -3pt}{4pt}%
  {\TEN\sffamily\bfseries\RAGG}}%
\def\subsubsection{\@startsection{subsubsection}{3}{1.0em}{6pt plus 4pt minus 2pt}{-10pt}%
  {\TEN\bf}}%
\def\paragraph{\@startsection{paragraph}{4}{1em}{0.1pt plus 0.1pt minus 0.1pt}{-0.5em}{\TEN\it}}%
\def\subparagraph{\@startsection{subparagraph}{5}{1em}{0.1pt plus 0.1pt minus 0.1pt}{-1em}{\TEN\it}}%
\fi

\if@MOOR
\def\section{\@startsection{section}{1}{1em}{12pt plus 2pt minus 4pt}{-1em}{\bf}}%
\def\subsection{\@startsection{subsection}{2}{1em}{12pt plus 2pt minus 2pt}{-1em}{\bf}}%
\def\subsubsection{\@startsection{subsubsection}{3}{1em}{12pt plus 2pt minus 2pt}{-1em}{\bf}}%
\def\paragraph{\@startsection{paragraph}{4}{1em}{6pt plus 1pt minus 2pt}{-1em}{\bi}}%
\def\subparagraph{\@startsection{subparagraph}{5}{1em}{-0.01pt}{-1em}{\it}}%
\fi

%---
\def\ECHowSections{%
\setcounter{section}{0}%
\renewcommand\thesection      {EC.\@arabic\c@section}%
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}%
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}%
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}%
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FIGURES and TABLES
\newbox\@tempboxa
\newbox\@tempboxb

\def\FigureCaptionFontStyle{\sffamily\bfseries}%
\def\FigureNameFontStyle{\sffamily\bfseries}%
\def\FigureNoteStyle{\EGT\rm}
\def\FigureNoteName{Note.}

\def\TableCaptionFontStyle{\sffamily\bfseries}%
\def\TableNameFontStyle{\sffamily\bfseries}%
%\def\TableFontSize{\EGT}
\def\TableNoteStyle{\EGT\rm}
\def\TableNoteName{Note.}

\def\NOTE#1{\unskip\hspace*{0em}{\it #1\/}\enskip}

\if@OPRE
\def\FigureCaptionFontStyle{\mdseries}%
\def\FigureNameFontStyle{\bfseries}%
\def\TableCaptionFontStyle{\mdseries}%
\def\TableNameFontStyle{\bfseries}%
\def\TableNoteStyle{\EGT\sffamily}
\def\NOTE#1{\unskip\hspace*{0em}{\sffamily\itshape #1\/}\enskip}
\fi

\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \setbox9=\hbox{\FigureNameFontStyle #1\kern16pt}\hangindent\wd9\noindent
  \HD{9}{0}\hbox{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{9}\endgraf}
\long\def\@maketablecaption#1#2{\EGT\TableCaptionFontStyle
  \setbox9=\hbox{\TableNameFontStyle #1\kern16pt}\hangindent\wd9\noindent
  \HD{9}{0}\hbox{\TableNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{5}\endgraf}

%% MJ-4/19/2006
\if@MNSC
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \begin{Center}\HD{9}{0}{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf\end{Center}}
\fi
\if@IJOC
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \setbox9=\hbox{\FigureNameFontStyle #1\kern16pt}\hangindent\wd9\noindent
  \HD{9}{0}\hbox{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf}
\fi
\if@TRSC
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \setbox9=\hbox{\FigureNameFontStyle #1\kern16pt}\hangindent\wd9\noindent
  \HD{9}{0}\hbox{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf}
\fi

%% MJ-3/9/2015
\if@STSC
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \begin{Center}\HD{9}{0}{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf\end{Center}}
\fi
\if@STSC
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \begin{Center}\HD{9}{0}{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf\end{Center}}
\fi

%% MW-11/5/2020
\if@IJDS
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \begin{Center}\HD{9}{0}{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf\end{Center}}
\fi
\if@IJDS
\long\def\@makefigurecaption#1#2{\EGT\FigureCaptionFontStyle
  \begin{Center}\HD{9}{0}{\FigureNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{0}\endgraf\end{Center}}
\fi


%% MJ-1/31/2007
\long\def\@maketablecaption#1#2{\EGT\TableCaptionFontStyle
  \begin{Center}\HD{9}{0}{\TableNameFontStyle #1\kern16pt}\ignorespaces #2\HD{0}{5}\endgraf\end{Center}}


\newif\if@rotate \@rotatefalse
\def\rotate{\global\@rotatetrue}
\def\endrotate{\global\@rotatefalse}

%*********************************************

%************************************
\def\FIGURE#1#2#3{%
\long\def\testfignote{#3}%
\long\def\itis@empty{}%
\ifx\testfignote\itis@empty
  \long\def\fignote##1{\relax}%
\else
  \long\def\fignote##1{\par\noindent
  \FigureNoteStyle\HD{11}{0}{\it\FigureNoteName}\enskip ##1\endgraf}%
\fi
\if@rotate
  \setbox4=\hbox to \textheight{\vbox{\hsize\textheight
  \begin{minipage}{\textheight}
  \caption[]{#2}%
  \begin{Center}%
  {#1}%
  \end{Center}%
  \fignote{#3}%
  \end{minipage}}}
\else
  \setbox4=\hbox to \hsize{\vbox{%
  \begin{minipage}{\hsize}
  \caption[]{#2}
  \hbox to\hsize{\hss{#1}\hss}%
  \fignote{#3}%
  \end{minipage}}}
\fi
\if@rotate
  \noindent\vrule width0pt height0.5\textheight depth0.5\textheight
  \hspace*{0.5\textwidth}\rotatebox{90}{\copy4}%
\else
  \box4
\fi}
%************************************
%************************************
\if@STSC
\def\FIGURE#1#2#3{%
\long\def\testfignote{#3}%
\long\def\itis@empty{}%
\ifx\testfignote\itis@empty
  \long\def\fignote##1{\relax}%
\else
  \long\def\fignote##1{\par\noindent
  \FigureNoteStyle\noindent\HD{11}{0}{\it\FigureNoteName}\enskip ##1\endgraf}%
\fi
\if@rotate
  \setbox4=\hbox to \textheight{\vbox{\hsize\textheight
  \begin{minipage}{\textheight}
  \caption[]{#2}%
  \begin{Center}%
  {#1}%
  \end{Center}%
  \fignote{#3}%
  \end{minipage}}}
\else
  \setbox4=\hbox to \hsize{\vbox{%
  \begin{minipage}{\hsize}
  \caption[]{#2}
  \hbox to\hsize{\hss{#1}\hss}%
  \fignote{#3}%
  \end{minipage}}}
\fi
\if@rotate
  \noindent\vrule width0pt height0.5\textheight depth0.5\textheight
  \hspace*{0.5\textwidth}\rotatebox{90}{\copy4}%
\else
  \box4
\fi}
\fi
%************************************

%************************************
\if@IJDS
\def\FIGURE#1#2#3{%
\long\def\testfignote{#3}%
\long\def\itis@empty{}%
\ifx\testfignote\itis@empty
  \long\def\fignote##1{\relax}%
\else
  \long\def\fignote##1{\par\noindent
  \FigureNoteStyle\noindent\HD{11}{0}{\it\FigureNoteName}\enskip ##1\endgraf}%
\fi
\if@rotate
  \setbox4=\hbox to \textheight{\vbox{\hsize\textheight
  \begin{minipage}{\textheight}
  \caption[]{#2}%
  \begin{Center}%
  {#1}%
  \end{Center}%
  \fignote{#3}%
  \end{minipage}}}
\else
  \setbox4=\hbox to \hsize{\vbox{%
  \begin{minipage}{\hsize}
  \caption[]{#2}
  \hbox to\hsize{\hss{#1}\hss}%
  \fignote{#3}%
  \end{minipage}}}
\fi
\if@rotate
  \noindent\vrule width0pt height0.5\textheight depth0.5\textheight
  \hspace*{0.5\textwidth}\rotatebox{90}{\copy4}%
\else
  \box4
\fi}
\fi
%************************************

%************************************
\if@TRSC
\def\FIGURE#1#2#3{%
\long\def\testfignote{#3}%
\long\def\itis@empty{}%
\ifx\testfignote\itis@empty
  \long\def\fignote##1{\relax}%
\else
  \long\def\fignote##1{\par\noindent
  \FigureNoteStyle\noindent\HD{11}{0}{\it\FigureNoteName}\enskip ##1\endgraf}%
\fi
\if@rotate
  \setbox4=\hbox to \textheight{\vbox{\hsize\textheight
  \begin{minipage}{\textheight}
  \begin{Center}%
  {#1}%
  \end{Center}%
  \caption[]{#2}%
  \fignote{#3}%
  \end{minipage}}}
\else
  \setbox4=\hbox to \hsize{\vbox{%
  \begin{minipage}{\hsize}
  \hbox to\hsize{\hss{#1}\hss}%
  \caption[]{#2}
  \fignote{#3}%
  \end{minipage}}}
\fi
\if@rotate
  \noindent\vrule width0pt height0.5\textheight depth0.5\textheight
  \hspace*{0.5\textwidth}\rotatebox{90}{\copy4}%
\else
  \box4
\fi}
\fi
%************************************

\def\TEGT{\TableSpaced}%

% TABLE
\long\def\TABLE#1#2#3{\setbox\tempbox=\hbox{{\TEGT #2}}%
  \tempdim\wd\tempbox\tempdimht\ht\tempbox\advance\tempdimht\dp\tempbox
  \@TABLE{#1}{#2}{#3}{\tempdim}}

\long\def\@TABLE#1#2#3#4{%
\TableSpaced
%\if@COPYEDIT\ifdim\tempdimht<\TableStretchBreak\def\arraystretch{1.5}\else\def\arraystretch{1}\fi\else\fi
\long\def\testtabnote{#3}%
\long\def\itis@empty{}%
\ifx\testtabnote\itis@empty
  \long\def\tabnote##1{\relax}%
\else
  \long\def\tabnote##1{\par\TableNoteStyle\parindent1em\ignorespaces
    \HD{11}{0}##1\endgraf}%
\fi
\if@rotate
  \setbox4=\hbox to \textheight
  {\vbox to \textwidth{\hsize\textheight\vfill\begin{Flushright}% Center
  \begin{minipage}[c]{#4}%
  \caption[]{#1}{\TEGT #2}\tabnote{#3}\end{minipage}
  \end{Flushright}\vfill}}
\else
  \setbox4=\hbox to \hsize{\hss
  \begin{minipage}[t]{#4}%
  \caption[]{#1}{\TEGT #2}\tabnote{#3}\end{minipage}\hss}
\fi
\if@rotate
  \rotatebox{90}{\copy4}%
\else
  \box4
\fi}
%\fi
%*********************
\if@MOOR
\def\FigureCaptionFontStyle{\mdseries}%
\def\TableCaptionFontStyle{\mdseries}%
\long\def\@makefigurecaption#1#2{\EGT
  \FigureCaptionFontStyle
  \setbox\@tempboxa=\hbox{{\sc #1.}\enskip #2}%
  \setbox\@tempboxb=\hbox{#2}%
  \ifdim \wd\@tempboxb < 3pt
    \noindent\null\hfill{\sc #1.}%
    \HD{14}{0}\hfill\null\endgraf
  \else
  \ifdim \wd\@tempboxa >\hsize
    \noindent\hspace*{0em}\HD{14}{0}{\sc #1.}\enskip
    #2\par
  \else
    \noindent\null\hfill{\sc #1.}%
    \enskip #2\HD{14}{0}\hfill\null\endgraf
  \fi\fi}%
\long\def\@maketablecaption#1#2{\EGT
% Set TN followed by the caption see the length
  \setbox\@tempboxa
  \hbox{\TableCaptionFontStyle{\sc #1}.\enskip #2}%
% Set the caption only to examine its existence and length if any
  \setbox\@tempboxb
  \hbox{\TableCaptionFontStyle #2}%
% If no caption, TN centers with no period after it
  \ifdim\wd\@tempboxb < 3pt
    \begin{Center}\TableCaptionFontStyle\HD{8}{0}{\sc #1}\HD{0}{6}\end{Center}
  \else
% If TN+caption shorter than the table
  \ifdim\wd\@tempboxa < \tempdim
    \begin{Center}\TableCaptionFontStyle\HD{8}{0}{\sc #1}.\enskip #2\HD{0}{6}\end{Center}
  \else
% If TN+caption longer than the table
    \noindent\TableCaptionFontStyle\HD{8}{0}{\sc #1}.\enskip #2\HD{0}{6}\endgraf
  \fi\fi}%
%
\def\FIGURE#1#2#3{%
\long\def\testfignote{#3}\long\def\itis@empty{}%
\ifx\testfignote\itis@empty
  \long\def\fignote##1{\relax}%
\else
  \long\def\fignote##1{\par{\FigureNoteStyle
    \parindent1em\HD{10}{0}{\it\FigureNoteName}\enskip
    ##1\HD{0}{3}\vspace*{-3pt}\endgraf}}%
\fi
\if@rotate
  \setbox4=\hbox to \textheight{\vbox{\hsize\textheight
  \begin{minipage}{\textheight}
  \caption[]{#2}
  \hbox to\hsize{\hss{#1}\hss}%
  \fignote{#3}%
  \end{minipage}}}
\else
  \setbox4=\hbox to \hsize{\vbox{%
  \begin{minipage}{\hsize}
  \caption[]{#2}
  \hbox to\hsize{\hss{#1}\hss}%
  \fignote{#3}%
  \end{minipage}}}
\fi
\if@rotate
  \setbox5=\zeroCC{\box4}%
  \par\noindent\hspace*{0.5\textwidth}%
  \vrule width 0pt height 0.5\textheight depth 0.499\textheight
  \rotatebox{90}{\box5}%
\else
  \noindent\box4%
\fi}
%
% TABLE
\def\TABLE#1#2#3{%
  \setbox\tempbox=\hbox{{\TEGT #2}}%
  \tempdim\wd\tempbox\tempdimht\ht\tempbox\advance\tempdimht\dp\tempbox
  \@TABLE{#1}{#2}{#3}{\tempdim}}
%
\def\@TABLE#1#2#3#4{%
%%\if@COPYEDIT\ifdim\tempdimht<\TableStretchBreak\def\arraystretch{1.5}\else\def\arraystretch{1}\fi\else\fi
\TABLESpaced
\long\def\testtabnote{#3}%
\long\def\itis@empty{}%
\ifx\testtabnote\itis@empty
  \long\def\tabnote##1{\relax}%
\else
  \long\def\tabnote##1{\par\TableNoteStyle{\parindent1em
  \HD{13}{0}##1\endgraf}}%
\fi
\if@rotate
  \setbox4=\hbox to #4 %%\textheight
  {\vbox to \textwidth{\hsize #4 %%%\textheight
  \vss
  \begin{minipage}[c]{#4}%
  \caption[]{#1}%
  {\TEGT #2}%
  \tabnote{#3}%
  \end{minipage}%
  \vss}}
\else
  \setbox4=\hbox to \hsize{\hss
  \begin{minipage}[t]{#4}%
  \TEGT
  \caption[]{#1}%
  {\TEGT #2}%
  \tabnote{#3}%
  \end{minipage}\hss}
\fi
\if@rotate
  \setbox5=\zeroCC{\box4}%
  \par\noindent\hspace*{0.5\textwidth}%
  \vrule width 0pt height 0.5\textheight depth 0.499\textheight
  \rotatebox{90}{\box5}%
\else
  \noindent\box4%
\fi}
\fi
%*********************

\def\TheoremsNumberedBySection{%
\theoremstyle{TH}%
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{corollary}{Corollary}[section]
\newtheorem{claim}{Claim}[section]
\newtheorem{conjecture}{Conjecture}[section]
\newtheorem{hypothesis}{Hypothesis}[section]
\newtheorem{assumption}{Assumption}[section]
\theoremstyle{EX}
\newtheorem{remark}{Remark}[section]
\newtheorem{example}{Example}[section]
\newtheorem{problem}{Problem}[section]
\newtheorem{definition}{Definition}[section]
\newtheorem{question}{Question}[section]
\newtheorem{answer}{Answer}[section]
\newtheorem{exercise}{Exercise}[section]
%---
\def\ECTheoremsNumberedBySection{%
\setcounter{theorem}{0}\let\oldthetheorem=\thetheorem\def\thetheorem{\oldthetheorem}%
\setcounter{lemma}{0}\let\oldthelemma=\thelemma\def\thelemma{\oldthelemma}%
\setcounter{proposition}{0}\let\oldtheproposition=\theproposition\def\theproposition{\oldtheproposition}%
\setcounter{corollary}{0}\let\oldthecorollary=\thecorollary\def\thecorollary{\oldthecorollary}%
\setcounter{claim}{0}\let\oldtheclaim=\theclaim\def\theclaim{\oldtheclaim}%
\setcounter{conjecture}{0}\let\oldtheconjecture=\theconjecture\def\theconjecture{\oldtheconjecture}%
\setcounter{hypothesis}{0}\let\oldthehypothesis=\thehypothesis\def\thehypothesis{\oldthehypothesis}%
\setcounter{assumption}{0}\let\oldtheassumption=\theassumption\def\theassumption{\oldtheassumption}%
\setcounter{remark}{0}\let\oldtheremark=\theremark\def\theremark{\oldtheremark}%
\setcounter{example}{0}\let\oldtheexample=\theexample\def\theexample{\oldtheexample}%
\setcounter{problem}{0}\let\oldtheproblem=\theproblem\def\theproblem{\oldtheproblem}%
\setcounter{definition}{0}\let\oldthedefinition=\thedefinition\def\thedefinition{\oldthedefinition}%
\setcounter{question}{0}\let\oldthequestion=\thequestion\def\thequestion{\oldthequestion}%
\setcounter{answer}{0}\let\oldtheanswer=\theanswer\def\theanswer{\oldtheanswer}%
\setcounter{exercise}{0}\let\oldtheexercise=\theexercise\def\theexercise{\oldtheexercise}%
}%
\def\ECHowTheorems{\ECTheoremsNumberedBySection}%
%---
}
\def\TheoremsNumberedThrough{%
\theoremstyle{TH}%
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{claim}{Claim}
\newtheorem{conjecture}{Conjecture}
\newtheorem{hypothesis}{Hypothesis}
\newtheorem{assumption}{Assumption}
\theoremstyle{EX}
\newtheorem{remark}{Remark}
\newtheorem{example}{Example}
\newtheorem{problem}{Problem}
\newtheorem{definition}{Definition}
\newtheorem{question}{Question}
\newtheorem{answer}{Answer}
\newtheorem{exercise}{Exercise}
%---
\def\ECTheoremsNumberedThrough{%
\setcounter{theorem}{0}\let\oldthetheorem=\thetheorem\def\thetheorem{EC.\oldthetheorem}%
\setcounter{lemma}{0}\let\oldthelemma=\thelemma\def\thelemma{EC.\oldthelemma}%
\setcounter{proposition}{0}\let\oldtheproposition=\theproposition\def\theproposition{EC.\oldtheproposition}%
\setcounter{corollary}{0}\let\oldthecorollary=\thecorollary\def\thecorollary{EC.\oldthecorollary}%
\setcounter{claim}{0}\let\oldtheclaim=\theclaim\def\theclaim{EC.\oldtheclaim}%
\setcounter{conjecture}{0}\let\oldtheconjecture=\theconjecture\def\theconjecture{EC.\oldtheconjecture}%
\setcounter{hypothesis}{0}\let\oldthehypothesis=\thehypothesis\def\thehypothesis{EC.\oldthehypothesis}%
\setcounter{assumption}{0}\let\oldtheassumption=\theassumption\def\theassumption{EC.\oldtheassumption}%
\setcounter{remark}{0}\let\oldtheremark=\theremark\def\theremark{EC.\oldtheremark}%
\setcounter{example}{0}\let\oldtheexample=\theexample\def\theexample{EC.\oldtheexample}%
\setcounter{problem}{0}\let\oldtheproblem=\theproblem\def\theproblem{EC.\oldtheproblem}%
\setcounter{definition}{0}\let\oldthedefinition=\thedefinition\def\thedefinition{EC.\oldthedefinition}%
\setcounter{question}{0}\let\oldthequestion=\thequestion\def\thequestion{EC.\oldthequestion}%
\setcounter{answer}{0}\let\oldtheanswer=\theanswer\def\theanswer{EC.\oldtheanswer}%
\setcounter{exercise}{0}\let\oldtheexercise=\theexercise\def\theexercise{EC.\oldtheexercise}%
}%
\def\ECHowTheorems{\ECTheoremsNumberedThrough}%
%---
}
%\TheoremsNumberedThrough% default behavior (in the template): Th. 1, Th. 2, Lemma 1, ...

\def\ECRepeatTheorems{%
\theoremstyle{THkey}%
\newtheorem{repeattheorem}{Theorem}
\newtheorem{repeatlemma}{Lemma}
\newtheorem{repeatproposition}{Proposition}
\newtheorem{repeatcorollary}{Corollary}
\newtheorem{repeatclaim}{Claim}
\newtheorem{repeatconjecture}{Conjecture}
\newtheorem{repeathypothesis}{Hypothesis}
\newtheorem{repeatassumption}{Assumption}
\theoremstyle{EXkey}
\newtheorem{repeatremark}{Remark}
\newtheorem{repeatexample}{Example}
\newtheorem{repeatproblem}{Problem}
\newtheorem{repeatdefinition}{Definition}
\newtheorem{repeatquestion}{Question}
\newtheorem{repeatanswer}{Answer}
\newtheorem{repeatexercise}{Exercise}}


\def\TableStretchBreak{380pt}%

%%%%%%%%%%%%%%%%%%%%%%%%%

\if@DECA
\JOURNAL{Decision Analysis}%
\ISSN{1545-8490}%
\EISSN{1545-8504}%
\fi

\if@IJOC
\JOURNAL{INFORMS Journal on Computing}%
\ISSN{0899-1499}%
\EISSN{1526-5528}%
\OneAndAHalfSpacedXII
\fi

\if@INTE
\JOURNAL{INFORMS Journal on Applied Analytics}%
\ISSN{0092-2102}%
\EISSN{1526-551X}%
\fi

\if@ISRE
\JOURNAL{Information Systems Research}%
\ISSN{1047-7047}%
\EISSN{1526-5536}%
\fi

\if@MNSC
\JOURNAL{Management Science}%
\ISSN{0025-1909}%
\EISSN{1526-5501}%
\fi

\if@MKSC
\JOURNAL{Marketing Science}%
\ISSN{0732-2399}%
\EISSN{1526-548X}%
\fi

\if@MOOR
\JOURNAL{Mathematics of Operations Research}%
\ISSN{0364-765X}%
\EISSN{1526-5471}%
\fi

\if@MSOM
\JOURNAL{Manufacturing \& Service Operations Management}%
\ISSN{1523-4614}%
\EISSN{1526-5498}%
\fi

\if@OPRE
\JOURNAL{Operations Research}%
\ISSN{0030-364X}%
\EISSN{1526-5463}%
\fi

\if@ORSC
\JOURNAL{Organization Science}%
\ISSN{1047-7039}%
\EISSN{1526-5455}%
\fi

\if@TRSC
\JOURNAL{Transportation Science}%
\ISSN{0041-1655}%
\EISSN{1526-5447}%
\fi

\if@ITED
\JOURNAL{INFORMS Transactions on Education}%
\ISSN{1532-0545}%
\EISSN{1532-0545}%
\fi

\if@SERV
\JOURNAL{Service Science}%
\ISSN{2164-3962}%
\EISSN{2164-3970}%
\fi

\if@STSC
\JOURNAL{Strategy Science}%
\ISSN{2333-2050}%
\EISSN{2333-2077}%
\fi


\if@IJDS
\JOURNAL{INFORMS Journal on Data Science}%
\ISSN{2694-4022}%
\EISSN{2694-4030}%
\fi


\pagestyle{headings}
\pagenumbering{arabic}
\onecolumn\sloppy
\frenchspacing
\flushbottom

\AtBeginDocument{\ARTICLEfirstpage}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%-b-Appendix
%\newcommand\appendix{\par
%  \setcounter{section}{0}%
%  \setcounter{subsection}{0}%
%  \renewcommand\thesection{\@Alph\c@section}}

\def\appendixhead#1{\vskip20pt plus 9pt minus4pt\noindent
  {\AppendixHeadSize\textbf{#1}}\vskip4pt\nobreak}%

\newenvironment{APPENDIX}[1]{\par
  \long\def\testAPP{.\space #1}%
  \long\def\testAPPempty{.\space}%
  \ifx\testAPP\testAPPempty
    \appendixhead{Appendix}%
  \else
    \appendixhead{Appendix. #1}%
  \fi
  \AppendixFontSize
  \def\section{\@startsection{section}{1}{0pt}%
    {-6pt plus -6pt minus -1pt}{2.5pt}{\AppendixSectionHeadSize\bf\RAGG}}
  \def\subsection{\@startsection{subsection}{2}{0pt}%
    {-4pt plus -4pt minus -1pt}{2pt}{\AppendixFontSize\bf\RAGG}}
  \def\subsubsection{\@startsection{subsubsection}{3}{0pt}%
    {3pt plus 3pt minus 1pt}{-1em}{\AppendixFontSize\bf}}
  \if@MOOR
    \def\section{\@startsection{section}{1}{1em}{12pt plus 2pt minus 4pt}{-1em}{\bf}}%
    \def\subsection{\@startsection{subsection}{2}{1em}{12pt plus 2pt minus 2pt}{-1em}{\bf}}%
    \def\subsubsection{\@startsection{subsubsection}{3}{1em}{12pt plus 2pt minus 2pt}{-1em}{\bf}}%
  \fi
  \if@OPRE
    \def\section{\@startsection{section}{1}{0pt}%
      {-6pt plus -6pt minus -1pt}{2.5pt}{\AppendixSectionHeadSize\sffamily\bfseries\RAGG}}
    \def\subsection{\@startsection{subsection}{2}{0pt}%
      {-4pt plus -4pt minus -1pt}{2pt}{\AppendixFontSize\sffamily\bfseries\RAGG}}
    \def\subsubsection{\@startsection{subsubsection}{3}{0pt}%
      {3pt plus 3pt minus 1pt}{-1em}{\AppendixFontSize\bf}}
  \fi
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \renewcommand\thesection{\@Alph\c@section}%
  \parindent1em}
  {\vskip1sp}

\newenvironment{APPENDICES}{%
  \par\setcounter{nowappendix}{1}\relax
  \AppendixFontSize
  \def\section{\@startsection{section}{1}{0pt}%
    {-6pt plus -6pt minus -1pt}{2.5pt}{\AppendixSectionHeadSize\bf\RAGG}}
  \def\subsection{\@startsection{subsection}{2}{0pt}%
    {-4pt plus -4pt minus -1pt}{2pt}{\AppendixFontSize\bf\RAGG}}
  \def\subsubsection{\@startsection{subsubsection}{3}{0pt}%
    {3pt plus 3pt minus 1pt}{-1em}{\AppendixFontSize\bf}}
  \if@MOOR
    \def\section{\@startsection{section}{1}{1em}{12pt plus 2pt minus 4pt}{-1em}{\bf}}%
    \def\subsection{\@startsection{subsection}{2}{1em}{12pt plus 2pt minus 2pt}{-1em}{\bf}}%
    \def\subsubsection{\@startsection{subsubsection}{3}{1em}{12pt plus 2pt minus 2pt}{-1em}{\bf}}%
  \fi
  \if@OPRE
    \def\section{\@startsection{section}{1}{0pt}%
      {-6pt plus -6pt minus -1pt}{2.5pt}{\AppendixSectionHeadSize\sffamily\bfseries\RAGG}}
    \def\subsection{\@startsection{subsection}{2}{0pt}%
      {-4pt plus -4pt minus -1pt}{2pt}{\AppendixFontSize\sffamily\bfseries\RAGG}}
    \def\subsubsection{\@startsection{subsubsection}{3}{0pt}%
      {3pt plus 3pt minus 1pt}{-1em}{\AppendixFontSize\bf}}
  \fi
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{subsubsection}{0}%
  \renewcommand\thesection{\@Alph\c@section}%
  \parindent1em}
  {\vskip1sp}


\def\AppendixHeadSize{\fs.13.15.\relax}
\def\AppendixFontSize{\small}
\def\AppendixSectionHeadSize{\fs.11.{13.6}.\relax}

\if@MOOR
\let\AppendixHeadSize=\normalsize
\let\AppendixFontSize=\normalsize
\let\AppendixSectionHeadSize=\normalsize
\fi

\if@OPRE
\let\AppendixHeadSize=\normalsize
\let\AppendixFontSize=\normalsize
\let\AppendixSectionHeadSize=\normalsize
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%-e-Appendix

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ECSwitch{%
\clearpage
%\SingleSpaced
\normalsize
\pagestyle{ECheadings}%
\ECHowTheorems
\ECHowEquations
\ECHowSections
\setcounter{figure}{0}%
\renewcommand\thefigure{EC.\@arabic\c@figure}%
\setcounter{table}{0}%
\renewcommand\thetable{EC.\@arabic\c@table}%
\setcounter{page}{1}\def\thepage{ec\arabic{page}}%
\hspace*{1em}\relax}

\long\def\ECDisclaimer{\par\noindent{\fs.15.20.\raggedright\bf This page is intentionally blank.
Proper e-companion title page, with INFORMS branding and exact metadata
of the main paper, will be produced by the INFORMS office when the issue is being assembled.\endgraf}\clearpage}



\frenchspacing
\parindent 1em

\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% end of informs2.cls

