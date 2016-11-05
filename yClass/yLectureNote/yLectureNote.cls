%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yLectureNote class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Copyright Yves Zumbach 2016
% Licenced under the LaTeX Project Public Licence
% For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at harveysheppard75[at]yandex[period]com

% Based upon the uiothesis and report class


\ProvidesClass{yLectureNote}[2016/09/19 A class for lecture notes with a modern look combined with a marginpar]
\NeedsTeXFormat{LaTeX2e}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifFrenchBullet
\FrenchBulletfalse
\newif\ifFrench
\Frenchfalse
\DeclareOption{french}{
	\Frenchtrue
	\FrenchBullettrue
	\PassOptionsToClass{french}{report}
}
\newif\ifGerman
\Germanfalse
\DeclareOption{german}{
	\Germantrue
	\PassOptionsToClass{german}{report}
}
\newif\ifPrintSerieGlobal
\PrintSerieGlobalfalse
\DeclareOption{printSerie}{
	\PrintSerieGlobaltrue
}

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{report}
}


\ProcessOptions\relax



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[a4paper, 11pt, openany, oneside]{report}

\RequirePackage{ifxetex}
\ifxetex
\else
	\ClassWarning{yLectureNote}{For this template to work properly, please compile it with XeLaTeX!}
\fi

\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage[no-math]{fontspec}

\RequirePackage{polyglossia}
\setdefaultlanguage{english}
\ifFrench
	\setdefaultlanguage{french}
\fi
\ifGerman
	\setdefaultlanguage{german}
\fi

\ClassWarning{yLectureNote}{For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at harveysheppard75[at]yandex[period]com}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Needed packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[final=true,step=1]{microtype}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage[autostyle=true]{csquotes}
\ifFrench
	\setquotestyle[guillemets]{french}
\fi
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{amsmath, amsfonts, amssymb, amsthm}
\RequirePackage{appendix}
\RequirePackage{ragged2e}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{varwidth}
\RequirePackage{infoBulle}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{contour}
\RequirePackage{marginfix}
\RequirePackage{lettrine}
\RequirePackage{zref-abspos}
\RequirePackage{titletoc}
\RequirePackage{mdframed}
\RequirePackage{ifthen}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{changepage}

\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}
\setlength{\marginparpush}{\baselineskip}

\RequirePackage[
	xetex,
	a4paper,
%	showframe,
	top=27mm,
	bottom=27mm,
	inner=20mm,
	outer=20mm,
	ignorehead,
	ignorefoot,
	includemp,
	marginparwidth=52mm,
	marginparsep=8mm,
	headsep=7mm,
	footskip=14mm,
	headheight=13.6pt,
]{geometry}

\setlength{\columnsep}{\marginparsep}

% Saving some length as commands
\newlength{\wholeMargin}
\setlength{\wholeMargin}{\marginparwidth}
\addtolength{\wholeMargin}{\marginparsep}

\newlength{\wholeWidth}
\setlength{\wholeWidth}{\textwidth}
\addtolength{\wholeWidth}{\wholeMargin}

\newcommand{\nomarginparpage}{
	\fancyhfoffset[R]{0mm}
	\newgeometry{
		top=27mm,
		bottom=27mm,
		inner=20mm,
		outer=20mm,
		ignorehead,
		ignorefoot,
		nomarginpar
	}
}
\newcommand{\marginparpage}{
	\restoregeometry
	\fancyhfoffset[OR, EL]{\marginparsep + \marginparwidth}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\clubpenalty=1000 %penalty for breaking after the first line of a par
\widowpenalty=1000 %penalty for breaking before the last line of a par
\brokenpenalty=700 %penalty for page breaking after hyphenated line
\XeTeXlinebreakpenalty=1
\tolerance=500 %Allow LaTeX to break lines too often. It prevents line for overflowing in the margins



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
	BoldFont=Fira Sans Book,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Medium Italic
]
% Normal font
\setmainfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans Book,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Medium Italic
]
\newfontfamily{\normalFont}{Fira Sans Light}
\newfontfamily{\lightBoldFont}{Fira Sans}
\newfontfamily{\heavyFont}{Fira Sans Heavy}
\newfontfamily{\titleFont}{ShintiaScript}
\newfontfamily{\chapterNumberFont}{Oswald BoldItalic}
\newfontfamily{\chapterFont}{ShintiaScript}
\newfontfamily{\serifFont}{Vollkorn}
\newfontfamily{\sectionNumbers}{Oswald MediumItalic}
\newfontfamily{\abril}{Abril Fatface}

\usepackage{fontawesome}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{mainColor}{RGB}{211, 47, 47}
\colorlet{lightMainColor}{mainColor!80}
\newcommand{\lightMainColor}{\colorlet{lightMainColor}{mainColor!80}\color{lightMainColor}}
\definecolor{secondColor}{RGB}{255, 193, 7}

\definecolor{sectionNumbersColor}{gray}{.7}
\definecolor{subsectionNumbersColor}{gray}{.75}

\definecolor{lightGrey}{gray}{0.94}
\definecolor{middleGrey}{gray}{.75}
\definecolor{darkGrey}{gray}{.55}

