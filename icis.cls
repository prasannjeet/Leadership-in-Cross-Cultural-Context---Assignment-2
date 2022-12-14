\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icis}[2014/03/01 ICIS Conference submission style]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt,letterpaper]{article}

% Must have the following two lines at the top of your document
% %!TEX TS-program = xelatex
% %!TEX encoding = UTF-8 Unicode
% Or you must manually choose to compile with XeLaTeX

% These 3 are required to use the Georgia font family
\RequirePackage{xltxtra}
\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{graphicx}
\RequirePackage[labelsep=period,font=bf]{caption}   % Replace caption colon with
                                % period
%\RequirePackage[margin=1in]{geometry}
% \RequirePackage[total={7in,9.25in},top=0.75in,paper=letterpaper]{geometry}
\RequirePackage{fancyhdr}

% Get rid of spacing inside lists
\RequirePackage{enumitem}
\setlist{noitemsep}

\RequirePackage[backend=biber,
sorting=nyt,
style=authoryear,
sortcites=true,
maxcitenames=2,
mincitenames=1,
maxbibnames=100,
date=year,
url=false,
urldate=long,
isbn=false,
firstinits=true,
doi=false,
terseinits=false,
autocite=inline,
uniquename=false,
dashed=false,
uniquelist=false,
block=none, %unsure about this one. hopefully it will be in the style
hyperref=true, %unsure about this too.
]{biblatex}

% \defaultfontfeatures{Scale=MatchLowercase}
\setmainfont[Ligatures={Common,TeX}]{Georgia}
% \setromanfont[Numbers=Uppercase]{Georgia}

\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\renewcommand{\Huge}{\fontsize{20pt}{24pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{13pt}{15pt}\selectfont}
\renewcommand{\Large}{\fontsize{12pt}{14pt}\selectfont}
\renewcommand{\large}{\fontsize{11pt}{13pt}\selectfont}
% \setlength{\textwidth}{7in}
% \setlength{\textheight}{9.25in}
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}

\urlstyle{rm}

% These are variables set in the frontmatter of the document
% Not exactly sure if I need this step, but it was in the example I found.
\let\@researchtype\@empty
\let\@shorttitle\@empty
\let\@track\@empty

\newcommand{\researchtype}[1]{\gdef\@researchtype{#1}}
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand{\track}[1]{\gdef\@track{#1}}

\renewcommand{\maketitle}{%
  \begin{center} %
    {\Huge\bfseries\@title\par}
    {\Large\itshape\@researchtype\par}
  \end{center}
  \thispagestyle{plain}\@thanks
}

% TODO: Figure out citation style. Of course, MISQ doesn't use APA. 

\renewcommand{\section}{%
  \@startsection
    {section}{1}{0pt}{4pt}%
    {4pt}{\bfseries\LARGE}%
}

\renewcommand{\subsection}{%
  \@startsection
    {subsection}{2}{0pt}{4pt}%
    {4pt}{\bfseries\large\itshape}%
}

\renewcommand{\subsubsection}{%
  \@startsection
    {subsubsection}{3}{0pt}{4pt}%
    {4pt}{\bfseries}%
}
\setcounter{secnumdepth}{0}

% Header and footer info
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\textit{\@shorttitle}}
% \fancyhead[LE]{\textit{\@track}}
%\fancyfoot[R]{\textit{Thirty Sixth International Conference on Information Systems, %
           %   Fort Worth 2015}\hspace{5mm}\textbf{\thepage}}
% \fancyfoot[LE]{\textbf{\thepage}\hspace{5mm}\textit{Thirty Sixth International Conference on Information Systems, %
%               Fort Worth 2015}}

% No header on the first page. Only a footer
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[R]{\textit{\@shorttitle}}
   % \fancyfoot[R]{\textit{Thirty Sixth International Conference on Information Systems, %
    %          Fort Worth 2015}\hspace{5mm}\textbf{\thepage}}
  }

% Get rid of the horizontal rules
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Bibliography stuff
\renewcommand{\bibnamedelimi}{. }
% \renewcommand{\bibnamedelima}{.}
% \renewcommand{\bibnamedelimb}{.}