%% This is file `imsart.cls'
%%
%% LaTeX 2e class file for the processing of LaTeX2e files
%% of the following IMS/BS journals:
%%
%%   The Annals of Probability
%%   The Annals of Applied Probability
%%   The Annals of Statistics
%%   The Annals of Applied Statistics
%%   Statistical Science
%%   Probability Surveys
%%   Statistics Surveys
%%   Electronic Journal of Statistics
%%   Bernoulli
%%   Annales de l'Institut Henri Poincar\'e - Probabilit\'es et Statistiques
%%   Brazilian Journal of Probability and Statistics
%%   Bayesian Analysis
%%
%%   Institute of Mathematical Statistics, U.S.A.
%%   Bernoulli Society
%%   Institut Henry Poincare
%%   Brazilian Statistical Association
%%   International Society for Bayesian Analysis
%%   
%% Macros written by Vytas Statulevicius, VTeX, Lithuania
%% Maintained by Deimantas Galcius, VTeX, Lithuania
%% for Institute of Mathematical Statistics, U.S.A.
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% The original distribution is located at:
%% http://www.e-publications.org/ims/support
%%
%% This class file loads standard "article.cls" with appropriate 
%% settings and then style file "imsart.sty" with additional macros
%%
%% You are free to use this style file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.
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
%%
%%
%% Bug fixes and changes: at end of file
% 
% TeX programming: Vytas Statulevicius, VTeX, Lithuania.
% TeX programming: Deimantas Galcius, VTeX, Lithuania.
% TeX programming: Edgaras Sakuras, VTeX, Lithuania.
% Requires Latex2e, ver.2000.06
% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imsart}[2020/08/23 driver class for package imsart.sty]
% 
% set various options for different journals:
\DeclareOption{ps}{%
    \PassOptionsToClass{10pt,oneside}{article}%
    }
% 
\DeclareOption{ss}{%
    \PassOptionsToClass{10pt,oneside}{article}%
    }
% 
\DeclareOption{ejs}{%
    \PassOptionsToClass{10pt,oneside}{article}%
    }
% 
\DeclareOption{aap}{%
    \PassOptionsToClass{11pt,oneside,leqno}{article}%
    \PassOptionsToPackage{leqno}{amsmath}%
    }
% 
\DeclareOption{aop}{%
    \PassOptionsToClass{11pt,oneside,leqno}{article}%
    \PassOptionsToPackage{leqno}{amsmath}%
    }
% 
\DeclareOption{aos}{%
    \PassOptionsToClass{11pt,oneside,leqno}{article}%
    \PassOptionsToPackage{leqno}{amsmath}%
    }
% 
\DeclareOption{aoas}{%
    \PassOptionsToClass{11pt,oneside,leqno}{article}%
    \PassOptionsToPackage{leqno}{amsmath}%
    }
% 
\DeclareOption{sts}{%
    \PassOptionsToClass{11pt,oneside,leqno}{article}%
    \PassOptionsToPackage{leqno}{amsmath}%
    }
% 
\DeclareOption{bj}{%
    \PassOptionsToClass{10pt,oneside}{article}%
    }
% 
\DeclareOption{aihp}{%
    \PassOptionsToClass{10pt,oneside,fleqn}{article}%
    \PassOptionsToPackage{fleqn}{amsmath}%
    \PassOptionsToPackage{numbers,sort&compress}{natbib}%
    }
% 
\DeclareOption{bjps}{%
    \PassOptionsToClass{11pt,twoside}{article}%
    }
% 
\DeclareOption{ba}{%
    \PassOptionsToClass{10pt,oneside}{article}%
    }
% 
\PassOptionsToPackage{cmex10}{amsmath}
% 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
% 
\LoadClass{article}
% 
\IfFileExists{imsart.sty}%
    {}%
    {%
        \ClassError{imsart}%
            {The complimentary style file "imsart.sty" is required}%
            {%
                The complimentary style file "imsart.sty" is required\MessageBreak
                You need to install file "imsart.sty" in your system\MessageBreak
                File could be downloaded from http://www.e-publications.org/ims/support
            }%
    }
% 
% Load additional macros and modifications for "article.cls"
\RequirePackage{imsart}
% 
\endinput
%%
%% End of file `imsart.cls'.
