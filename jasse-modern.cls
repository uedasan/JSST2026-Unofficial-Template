\ProvidesClass{jasse-modern}[2026/04/10 v0.2 Modernized JSST/JASSE class]
\RequirePackage{iftex}

\newif\ifjasse@journal
\DeclareOption{journal}{\jasse@journaltrue}
\DeclareOption{proceedings}{\jasse@journalfalse}
\ExecuteOptions{proceedings}
\ProcessOptions\relax

\def\jasse@topmargin{4.6mm}
% Physical top offset used by geometry. In proceedings mode this can be
% tuned together with \jasse@headheight to absorb fancyhdr warnings while
% keeping the visible text block close to the original layout.
\def\jasse@geometry@top{85.36319pt}
\def\jasse@headsep{10pt}
\def\jasse@footskip{30pt}
\def\jasse@textheight{600pt}
\def\jasse@columnsep{5mm}
\def\jasse@textwidth{430pt}
\def\jasse@geometry@left{89.26999pt}
\def\jasse@geometry@options{asymmetric,}
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
  \def\jasse@geometry@options{}
  \def\jasse@classoptions{a4paper,11pt}
  \def\jasse@geometry@left{99.26999pt}
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
    \rmfamily Vol. \@Vol, No. \@No, \@Pages.}%
    \fancyhead[R]{\footnotesize\copyright~%
      \ifx\@copyrightyear\@empty\@Year\else\@copyrightyear\fi\ \@copyrightowner}%
  }
  \def\jasse@pagestyle@titleheadheight{40pt}
  \def\jasse@title@dates{{\small\@Received; \@Accepted; \@Published}}
\fi
\ifjasse@journal\else
  % Proceedings mode: a slightly larger headheight can remove fancyhdr
  % warnings; the top offset below is the corresponding compensation knob.
  \def\jasse@geometry@top{83.36319pt}
  \def\jasse@headheight{14pt}
  \def\jasse@pagestyle@titleheadheight{14pt}
\fi
\expandafter\LoadClass\expandafter[\jasse@classoptions]{article}

\RequirePackage{amsmath,amsthm}
\ifLuaTeX
  \RequirePackage[
    \jasse@geometry@options
    includehead,
    left=\jasse@geometry@left,
    top=\jasse@geometry@top,
    textwidth=\jasse@textwidth,
    textheight=\jasse@textheight,
    headheight=\jasse@headheight,
    headsep=\jasse@headsep,
    footskip=\jasse@footskip
  ]{geometry}
\else
  \RequirePackage[
    dvipdfmx,
    \jasse@geometry@options
    includehead,
    left=\jasse@geometry@left,
    top=\jasse@geometry@top,
    textwidth=\jasse@textwidth,
    textheight=\jasse@textheight,
    headheight=\jasse@headheight,
    headsep=\jasse@headsep,
    footskip=\jasse@footskip
  ]{geometry}
\fi
\ifLuaTeX
  \RequirePackage{newtxtext,newtxmath}
  \RequirePackage{graphicx}
\else
  \RequirePackage[varg]{txfonts}
  \RequirePackage[dvipdfmx]{graphicx}
\fi
\RequirePackage{authblk}
\RequirePackage{fancyhdr}
\setlength{\columnsep}{\jasse@columnsep}

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
\def\jasse@title@topskip{\null\vskip 2em}
\def\jasse@title@aftertitle{\vskip 1.5em}
\def\jasse@title@afterauthors{\vskip 1em}
\def\jasse@title@bottomskip{\vskip 1.5em}
\def\jasse@printtitle{{\LARGE\bfseries \@title \par}}
\def\jasse@printauthors{%
  {\large \lineskip .5em%
  \begin{tabular}[t]{c}%
    \@author%
  \end{tabular}\par}%
}
\def\jasse@printemail{$^*$\texttt{\@email}\par}
\def\jasse@printdates{\jasse@title@dates}
\def\@maketitle{%
\newpage\jasse@title@topskip
\begin{center}%
  \let \footnote \thanks%
  \jasse@printtitle
  \jasse@title@aftertitle
  \jasse@printauthors
  \jasse@printemail
  \jasse@title@afterauthors
  \jasse@printdates
\end{center}%
  \par%
  \jasse@title@bottomskip
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

\renewcommand\refname{References}
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \small
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}%
            \setlength{\itemsep}{2pt}
            \setlength{\parsep}{0pt}
           }%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\endlist}

\makeatother
