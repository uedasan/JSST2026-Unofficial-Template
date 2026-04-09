%\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{jasse}[2014/07/29 ver.0.5]
\LoadClass[a4paper,twoside,11pt]{article}
%
\oddsidemargin=17pt
\evensidemargin=17pt
\topmargin=4.6mm
\headheight=12pt
\headsep=10pt
\footskip=30pt
\textheight=600pt
\textwidth=430pt
\columnsep=5mm
%%%%%%%%
\def\@maketitle{%
\newpage\null\vskip 2em%
\begin{center}%
	\let \footnote \thanks%
	{\LARGE\bf \@title \par}%
    	\vskip 1.5em%
    	{\large \lineskip .5em%
    	\begin{tabular}[t]{c}%
		\@author%
	\end{tabular}\par}%
    $^*$\texttt{\@email}\par%
	\vskip 1em
\end{center}%
  \par%
  \vskip 1.5em%
  \gdef\@email{}%
}%
\long
\def\email#1{\long\gdef\@email{#1}}%
\def\Received#1{\gdef\@Received{Received: #1}}
\def\Accepted#1{\gdef\@Accepted{Accepted: #1}}
\def\Published#1{\gdef\@Published{Published: #1}}
%%%%%%%%%%%%%%%%%%%
% Abstract
%%%%%%%%%%%%%%%%%%%
\renewenvironment{abstract}{%
\par
\noindent\textbf{Abstract. }\ignorespaces
}{\par}
%%%%%%%%%%%%%%%%%%%
% Keywords
%%%%%%%%%%%%%%%%%%%
\newenvironment{keywords}{%
\par\vspace{0.5em}%
\noindent\textbf{Keywords: }\ignorespaces
}{\par}
%%%%%%%%%%%%%%%%%%%
% Acknowledgement
%%%%%%%%%%%%%%%%%%%
\def\acknowledgement{%
\vskip 1.7em
\noindent{\bfseries{\Large Acknowledgement}\ }\\[3mm]
%
}
%%%%%%%%%%%%%%%%%%%
% Appendix
%%%%%%%%%%%%%%%%%%%
\let\oldappendix\appendix
\renewcommand{\appendix}{%
\oldappendix%
\renewcommand{\thesection}{Appendix \Alph{section}.}}%
%%%%%%%%%%%%%%%%%%%
% Include packages
%%%%%%%%%%%%%%%%%%%
%\usepackage{amsmath,amssymb,amsthm}
\usepackage{amsmath,amsthm}
\usepackage[varg]{txfonts}
%\usepackage{amsfonts}
\usepackage{authblk}
\usepackage{lastpage}
\usepackage{fancyhdr}
\usepackage[dvipdfmx]{graphicx}
\renewcommand\Affilfont{\normalsize}% font size of affiliations
\renewcommand\Authands{, }% omit ``, and'' in authors' list 
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}
\renewcommand\Authfont{\normalsize}
\renewcommand\Affilfont{\small}
%
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LO,RE]{\slshape JSST2026}
\fancyfoot[C]{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
%
%%%%%%%%%%%%%%%%%%%
% Paper Information
%%%%%%%%%%%%%%%%%%%
\def\Year#1{\gdef\@Year{#1}}
\def\Vol#1{\gdef\@Vol{#1}}
\def\No#1{\gdef\@No{#1}}
\def\Pages#1{\gdef\@Pages{#1}}
\fancypagestyle{titlepage}
   {
   \fancyhf{}
   \fancyhead[L]{\slshape JSST2026}
   \fancyfoot[C]{\thepage}
   \renewcommand\headrulewidth{0pt}
   \renewcommand\footrulewidth{0pt}
   \setlength\headheight{12pt}
   }
%
%%%%%%%%%%%%%%%%%%%
% Theorem environment
%%%%%%%%%%%%%%%%%%%
\newtheorem{theorem}{Theorem}
\newtheorem{algorithm}{Algorithm}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{condition}{Condition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{remark}{Remark}

\makeatletter
\renewenvironment{thebibliography}[1]
     {\section*{References}%
      \small
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
            \setlength{\itemsep}{2pt}
            \setlength{\parsep}{0pt} 
            \setlength{\parskip}{0pt}
            \setlength{\topsep}{0pt}
           }%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\endlist}
\makeatother
