\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proposal}[2025 proposal]

\RequirePackage[utf8]{inputenc}

% Load base class
\LoadClass[%
]{scrartcl}

% Document title macros
\newcommand*{\@applicant}{}
\newcommand*{\applicant}[1]{\gdef\@applicant{#1}}
\newcommand*{\@project}{}
\newcommand*{\project}[1]{\gdef\@project{#1}}


\RequirePackage[T1]{fontenc}
\RequirePackage[english, ngerman]{babel}
\RequirePackage{csquotes}
\RequirePackage{amsmath}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{microtype}
\RequirePackage[headheight = 28pt, tmargin = 70pt, lmargin = 55pt, rmargin = 55pt, bmargin = 70pt]{geometry}
\RequirePackage[exponent-product = \cdot]{siunitx}
\RequirePackage{rotating}
\RequirePackage{helvet}
\RequirePackage{lastpage}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{eurosym}
\RequirePackage{fp}
\RequirePackage{pgfgantt}
\RequirePackage{booktabs}

\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}

\RequirePackage[backend = biber,
    style = alphabetic,
    giveninits = true,
    natbib = true,
    hyperref = true,
    maxbibnames = 10,
    ]{biblatex}
\renewcommand*{\labelalphaothers}{}
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
    \renewcommand{\formdate}{03/25}
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
    \renewcommand{\formdate}{03/25}
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

\ihead{\dfgform{} \formnumber{} -- \formdate{}}
\ohead{\pagemark}
\cfoot{}
\chead{}

\KOMAoptions{paper=a4}
\KOMAoption{fontsize}{11pt}
\pagestyle{scrheadings}
\setkomafont{section}{\normalsize}
\setkomafont{subsection}{\normalsize}
\renewcommand{\familydefault}{\sfdefault}
\renewcommand{\headfont}{\sffamily\footnotesize}
\setlength{\parskip}{0.5em}
\setlength{\parindent}{0em}

% Avoid hyperref warning when using the listed commands in section titles etc.:
\pdfstringdefDisableCommands{%
    \def\underline#1{<#1>}%
}

\newcommand{\subsubsubsection}[1]{\paragraph{#1} \mbox{} \par}
\setcounter{secnumdepth}{5}

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