\newcommand{\inColor}[1]{{\bfseries\color{mainColor}#1}}
\colorlet{light-gray}{lightGrey} %redefines infoBulle background light-grey to match yLectureNote lightGrey

% Theoreme and blocs colors
\definecolor{mathematicalColor}{RGB}{230, 126, 34}
\definecolor{tipsColor}{RGB}{142, 68, 173}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Utilities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\noHyphen}{\hyphenpenalty10000\exhyphenpenalty10000\righthyphenmin62\lefthyphenmin62\tolerance=1\emergencystretch=\maxdimen\hbadness=10000}

\newcommand{\emaillink}[1]{%
	{\hypersetup{urlcolor=black}\href{mailto:#1}{#1}}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\subtitleRubberWidth}\setlength{\subtitleRubberWidth}{2cm}
\newlength{\subtitleDefaultPadding}\setlength{\subtitleDefaultPadding}{2mm}
\newlength{\subtitleRubberHeight}\setlength{\subtitleRubberHeight}{4.5cm}
\RequirePackage{titlesec}
\titleformat{\chapter}[block]
{} % format
{\begin{tikzpicture}%
		\node [font=\fontsize{1cm}{1.2cm}\selectfont] (chapterLabel) {\hspace{-.3ex}\chaptername};
		\draw [xshift=-2mm, mainColor, ultra thick] (chapterLabel.south west) -- (chapterLabel.south east);
	\end{tikzpicture}
	\begin{tikzpicture}[remember picture, overlay, inner sep=0mm]
%		Coordinates
		\coordinate[xshift=-1in-\evensidemargin-\subtitleRubberWidth] (rubberNorthWest) at (current page.north east);
		\coordinate[xshift=\subtitleRubberWidth, yshift=-\subtitleRubberHeight] (rubberSouthEast) at (rubberNorthWest);
		\coordinate[yshift=-\subtitleRubberHeight] (rubberSouthWest) at (rubberNorthWest);
		\coordinate[xshift=\subtitleDefaultPadding, yshift=-1in-\voffset-\topmargin-\headheight-\headsep] (rubberTextNorthWest) at (rubberNorthWest);
%		Drawing the rubber
		\fill[mainColor] (rubberNorthWest) rectangle (rubberSouthEast) -- +(-\subtitleRubberWidth/2, -8mm) -- (rubberSouthWest) -- cycle;
		\draw[White] (rubberSouthWest)[xshift=\subtitleRubberWidth/2] node [
			anchor=south,
			align=center,
			text width=\subtitleRubberWidth-2\subtitleDefaultPadding
		] {
			\chapterNumberFont\fontsize{2cm}{2.4cm}\selectfont
			\color{White}
			\thechapter
		};
	\end{tikzpicture}%
}
{0pt} % sep
{ % code before
	\begin{adjustwidth}{-3mm}{-\wholeMargin}
		\FlushLeft
		\begingroup
		\chapterFont\fontsize{1.5cm}{1.8cm}\selectfont%
		\noHyphen%
}[ % code after
		\endgroup
	\end{adjustwidth}
]

\titleformat{name=\chapter, numberless}[block]
{} % format
{}
{0pt} % sep
{ % code before
	\begin{adjustwidth}{-3mm}{-\wholeMargin}
		\FlushLeft
		\begingroup
		\chapterFont\fontsize{1.5cm}{1.8cm}\selectfont%
		\noHyphen%
	}[ % code after
	\endgroup
\end{adjustwidth}
]

\titleformat{\section}{}{%
	\hspace*{-3mm}\fontsize{1.3cm}{1.8cm}\sectionNumbers\color{sectionNumbersColor}%
	\raisebox{-1mm}{\thesection}%
}{-2mm}{\huge\fontspec{Fira Sans Medium}\selectfont}{}

\titleformat{\subsection}{}{%
	\hspace*{-3mm}\fontsize{.8cm}{1cm}\sectionNumbers\color{subsectionNumbersColor}%
	\raisebox{-1mm}{\thesubsection}%
}{-2mm}{\LARGE}{}
\titleformat*{\subsubsection}{\LARGE\headingFont}

%Titling spacing: left before after [right]
\titlespacing*{\chapter}{0mm}{3mm}{1cm}
%\titlespacing*{name=\chapter,numberless}{0pt}{10pt}{0pt} %starred version of chapter default: 0pt, 50pt, 40pt
\titlespacing*{\section}{0mm}{3mm}{-2mm}
\titlespacing*{name=\section, numberless}{0mm}{3mm}{-2mm}
\titlespacing*{\subsection}{0mm}{2mm}{-1mm}
\titlespacing*{\subsubsection}{0mm}{2mm}{1.5mm}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
% Leftmark = chapter, rightmark = section
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\subsectionmark}[1]{\markright{#1}{}}
\assignpagestyle{\chapter}{yLectureNote}
\assignpagestyle{\part}{yLectureNote}
\fancypagestyle{yLectureNote}{
	\fancyhf{}
	\fancyhead[L]{{\renewcommand{\\}{ }\inColor{\textsc{\@title}} \& \leftmark, \textit{\rightmark}}}
	\fancyfoot[L]{%
		\ifdefempty{\yLectureNoteClassDate}%
		{}{\yLectureNoteClassDate}%
		\ifthenelse{\boolean{PrintSerieGlobal} \AND \boolean{PrintSerie}}{%
				\ifdefempty{\yLectureNoteClassDate}{}{, }%
				\serieString\ \theySerie%
%			}{}%
		}{}%
	}
	\fancyfoot[R]{\thepage/{\hypersetup{linkcolor=Black}\pageref{LastPage}}}
	\fancyhfoffset[R]{\marginparsep + \marginparwidth}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{yLectureNote}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{fit}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}

\pgfdeclarelayer{bg}    % declare background layer
\pgfsetlayers{bg,main}	% set the order of the layers (main is the standard layer)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\@professor}{}
\newcommand{\professor}[1]{\renewcommand{\@professor}{#1}}
\newcommand{\@yLanguage}{}
\newcommand{\yLanguage}[1]{\renewcommand{\@yLanguage}{#1}}

\newcommand{\titlepageRubberVerticalSpacer}{\vspace*{1cm}}
\newcommand{\titlepageIcon}[1]{{\fontsize{28pt}{0pt}#1}\\[2mm]}
\newcommand{\titlepageTitleStyle}[1]{\begingroup\fontsize{48pt}{57.6pt}\selectfont\titleFont#1\endgroup}
\newcommand{\titlepageSubtitleStyle}[1]{{\Huge\selectfont#1}}

\newlength{\titlepageRubberWidth}\setlength{\titlepageRubberWidth}{5cm}
\newlength{\titlepageDefaultPadding}\setlength{\titlepageDefaultPadding}{3mm}
\colorlet{titlepageRubberColor}{mainColor}

\DeclareDocumentCommand{\titleOne}{ O{} }{%
	\thispagestyle{empty}%
	\null
	\vspace*{1cm}
	\begin{tikzpicture}[remember picture, overlay, inner sep=0mm]
%		Title of the document
		\node [
			anchor=north west,
			align=left,
			text width=\paperwidth-\titlepageRubberWidth-2in-\evensidemargin-\oddsidemargin-\titlepageDefaultPadding,
		] (titlepageTitle) {
			\titlepageTitleStyle{\@title}
		};
		\ifdefempty{\@subtitle}{}{
			\coordinate[yshift=-\titlepageDefaultPadding, xshift=\titlepageDefaultPadding] (titlePageSubtitleNorthWest) at (titlepageTitle.south west);
			\node (titlepageSubtitle) [
				anchor=north west,
				text width=\paperwidth-\titlepageRubberWidth-2in-\evensidemargin-\oddsidemargin-\titlepageDefaultPadding-3mm,
			] at (titlePageSubtitleNorthWest) {\titlepageSubtitleStyle{\@subtitle}};
			}
%		Rubber
		\coordinate [
			xshift=-1in-\evensidemargin-\titlepageRubberWidth/2,
			yshift=-1in-\voffset
		] (titlepageRubberCenterTop) at (current page.north east);
%		Rubber coordinates
		\coordinate [
			xshift=-1in-\evensidemargin-\titlepageRubberWidth
		] (titlepageRubberLeftTop) at (current page.north east);
		\coordinate [
			xshift=-1in-\evensidemargin,
			yshift=-.6\paperheight
		] (titlepageRubberRightBottom) at (current page.north east);
%		Rubber margined coordinates
		\coordinate [
			xshift=\titlepageDefaultPadding-1in-\evensidemargin-\titlepageRubberWidth,
			yshift=-\titlepageDefaultPadding
		] (marginedTitlepageRubberLeftTop) at (current page.north east);
		\coordinate [
			xshift=-1in-\evensidemargin-\titlepageDefaultPadding,
			yshift=\titlepageDefaultPadding-.6\paperheight
		] (marginedTitlepageRubberRightBottom) at (current page.north east);
		\fill [mainColor] (titlepageRubberLeftTop) rectangle (titlepageRubberRightBottom);
%		Rubber content
		\node [
			fit=(marginedTitlepageRubberLeftTop)(marginedTitlepageRubberRightBottom),
			color=white,
			font=\bfseries
		] {
			\ifdefempty{\@professor}{
				\ClassWarning{yLectureNote}{You did not provide a professor name!}
			}{
				\titlepageIcon{\FA\symbol{"F19D}}
				\@professor\\
			}
			\ifdefempty{\@author}{
				\ClassWarning{yLectureNote}{You did not provide an author name!}
			}{
				\titlepageRubberVerticalSpacer
				\titlepageIcon{\faUser}
				\@author\\
			}
			\titlepageRubberVerticalSpacer
			\titlepageIcon{\faCalendar}
			\@date\\
			\ifdefempty{\@yLanguage}{}{
				\titlepageRubberVerticalSpacer
				\titlepageIcon{\FA\symbol{"F1AB}}
				\@yLanguage\\
			}
			#1
		};
%		Rubber bottom image
		\node [
			text width=\titlepageRubberWidth,
			anchor=north east
		] at (titlepageRubberRightBottom) {\includegraphics[width=\linewidth]{images/epflLogo.jpg}};
	\end{tikzpicture}
	\newpage
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\@namedef{ver@array.sty}{2008/09/09}
\makeatother
\usepackage{makecell}
\RequirePackage{tabu}
\RequirePackage{longtable}

\definecolor{tableLineOne}{RGB}{245, 245, 245}
\definecolor{tableLineTwo}{RGB}{224, 224, 224}
\everyrow{\tabucline[.4mm  white]{}}
\taburowcolors[2] 2{tableLineOne .. tableLineTwo}
\tabulinesep = ^1.5mm_1mm
\newcommand{\tableHeaderStyle}{
	\rowfont{\bfseries\sffamily\leavevmode\color{white}}
	\rowcolor{darkGrey}
	\Gape[3.5mm][1.5mm]{}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Hyper-references
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={0 0 0},
	pdfcreator=LaTeX,
	colorlinks=true,
	linkcolor=blue,
	linktoc=all,
	urlcolor=blue,
	citecolor=blue,
	filecolor=blue,
	breaklinks
}
\RequirePackage{memhfixc} %fix some problem with hyperref

% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
	\do\)\do\,\do\?\do\'\do+\do\=\do\#\do-}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Itemize and consort
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\itemColor}[1]{\item[\llap{\inColor{#1}\hspace*{.75mm}}]}
\RequirePackage{enumitem}
\setlist{nosep}
\newcommand{\sideListConfig}{
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
	\setlength{\itemindent}{0pt} % indentation of first line of an item; can be negative
	\setlength{\labelsep}{1ex} % separation between end of the box containing the label and the text of the first line of an item
	\setlength{\leftmargin}{\labelsep+2mm} % horizontal distance between the left margins of the environment and the list; must be nonnegative
	\setlength{\topsep}{-.5\baselineskip} % amount of extra vertical space at top of list
	\setlength{\partopsep}{0pt} % extra length at top if environment is preceded by a blank line (it should be a rubber length)
	\setlength{\parsep}{\baselineskip} % amount of vertical space between paragraphs within an item
	\setlength{\itemsep}{-\baselineskip} % amount of extra vertical space between items
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
}

% Enumeratable list
\newenvironment{sideEnumerate}{%
	\begin{list}{
			\arabic{enumi}
		}{%
		\sideListConfig
		\usecounter{enumi}
	}
}{\end{list}}

% Itemized list
\newenvironment{sideItemize}{%
	\begin{list}{%
			\textbullet%
		}{%
			\sideListConfig
		}
}{\end{list}}

% Description lists
\newenvironment{sideDescription}{%
	\begingroup\begin{list}{}{%
			\sideListConfig
		}
	}{\end{list}\endgroup}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Quotation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\quoteStart}{
	\fontsize{3cm}{0mm}\selectfont%
	\color{middleGrey}%
	{\fontspec{Lora Bold Italic}“}
}
\NewDocumentCommand{\blockQuote}{o m}{
	\vskip \baselineskip
	\hfill\begin{minipage}{.92\linewidth}
		\mbox{}%
		\setlength{\parindent}{0pt}%
		\setlength{\parskip}{\baselineskip}%
		\llap{\raisebox{-1.5cm}[0mm][0mm]{\quoteStart\hspace*{-16mm}}}
		{\itshape#2}
		\IfValueT{#1}{
			\setlength{\parskip}{\baselineskip/2}%
			\begingroup\setlength\topsep{0pt}
			\begin{flushright}
				--- #1
			\end{flushright}
			\endgroup
		}
	\end{minipage}
	\vskip \baselineskip
}

\DeclareDocumentCommand{\sideQuote}{o m}{%
	\marginElement{%
		\llap{\raisebox{-1.8cm}[0mm][0mm]{\quoteStart\hspace*{-16mm}\isOddPage{}{\hspace*{-7mm}}}}%
		{\itshape#2}%
		\IfValueT{#1}{%
			\setlength{\parskip}{\baselineskip/2}%
			\begingroup\setlength\topsep{0pt}%
			\begin{flushright}%
				--- #1%
			\end{flushright}%
			\endgroup%
		}%
	}%
}

\DeclareDocumentCommand{\fullQuote}{o m}{
	\vskip \baselineskip
	\begin{whole}
		\mbox{}
		\llap{\quoteStart}
		{\itshape#2}
		\IfValueT{#1}{
			\setlength{\parskip}{\baselineskip/2}%
			\begingroup\setlength\topsep{0pt}
			\begin{flushright}
				--- #1
			\end{flushright}
			\endgroup
		}
	\end{whole}
	\vskip \baselineskip
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Captions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{caption}
\DeclareCaptionLabelFormat{yLabel}{
	\tikz{
		\node[anchor=west, inner sep=2mm, fill=lightGrey, font=\bfseries, text=mainColor]{#1 #2};
	}
}

\DeclareDocumentCommand{\sideCaptionOf}{m m}{\marginnote{\captionof{#1}{#2}}}

\DeclareCaptionStyle{yLectureNoteCaptionStyle}{labelsep=none, labelformat=yLabel, singlelinecheck=false}
\captionsetup*[figure]{style=yLectureNoteCaptionStyle, justification=RaggedRight, position=bottom}
\captionsetup*[table]{style=yLectureNoteCaptionStyle, justification=RaggedRight, position=bottom}

\captionsetup*[SCtable]{style=yLectureNoteCaptionStyle}
\captionsetup*[SCfigure]{style=yLectureNoteCaptionStyle}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{marginnote}

% The mark on the sidenote
\DeclareDocumentCommand{\sideMark}{O{mainColor} m}{{\color{#1}\normalFont#2.{\:}}}

\DeclareDocumentCommand{\marginElement}{m}{%
	\marginpar{%
		\mathLeft%
		\RaggedRight%
		\footnotesize%
		#1%
	}\unskip%
}%

\DeclareDocumentCommand{\sideTitle}{m}{{\color{mainColor}\lightBoldFont\large#1}\\}

\DeclareDocumentCommand{\sideNote}{O{mainColor} m}{%
	{%
		\hypersetup{linkcolor=mainColor}%
		\normalFont%
		\footnotemark%
	}%
	\ignorespaces%
	\marginElement{%
		\sideMark[#1]{\thefootnote}%
		\ignorespaces%
		#2%
	}%
}%

\DeclareDocumentCommand{\forcedSideNote}{O{mainColor} m}{%
	{%
		\hypersetup{linkcolor=mainColor}%
		\normalFont%
		\footnotemark%
	}%
	\ignorespaces%
	\marginnote{
		\RaggedRight\footnotesize%
		\sideMark[#1]{\thefootnote}%
		\ignorespaces%
		#2%
	}%
}

\makeatletter
\DeclareDocumentCommand{\sideTable}{o m}{%
	\marginpar{%
		\RaggedRight\footnotesize%
		\@afterindentfalse\@afterheading
		\vspace*{6mm} % compensate the table space added above the first line by the gape command
		#2
		\captionsetup*[table]{font={footnotesize}}
		\IfValueT{#1}{\captionof{table}{#1}}
	}
}

% Sidefigure
\DeclareDocumentCommand{\sideFigure}{o m}{%
	\marginElement{%
		\RaggedRight%
		\@afterindentfalse\@afterheading%
		#2%
		\captionsetup*[figure]{font={footnotesize}}%
		\IfValueT{#1}{\vspace*{-2mm}\captionof{figure}{#1}}
	}
}
\makeatother



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Full width environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{whole}{%
	\blockmargin
	\begin{adjustwidth}{0em}{-\wholeMargin}
}{%
	\end{adjustwidth}
	\unblockmargin
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		End-of-chapter ornament
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentCommand{\yOrnament}{O{} O{}}{
	\begin{center}
		\ornamentOneSkeleton{#1}{#2}{-1}
	\end{center}
}

\DeclareDocumentCommand{\ornamentOneSkeleton}{m m m}{ % tikzpictureArgument drawArgument verticalMultiplicxationFactor
	\begin{tikzpicture}[inner sep=0mm, scale=.5, #1]
	\draw[mainColor, ultra thick, #2] (-3, 0) -- (-1.5, 0) -- (-1, #3*.5) -- (-.5, 0) -- (.5, #3*1) -- (0, #3*1.5) -- (-.5, #3*1) -- (.5, 0) -- (1, #3*.5) -- (1.5, 0) -- (3, 0);
	\end{tikzpicture}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Math
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand{\mathLeft}{\@fleqntrue\@mathmargin\parindent}
\makeatother



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		AuthorBlock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\extraVerticalSpace}{\rule{0pt}{2.5ex}}

\DeclareDocumentCommand{\blockLine}{m m}{#1 \& #2\\}

% Author shortcuts
\DeclareDocumentCommand{\authorName}{m O{\faUser}}{
	\blockLine{}{\bfseries#1}%
}
\DeclareDocumentCommand{\authorAdressLineOne}{m O{\extraVerticalSpace\faHome}}{
	\blockLine{#2}{#1}%
}
\DeclareDocumentCommand{\authorAdressLineTwo}{m O{\phantom{\fontsize{2mm}{2mm}\faHome}}}{
	\blockLine{#2}{#1}%
}
\DeclareDocumentCommand{\authorAdressLineThree}{m O{\phantom{\fontsize{2mm}{2mm}\faHome}}}{
	\blockLine{#2}{#1}%
}
\DeclareDocumentCommand{\authorPhone}{m O{\extraVerticalSpace\fontsize{5mm}{4mm}\faMobile}}{
	\blockLine{#2}{#1}%
}
\DeclareDocumentCommand{\authorMail}{m O{\extraVerticalSpace\faEnvelopeO}}{
	\blockLine{#2}{\emaillink{#1}}%
}
\DeclareDocumentCommand{\authorWebsite}{m O{\extraVerticalSpace{\FA\symbol{"F245}}}}{
	\blockLine{#2}{\href{#1}{\color{Black}#1}}%
}

% Book shortcuts
%\DeclareDocumentCommand{\bookAuthor}{m O{{\FA\symbol{"F040}}}}{
%	\blockLine{#2}{\bfseries#1}%
%}
%\DeclareDocumentCommand{\bookParution}{m O{\extraVerticalSpace\faCalendar}}{
%	\blockLine{#2}{#1}%
%}
%\DeclareDocumentCommand{\bookISBN}{m O{\extraVerticalSpace\textsc{isbn}}}{
%	\blockLine{#2}{#1}%
%}

\newcommand{\blockLineWidth}{1.8mm}
\newcommand{\blockLineLength}{8mm}
\DeclareDocumentCommand{\authorBlock}{m O{inner sep=5mm}}{
	\blockSkeleton[
		\node[font=\fontsize{1.3cm}{1cm}, text=mainColor] (userIcon) at ($(authorBlock.north west)+(1mm, 0)$) {\faUser};
	][#2]{#1}
}
%\DeclareDocumentCommand{\bookBlock}{m O{inner sep=5mm}}{
%	\blockSkeleton[
%	\node[font=\fontsize{1.3cm}{1cm}, text=mainColor] (bookIcon) at ($(authorBlock.north west)+(1mm, 0)$) {\faBook};
%	][#2]{#1}
%}

% Arguments: 1afterCode 2matrixArgument 3columnOneCode 4columnTwoCode 5text
\DeclareDocumentCommand{\blockSkeleton}{O{} O{inner sep=5mm,} O{text=mainColor} O{} m}{
	\begin{tikzpicture}
	\matrix (authorBlock)[
		matrix of nodes, ampersand replacement=\&,
		nodes={inner ysep=.7mm, inner xsep=0mm, inner xsep=2mm, anchor=south west},
		column 1/.style={nodes={anchor=south,#3}},%
		column 2/.style={nodes={#4}},
		#2
	]{#5};
	\begin{scope}[darkGrey, line width=\blockLineWidth]
		\draw ($(authorBlock.north east)+(-\blockLineLength, 0)$) -- ++(\blockLineLength, 0) -- ++(0, -\blockLineLength);
		\draw ($(authorBlock.south west)+(0, \blockLineLength)$) -- ++(0, -\blockLineLength) -- ++(\blockLineLength, 0);
		\draw ($(authorBlock.south east)+(-\blockLineLength, 0)$) -- ++(\blockLineLength, 0) -- ++(0, \blockLineLength);
	\end{scope}
	#1
	\end{tikzpicture}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Numbers typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareDocumentCommand{\bigNumber}{o m O{\lightMainColor}}{% style line_color number
	{\heavyFont\LARGE{\IfValueT{#1}{#1}#2}}\\{#3\rule{1.5cm}{2mm}}% \contourlength{.4pt}\contournumber{50}\contour{mainColor}
}

\DeclareDocumentCommand{\sideNumber}{O{mainColor} o m O{mainColor} m}{% sidenotemark_color number_style number line_color text
	{%
		\hypersetup{linkcolor=mainColor}%
		\normalFont%
		\footnotemark%
	}%
	\ignorespaces%
	\marginElement{%
		{\heavyFont\fontsize{1.2cm}{1.44cm}\selectfont\color{darkGrey}{\IfValueT{#2}{#2}#3}}\\%
		{\color{#4}\rule{1.5cm}{2mm}}\\%
		\sideMark[#1]{\thefootnote}
		\ignorespaces%
		#5%
	}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Table of content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\yTableOfContent}[1][]{%
	\nomarginparpage
	\hypersetup{linkcolor=black}
	\setlength{\parskip}{2mm}
	\tableofcontents
	#1
	\newpage
	\marginparpage
}

\newcommand{\yTheContentsPage}{{\hypersetup{linkcolor=darkGrey},\quad\thecontentspage}}

\titlecontents*{chapter}
[2em] % Left
{\fontspec{Fira Sans SemiBold}} % Above code
{\contentslabel[\color{mainColor}\thecontentslabel]{2em}} % Numbered entry format
{\hspace*{-2em}} % numberless entry format
{\yTheContentsPage} % filler page format
[] % below code

\titlecontents{section}
[4em] % Left
{\fontspec{Fira Sans Book}} % Above code
{\contentslabel{2em}} % Numbered entry format
{\hspace*{-2em}} % numberless entry format
{\yTheContentsPage} % filler page format
[] % below code

\titlecontents{subsection}
[6em] % Left
{} % Above code
{\contentslabel{2em}} % Numbered entry format
{\hspace*{-2em}} % numberless entry format
{\yTheContentsPage} % filler page format
[] % below code

\makeatletter
%	\pretocmd{\@schapter}{\startcontents[chapter]}{}{} % uncomment to activate mini toc in frontmatter
	\pretocmd{\@chapter}{\startcontents}{}{}
\makeatother

\apptocmd{\contentsline}{\par}{}{} % patching contentsline so that it works with partial ToC

\titlecontents{partialsection}[0mm]% partial section style
{\contentsmargin[4mm]{0mm}\fontspec{Fira Sans Book}}%
{{\makebox[3.5mm]{\color{partialTocColor}$\blacktriangleright$\hfill}}\yTocSection}%
{}{}[\vspace*{1mm}]%
\newcommand{\yTocSection}[1]{%
		{#1\hspace*{1mm}(p. \thecontentspage)}%
}

\newcommand{\partialTocTitle}{%
	In Short%
}
\ifFrench
\renewcommand{\partialTocTitle}{En Bref}
\fi
\ifGerman
\renewcommand{\partialTocTitle}{Kurz}
\fi

\mdfdefinestyle{partialToc}{
	skipabove=\baselineskip,
	skipbelow=\baselineskip,
	innertopmargin=4mm,
	innerbottommargin=\baselineskip,
	innerleftmargin=4mm,
	innerrightmargin=4mm,
	leftmargin=0mm,
	rightmargin=0mm,
	rightline=false,
	topline=false,
	bottomline=false,
	leftline=false,
	linewidth=1mm,
	backgroundcolor=light-gray,
}
\colorlet{partialTocColor}{mainColor}
\DeclareDocumentCommand{\printMarginPartialToc}{O{1} O{\partialTocTitle} o o}{%
	\marginElement{%
		\IfValueT{#3}{\vspace*{#3}}%
		\begin{mdframed}[style=partialToc]%
			{\fontspec{Fira Sans Book}\Large #2}%\\
			{\color{partialTocColor}\hfill\rule{\linewidth}{.5mm}}\\[2mm]%
			\printcontents{partial}{1}{\setcounter{tocdepth}{#1}\hypersetup{linkcolor=black}}%
		\end{mdframed}%
		\IfValueT{#4}{\vspace*{#4}}%
	}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Mathematical infoBulle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract commands
\DeclareDocumentCommand{\yLectureNoteTheoremTitleContent}{m m m m}{%
	\mbox{}%
	\parbox[t][0pt]{.75cm}{%
		\mbox{}%
		\raisebox{-1mm}{\iconStyle\color{lightGrey}#1}%
	}\hspace*{2mm}%
	\parbox[t]{\linewidth-.75cm}{%
		\mbox{}%
		\infoBulleTitleFormat\textbf{#2~\thechapter.#3\IfValueTF{#4}{:}{}}\IfValueTF{#4}{\quad#4}{}%
	}%
}
\DeclareDocumentCommand{\yLectureNoteLogo}{O{Grey} m}{%
	\raisebox{-1mm}{\infoBulleAbstractLogo[#1]{#2}}
}
% General mathematical commands
\newcommand{\mathematicalLogo}{%
	\infoBulleAbstractLogo[mathematicalColor]{\fontsize{.6cm}{.72cm}\selectfont$\pi$}%\includegraphics[width=.6\linewidth]{images/Shape158-inverted.png}}
}

% Theorem commands
\newcommand{\theoremString}{Theorem}
\ifFrench
	\renewcommand{\theoremString}{Théorème}
\fi
\ifGerman
	\renewcommand{\theoremString}{Lehrsatz}
\fi
\newcounter{theorem}[chapter]
\NewDocumentEnvironment{theorem}{O{}}{
	\stepcounter{theorem}
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=mathematicalColor,
		frametitle=\yLectureNoteTheoremTitleContent{\mathematicalLogo}{\theoremString}{\thetheorem}{#1}
	]\relax%
}{
	\end{mdframed}
}

% Lemma commands
\newcommand{\lemmaString}{Lemma}
\ifFrench
	\renewcommand{\lemmaString}{Lemme}
\fi
\ifGerman
	\renewcommand{\lemmaString}{Lemma}
\fi
\newcounter{lemma}[chapter]
\NewDocumentEnvironment{lemma}{o}{
	\stepcounter{lemma}
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=mathematicalColor,
		frametitle=\yLectureNoteTheoremTitleContent{\mathematicalLogo}{\lemmaString}{\thelemma}{#1}
		]\relax%
	}{
\end{mdframed}
}

% Corollary commands
\newcommand{\corollaryString}{Corollary}
\ifFrench
\renewcommand{\corollaryString}{Corollaire}
\fi
\ifGerman
\renewcommand{\corollaryString}{Folge}
\fi
\newcounter{corollary}[chapter]
\NewDocumentEnvironment{corollary}{o}{
	\stepcounter{corollary}
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=mathematicalColor,
		frametitle=\yLectureNoteTheoremTitleContent{\mathematicalLogo}{\corollaryString}{\thecorollary}{#1}
		]\relax%
	}{
\end{mdframed}
}

% Definition commands
\newcommand{\definitionString}{Definition}
\ifFrench
\renewcommand{\definitionString}{Définition}
\fi
\ifGerman
\renewcommand{\definitionString}{Definition}
\fi
\newcounter{definition}[chapter]
\NewDocumentEnvironment{definition}{o}{
	\stepcounter{definition}
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=mathematicalColor,
		frametitle=\yLectureNoteTheoremTitleContent{\mathematicalLogo}{\definitionString}{\thedefinition}{#1}
		]\relax%
	}{
\end{mdframed}
}

% Axiom commands
\newcommand{\axiomString}{Axiom}
\ifFrench
\renewcommand{\axiomString}{Axiome}
\fi
\ifGerman
\renewcommand{\axiomString}{Axiom}
\fi
\newcounter{axiom}[chapter]
\NewDocumentEnvironment{axiom}{o}{
	\stepcounter{axiom}
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=mathematicalColor,
		frametitle=\yLectureNoteTheoremTitleContent{\mathematicalLogo}{\axiomString}{\theaxiom}{#1}
		]\relax%
	}{
\end{mdframed}
}

% Proposition commands
\newcommand{\propositionString}{Proposition}
\ifFrench
\renewcommand{\propositionString}{Proposition}
\fi
\ifGerman
\renewcommand{\propositionString}{Vorschlag}
\fi
\newcounter{proposition}[chapter]
\NewDocumentEnvironment{proposition}{o}{
	\stepcounter{proposition}
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=mathematicalColor,
		frametitle=\yLectureNoteTheoremTitleContent{\mathematicalLogo}{\propositionString}{\theproposition}{#1}
		]\relax%
	}{
\end{mdframed}
}

% Tips commands
\newcommand{\tipsString}{Tips}
\ifFrench
\renewcommand{\tipsString}{Astuce}
\fi
\ifGerman
\renewcommand{\tipsString}{Trick}
\fi
\newcommand{\tipsLogo}{%
	\infoBulleAbstractLogo[tipsColor]{\FA\symbol{"F0EB}}
}
\newcounter{tips}[chapter]
\DeclareDocumentCommand{\tipsInfo}{m m}{%
	\stepcounter{tips}%
	\begin{mdframed}[%
		style=infoBulle,
		linecolor=tipsColor,
		frametitle=\yLectureNoteTheoremTitleContent{\tipsLogo}{\tipsString}{\thetips}{#1}
		]\relax%
		#2%
\end{mdframed}%
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Date typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
	\usepackage{datetime}
	\newdateformat{autodate}{
		\dayofweekname{\THEDAY}{\THEMONTH}{\THEYEAR}\ifGerman, den\else\ifFrench\else, the\fi\fi\ \ordinaldate{\THEDAY}\ifGerman.\fi\ \shortmonthname[\THEMONTH] \THEYEAR
	}
	\autodate
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yLecture Side blocks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\mdfdefinestyle{yLectureNoteSideBlock}
{
	skipabove=0mm,
	skipbelow=0mm,
	innertopmargin=4mm,
	innerbottommargin=4mm,
	innerleftmargin=4mm,
	innerrightmargin=4mm,
	leftmargin=0mm,
	rightmargin=0mm,
	rightline=false,
	leftline=false,
	topline=false,
	bottomline=false,
	linewidth=1mm,
	backgroundcolor=light-gray,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yLecture Date
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{yDate}
\newcommand{\yLectureNoteClassDate}{}
\newcommand{\classDate}[3]{%
	\stepcounter{yDate}%
	\newdate{yDate-\theyDate}{#1}{#2}{#3}%
	\renewcommand{\yLectureNoteClassDate}{\displaydate{yDate-\theyDate}}%
	\marginElement{%
		\begin{mdframed}[style=yLectureNoteSideBlock]%
			\parbox{\linewidth}{%
			\mbox{}%
			\parbox[t]{.5cm}{\leavevmode\color{tipsColor}\FA\symbol{"F073}}%
			\parbox[t]{\linewidth-.5cm}{%
					\yLectureNoteClassDate%
				}%
			}%
		\end{mdframed}%
	}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yLecture Serie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifPrintSerie
\PrintSeriefalse
\newcounter{ySerie}
\newcommand{\serieString}{Exercices serie}
\ifFrench
\renewcommand{\serieString}{Série d'exercices}
\fi
\ifGerman
\renewcommand{\serieString}{Übungserie}
\fi
\newcommand{\nextSerie}{%
	\PrintSerietrue
	\stepcounter{ySerie}%
	\marginElement{%
		\begin{mdframed}[style=yLectureNoteSideBlock]%
			\parbox{\linewidth}{%
				\mbox{}%
				\parbox[t]{.5cm}{\leavevmode\color{mathematicalColor}\FA\symbol{"F044}}%
				\parbox[t]{\linewidth-.5cm}{%
					\serieString\ \theySerie%
				}%
			}%
		\end{mdframed}%
	}%
}
\newcommand{\stopPrintingSerie}{\PrintSeriefalse}
\newcommand{\printSerie}{\PrintSerietrue}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yLecture SideInfo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\mdfdefinestyle{yLectureNoteSideInfo}
{
	skipabove=0mm,
	skipbelow=0mm,
	innertopmargin=1mm,
	innerbottommargin=1mm,
	innerleftmargin=3mm,
	innerrightmargin=0mm,
	leftmargin=0mm,
	rightmargin=0mm,
	rightline=false,
	topline=false,
	bottomline=false,
	linewidth=1mm,
	frametitlebelowskip=1mm,
	frametitleaboveskip=1mm,
}
\DeclareDocumentCommand{\sideInfoAbstract}{m m m m m}{%
	\marginElement{%
		\begin{mdframed}[style=yLectureNoteSideInfo, linecolor=#2, frametitle={%
				\parbox{\linewidth}{%
					\mbox{}%
					\parbox[t]{.5cm}{\leavevmode\color{#2}#1}%
					\parbox[t]{\linewidth-.5cm}{\bfseries\IfNoValueTF{#3}{#4}{#3}}%
				}%
			}]%
			#5%
		\end{mdframed}%
	}%
}

\newcommand{\difficultyString}{Difficulty}
\ifGerman
\renewcommand{\difficultyString}{Schwierigkeit}
\fi
\ifFrench
\renewcommand{\difficultyString}{Difficulté}
\fi
\DeclareDocumentCommand{\sideCritical}{o m}{%
	\sideInfoAbstract{\faTimesCircle}{criticalColor}{\difficultyString}{#1}{#2}%
}

\newcommand{\infoString}{Info}
\DeclareDocumentCommand{\sideInfo}{o m}{%
	\sideInfoAbstract{\faInfoCircle}{informationColor}{\infoString}{#1}{#2}%
}

\DeclareDocumentCommand{\sideTips}{o m}{%
	\sideInfoAbstract{\FA\symbol{"F0EB}}{tipsColor}{\tipsString}{#1}{#2}%
}
