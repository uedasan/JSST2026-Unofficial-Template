\ProvidesClass{jasse-modern}[2026/04/10 v0.2 Modernized JSST/JASSE class]
% Unofficial modernized class prepared by Ryosuke Ueda.
\RequirePackage{iftex}
\RequirePackage{kvoptions}
\RequirePackage{xparse}

\SetupKeyvalOptions{family=jasse,prefix=jasse@opt@}
\DeclareBoolOption[false]{journal}
\DeclareComplementaryOption{proceedings}{journal}
\DeclareBoolOption[false]{links}
\DeclareStringOption[auto]{fontscheme}
\ProcessKeyvalOptions*

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

\ifjasse@opt@journal
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
\ifjasse@opt@journal\else
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
\newif\ifjasse@font@newtx
\edef\jasse@fontscheme@requested{\jasse@opt@fontscheme}
\def\jasse@fontscheme@auto{auto}
\def\jasse@fontscheme@newtx{newtx}
\def\jasse@fontscheme@txfonts{txfonts}
\ifLuaTeX
  \jasse@font@newtxtrue
  \ifx\jasse@fontscheme@requested\jasse@fontscheme@txfonts
    \ClassWarningNoLine{jasse-modern}{fontscheme=txfonts is ignored under LuaLaTeX; using newtx}%
  \fi
\else
  \ifx\jasse@fontscheme@requested\jasse@fontscheme@newtx
    \jasse@font@newtxtrue
  \else
    \ifx\jasse@fontscheme@requested\jasse@fontscheme@auto
      \jasse@font@newtxfalse
    \else
      \ifx\jasse@fontscheme@requested\jasse@fontscheme@txfonts
        \jasse@font@newtxfalse
      \else
        \ClassWarningNoLine{jasse-modern}{Unknown fontscheme '\jasse@opt@fontscheme'; using txfonts for upLaTeX}%
        \jasse@font@newtxfalse
      \fi
    \fi
  \fi
\fi
\ifjasse@font@newtx
  \RequirePackage{newtxtext,newtxmath}
\else
  \RequirePackage[varg]{txfonts}
\fi
\ifLuaTeX
  \RequirePackage{graphicx}
\else
  \RequirePackage[dvipdfmx]{graphicx}
\fi
\ifjasse@opt@links
  \ifLuaTeX
    \RequirePackage[hidelinks]{hyperref}
  \else
    \RequirePackage[dvipdfmx,hidelinks]{hyperref}
  \fi
\else
  \RequirePackage{url}
\fi
\RequirePackage{authblk}
\RequirePackage{fancyhdr}
\setlength{\columnsep}{\jasse@columnsep}

\makeatletter

\newlength{\jasse@title@topskip}
\newlength{\jasse@title@aftertitleskip}
\newlength{\jasse@title@afterauthorskip}
\newlength{\jasse@title@bottomskip}
\newlength{\jasse@acknowledgement@beforeskip}
\newlength{\jasse@acknowledgement@afterskip}
\setlength{\jasse@title@topskip}{2em}
\setlength{\jasse@title@aftertitleskip}{1.5em}
\setlength{\jasse@title@afterauthorskip}{1em}
\setlength{\jasse@title@bottomskip}{1.5em}
\setlength{\jasse@acknowledgement@beforeskip}{1.7em}
\setlength{\jasse@acknowledgement@afterskip}{3mm}

