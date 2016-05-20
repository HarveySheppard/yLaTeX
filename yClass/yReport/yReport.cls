%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yReport class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Copyright Yves Zumbach 2016
% Licenced under the LaTeX Project Public Licence
% For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at thib1235[at]gmail.com

% Based upon the uiothesis and report class


\ProvidesClass{yReport}[2016/01/20 A report class with a modern look combined with a marginpar]
\NeedsTeXFormat{LaTeX2e}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifColorBullet
\ColorBullettrue
\DeclareOption{noColorBullet}{
	\ColorBulletfalse
}

\newif\ifFrenchBullet
\FrenchBulletfalse
\DeclareOption{frenchBullet}{
	\FrenchBullettrue
}
\DeclareOption{noFrenchBullet}{
	\yFrenchBulletfalse
}

\newif\ifFrench
\Frenchfalse
\DeclareOption{french}{
	\Frenchtrue
	\PassOptionsToClass{french}{report}
}

\newif\ifArticle
\Articlefalse
\DeclareOption{article}{
	\Articletrue
}

\newif\ifHeaders
\Headerstrue
\DeclareOption{noHeaders}{
	\Headersfalse
}

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{report}
}

\ExecuteOptions{frenchBullet}

\ProcessOptions\relax



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifArticle
\LoadClass[a4paper, 10pt, fleqn, openany, twoside]{article}
\else
\LoadClass[a4paper, 10pt, fleqn, openany, twoside]{report}
\fi

\RequirePackage{ifxetex}
\ifxetex
\else
\ClassWarning{yReport}{For this template to work properly, please compile it with XeLaTeX!}
\fi

\typeout{This class is based on my previous work and the uiothesis class.}

\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage[no-math]{fontspec}

\RequirePackage{polyglossia}
\ifFrench
\setdefaultlanguage{french}
\else
\setdefaultlanguage{english}
\fi

\ClassWarning{yReport}{For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at thib1235[at]gmail.com}



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
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{appendix}
\RequirePackage{ragged2e}
\RequirePackage{addlines}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{varwidth}
\RequirePackage[marginIcons]{infoBulle}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{contour}
\RequirePackage{marginfix}
\RequirePackage{lettrine}
\RequirePackage{zref-abspos}
\RequirePackage{titletoc}
\RequirePackage{mdframed}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{changepage}
\ifArticle\else
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{\errmessage{Cannot patch \string\part}}
\fi

\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}
\setlength{\marginparpush}{1.5\baselineskip}

\RequirePackage[
	xetex,
	a4paper,
%	showframe,
	twoside,
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
	headheight=12.2pt,
]{geometry}

% Commands for changing the page layout mid-document
\newcommand{\symmetricalPage}{
	\fancyhfoffset[OR, EL]{0mm}
	\newgeometry{
		top=20mm,
		bottom=20mm,
		inner=20mm,
		outer=20mm,
		includehead,
		ignorefoot,
		nomarginpar,
		headsep=10mm,
		footskip=10mm,
	}
}
\newcommand{\asymmetricalPage}{
	\restoregeometry
	\fancyhfoffset[OR, EL]{\marginparsep + \marginparwidth}
}

\setlength{\columnsep}{\marginparsep}

% Saving some length as commands
\newlength{\wholeMargin}
\setlength{\wholeMargin}{\marginparwidth}
\addtolength{\wholeMargin}{\marginparsep}

\newlength{\wholeWidth}
\setlength{\wholeWidth}{\textwidth}
\addtolength{\wholeWidth}{\wholeMargin}



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
BoldFont=Fira Sans Medium,
ItalicFont=Fira Sans Light Italic,
BoldItalicFont=Fira Sans Medium Italic
]
% Normal font
\setmainfont{Fira Sans Light}[
Numbers=OldStyle,
BoldFont=Fira Sans Medium,
ItalicFont=Fira Sans Light Italic,
BoldItalicFont=Fira Sans Medium Italic
]
\newfontfamily{\normalFont}{Fira Sans Light}
\newfontfamily{\lightBoldFont}{Fira Sans}
\newfontfamily{\heavyFont}{Fira Sans Heavy}
\newfontfamily{\titleFont}{CanterLight}
\newfontfamily{\headingFontTest}{Fira Sans Book}
\newcommand{\headingFont}{\headingFontTest}
\newfontfamily{\chapterNumberFont}{Canter Bold 3D}%{London}%{DiamondsThinItalic}%Abril Fatface}
\newfontfamily{\chapterFont}{CanterBold}
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
\colorlet{bigVerticalLineGrey}{lightGrey}

