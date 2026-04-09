\ProvidesClass{jasse-modern}[2026/04/10 v0.2 Modernized JSST/JASSE class]
\RequirePackage{iftex}

\newif\ifjasse@journal
\DeclareOption{journal}{\jasse@journaltrue}
\DeclareOption{proceedings}{\jasse@journalfalse}
\ExecuteOptions{proceedings}
\ProcessOptions\relax

\def\jasse@topmargin{4.6mm}
\def\jasse@headsep{10pt}
\def\jasse@footskip{30pt}
\def\jasse@textheight{600pt}
\def\jasse@columnsep{5mm}
\def\jasse@textwidth{430pt}
\def\jasse@classoptions{a4paper,twoside,11pt}
\def\jasse@oddsidemargin{17pt}
\def\jasse@evensidemargin{17pt}
\def\jasse@headheight{12pt}
\def\jasse@pagestyle@running{%
  \fancyhead[LO,RE]{\slshape \@proceedingsname}%
  \fancyfoot[C]{}%
}
\def\jasse@pagestyle@titleheadheight{12pt}
\def\jasse@pagestyle@titlehead{%
  \fancyhead[L]{\slshape \@proceedingsname}%
}
\def\jasse@title@dates{}

\ifjasse@journal
  \def\jasse@classoptions{a4paper,11pt}
  \def\jasse@oddsidemargin{27pt}
  \def\jasse@evensidemargin{27pt}
  \def\jasse@headheight{10pt}
  \def\jasse@textwidth{400pt}
  \def\jasse@pagestyle@running{%
    \fancyhead[R]{\slshape \@journalname}%
    \fancyfoot[C]{\thepage}%
  }
  \def\jasse@pagestyle@titlehead{%
    \fancyhead[L]{\footnotesize{\sc \@journalshortname}\\
    \rm Vol. \@Vol, No. \@No, \@Pages.}%
    \fancyhead[R]{\footnotesize\copyright~%
      \ifx\@copyrightyear\@empty\@Year\else\@copyrightyear\fi\ \@copyrightowner}%
  }
  \def\jasse@pagestyle@titleheadheight{40pt}
  \def\jasse@title@dates{{\small\@Received; \@Accepted; \@Published}}
\fi
\expandafter\LoadClass\expandafter[\jasse@classoptions]{article}

\oddsidemargin=\jasse@oddsidemargin
\evensidemargin=\jasse@evensidemargin
\topmargin=\jasse@topmargin
\headheight=\jasse@headheight
\headsep=\jasse@headsep
\footskip=\jasse@footskip
\textheight=\jasse@textheight
\textwidth=\jasse@textwidth
\columnsep=\jasse@columnsep

\RequirePackage{amsmath,amsthm}
\ifLuaTeX
  \RequirePackage{newtxtext,newtxmath}
  \RequirePackage{graphicx}
\else
  \RequirePackage[varg]{txfonts}
  \RequirePackage[dvipdfmx]{graphicx}
\fi
\RequirePackage{authblk}
\RequirePackage{fancyhdr}

\makeatletter

% Mode-specific publication metadata.
\def\@proceedingsname{JSST2026}
\def\ProceedingsName#1{\gdef\@proceedingsname{#1}}
\def\@journalname{Journal of Advanced Simulation in Science and Engineering}
\def\JournalName#1{\gdef\@journalname{#1}}
\def\@journalshortname{J.~Adv.~Simulat.~Sci.~Eng.}
\def\JournalShortName#1{\gdef\@journalshortname{#1}}
\def\@copyrightyear{}
\def\CopyrightYear#1{\gdef\@copyrightyear{#1}}
\def\@copyrightowner{Japan Society for Simulation Technology}
\def\CopyrightOwner#1{\gdef\@copyrightowner{#1}}

% Shared title metadata.
\def\@email{}
\def\@Received{}
\def\@Accepted{}
\def\@Published{}
\def\@Year{}
\def\@Vol{}
\def\@No{}
\def\@Pages{}
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
  \jasse@title@dates
\end{center}%
  \par%
  \vskip 1.5em%
  \gdef\@email{}%
}%
\long
\def\email#1{\long\gdef\@email{#1}}%

% Journal-only publication dates.
\def\Received#1{\gdef\@Received{Received: #1}}
\def\Accepted#1{\gdef\@Accepted{Accepted: #1}}
\def\Published#1{\gdef\@Published{Published: #1}}

% Legacy aliases kept for compatibility with journal-style inputs.
\def\ReceivedDate#1{\gdef\@Received{Received: #1}}
\def\AcceptedDate#1{\gdef\@Accepted{Accepted: #1}}
\def\PublishedDate#1{\gdef\@Published{Published: #1}}

% Shared document environments.
\renewenvironment{abstract}{%
\par
\noindent\textbf{Abstract. }\ignorespaces
}{\par}

\newenvironment{keywords}{%
\par\vspace{0.5em}%
\noindent\textbf{Keywords: }\ignorespaces
}{\par}

\def\acknowledgement{%
\vskip 1.7em
\noindent{\bfseries{\Large Acknowledgement}\ }\\[3mm]
}

\let\oldappendix\appendix
\renewcommand{\appendix}{%
\oldappendix%
\renewcommand{\thesection}{Appendix \Alph{section}.}}%

\renewcommand\Authands{, }
\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.}
\renewcommand\Authfont{\normalsize}
\renewcommand\Affilfont{\small}

% Shared page-style setup with mode-specific header hooks.
\pagestyle{fancy}
\fancyhf{}
\jasse@pagestyle@running
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% Journal issue metadata. Proceedings mode accepts these but does not render them.
\def\Year#1{\gdef\@Year{#1}}
\def\Vol#1{\gdef\@Vol{#1}}
\def\No#1{\gdef\@No{#1}}
\def\Pages#1{\gdef\@Pages{#1}}

\def\jasse@pagestyle@titlecommon{%
  \setlength\headheight{\jasse@pagestyle@titleheadheight}%
  \fancyfoot[C]{\thepage}%
  \renewcommand\headrulewidth{0pt}%
  \renewcommand\footrulewidth{0pt}%
}

\fancypagestyle{titlepage}
  {
  \fancyhf{}
  \jasse@pagestyle@titlehead
  \jasse@pagestyle@titlecommon
  }

% Shared theorem and bibliography setup.
\newtheorem{theorem}{Theorem}
\newtheorem{algorithm}{Algorithm}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{condition}{Condition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{remark}{Remark}

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