% Mode-specific publication metadata.
\def\@proceedingsname{JSST2026}
\newcommand{\jasse@set@proceedingsname}[1]{\gdef\@proceedingsname{#1}}
\NewDocumentCommand{\ProceedingsName}{m}{\jasse@set@proceedingsname{#1}}
\def\@journalname{Journal of Advanced Simulation in Science and Engineering}
\newcommand{\jasse@set@journalname}[1]{\gdef\@journalname{#1}}
\NewDocumentCommand{\JournalName}{m}{\jasse@set@journalname{#1}}
\def\@journalshortname{J.~Adv.~Simulat.~Sci.~Eng.}
\newcommand{\jasse@set@journalshortname}[1]{\gdef\@journalshortname{#1}}
\NewDocumentCommand{\JournalShortName}{m}{\jasse@set@journalshortname{#1}}
\def\@copyrightyear{}
\newcommand{\jasse@set@copyrightyear}[1]{\gdef\@copyrightyear{#1}}
\NewDocumentCommand{\CopyrightYear}{m}{\jasse@set@copyrightyear{#1}}
\def\@copyrightowner{Japan Society for Simulation Technology}
\newcommand{\jasse@set@copyrightowner}[1]{\gdef\@copyrightowner{#1}}
\NewDocumentCommand{\CopyrightOwner}{m}{\jasse@set@copyrightowner{#1}}

% Shared title metadata.
\def\@email{}
\def\@Received{}
\def\@Accepted{}
\def\@Published{}
\def\@Year{}
\def\@Vol{}
\def\@No{}
\def\@Pages{}
\def\jasse@title@begin{\begin{center}\let \footnote \thanks}
\def\jasse@title@end{\end{center}\par}
\def\jasse@title@topspace{\null\vskip\jasse@title@topskip}
\def\jasse@title@aftertitle{\vskip\jasse@title@aftertitleskip}
\def\jasse@title@afterauthors{\vskip\jasse@title@afterauthorskip}
\def\jasse@title@bottomspace{\vskip\jasse@title@bottomskip}
\def\jasse@printtitle{{\LARGE\bfseries \@title \par}}
\def\jasse@printauthortable{%
  \begin{tabular}[t]{c}%
    \@author%
  \end{tabular}%
}
\def\jasse@printauthors{%
  {\large \lineskip .5em%
  \jasse@printauthortable\par}%
}
\def\jasse@printemail{$^*$\texttt{\@email}\par}
\def\jasse@printdates{\jasse@title@dates}
\def\@maketitle{%
\newpage\jasse@title@topspace
\jasse@title@begin
  \jasse@printtitle
  \jasse@title@aftertitle
  \jasse@printauthors
  \jasse@printemail
  \jasse@title@afterauthors
  \jasse@printdates
\jasse@title@end
  \jasse@title@bottomspace
  \gdef\@email{}%
}%
\NewDocumentCommand{\email}{+m}{\gdef\@email{#1}}%

% Journal-only publication dates.
\newcommand{\jasse@set@received}[1]{\gdef\@Received{Received: #1}}
\newcommand{\jasse@set@accepted}[1]{\gdef\@Accepted{Accepted: #1}}
\newcommand{\jasse@set@published}[1]{\gdef\@Published{Published: #1}}
\NewDocumentCommand{\Received}{m}{\jasse@set@received{#1}}
\NewDocumentCommand{\Accepted}{m}{\jasse@set@accepted{#1}}
\NewDocumentCommand{\Published}{m}{\jasse@set@published{#1}}

% Legacy aliases kept for compatibility with journal-style inputs.
\NewDocumentCommand{\ReceivedDate}{m}{\Received{#1}}
\NewDocumentCommand{\AcceptedDate}{m}{\Accepted{#1}}
\NewDocumentCommand{\PublishedDate}{m}{\Published{#1}}

% Shared document environments.
\def\jasse@abstract@begin{\par\noindent}
\def\jasse@abstract@heading{\textbf{Abstract. }\ignorespaces}
\def\jasse@abstract@end{\par}
\renewenvironment{abstract}{%
\jasse@abstract@begin
\jasse@abstract@heading
}{\jasse@abstract@end}

\def\jasse@keywords@prefix{\par\vspace{0.5em}\noindent}
\def\jasse@keywords@heading{\textbf{Keywords: }\ignorespaces}
\def\jasse@keywords@end{\par}
\newenvironment{keywords}{%
\jasse@keywords@prefix
\jasse@keywords@heading
}{\jasse@keywords@end}

\def\jasse@printblockheading#1{%
\vskip\jasse@acknowledgement@beforeskip
\noindent{\bfseries{\Large #1}\ }\\[\jasse@acknowledgement@afterskip]
}

\def\acknowledgement{%
\jasse@printblockheading{Acknowledgement}
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
\newcommand{\jasse@set@year}[1]{\gdef\@Year{#1}}
\newcommand{\jasse@set@vol}[1]{\gdef\@Vol{#1}}
\newcommand{\jasse@set@no}[1]{\gdef\@No{#1}}
\newcommand{\jasse@set@pages}[1]{\gdef\@Pages{#1}}
\NewDocumentCommand{\Year}{m}{\jasse@set@year{#1}}
\NewDocumentCommand{\Vol}{m}{\jasse@set@vol{#1}}
\NewDocumentCommand{\No}{m}{\jasse@set@no{#1}}
\NewDocumentCommand{\Pages}{m}{\jasse@set@pages{#1}}
\define@key{jassemeta}{proceedings-name}{\ProceedingsName{#1}}
\define@key{jassemeta}{journal-name}{\JournalName{#1}}
\define@key{jassemeta}{journal-short-name}{\JournalShortName{#1}}
\define@key{jassemeta}{copyright-year}{\CopyrightYear{#1}}
\define@key{jassemeta}{copyright-owner}{\CopyrightOwner{#1}}
\define@key{jassemeta}{received}{\Received{#1}}
\define@key{jassemeta}{accepted}{\Accepted{#1}}
\define@key{jassemeta}{published}{\Published{#1}}
\define@key{jassemeta}{year}{\Year{#1}}
\define@key{jassemeta}{vol}{\Vol{#1}}
\define@key{jassemeta}{no}{\No{#1}}
\define@key{jassemeta}{number}{\No{#1}}
\define@key{jassemeta}{pages}{\Pages{#1}}
\NewDocumentCommand{\JasseSetup}{m}{\setkeys{jassemeta}{#1}}
\NewDocumentCommand{\ProceedingsSetup}{m}{\setkeys{jassemeta}{#1}}
\NewDocumentCommand{\JournalSetup}{m}{\setkeys{jassemeta}{#1}}

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
