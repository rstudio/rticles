%% Journal of Open Research Software Latex template -- Created By Stephen Bonner and John Brennan, Durham Universtiy, UK.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jors}[2016/03/08 Journal Of Open Software Research]

%% Article options
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}


\DeclareOption{sansserif}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{jors}{Unknown option '\CurrentOption'}
}


\ExecuteOptions{12pt}


\ProcessOptions\relax

\LoadClass[a4paper]{article}

%% Load additional packages and commands.
\RequirePackage{xcolor}
\RequirePackage{sectsty}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}

%% Additional TeX/LaTeX code...

%% Remove the indentation
\newlength\tindent
\setlength{\tindent}{\parindent}
\setlength{\parindent}{0pt}
\renewcommand{\indent}{\hspace*{\tindent}}

%% Remove the page numbers
\pagenumbering{gobble}

%% Set the font too 13 for the titles
\sectionfont{\fontsize{13}{15}\selectfont}

%% Set indentation for the lists
\setlist[description]{leftmargin=1cm,labelindent=1cm}

%% Set spacing for the section headings
\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}

%% Set margins
\usepackage[margin=1.2in,footskip=0.25in]{geometry}

\endinput
