%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{parch}[2015/12/05 Class for the school newspaper `Le Parchemin,]


\DeclareOption*{
	\ClassWarning{parch'}{Unknown option '\CurrentOption'}
}

\ProcessOptions\relax

\LoadClass[a4paper, 10pt, oneside, fleqn]{article}
\RequirePackage[no-math]{fontspec}

\RequirePackage{polyglossia}
\setdefaultlanguage{french}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Various packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[fontsize=10pt, baseline=12pt, lines=40]{grid}
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage[german=swiss]{csquotes}
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{setspace}
\RequirePackage{multicol}
\RequirePackage{lettrine}
\RequirePackage{datetime}
\RequirePackage{mdframed}
\RequirePackage{blindtext}
\RequirePackage{tcolorbox}
\RequirePackage{etoolbox}
\RequirePackage{xstring}
\RequirePackage{pas-crosswords} % mots-croisés
\RequirePackage[large]{cwpuzzle}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{lightGrey}{gray}{.8}
\definecolor{mediumGrey}{gray}{.5}
\definecolor{deepGrey}{gray}{.3}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\defaultfontfeatures{Ligatures=TeX}
\frenchspacing
% For source code
\setmonofont{Source Code Pro Light}[
	BoldFont=Source Code Pro,
]
% Normal font
\setsansfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans SemiBold,
]
% Normal font
\setmainfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans,
]
% Font for chapter number
\newfontfamily{\upperNumber}{Fira Sans Light}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\marginSize}
\setlength{\marginSize}{1.5cm}
\RequirePackage[
%	showframe,
	xetex,
	a4paper,
	includeheadfoot,
	left=\marginSize,
	right=\marginSize,
	top=\marginSize,
	bottom=\marginSize-4mm,
	marginparwidth=0cm,
	marginparsep=0mm,
	footskip=5mm,
]{geometry}
\setlength{\headheight}{24.6pt}
\setlength{\headsep}{10pt}
\setlength{\skip\footins}{0mm}
\setlength{\footnotesep}{0mm}
\setlength{\parskip}{0ex}
\setlength{\parindent}{2em}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={1 1 0},
	pdftitle={Le Parchemin},
	pdfauthor={TeamParch'},
	pdfsubject={},
	pdfcreator=LaTeX,
	pdfkeywords={{journal}{collège Madame De Staël}},
	colorlinks=true,
	linkcolor=blue,
	linktoc=all,
	urlcolor=blue,
	citecolor=blue,
	filecolor=blue
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Itemize and consort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\labelitemi{---}
\RequirePackage{enumitem}
\setlist[itemize]{nosep}
\setlist[description]{nosep}
\setlist[enumerate]{nosep}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\fancypagestyle{ParchHeader}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0mm}
	\newlength{\headerHFill}
	\setlength{\headerHFill}{\textwidth-\widthof{\fontspec{georgiab.ttf}\selectfont Le Parchemin}-\widthof{\monthname\ \the\year}-28pt} % 24pt = 4 * 6pt de marge (marge à  gauche et à droite des deux tcbox)
	\fancyhead[L]{
		\tcbox[
				equal height group=Header,
				colback=deepGrey,
				boxrule=0pt,
				left=6pt,
				right=6pt,
				top=6pt,
				bottom=6pt,
				boxsep=0pt,
				arc=0pt,
				nobeforeafter
			]{
			{\fontspec{georgiab.ttf}\color{white}Le Parchemin}
		}
	}
	\fancyhead[R]{
		\tcbox[
				equal height group=Header,
				colback=lightGrey,
				boxrule=0pt,
				left=6pt,
				right=6pt,
				top=6pt,
				bottom=6pt,
				boxsep=0pt,
				arc=0pt,
				nobeforeafter
			]{
			\hspace*{\headerHFill}\monthname\ \the\year
		}
	}
	\cfoot{\thepage}
}
\pagestyle{ParchHeader}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Cross-words and Sudokus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\maDef}[2]{\printDef{#1}{\hspace{-2ex}\textbf{.} #2}}

\renewcommand{\SudokuLinethickness}{1pt} %Change la largeur de la ligne des sudokus
\newcounter{row}
\newcounter{col}
\newcommand\setrow[9]{
	\setcounter{col}{1}
	\foreach \n in {#1, #2, #3, #4, #5, #6, #7, #8, #9} {
		\edef\x{\value{col} - 0.5}
		\edef\y{9.5 - \value{row}}
		\node[anchor=center] at (\x, \y) {\n};
		\stepcounter{col}
	}
	\stepcounter{row}
}
\newcommand\setrowgrand[9]{
	\setcounter{col}{1}
	\foreach \n in {#1, #2, #3, #4, #5, #6, #7, #8, #9} {
		\edef\x{\value{col} - 0.5}
		\edef\y{16.5 - \value{row}}
		\node[anchor=center] at (\x, \y) {\n};
		\stepcounter{col}
	}
}
\newcommand\setrowsuite[7]{
	\foreach \n in {#1, #2, #3, #4, #5, #6, #7} {
		\edef\x{\value{col} - 0.5}
		\edef\y{16.5 - \value{row}}
		\node[anchor=center] at (\x, \y) {\n};
		\stepcounter{col}
	}
	\stepcounter{row}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Rules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\hrulefill{\leavevmode\leaders\hrule height \@parchVerticalSeparatorWidth\hfill\kern\z@}

\newcommand{\parchHRule}{
	\noindent{\color{mediumGrey}\hrulefill}
	\vspace*{\baselineskip}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Parch Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\mdfdefinestyle{noLines}{
	topline=false,
	bottomline=false,
	rightline=false,
	leftline=false,
	linewidth=1mm,
	linecolor=mediumGrey,
}

	%		Title Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newcommand{\parchTitreArticle}[1]{{
	\fontsize{4em}{1ex}
	\fontspec{JosefinSans-SemiBold.ttf}\selectfont
	\noindent\hspace*{-.5mm}#1
}}


	%		Author and Place Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newlength{\@parchAuteurLieuInnerVSpace}
\setlength{\@parchAuteurLieuInnerVSpace}{2ex}
\newcommand{\parchAuteurLieu}[2]{
	\vfill
	\begin{gridenv}
	\begin{mdframed}[
			skipabove=0mm,
			skipbelow=0mm,
			innerleftmargin=2ex,
			innerrightmargin=2ex,
			innertopmargin=2ex,
			innerbottommargin=2ex,
			rightline=false,
			topline=false,
			bottomline=false,
			linewidth=1mm,
			linecolor=mediumGrey,
			backgroundcolor=lightGrey,
			fontcolor=black,
		]
		\textbf{#1}\\
		#2
	\end{mdframed}
	\vspace*{-5mm}
	\end{gridenv}
}


	%		Resume and Theme Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newcommand{\parchResumeEnd}{{
		\color{deepGrey}
		\fontsize{1em}{1ex}\fontspec{Fira Sans Ultra}\selectfont
		<
	}}
\newcommand{\parchResumeBegin}{{
	\color{deepGrey}
	\fontsize{1em}{1ex}\fontspec{Fira Sans Ultra}\selectfont
	>
}}

\mdfdefinestyle{parchResume}{
	innerleftmargin=0ex,
	innerrightmargin=0ex,
	innertopmargin=\baselineskip,
	innerbottommargin=\baselineskip-1mm,
	rightline=false,
	leftline=false,
	linewidth=1mm,
	linecolor=mediumGrey,
	align=left,
}

\newcommand{\@parchTheme}[1]{
	\rotatebox{45}{\color{mediumGrey}$\blacksquare$}
	\fontsize{1.5em}{1ex}
	\fontspec{georgiab.ttf}\selectfont %Georgia Bold ou Gill Sans MT Condensed
	#1
}

\newenvironment{parchResume}
{
	\begin{gridenv}
		\vspace*{-\baselineskip}
		\begin{mdframed}[style=parchResume]
			\parchResumeBegin
		}
		{
		\end{mdframed}
	\end{gridenv}
}

\newenvironment{parchResumeTheme}[1]
{
	\begin{gridenv}
		\vspace*{-\baselineskip}
		\begin{mdframed}[
			style=parchResume,
			innertopmargin=.5\baselineskip,
			innerbottommargin=\baselineskip,
			topline=false,
			frametitle={\hspace*{-\parindent}\hfill{\@parchTheme{#1}}},
			frametitlerule=true,
			frametitlerulewidth=1mm,
			frametitleaboveskip=0\baselineskip, %.6 when boxed
			frametitlebelowskip=.4\baselineskip, % .5 when boxed
			innertopmargin=\baselineskip-1mm,
			]
			\parchResumeBegin
		}
		{
		\end{mdframed}
	\end{gridenv}
}


	%		Abstract of article for front page
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newenvironment{parchAbstractTheme}[1]
{
	\begin{mdframed}[
		style=parchResume,
		bottomline=false,
		innertopmargin=.5\baselineskip,
		innerbottommargin=\baselineskip,
		topline=false,
		frametitle={\hspace*{-\parindent}\hfill{\@parchTheme{#1}}},
		frametitlerule=true,
		frametitlerulewidth=1mm,
		frametitleaboveskip=0\baselineskip, %.6 when boxed
		frametitlebelowskip=.4\baselineskip, % .5 when boxed
		innertopmargin=\baselineskip-1mm,
		]
		\parchResumeBegin
}
{
	\end{mdframed}
	\vspace*{-\baselineskip}
}

\newenvironment{parchAbstract}
{
	\begin{mdframed}[
		style=parchResume,
		bottomline=false,
		]
		\parchResumeBegin
}
{
	\end{mdframed}
}


	%		Citation Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newcommand{\parchCitation}[2][]{
	\begin{gridenv}
		\vspace*{.5\baselineskip}
			\raisebox{-2mm}{
				\fontspec{Fira Sans Bold}\fontsize{6em}{1ex}\selectfont
				\color{lightGrey}
				<<
			}
			\hspace*{-12mm}
			\textit{#2}
			\ifstrequal{#1}{}{}{
				\begingroup\setlength\topsep{0pt}
					\begin{flushright}
						--- #1
					\end{flushright}
				\endgroup
			}
			\vspace*{.5\baselineskip}
	\end{gridenv}
}


	%		Stamp Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newlength{\@parchStampLength}
\setlength{\columnsep}{5mm}%
\setlength{\intextsep}{0pt}

\newcommand{\parchStampLeft}[2][.25]{
	\setlength{\@parchStampLength}{\widthof{\fontspec{Fira Sans Bold}#2}+2em}
	\begin{wrapfigure}[4]{r}[#1\@parchStampLength + \multicolsep + 1mm]{\@parchStampLength}
		\vfill
	\end{wrapfigure}
}

\newcommand{\parchStampRight}[2][.75]{
	\setlength{\@parchStampLength}{\widthof{\fontspec{Fira Sans Bold}\textit{#2}}+2em}
	\begin{wrapfigure}[4]{l}[#1\@parchStampLength]{\@parchStampLength}
		\begin{mdframed}[
			style=noLines,
			backgroundcolor=deepGrey,
			skipabove=.8em,
			skipbelow=0pt,
			innerleftmargin=1em,
			innerrightmargin=1em,
			innertopmargin=1.8ex,
			innerbottommargin=1.8ex,
			]
			{\fontspec{Fira Sans Bold}\selectfont
				\color{White}
				\textit{#2}}
		\end{mdframed}
	\end{wrapfigure}
}


	%		Article Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
\newenvironment{parchArticle*}[5][3]{
	\parchTitreArticle{#2}
	\begin{multicols*}{#1}
		\begin{spacing}{#5}
			\def\lastAuteur{#3}
			\def\lastLieu{#4}
			\noindent
}{
			\parchAuteurLieu{\lastAuteur}{\lastLieu}
		\end{spacing}
	\end{multicols*}
}

\newenvironment{parchArticle}[5][3]{
	\parchTitreArticle{#2}
	\begin{multicols}{#1}
		\begin{spacing}{#5}
			\def\lastAuteur{#3}
			\def\lastLieu{#4}
			\noindent
}{
			\parchAuteurLieu{\lastAuteur}{\lastLieu}
		\end{spacing}
	\end{multicols}
}
\newlength{\@parchVerticalSeparatorWidth}
\setlength{\@parchVerticalSeparatorWidth}{.4mm}
\newlength{\@parchMultiColSepOverTwo}
\setlength{\@parchMultiColSepOverTwo}{2.2mm} %multicolsep = 13pt = 4.6mm -> (4.6mm - .4mm (largeur ligne verticale)) / 2 = 2.1mm
\newlength{\@parchVerticalSpaceBeforeSeparator}
\setlength{\@parchVerticalSpaceBeforeSeparator}{\baselineskip + \heightof{\parchTitreArticle{test}}}
\newlength{\@parchColumnWidth}
\setlength{\@parchColumnWidth}{(\textwidth - 2\multicolsep)/3}
\newcommand{\parchArticleCoteACote}[3][l]{%
	\ifstrequal{#1}{l}{%
		\noindent\begin{minipage}[t]{\@parchColumnWidth}
			\setlength{\parindent}{2em}
			#2
		\end{minipage}\hspace*{\@parchMultiColSepOverTwo}{\color{mediumGrey}\vrule width \@parchVerticalSeparatorWidth}\hspace*{\@parchMultiColSepOverTwo}%
	}{}
	\noindent\begin{minipage}[t]{(\textwidth - \@parchColumnWidth) - 7mm}
		\setlength{\parindent}{2em}
		#3
	\end{minipage}%
	\ifstrequal{#1}{r}{%
		\hspace*{\@parchMultiColSepOverTwo}{\color{mediumGrey}\vrule width \@parchVerticalSeparatorWidth}\hspace*{\@parchMultiColSepOverTwo}%
		\begin{minipage}[t]{\@parchColumnWidth}
			\setlength{\parindent}{2em}
			#2
		\end{minipage}
	}{}
}


	%		Images Commands
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\parchImage}[2][\linewidth]{
	\begin{gridenv}
		\noindent\includegraphics[width=#1]{#2}
	\end{gridenv}
	\noindent
}




\endinput