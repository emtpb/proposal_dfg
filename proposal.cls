\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proposal}[2025 proposal]

% Load base class
\LoadClass[%
    a4paper,
    fontsize=11pt,
    captions=tableheading,
]{scrartcl}

% Document title macros
\newcommand*{\@applicant}{}
\newcommand*{\applicant}[1]{\gdef\@applicant{#1}}
\newcommand*{\@project}{}
\newcommand*{\project}[1]{\gdef\@project{#1}}

\RequirePackage[T1]{fontenc}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{lastpage}
\RequirePackage[english, ngerman]{babel}
\RequirePackage{csquotes}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{helvet}
\RequirePackage{microtype}
\RequirePackage{amsmath}
\RequirePackage[exponent-product = \cdot]{siunitx}
\RequirePackage{eurosym}
\RequirePackage{fp}

\RequirePackage[backend = biber,
    style = alphabetic,
    giveninits = true,
    natbib = true,
    hyperref = true,
    maxbibnames = 10,
    ]{biblatex}
\renewcommand*{\labelalphaothers}{}
\urlstyle{same}
\DeclareBibliographyCategory{reviewed}
\DeclareBibliographyCategory{nonreviewed}

\newcommand{\maxpage}{}
\newcommand{\page}{}
\newcommand{\of}{}
\newcommand{\ofmax}{}
\newcommand{\total}{}
\newcommand{\dfgform}{}
\newcommand{\formnumber}{}
\newcommand{\formdate}{}
\newcommand{\settitle}

\DeclareOption{german}{
    \sisetup{locale=DE,detect-all}
    \AtBeginDocument{\selectlanguage{ngerman}}
    \renewcommand{\page}{Seite}
    \renewcommand{\of}{von}
    \renewcommand{\ofmax}{von max.}
    \renewcommand{\total}{Summe}
    \renewcommand{\dfgform}{DFG-Vordruck}
}

\DeclareOption{english}{
    \sisetup{locale=US,detect-all}
    \AtBeginDocument{\selectlanguage{english}}
    \renewcommand{\page}{page}
    \renewcommand{\of}{of}
    \renewcommand{\ofmax}{of max.}
    \renewcommand{\total}{Total}
    \renewcommand{\dfgform}{DFG form}
}

\DeclareOption{53.01}{
    \renewcommand{\maxpage}{17}
    \renewcommand{\pagemark}{\page{} \thepage{} \ofmax{} \maxpage{}}
    \renewcommand{\formnumber}{53.01}
    \renewcommand{\formdate}{09/25}
    \@ifclasswith{proposal}{german}{%
        \renewcommand{\settitle}{%
            {\raggedright{}\normalsize\bfseries
            Beschreibung des Vorhabens - Projektanträge\par
            \@applicant\par
            \@project\par
            \rule{\textwidth}{0.5pt}\par
            Beschreibung des Vorhabens}
        }
    }{%
        \renewcommand{\settitle}{%
            {\raggedright{}\normalsize\bfseries
            Project Description - Project Proposals\par
            \@applicant\par
            \@project\par
            \rule{\textwidth}{0.5pt}\par
            Project Description}
        }
    }
    \AddToHook{begindocument/end}{\settitle}
}

\DeclareOption{53.02}{
    \renewcommand{\pagemark}{\page{} \thepage{} \of{} \pageref{LastPage}}
    \renewcommand{\formnumber}{53.02}
    \renewcommand{\formdate}{10/25}
    \@ifclasswith{proposal}{german}{%
        \renewcommand{\settitle}{%
            {\raggedright{}\normalsize\bfseries
            Gesamtbeschreibung der (Klinischen) Forschungsgruppe und des Koordinationsantrags\par
            \@applicant\par
            \@project\par
            \rule{\textwidth}{0.5pt}\par
            Gesamtbeschreibung der (Klinischen) Forschungsgruppe und des Koordinationsantrags}
        }
    }{%
        \renewcommand{\settitle}{%
            {\raggedright{}\normalsize\bfseries
            Overall Description of the (Clinical) Research Unit and the Coordination Proposal\par
            \@applicant\par
            \@project\par
            \rule{\textwidth}{0.5pt}\par
            Overall Description of the (Clinical) Research Unit and the Coordination Proposal}
        }
    }
    \AddToHook{begindocument/end}{\settitle}
}

\DeclareOption{53.20}{
    \renewcommand{\pagemark}{\page{} \thepage{}}
    \renewcommand{\formnumber}{53.20}
    \renewcommand{\formdate}{08/23}
    \@ifclasswith{proposal}{german}{%
        \renewcommand{\settitle}{%
            {\raggedright{}\normalsize\bfseries
            Beschreibung des Vorhabens - Antragsskizze Forschungsgruppe\par
            \@applicant\par
            \@project\par
            \rule{\textwidth}{0.5pt}\par
            Beschreibung des Vorhabens - Antragsskizze Forschungsgruppe}
        }
    }{%
        \renewcommand{\settitle}{%
            {\raggedright{}\normalsize\bfseries
            Project Description - Draft Proposal for a Research Unit\par
            \@applicant\par
            \@project\par
            \rule{\textwidth}{0.5pt}\par
            Project Description - Draft Proposal for a Research Unit}
        }
    }
    \AddToHook{begindocument/end}{\settitle}
}

\DeclareOption{53.200}{
    \renewcommand{\pagemark}{\page{} \thepage{} \of{} \pageref{LastPage}}
    \renewcommand{\formnumber}{53.200}
    \renewcommand{\formdate}{07/25}
}

\DeclareOption{9ptbibliography}{
    \renewcommand{\bibfont}{\footnotesize}
}

\ExecuteOptions{german}
\ProcessOptions\relax

% Page layout
\ihead{\dfgform{} \formnumber{} -- \formdate{}}
\ohead{\pagemark}
\cfoot{}
\chead{}
\pagestyle{scrheadings}
\KOMAoptions{DIV=12}
\setlength{\parskip}{0.5em}
\setlength{\parindent}{0em}

\setkomafont{section}{\normalsize}
\setkomafont{subsection}{\normalsize}
\renewcommand{\familydefault}{\sfdefault}
\renewcommand{\headfont}{\sffamily\footnotesize}

% Avoid hyperref warning when using the listed commands in section titles etc.:
\pdfstringdefDisableCommands{%
    \def\underline#1{<#1>}%
}

\newcommand{\subsubsubsection}[1]{\paragraph{#1} \mbox{} \par}
\setcounter{secnumdepth}{5}

% Macro to reset the page counter and provide a new maximum page number
\newcommand{\resetpagecount}[1]{%
    \clearpage
    \renewcommand{\maxpage}{#1}
    \setcounter{page}{1}
}


% Place this environment in funds section to automatically add up costs using the macro 'position'.
\newenvironment{funds}[1][]
    % Define variable funds for calculation. Store argument (description of total) in new command.
    {\def\funds{0.00} \newcommand{\totaldescr}{#1}}
    % Print total of environment with provided description.
    {\rule{\textwidth}{0.5pt} \par \total~\totaldescr \hfill \num[round-mode = places, round-precision = 2]{\funds}\,\euro}

% To be used inside a funds environment. Place text and add given price to totals.
\newcommand{\position}[2]{\par #1 \hfill \num[round-mode = places, round-precision = 2]{#2}\,\euro \FPeval{\funds}{\funds + #2}}
% Same as above but with multiples of a position.
\newcommand{\positionmul}[3]{\par #1 \hfill \num{#3} $\times$ \num[round-mode = places, round-precision = 2]{#2}\,\euro \FPeval{\funds}{\funds + #3*#2}}
