%       What follows is a slightly modified version of D. Arseneau's
%       cite.sty style file, to take into account the form of references
%       for the journal Science.  We have left all copyright information
%       intact, as instructed by the author of the original file.




%     C I T E . S T Y
%
%     version 4.01  (Nov 2003)
%
%     Compressed, sorted lists of on-line or superscript numerical citations.
%     see also drftcite.sty (And the stub overcite.sty)
%
%     Copyright (C) 1989-2003 by Donald Arseneau
%     These macros may be freely transmitted, reproduced, or modified
%     provided that this notice is left intact.
%
%     Instructions follow \endinput.
%  ------------------------------------
% First, ensure that some catcodes have the expected values
\edef\citenum{% to restore funny codes
  \catcode\string`\string ` \the\catcode\string`\`
  \catcode\string`\string ' \the\catcode\string`\'
  \catcode\string`\string = \the\catcode\string`\=
  \catcode\string`\string _ \the\catcode\string`\_
  \catcode\string`\string : \the\catcode\string`\:}
\catcode\string`\` 12
\catcode`\' 12
\catcode`\= 12
\catcode`\_ 8
\catcode`\: 12

%   Handle optional variations:
%   [ verbose, nospace, space, ref, nosort, noadjust, superscript, nomove ],
%   \citeform,\citeleft,\citeright,\citemid,\citepunct,\citedash
%
%   Set defaults:

%   Science change -- ( on the left, per Science Style.
\providecommand\citeleft{(}

%   Science change -- ) on the right:
\providecommand\citeright{)}

%   Science addition -- biblabel changed to numerals with periods.
\renewcommand\@biblabel[1]{#1.}

%   , (comma space) before note
\providecommand\citemid{,\penalty\@medpenalty\ }

%   , (comma thin-space) between entries; [nospace] eliminates the space
\providecommand\citepunct{,\penalty\@m\hskip.13emplus.1emminus.1em}%

%   -- (endash) designating range of numbers:
% (using \hbox avoids easy \exhyphenpenalty breaks)
\providecommand{\citedash}{\hbox{--}\penalty\@m}

%   Each number left as-is:
\providecommand\citeform{}

%   punctuation characters to move for overcite
\providecommand{\CiteMoveChars}{.,:;}

%   font selection for superscript numbers
\providecommand\OverciteFont{\fontsize\sf@size\baselineskip\selectfont}


%   Do not repeat warnings.  [verbose] reverses
\let\oc@verbo\relax

% Default is to move punctuation:
\def\oc@movep#1{\futurelet\@tempb\@citey}

%----------------------
% \citen uses \@nocite to ignore spaces after commas, and write the aux file
% \citation. \citen then loops over the citation tags, using \@make@cite@list
% to make a sorted list of numbers.  Finally, \citen executes \@citelist to
% compress ranges of numbers and print the list. \citen can be used by itself
% to give citation numbers without the brackets and other formatting; e.g.,
% "See also ref.~\citen{junk}."
%
\DeclareRobustCommand\citen[1]{%
 \begingroup
  \let\@safe@activesfalse\@empty
  \@nocite{#1}% ignores spaces, writes to .aux file, returns #1 in \@no@sparg
  \@tempcntb\m@ne    % \@tempcntb tracks highest number
  \let\@h@ld\@empty  % nothing held from list yet
  \let\@citea\@empty % no punctuation preceding first
  \let\@celt\delimiter % an unexpandable, but identifiable, token
  \def\@cite@list{}% % empty list to start
  \@for \@citeb:=\@no@sparg\do{\@make@cite@list}% make a sorted list of numbers
  % After sorted citelist is made, execute it to compress citation ranges.
  \@tempcnta\m@ne    % no previous number
  \let\@celt\@compress@cite \@cite@list % output number list with compression
  \@h@ld % output anything held over
 \endgroup
 \@restore@auxhandle
 }

% For each citation, check if it is defined and if it is a number.
% if a number: insert it in the sorted \@cite@list
% otherwise: output it immediately.
%
\def\@make@cite@list{%
 \expandafter\let \expandafter\@B@citeB
          \csname b@\@citeb\@extra@b@citeb \endcsname
 \ifx\@B@citeB\relax % undefined: output ? and warning
    \@citea {\bfseries ?}\let\@citea\citepunct \G@refundefinedtrue
    \@warning {Citation `\@citeb' on page \thepage\space undefined}%
    \oc@verbo \global\@namedef{b@\@citeb\@extra@b@citeb}{?}%
 \else %  defined               % remove previous line to repeat warnings
    \ifcat _\ifnum\z@<0\@B@citeB _\else A\fi % a positive number, put in list
       \@addto@cite@list
    \else % citation is not a number, output immediately
       \@citea \citeform{\@B@citeB}\let\@citea\citepunct
 \fi\fi}