\newcommand{\inColor}[1]{{\bfseries\color{mainColor}#1}}
\colorlet{light-gray}{lightGrey} %redefines infoBulle background light-grey to match yReport lightGrey



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Utilities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareDocumentCommand{\isOddPage}{mm}{%
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
	#1%
	\else%
	#2%
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRight}{O{} O{}}{%
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
	\begin{FlushRight}%
		#1%
		\else%
		\begin{FlushLeft}%
			#2%
			\fi%
		}
		\DeclareDocumentCommand{\alignLeftOrRightEnd}{O{} O{}}{%
			\strictpagechecktrue%
			\checkoddpage%
			\ifoddpage%
		\end{FlushRight}%
		#1%
		\else%
	\end{FlushLeft}%
	#2%
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRightStandalone}{}{
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
	\FlushRight%
	\else%
	\FlushLeft%
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRightStandaloneInversed}{}{
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
	\FlushLeft%
	\else%
	\FlushRight%
	\fi%
}
\newcommand{\noHyphen}{\hyphenpenalty10000\exhyphenpenalty10000\righthyphenmin62\lefthyphenmin62}

\newcommand{\emaillink}[1]{%
	{\hypersetup{urlcolor=black}\href{mailto:#1}{#1}}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\chapter}[block]
{} % format
{ % label
	\backgroundThisPageColor%
	\isOddPage{%
		\begin{tikzpicture}[remember picture, overlay]
		\coordinate[xshift=-\bigVerticalLineWidth/2, yshift=-5.8cm] (numberCenter) at (current page.north east);
		\draw[White] (numberCenter) node{
			\chapterNumberFont\fontsize{6.5cm}{7.8cm}\selectfont
			\color{White}
			\thechapter
		};
		\end{tikzpicture}%
	}{%
	\begin{tikzpicture}[remember picture, overlay]
	\coordinate[xshift=\bigVerticalLineWidth/2, yshift=-5.8cm] (numberCenter) at (current page.north west);
	\draw[White] (numberCenter) node{
		\chapterNumberFont\fontsize{6.5cm}{7.8cm}\selectfont
		\color{White}
		\thechapter
	};
	\end{tikzpicture}%
}
}
{0pt} % sep
{ % code before
	\isOddPage{
		\begin{FlushRight}
			\vspace*{-1.5mm}
	}{
		\begin{FlushLeft}
		\vspace*{-10mm}
	}
	\fontsize{2.5cm}{3cm}\chapterFont\selectfont%
}[ % code after
\alignLeftOrRightEnd
]
\titleformat{name=\chapter, numberless}[block]
{} % format
{\backgroundThisPageColor} % label
{0pt} % sep
{ % code before
	\alignLeftOrRight
	\fontsize{2.5cm}{3cm}\chapterFont\selectfont	
}[ % code after
\alignLeftOrRightEnd
]

\ifArticle
\renewcommand{\thesection}{\arabic{section}}
\else
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\fi

\titleformat{\section}{}{%
	\fontsize{1.6cm}{1.8cm}\sectionNumbers\color{sectionNumbersColor}%
	\rlap{\hspace*{-3mm}\raisebox{-3mm}[1pt][1pt]{\thesection}}%
}{-.8mm}{\Huge\headingFont}{}

\titleformat{\subsection}{}{%
	\fontsize{1cm}{1.2cm}\sectionNumbers\color{subsectionNumbersColor}%
	\rlap{\hspace*{-2mm}\raisebox{-2mm}[0pt][0pt]{\thesubsection}}%
}{-.5mm}{\huge\headingFont}{}
\titleformat*{\subsubsection}{\LARGE\headingFont}

%Titling spacing: left before after [right]
\titlespacing*{\chapter}{0mm}{3mm}{1cm}
%\titlespacing*{name=\chapter,numberless}{0pt}{10pt}{0pt} %starred version of chapter default: 0pt, 50pt, 40pt
\titlespacing*{\section}{0mm}{-1mm}{-4mm}
\titlespacing*{name=\section, numberless}{0mm}{-1mm}{-3mm}
\titlespacing*{\subsection}{0mm}{-1mm}{-3mm}
\titlespacing*{\subsubsection}{0mm}{2mm}{1.5mm}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\ifArticle
	\renewcommand{\leftmark}{\rightmark}
\fi
\ifArticle\else
	\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\fi
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\renewcommand{\subsectionmark}[1]{\markright{#1}{}}
\assignpagestyle{\chapter}{empty}
\assignpagestyle{\part}{empty}
\fancypagestyle{yReport}{
	\fancyhf{}
	\ifHeaders
		\fancyhead[RO]{{\renewcommand{\\}{ }\textit{\runauthor}, \leftmark\ \& \inColor{\textsc{\runtitle}}}}
		\fancyhead[LE]{{\renewcommand{\\}{ }\inColor{\textsc{\runtitle}} \& \leftmark, \textit{\runauthor}}}
	\fi
	\fancyfoot[C]{\thepage/{\hypersetup{linkcolor=Black}\pageref{LastPage}}}
	\fancyhfoffset[OR, EL]{\marginparsep + \marginparwidth}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{yReport}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{fit}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}

\pgfdeclarelayer{bg}    % declare background layer
\pgfsetlayers{bg,main}	% set the order of the layers (main is the standard layer)

\newlength{\bigVerticalLineWidth}
\setlength{\bigVerticalLineWidth}{\evensidemargin + 1in + \hoffset}

\newlength{\bigVerticalLinePartOfMarginParSep}
\setlength{\bigVerticalLinePartOfMarginParSep}{\marginparsep/8}
\setlength{\bigVerticalLinePartOfMarginParSep}{5\bigVerticalLinePartOfMarginParSep}

\addtolength{\bigVerticalLineWidth}{-\bigVerticalLinePartOfMarginParSep}

\newcommand{\bigVerticalLine}[1]{
	\strictpagechecktrue
	\checkoddpage
	\ifoddpage%
	\AddToShipoutPictureBG*{
		\begin{tikzpicture}[remember picture, overlay]
			\fill[fill=#1] (current page.south east) rectangle ++(-\bigVerticalLineWidth, \paperheight);
		\end{tikzpicture}
	}
	\else%
	
	\AddToShipoutPictureBG*{
		\begin{tikzpicture}[remember picture, overlay]
			\fill[fill=#1] (current page.south west) rectangle ++(\bigVerticalLineWidth, \paperheight);
		\end{tikzpicture}
	}
	\fi%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Backgrounding commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Vertical lines
\newcommand{\backgroundThisPageGrey}{\bigVerticalLine{bigVerticalLineGrey}}
\newcommand{\backgroundThisPageColor}{\bigVerticalLine{mainColor}}

% Entire page area
\newcounter{background}[page]
\renewcommand{\thebackground}{\arabic{page}-\arabic{background}}

\newcommand{\backgroundAnchor}[1]{\leavevmode\zsavepos{background-#1}}

\newlength{\backgroundInnerTopSpace}
\DeclareDocumentCommand{\startBackground}{O{0mm} O{0mm} O{\thebackground}}{% space_before_begin space_after_begin counter
	\setlength{\backgroundInnerTopSpace}{1em}\addtolength{\backgroundInnerTopSpace}{#2}%
	\vspace*{#1}\newline%
	\backgroundAnchor{begin-#3}\vspace*{\backgroundInnerTopSpace}\\%
}

\DeclareDocumentCommand{\startBackgroundPageTop}{O{\thebackground}}{\begin{tikzpicture}[overlay, remember picture]%
	\node at (current page.north west) {\backgroundAnchor{begin-#1}};
\end{tikzpicture}}

\newlength{\depthLength}
\settodepth{\depthLength}{p}
\newlength{\backgroundInnerBottomSpace}
\newlength{\backgroundOuterBottomSpace}
\DeclareDocumentCommand{\stopBackground}{O{0mm} O{0mm} O{\thebackground}}{% outer_space inner_space counter
	\setlength{\backgroundInnerBottomSpace}{2\depthLength}\addtolength{\backgroundInnerBottomSpace}{#2}%
	\vspace*{\backgroundInnerBottomSpace}%
	\setlength{\backgroundOuterBottomSpace}{1em}\addtolength{\backgroundOuterBottomSpace}{#1}
	\backgroundAnchor{end-#3}\vspace*{\backgroundOuterBottomSpace}
}

\DeclareDocumentCommand{\stopBackgroundPageBottom}{O{\thebackground}}{\tikz[overlay, remember picture]{\node at (current page.south east) {\backgroundAnchor{end-#1}};}}

\tikzset{background/.style = {fill=lightGrey}}
\newcommand{\drawBackground}[1][\thebackground]{%
	\leavevmode%
	\stepcounter{background}%
	\zsavepos{background-draw-#1}%
	\begin{tikzpicture}[remember picture, overlay, inner sep=0mm]
		\fill[background] let
		\p1=(current page.west),
		\p2=(current page.east) in
		(\x1, \zposy{background-begin-#1}sp - \zposy{background-draw-#1}sp) rectangle
		(\x2, \zposy{background-end-#1}sp   - \zposy{background-draw-#1}sp);
	\end{tikzpicture}%
	\ignorespaces
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Date typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{datetime}
\ifFrench
\newcommand{\monthThreeLetterName}{%
	\ifcase\the\month
	\or Jan% 1
	\or Fév% 2
	\or Mar% 3
	\or Avr% 4
	\or Mai% 5
	\or Jui% 6
	\or Jul% 7
	\or Aou% 8
	\or Sep% 9
	\or Oct% 10
	\or Nov% 11
	\or Déc% 12
	\fi
}
\else
\newcommand{\monthThreeLetterName}{%
	\ifcase\the\month
	\or Jan% 1
	\or Feb% 2
	\or Mar% 3
	\or Apr% 4
	\or May% 5
	\or Jun% 6
	\or Jul% 7
	\or Aug% 8
	\or Sep% 9
	\or Oct% 10
	\or Nov% 11
	\or Dec% 12
	\fi
}
\fi
\newdateformat{dayNumberOnTwoDigit}{\twodigit{\THEDAY}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\bigColoredTitle}{{\color{mainColor}\fontsize{3cm}{3.6cm}\selectfont\chapterFont\runtitle}}
\newcommand{\titleOne}{%
	\thispagestyle{empty}%
	\symmetricalPage
	\null
	\vspace*{1cm}
	\begin{tikzpicture}[remember picture, overlay, opacity=.8]
	\node[inner sep=0pt,outer sep=0pt,anchor=north west] at(current page.north west) {\includegraphics[width=\paperwidth]{images/AbstractBackgroundAllRed.png}}; % for fadings: scope fading = east
	\end{tikzpicture}
	\begin{minipage}{\widthof{\bigColoredTitle}}%
		{\fontsize{.6cm}{.72cm}\selectfont\fontspec{Fira Sans Book}\color{mainColor}%
			\contourlength{2pt} % how thick each copy is
			\contournumber{20}%
			\contour{white}{\@subtitle}%
		}\\[2mm]%
		\bigColoredTitle\\[-5mm]%
		\begin{FlushRight}
			\itshape\runauthor\hspace*{1mm}
		\end{FlushRight}
	\end{minipage}%
	\newpage
	\asymmetricalPage
}

\newlength{\titlepageHeaderHeight}
\setlength{\titlepageHeaderHeight}{11cm}
\newcommand\getwidthofnode[2]{%
	\pgfextractx{#1}{\pgfpointanchor{#2}{east}}%
	\pgfextractx{\pgf@xa}{\pgfpointanchor{#2}{west}}% \pgf@xa is a length defined by PGF for temporary storage. No need to create a new temporary length.
	\addtolength{#1}{-\pgf@xa}%
}
\newlength{\titlepageTitleLength}
\DeclareDocumentCommand{\titleTwo}{o o}{
	\thispagestyle{empty}
	\symmetricalPage
	\null
	\tikzset{
		fitting node/.style={
			inner sep=0pt,
			fill=none,
			draw=none,
			reset transform,
			fit={(\pgf@pathminx,\pgf@pathminy) (\pgf@pathmaxx,\pgf@pathmaxy)}
		},
		reset transform/.code={\pgftransformreset}
	}
	\begin{tikzpicture}[remember picture, overlay]
		% some coordinates
		\coordinate[yshift=-\titlepageHeaderHeight](rectangleEnd) at (current page.north east);
		\coordinate[xshift=-4cm](dateCenter) at (rectangleEnd);
		
		% draw an image if one was provided
		\IfValueT{#1}{\draw (current page.center)[yshift=-\titlepageHeaderHeight/2] node[align=center, inner sep=0mm, anchor=center] {\IfValueTF{#2}{\includegraphics[#2]{#1}}{\includegraphics[height=\paperheight-\titlepageHeaderHeight]{#1}}};}
		
		% red rectangle
		\fill[mainColor] (current page.north west) rectangle (rectangleEnd) node[fitting node] (headerRectangle) {};
		
		% title page text (title rule and subtitle)
			% title
		\draw (\leftmargin, -3.5cm) node[align=left, inner sep=0mm, anchor=south west, font=\fontsize{2.3cm}{1.8cm}\selectfont\chapterFont] (title) {
			\hspace*{-.8mm}\begin{varwidth}{\textwidth}%
				\FlushLeft%
				\noHyphen\runtitle%
			\end{varwidth}%
		};
			% rule
		\getwidthofnode{\titlepageTitleLength}{title}
		\node[inner xsep=0mm, text width=\titlepageTitleLength, anchor=north west, yshift=-2mm] (rule) at (title.south west) {
			{\color{White}\rule{\linewidth}{.6mm}}
		};
			% author
		\node[inner xsep=0mm, text width=\linewidth, anchor=north west, yshift=-2mm] (subtitle) at (rule.south west) {
			{\fontsize{.6cm}{.72cm}\selectfont\color{White}
				\@subtitle}% \runauthor
			};
		
		% Date
		\fill[mainColor] (dateCenter)[yshift=1mm] circle (1.8cm);
		\fill[Black] (dateCenter)[yshift=1mm] circle (1.4cm); %, draw=Black, ultra thick
		\draw[White](dateCenter) node[text width=1.3cm, align=center] (day) {\fontsize{1cm}{1.2cm}\selectfont\textbf{\dayNumberOnTwoDigit\today}};
		\draw[White](dateCenter) node [node distance = .75cm, above of=day, text width=1.3cm, align=center](month) {\fontsize{.6cm}{1.2cm}\selectfont\textsc{\addfontfeatures{LetterSpace=15.0}\monthThreeLetterName}};
		\draw[White](dateCenter) node[node distance = .65cm, below of=day, text width=1.3cm, align=center] (year) {\fontsize{.4cm}{1.2cm}\selectfont{\addfontfeatures{LetterSpace=20.0}\the\year} };
		% author
%		\node[anchor=south east] at ($(current page.south east)+(-6mm, 6mm)$) {\fontspec{Canter Light}\fontsize{10mm}{6mm}\color{White}\selectfont Yves Zumbach};
	\end{tikzpicture}
	\null
	\vfill
	% author
%	\begin{tikzpicture}
%		\draw (0,0) node[inner sep=4mm, anchor=west](author){\color{Black}\itshape\bfseries by \runauthor};
%		\coordinate[xshift=-\evensidemargin - 1in - \hoffset] (authorSouthMargin) at (author.south west);
%		\begin{pgfonlayer}{bg}
%			\node[fit=(authorSouthMargin)(author), fill=middleGrey]{};
%		\end{pgfonlayer}
%	\end{tikzpicture}
	\newpage
	\asymmetricalPage
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
\tabulinesep = ^2.5mm_2mm
\newcommand{\tableHeaderStyle}{
	\rowfont{\bfseries\sffamily\leavevmode\color{white}}
	\rowcolor{mainColor}
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
\newcommand{\listConfig}{
	\setlength{\topsep}{0pt} % amount of extra vertical space at top of list
	\setlength{\partopsep}{\baselineskip} % extra length at top if environment is preceded by a blank line (it should be a rubber length)
	\setlength{\parsep}{\baselineskip} % amount of vertical space between paragraphs within an item
	\setlength{\itemsep}{-\baselineskip} % amount of extra vertical space between items
	\setlength{\leftmargin}{1cm} % horizontal distance between the left margins of the environment and the list; must be nonnegative
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
	\setlength{\itemindent}{0pt} % indentation of first line of an item; can be negative
	\setlength{\labelsep}{2mm} % separation between end of the box containing the label and the text of the first line of an item
}
\newcommand{\sideListConfig}{
	\setlength{\topsep}{-.5\baselineskip} % amount of extra vertical space at top of list
	\setlength{\partopsep}{0pt} % extra length at top if environment is preceded by a blank line (it should be a rubber length)
	\setlength{\parsep}{\baselineskip} % amount of vertical space between paragraphs within an item
	\setlength{\itemsep}{-\baselineskip} % amount of extra vertical space between items
	\setlength{\leftmargin}{8mm} % horizontal distance between the left margins of the environment and the list; must be nonnegative
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
	\setlength{\itemindent}{0pt} % indentation of first line of an item; can be negative
	\setlength{\labelsep}{1ex} % separation between end of the box containing the label and the text of the first line of an item
}

% Enumeratable list
\newenvironment{enum}{%
	\begin{list}{
			\ifColorBullet
			\color{mainColor}
			\fi
			\arabic{enumi}
		}{%
		\listConfig
		\usecounter{enumi}
	}
}{\end{list}}
\newenvironment{sideEnum}{%
	\begin{list}{
			\ifColorBullet
			\color{mainColor}
			\fi
			\arabic{enumi}
		}{%
		\sideListConfig
		\usecounter{enumi}
	}
}{\end{list}}

% Itemized list
\newenvironment{items}{%
	\begin{list}{
			\ifColorBullet
			\color{mainColor}
			\fi
			\ifFrenchBullet
			\textbf{---}
			\else
			\textbullet
			\fi
		}{%
		\listConfig
	}
}{\end{list}}
\newenvironment{sideItems}{%
	\begin{list}{%
			\ifColorBullet%
			\color{mainColor}%
			\fi%
			\ifFrenchBullet%
			\textbf{---}%
			\else%
			\textbullet%
			\fi%
		}{%
			\sideListConfig
		}
}{\end{list}}

\newenvironment{descr}{%
	\begin{list}{}{%
			\listConfig
			\setlength{\itemsep}{0pt}
	}
}{\end{list}}
\newenvironment{sideDescr}{%
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
% side captions are aligned in the text block direction (left on even pages, right on odd pages)
\newcommand{\raggedouter}{%
	\checkoddpage%
	\ifoddpage%
	\RaggedRight%
	\else%
	\RaggedLeft%
	\fi%
}
\strictpagecheck

%\RequirePackage[margincaption,outercaption]{sidecap}
%\sidecaptionvpos{figure}{t} 
%\sidecaptionvpos{table}{t}


\RequirePackage{caption}
%\DeclareCaptionLabelFormat{yLabel}{\raisebox{-.3ex}{\tikz\fill[mainColor] (0,0) rectangle (1mm, \baselineskip);}\enspace#1 #2}
%		\parshape=3
%		2cm 6cm
%		2cm 6cm
%		0cm \linewidth
%		{\normalsize\normalfont%
%			\tikz{\node[inner sep=2mm, fill=lightGrey, text=mainColor, font=\bfseries]{#1 #2};}%
%		}%
\DeclareCaptionLabelFormat{yLabel}{%
%\lettrine[lhang=0, lines=2, findent=.5em, nindent=0em ]{\normalsize\tikz{\node[anchor=west, inner sep=2mm, fill=lightGrey, font=\bfseries, text=mainColor] {#1 #2};}}{}%\\
\tikz{\node[anchor=west, inner sep=2mm, fill=lightGrey, font=\bfseries, text=mainColor]{#1 #2};}
}

\DeclareDocumentCommand{\sideCaptionOf}{m m}{\marginnote{\captionof{#1}{#2}}}

\DeclareCaptionStyle{yReportCaptionStyle}{labelsep=none, labelformat=yLabel, singlelinecheck=false}
\captionsetup*[figure]{style=yReportCaptionStyle, justification=RaggedRight, position=bottom}
\captionsetup*[table]{style=yReportCaptionStyle, justification=RaggedRight, position=bottom}

\DeclareCaptionJustification{raggedouter}{\raggedouter}
\captionsetup*[SCtable]{style=yReportCaptionStyle, justification=raggedouter}
\captionsetup*[SCfigure]{style=yReportCaptionStyle, justification=raggedouter}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{marginnote}

% The mark on the sidenote
\DeclareDocumentCommand{\sideMark}{O{mainColor} m}{{\color{#1}\normalFont#2.{\:}}}

\DeclareDocumentCommand{\marginElement}{m}{%
	\marginpar{%
		\strictpagechecktrue%
		\checkoddpage%
		\ifoddpage%
		\RaggedRight\footnotesize%
		\else%
		\RaggedLeft\footnotesize%
		\fi%
		#1%
	}\unskip%
}%

\DeclareDocumentCommand{\sideTitle}{m}{{\lightBoldFont\large#1}}
\DeclareDocumentCommand{\sideTitleColor}{m}{{\color{mainColor}\sideTitle{#1}}}

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
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\RaggedRight\footnotesize%
		\else%
		\RaggedLeft\footnotesize%
		\fi%
		\sideMark[#1]{\thefootnote}%
		\ignorespaces%
		#2%
	}%
}

\makeatletter
\DeclareDocumentCommand{\sideTable}{o m}{%
	\marginpar{%
		\strictpagechecktrue%
		\checkoddpage%
		\ifoddpage%
		\justifying\footnotesize%
		\else%
		\RaggedLeft\footnotesize%
		\fi%
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
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\RaggedRight%
		\else%
		\RaggedLeft%
		\fi%
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
	\centering
	\blockmargin
	\begin{adjustwidth*}{0em}{-\wholeMargin}
}{%
	\end{adjustwidth*}
	\unblockmargin
}

% Centered environment
\newenvironment{centered}{%
	\begin{adjustwidth*}{0em}{-\wholeMargin}
		\centering
}{%
	\end{adjustwidth*}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		End-of-chapter ornament
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareDocumentCommand{\ornamentTwoTop}{O{} O{}}{
	\begin{center}
		\ornamentTwoSkeleton{#1}{#2}{1}
	\end{center}
}

\DeclareDocumentCommand{\ornamentTwoBottom}{O{} O{}}{
	\begin{center}
		\ornamentTwoSkeleton{#1}{#2}{-1}
	\end{center}
}

\DeclareDocumentCommand{\ornamentTwoSkeleton}{m m m}{ % tikzpictureArgument drawArgument verticalMultiplicxationFactor
	\begin{tikzpicture}[inner sep=0mm, #1]
	\draw[mainColor, ultra thick, #2] (-3.5, 0) -- (-2.5, 0) -- (-2, #3*.5) -- (-1.5, 0) -- (-.5, 0) -- (.5, #3*1) -- (0, #3*1.5) -- (-.5, #3*1) -- (.5, 0) -- (1.5, 0) -- (2, #3*.5) -- (2.5, 0) -- (3.5, 0);
	\end{tikzpicture}
}


\DeclareDocumentCommand{\ornamentOneTop}{O{} O{}}{
	\begin{center}
		\ornamentOneSkeleton{#1}{#2}{1}
	\end{center}
}

\DeclareDocumentCommand{\ornamentOneBottom}{O{} O{}}{
	\begin{center}
		\ornamentOneSkeleton{#1}{#2}{-1}
	\end{center}
}

\DeclareDocumentCommand{\ornamentOneSkeleton}{m m m}{ % tikzpictureArgument drawArgument verticalMultiplicxationFactor
	\begin{tikzpicture}[inner sep=0mm, #1]
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
%		Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\clubpenalty=1000 %penalty for breaking after the first line of a par
\widowpenalty=1000 %penalty for breaking before the last line of a par
\brokenpenalty=700 %penalty for page breaking after hyphenated line
\tolerance=500 %Allow LaTeX to break lines too often. It prevents line for overflowing in the margins



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
\DeclareDocumentCommand{\bookAuthor}{m O{{\FA\symbol{"F040}}}}{
	\blockLine{#2}{\bfseries#1}%
}
\DeclareDocumentCommand{\bookParution}{m O{\extraVerticalSpace\faCalendar}}{
	\blockLine{#2}{#1}%
}
\DeclareDocumentCommand{\bookISBN}{m O{\extraVerticalSpace\textsc{isbn}}}{
	\blockLine{#2}{#1}%
}

\newcommand{\blockLineWidth}{1.8mm}
\newcommand{\blockLineLength}{8mm}
\DeclareDocumentCommand{\authorBlock}{m O{inner sep=5mm}}{
	\blockSkeleton[
		\node[font=\fontsize{1.3cm}{1cm}, text=mainColor] (userIcon) at ($(authorBlock.north west)+(1mm, 0)$) {\faUser};
	][#2]{#1}
}
\DeclareDocumentCommand{\bookBlock}{m O{inner sep=5mm}}{
	\blockSkeleton[
	\node[font=\fontsize{1.3cm}{1cm}, text=mainColor] (bookIcon) at ($(authorBlock.north west)+(1mm, 0)$) {\faBook};
	][#2]{#1}
}

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
\makeatletter
%	\pretocmd{\@schapter}{\startcontents[chapter]}{}{} % uncomment to activate mini toc in frontmatter
	\pretocmd{\@chapter}{\startcontents}{}{}
\makeatother

\apptocmd{\contentsline}{\par}{}{} % patching contentsline so that it works with partial ToC

\titlecontents{partialsection}[0mm]% partial section style
{\contentsmargin[4mm]{0mm}\fontspec{Fira Sans Book}\alignLeftOrRightStandaloneInversed}%
{\isOddPage%
	{\makebox[3.5mm]{\color{partialTocColor}$\blacktriangleright$\hfill}}%
	{(p. \thecontentspage)}%
\yTocSection}%
{}{}[\vspace*{-1mm}]%
\newcommand{\yTocSection}[1]{%
	\isOddPage%
		{#1\hspace*{1mm}(p. \thecontentspage)}%
		{\hspace*{1mm}#1\makebox[3.5mm]{\hfill\color{partialTocColor}$\blacktriangleleft$}}%
}

\newcommand{\partialTocTitle}{%
	En Bref%
}

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
	linewidth=1mm
}
\colorlet{partialTocColor}{White}
\DeclareDocumentCommand{\printMarginPartialToc}{O{1} O{\partialTocTitle} o o}{%
	\ifArticle
	\mdfapptodefinestyle{partialToc}{
		backgroundcolor=light-gray
	}
	\colorlet{partialTocColor}{mainColor}
	\else
	\fi
	\marginElement{%
		\IfValueT{#3}{\vspace*{#3}}%
		\ifArticle%
		\begin{mdframed}[style=partialToc]%
		\fi%
			\alignLeftOrRightStandaloneInversed{\fontspec{Fira Sans Book}\Large #2}%\\
			{\color{partialTocColor}\hfill\rule{\linewidth}{.5mm}}%
			\vspace*{-2mm}%
			\printcontents{partial}{1}{\setcounter{tocdepth}{#1}\hypersetup{linkcolor=black}}%
			\ifArticle\else%
			\vspace*{1mm}
			{\color{partialTocColor}\hfill\rule{\linewidth}{.5mm}}%
			\fi%
		\ifArticle%
		\end{mdframed}%
		\fi%
		\IfValueT{#4}{\vspace*{#4}}%
	}
}









