\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NSF}
%%%%%%%%%%%%%%%%%%%%% PAPPG FORMAT: FONT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     - Arial7 (not Arial Narrow), Courier New, or Palatino Linotype at a font 
%       size of 10 points or larger;
%     - Times New Roman at a font size of 11 points or larger; or
%     - Computer Modern family of fonts at a font size of 11 points or larger.
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% default (Computer Modern)
\LoadClass[11pt, letterpaper, onecolumn]{article}




%%%%%%%%%%%%%%%%%%%%% PAPPG FORMAT: MARGIN  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Margins, in all directions, must be at least an inch. No proposer-supplied
%    information may appear in the margins.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[margin=1in]{geometry}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%   PACKAGES: hyperref, graphicx, fancyhdr, titlecaps, titlesec, xcolor
%   
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[pdftex,colorlinks,linkcolor=black,citecolor=black,
                urlcolor=black,filecolor=black]{hyperref}

\RequirePackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.eps,.pdf,.jpeg,.png}

\RequirePackage{fancyhdr}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
% \fancyfoot[R]{\thepage} 

\RequirePackage{xcolor}
% Define a gray for the section bar
\definecolor{secbar}{RGB}{228,228,228}  % bar color

\RequirePackage{titlecaps}
\RequirePackage[explicit]{titlesec}
% Configure titlecaps behavior
\Addlcwords{and if or the a an of in on for with}

% ---- Configuration knobs ----
\newcommand{\secsize}{\large}        % section title size
\newcommand{\subsecsize}{\normalsize}     % subsection title size
%\newcommand{\subsubsecsize}{\normalsize} % subsubsection title size

% ---- Section formatting with gray bar ----
% Creates a full-width gray bar with proper alignment
\newcommand{\sectionbar}[2]{%
	\noindent
	\colorbox{secbar}{%
		\parbox{\dimexpr\textwidth-2\fboxsep\relax}{%
			\vspace{0.3em}% top padding
			\makebox[1.7em][l]{\secsize\bfseries #1}%
			\secsize\bfseries\titlecap{#2}%
			\vspace{0.3em}% bottom padding
		}%
	}%
}

% SECTION: Gray bar with number and title
\titleformat{\section}
{\secsize\bfseries}
{}
{0pt}
{\sectionbar{\thesection}{#1}}

\titlespacing*{\section}
{0pt}                    % left indent
{2ex plus 0.5ex}         % before spacing
{1ex plus 0.2ex}         % after spacing

% SUBSECTION: Aligned with section numbering
\titleformat{\subsection}
{\subsecsize\bfseries}
{\makebox[2.1em][l]{\thesubsection}}
{0pt}
{\titlecap{#1}}

\titlespacing*{\subsection}
{0pt}                    % left indent
{1.5ex plus 0.4ex}       % before spacing
{0.8ex plus 0.2ex}       % after spacing

% SUBSUBSECTION: Aligned with section numbering
\titleformat{\subsubsection}
{\subsecsize}
{\makebox[2.5em][l]{\thesubsubsection}}
{0pt}
{\titlecap{#1}}

\titlespacing*{\subsubsection}
{0pt}                    % left indent
{1.2ex plus 0.3ex}       % before spacing
{0.6ex plus 0.2ex}       % after spacing

% Alternative: With same spacing as sections
\newcommand{\doctitle}[1]{%
	\noindent
	{\secsize\bfseries #1}\\
	{\rule{\textwidth}{1pt}}%
	\par
}

\usepackage{nopageno}