% Regular definition for adding entry to cite list, with sorting

\def\@addto@cite@list{\@tempcnta\@B@citeB \relax
   \ifnum \@tempcnta>\@tempcntb % new highest, add to end (efficiently)
      \edef\@cite@list{\@cite@list \@celt{\@B@citeB}}%
      \@tempcntb\@tempcnta
   \else % arbitrary number: insert appropriately
      \edef\@cite@list{\expandafter\@sort@celt \@cite@list \@gobble @}%
   \fi}
%
% \@sort@celt inserts number (\@tempcnta) into list of \@celt{num} (#1{#2})
% \@celt must not be expandable; list should end with two vanishing tokens.
%
\def\@sort@celt#1#2{\ifx \@celt #1% parameters are \@celt {num}
   \ifnum #2<\@tempcnta % number goes later in list
      \@celt{#2}%
      \expandafter\expandafter\expandafter\@sort@celt % continue
   \else % number goes here
      \@celt{\number\@tempcnta}\@celt{#2}% stop comparing
\fi\fi}

% Check if each number follows previous and can be put in a range
%
\def\@compress@cite#1{%  % This is executed for each number
  \advance\@tempcnta\@ne % Now \@tempcnta is one more than the previous number
  \ifnum #1=\@tempcnta   % Number follows previous--hold on to it
     \ifx\@h@ld\@empty   % first pair of successives
        \expandafter\def\expandafter\@h@ld\expandafter{\@citea 
           \citeform{#1}}%
     \else               % compressible list of successives
        \def\@h@ld{\citedash \citeform{#1}}%
     \fi
  \else   %  non-successor -- dump what's held and do this one
     \@h@ld \@citea \citeform{#1}%
     \let\@h@ld\@empty
  \fi \@tempcnta#1\let\@citea\citepunct
}

% Make \cite choose superscript or normal

\DeclareRobustCommand{\cite}{%
  \@ifnextchar[{\@tempswatrue\@citex}{\@tempswafalse\@citex[]}}

% Do \cite command on line.
%
\def\@citex[#1]#2{\@cite{\citen{#2}}{#1}}

% Modified by Science for italic number, roman parentheses.

\def\@cite#1#2{\leavevmode \cite@adjust
  \citeleft{\itshape {#1\if@tempswa\@safe@activesfalse\citemid{#2}\fi
  \spacefactor\@m % punctuation in note doesn't affect outside
  }}\citeright
 \@restore@auxhandle}

%  Put a penalty before the citation, and adjust the spacing: if no space
%  already or if there is extra space due to some punctuation, then change
%  to one inter-word space.
%
\def\cite@adjust{\begingroup%
  \@tempskipa\lastskip \edef\@tempa{\the\@tempskipa}\unskip
  \ifnum\lastpenalty=\z@ \penalty\@highpenalty \fi
  \ifx\@tempa\@zero@skip \spacefactor1001 \fi % if no space before, set flag
  \ifnum\spacefactor>\@m \ \else \hskip\@tempskipa \fi
  \endgroup}


\edef\@zero@skip{\the\z@skip}

%  Superscript cite, with no optional note.  Check for punctuation first.
%
\def\@citew#1{\begingroup \leavevmode
  \@if@fillglue \lastskip \relax \unskip
  \def\@tempa{\@tempcnta\spacefactor
     \/% this allows the last word to be hyphenated, and it looks better.
     \@citess{\citen{#1}}\spacefactor\@tempcnta
     \endgroup \@restore@auxhandle}%
  \oc@movep\relax}% check for following punctuation (depending on options)

%  Move trailing punctuation before the citation:
%
\def\@citey{\let\@tempc\@tempa
   % Watch for double periods and suppress them
   \ifx\@tempb.\ifnum\spacefactor<\@bigSfactor\else
     \let\@tempb\relax \let\@tempc\oc@movep
   \fi\fi
   % Move other punctuation
   \expandafter\@citepc\CiteMoveChars\delimiter
   \@tempc}%

\def\@citepc#1{%
   \ifx\@tempb#1\@empty #1\let\@tempc\oc@movep \fi
   \ifx\delimiter#1\else \expandafter\@citepc\fi}

%  Replacement for \@cite which defines the formatting normally done
%  around the citation list.  This uses superscripts with no brackets.
%  HOWEVER, trailing punctuation has already been moved over.  The
%  format for cites with note is given by \@cite.  Redefine \@cite and/
%  or \@citex to get different appearance.  I don't use \textsuperscript
%  because it is defined BADLY in compatibility mode.

\def\@citess#1{\mbox{$\m@th^{\hbox{\OverciteFont{#1}}}$}}

% \nocite: This is changed to ignore *ALL* spaces and be robust.  The
% parameter list, with spaces removed, is `returned' in \@no@sparg, which
% is used by \citen.
%
\DeclareRobustCommand\nocite[1]{%
 \@bsphack \@nocite{#1}%
 \@for \@citeb:=\@no@sparg\do{\@ifundefined{b@\@citeb\@extra@b@citeb}%
    {\G@refundefinedtrue\@warning{Citation `\@citeb' undefined}%
    \oc@verbo \global\@namedef{b@\@citeb\@extra@b@citeb}{?}}{}}%
 \@esphack}

\def\@nocite#1{\begingroup\let\protect\string% normalize active chars
 \xdef\@no@sparg{\expandafter\@ignsp#1 \: }\endgroup% and remove ALL spaces
 \if@filesw \immediate\write\@newciteauxhandle % = \@auxout, except with multibib
    {\string\citation {\@no@sparg}}\fi
 }

% for ignoring *ALL* spaces in the input.  This presumes there are no
% \outer tokens and no \if-\fi constructs in the parameter.  Spaces inside
% braces are retained.
%
\def\@ignsp#1 {\ifx\:#1\@empty\else #1\expandafter\@ignsp\fi}

% \@if@fillglue{glue}{true}{false}
\begingroup
 \catcode`F=12 \catcode`I=12\catcode`L=12
 \lowercase{\endgroup
 \def\@if@fillglue#1{%
  \begingroup \skip@#1\relax
  \expandafter\endgroup\expandafter 
  \@is@fil@ \the\skip@ \relax\@firstoftwo FIL\relax\@secondoftwo\@nil}
 \def\@is@fil@ #1FIL#2\relax#3#4\@nil{#3}
}

\let\nocitecount\relax  % in case \nocitecount was used for drftcite

% For the time being, just prevent gross errors from using hyperref.
% There are no hyper-links.  (I will need to carry the cite tags through
% the sorting process, and use \hyper@natlinkstart)

\providecommand\hyper@natlinkstart[1]{}
\providecommand\hyper@natlinkend{}
\providecommand\NAT@parse{\@firstofone}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     option processing

\DeclareOption{verbose}{\def\oc@verbo#1#2#3#4{}}
\DeclareOption{nospace}{\def\citepunct{,\penalty\@m}}
\DeclareOption{space}{\def\citepunct{,\penalty\@highpenalty\ }}
\DeclareOption{ref}{\def\citeleft{[Ref.\penalty\@M\ }}
\DeclareOption{nosort}{\def\@addto@cite@list
   {\edef\@cite@list{\@cite@list \@celt{\@B@citeB}}}}
\DeclareOption{sort}{}% default!
\DeclareOption{nomove}{\def\oc@movep{\@tempa}\let\@citey\oc@movep}
\DeclareOption{move}{}% default
\DeclareOption{nocompress}{%
  \def\@compress@cite#1{%  % This is executed for each number
     \@h@ld \@citea \hyper@natlinkstart\citeform{#1}\hyper@natlinkend
     \let\@h@ld\@empty \let\@citea\citepunct}
}
\DeclareOption{compress}{}% default
\DeclareOption{super}{\ExecuteOptions{superscript}}
\DeclareOption{superscript}{%
  \DeclareRobustCommand{\cite}{%
    \@ifnextchar[{\@tempswatrue\@citex}{\@tempswafalse\@citew}}
}
\DeclareOption{noadjust}{\let\cite@adjust\@empty}% Don't change spaces
\DeclareOption{adjust}{}% adjust space before [ ]
\DeclareOption{biblabel}{\def\@biblabel#1{\@citess{#1}\kern-\labelsep\,}}
\ProvidesPackage{scicite}[2003/11/04 \space  v 4.01]
\ProcessOptions

\ifx\@citey\oc@movep\else % we are moving punctuation; must ensure sfcodes
  \mathchardef\@bigSfactor3000
  \expandafter\def\expandafter\frenchspacing\expandafter{\frenchspacing
    \mathchardef\@bigSfactor1001
    \sfcode`\.\@bigSfactor \sfcode`\?\@bigSfactor \sfcode`\!\@bigSfactor }%
  \ifnum\sfcode`\.=\@m \frenchspacing \fi
\fi

%  Compatability with chapterbib (see use of \@extra@b@citeb)
\@ifundefined{@extra@b@citeb}{\def\@extra@b@citeb{}}{}

%  Compatability with multibib (see use of \@newciteauxhandle) (Yes, this is
%  overly messy, but I asked for it...  I can't have multibib putting junk after 
%  the cite command because it hides following punctuation, but then I have
%  to restore the ordinary meaning of \@newciteauxhandle = \@auxout.)
\providecommand\@newciteauxhandle{\@auxout}
\AtBeginDocument{\@ifundefined{newcites}{\global\let\@restore@auxhandle\relax}{}}
\def\@restore@auxhandle{\def\@newciteauxhandle{\@auxout}}


\@ifundefined{G@refundefinedtrue}{\let\G@refundefinedtrue\relax}{}

\@ifundefined{@safe@activesfalse}{}{}
\@ifundefined{bbl@cite@choice}{}{\@ifundefined{org@@citex}{}%
  {\let\org@@citex\@citex}}% Prevent stomping by babel


\citenum % execute restore-catcodes

% Aliases:
\let\citenum\citen
\let\citeonline\citen

\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


                   CITE.STY

Modify LaTeX's normal citation mechanism to:

o Put a comma and a small space between each citation number. The option
  [nospace] removes that space, and the option [space] replaces it with
  an ordinary inter-word space.

o Sort citation numbers into ascending order, printing non-numbers before 
  numbers.  All numbers should be greater than zero.  The [nosort] package 
  option turns off sorting.

o Compress lists of three or more consecutive numbers to one number range
  which can be split, with difficulty, after the dash.  All numbers should
  be greater than zero.  E.g., if you used to get the (nonsense) list 
  [7,5,6,?,4,9,8,Einstein,6], then this style will give [?,Einstein,4-6,6-9].
  Compression of ranges is disabled by the [nocompress] package option.

o Allow, but strongly discourage, line breaks within a series of
  citations.  Each number is separated by a comma and a small space.
  A break at the beginning of an optional note is discouraged also.

o Put a high-penalty breakpoint before the citation (unless you specifically
  forbid it with ~ ).  Also, adjust the spacing: if there is no space or if
  there is extra space due to some punctuation, then change to one inter-word
  space. E.g.,   A space will be inserted here\cite{Larry,Curly,Moe}.

o With package option [superscript] (or [super] for short), display citation
  numbers as superscripts (unless they have optional notes, causing them to
  be treated as described above).  Superscripted citations follow these
  additional rules:

- Superscript citations use THE SAME INPUT FORMAT as ordinary citations; this
  style will ignore spaces before the citation, and move trailing punctuation
  before the superscript citation.  For example, "information \cite{source};"
  ignores the space before \cite and puts the semicolon before the number, just
  as if you had typed "information;$^{12}$".  You may switch off movement with
  the [nomove] package option (only relevant with [superscript]).

- The punctuation characters that will migrate before the superscript are
  listed in the macro \CiteMoveChars, which you can redefine.  The default is
  .,;:.   Perhaps ! and ? should too, but they weren't listed in the APS style
  manual I looked at, and I agree with that rule to prevent too much visual
  separation.  Quotes were listed, but they should never have to migrate
  because both on-line and superscript versions put quotes before the citation.
  This gives one difficulty --- punctuation following quotes won't migrate
  inside the quotation: e.g., "``Transition State Theory''\cite{Eyring}." gives
  "``Transition State Theory''.$^8$", but you may want the period inside the
  quotes, thus: ``Transition State Theory.''$^8$.

- Doubling of periods (.., ?., !.) is checked for and suppressed. The spacing
  after the citation is set according to the final punctuation mark moved.
  There is a problem with double periods after a capitalized abbreviation
  or directly after \@ : Both of "N.A.S.A. \cite{space}." and "et al.\@
  \cite{many}." will give doubled periods.  These can be fixed as follows:
  "N.A.S.A\@. \cite{space}." and "et al.\ \cite{many}.". The NASA example 
  gives the wrong spacing when there is no citation.  Sorry.  Use \  after
  abbreviations like et al. to get the right spacing within a sentence whether
  or not a citation follows.

- Remember, these rules regarding punctuation only apply when the [superscript]
  option was given (or overcite.sty used) and the [nomove] option was NOT
  given.

o Define \citen to get just the numbers without the brackets or superscript
  and extra formatting.  Aliases are \citenum and \citeonline for easy
  conversion to other citation packages.

o `Citation...undefined' warnings are only given once per undefined citation
  tag.  In the text, missing numbers are represented with a bold `?' at the
  first occurrence, and with a normal `?' thenceforth.  The package option
  [verbose] restores the usual repeated warnings.

o Make \nocite, \cite, and \citen all ignore spaces in the input tags.

Although each \cite command sorts its numbers, better compression into
ranges can usually be achieved by carefully selecting the order of the
\bibitem entries or the order of initial citations when using BibTeX.
Having the entries pre-sorted will also save processing time, especially
for long lists of numbers.

Customization:
~~~~~~~~~~~~~~
There are several options for \usepackage{cite}, some already mentioned.

 [superscript] use superscrpts for cites without optional notes
 [super]       alias for [superscript] (like natbib)
 [verbose]     causes warnings for undefined cites to be repeated each time
 [ref]         uses the format "[Ref.~12, optional note]" (useful with 
               the superscript option)
 [nospace]     eliminates the spaces after commas in the number list.
 [space]       uses a full inter-word space after the commas
 [nosort]      prevents sorting of the numbers (default is to sort, and a
 [sort]        option is provided for completeness).
 [nomove]      prevents moving the superscript cite after punctuation.
 [move]        is the default
 [noadjust]    disables `smart' handling of space before a cite
 [adjust]      is the default
 [nocompress]  inhibit compression of consecutive numbers into ranges
 [compress]    is the default
 [biblabel]    define the bibliography label as a superscript

There are several commands that you may redefine to change the formatting
of citation lists:

command       function                   default
----------    -----------------------    ----------------------------
\citeform     reformats each number      nothing
\citepunct    printed between numbers    comma + penalty + thin space
\citeleft     left delimiter of list     [
\citeright    right delimeter of list    ]
\citemid      printed before note        comma + space
\citedash     used in a compressed range endash + penalty
\CiteMoveChars  charcters that move      .,:;
\OverciteFont   font selection command for superscripts

The left/mid/right commands don't affect the formatting of superscript
citations.  You may use \renewcommand to change any of these.  Remember,
these commands are extensions made by this package; they are not regular
LaTeX.  Some examples of changes:

1: \renewcommand\citeform[1]{\romannumeral 0#1}} % roman numerals i,vi
2: \renewcommand\citeform[1]{(#1)} % parenthesized numbers (1)-(5),(9)
3: \renewcommand\citeform{\thechapter.}  % by chapter: ^{2.18-2.21}
4: \renewcommand\citepunct{,} % no space and no breaks at commas
5: \renewcommand\citemid{; }  % semicolon before optional note
6: \renewcommand\citeleft{(}  % parentheses around list with note
   \renewcommand\citeright{)} % parentheses around list with note

The appearance of the whole citation list is governed by \@cite, (for full-
sized cites) and \@citess (for superscripts).  For more extensive changes 
to the formatting, redefine these.  For example, to get brackets around the 
list of superscript numbers you can do:

   \def\@citess#1{\textsuperscript{[#1]}}

after \makeatletter.

Related Note:  The superscript option does not affect the numbering format
of the bibliography; the "[12]" style is still the default.  To get
superscripts in the bibliography (at any time) you can define

   \renewcommand\@biblabel[1]{\textsuperscript{#1}}

Aw, OK, for your convenience, there is the [biblabel] package option that
just performs this definition (sort of).

\@extra@b@citeb is a hook for other style files to further specify
citations; for example, to number by chapter (see chapterbib.sty).

% Version 1991: Ignore spaces after commas in the parameter list. Move most of
% \citen into \@cmpresscites for speed. Give the proper \spacefactor afterwards.
% Version 1992: make \citepunct hold the punctuation between numbers (for ease
% of changing).  Add \/ to allow hyphenation of previous word, and look better
% in italics.
% 1992a: Make it work with NFSS.  (Thank you C. Hamlin and Rainer Schoepf)
%
% Version 3.0 (1992):  Rewrite, including sorting.  Make entries like "4th"
% be treated properly as text.
% 3.1: Bug fixes (and Joerg-Martin Schwarz also convinced me to use \ifcat)
% 3.2: NFSS support was wrong--added \reset@font.  Suppress repetitions of
%      warnings.  Include \@extra@b@citeb hook.
% 3.3: Handle LaTeX2e options. Introduce various customization hooks.
% 3.4: Heuristics to avoid removing \hspace glue before on-line \cite.
%      Make \nocite ignore spaces in list, simplify. Aliases for \citen.
%      Compatability with amsmath (which defines \over).
% 3.5: Replace \reset@font with \selectfont so italics are preserved
%      Include \G@refundefinedtrue.  Fix cite-with-note bug (Lars Engebretsen).
% 3.6: Add nosort option.
% 3.7: Add nomove option; catcode preservation and global \@no@sparg for
%      french.sty; warnings in \nocite.
% 3.8: \citedash hook, fix token look-ahead (Heiko Selber), noadjust, babel.
% 3.9: More babel-compatibility hacks. Punctuation move with \frencspacing.
% 4.0: Combine overcite with cite: [superscript] option.  Also add [nocompress]
%      option and \CiteMoveChars; multibib hooks.
% 4.01 \bf -> \bfseries
%
% Send problem reports to asnd@triumf.ca

Test file integrity:  ASCII 32-57, 58-126:  !"#$%&'()*+,-./0123456789
:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
