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
	\Frenchfalse
}

\newif\ifArticle
\Articlefalse
\DeclareOption{article}{
	\Articletrue
	\PassOptionsToClass{\CurrentOption}{report}
}

\newif\ifHeaders
\Headerstrue
\DeclareOption{noHeaders}{
	\Headersfalse
}

\newif\ifPortable
\Portablefalse
\DeclareOption{portable}{
	\Portabletrue
}

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{report}
}

\ExecuteOptions{frenchBullet}

\ProcessOptions\relax



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[a4paper, 10pt, fleqn, openany, twoside]{report}

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
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{amsmath, amsfonts, amssymb}
\RequirePackage{appendix}
\RequirePackage{ragged2e}
\RequirePackage{addlines}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage[marginIcons]{infoBulle}
\RequirePackage{eso-pic}
\RequirePackage{fancyhdr}
\RequirePackage{contour}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{changepage}
\patchcmd{\part}{\thispagestyle{plain}}{\thispagestyle{empty}}{}{\errmessage{Cannot patch \string\part}}

\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}

\RequirePackage[
	xetex,
	a4paper,
%	showframe,
	twoside,
	top=20mm,
	bottom=20mm,
	inner=20mm,
	outer=20mm,
	includehead,
	ignorefoot,
	includemp,
	marginparwidth=52mm,
	marginparsep=8mm,
	headsep=10mm,
	footskip=10mm,
]{geometry}

% No orphans
\clubpenalty = 500 % penalty for a single line of a paragraph staying on the page before
\widowpenalty = 1000 % penalty for a single line of a paragraph going to the page after

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
\ifPortable
\defaultfontfeatures{Path = ./fonts/}
\fi
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
\newfontfamily{\titleFont}{CanterLight}
\newfontfamily{\headingFont}{Josefin Sans}
\newfontfamily{\chapterNumberFont}{Canter Bold 3D}%{London}%{DiamondsThinItalic}%Abril Fatface}
\newfontfamily{\chapterFont}{CanterBold}
\newfontfamily{\serifFont}{Vollkorn}
\newfontfamily{\sectionNumbers}{Oswald Light}
\newfontfamily{\abril}{Abril Fatface}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{mainColor}{RGB}{211, 47, 47}
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
\DeclareDocumentCommand{\isOddPage}{mm}{
	\strictpagechecktrue
	\checkoddpage
	\ifoddpage%
	#1
	\else%
	#2
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRight}{O{} O{}}{
	\strictpagechecktrue
	\checkoddpage
	\ifoddpage%
	\begin{FlushRight}
		#1
		\else%
		\begin{FlushLeft}
			#2
			\fi%
		}
		\DeclareDocumentCommand{\alignLeftOrRightEnd}{O{} O{}}{
			\strictpagechecktrue
			\checkoddpage
			\ifoddpage%
		\end{FlushRight}
		#1
		\else%
	\end{FlushLeft}
	#2
	\fi%
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

\titleformat{\section}{}{%
	\fontsize{1.6cm}{1.8cm}\sectionNumbers\color{sectionNumbersColor}%
	\rlap{\hspace*{-3mm}\raisebox{-3mm}[0pt][0pt]{\ifArticle\else\arabic{chapter}.\fi\arabic{section}}}%
}{0pt}{\Huge\headingFont}{}

\titleformat{\subsection}{}{%
	\fontsize{1cm}{1.2cm}\sectionNumbers\color{subsectionNumbersColor}%
	\rlap{\hspace*{-2mm}\raisebox{-2mm}[0pt][0pt]{\ifArticle\else\arabic{chapter}.\fi\arabic{section}.\arabic{subsection}}}%
}{0pt}{\huge\headingFont}{}
\titleformat*{\subsubsection}{\LARGE\headingFont}

%Titling spacing: left before after [right]
\titlespacing*{\chapter}{0mm}{3mm}{1cm}
%\titlespacing*{name=\chapter,numberless}{0pt}{10pt}{0pt} %starred version of chapter default: 0pt, 50pt, 40pt
\titlespacing*{\section}{0mm}{-1mm}{-4mm}
\titlespacing*{\subsection}{0mm}{-1mm}{-3mm}
\titlespacing*{\subsubsection}{0mm}{2mm}{1.5mm}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancypagestyle{yReport}{
	\fancyhf{}
	\ifHeaders
	\fancyhead[RO]{\textit{\runauthor}, \leftmark\ \& \inColor{\textsc{\runtitle}}}
	\fancyhead[LE]{\inColor{\textsc{\runtitle}} \& \leftmark, \textit{\runauthor}}
	\fi
	\fancyfoot[C]{\thepage}
	\fancyhfoffset[OR, EL]{\marginparsep + \marginparwidth}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{yReport}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\assignpagestyle{\chapter}{empty}
\assignpagestyle{\part}{empty}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{fit}

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

\newcommand{\backgroundThisPageGrey}{\bigVerticalLine{bigVerticalLineGrey}}
\newcommand{\backgroundThisPageColor}{\bigVerticalLine{mainColor}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Date typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{datetime}
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
\newcommand{\bigColoredTitleTwo}{{\fontsize{3cm}{3.6cm}\selectfont\chapterFont\runtitle}}
\newcommand{\titleRule}{{\color{White}\rule{\linewidth}{1mm}}}
\newlength{\titlepageHeaderHeight}
\setlength{\titlepageHeaderHeight}{11cm}
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
		\coordinate[yshift=-\titlepageHeaderHeight](rectangleEnd) at (current page.north east);
		\coordinate[xshift=-4cm](dateCenter) at (rectangleEnd);
		
		\IfValueT{#1}{\draw (current page.center)[yshift=-\titlepageHeaderHeight/2] node[align=center, inner sep=0mm, anchor=center] {\IfValueTF{#2}{\includegraphics[#2]{#1}}{\includegraphics[height=\paperheight-\titlepageHeaderHeight]{#1}}};}
		
		\fill[mainColor] (current page.north west) rectangle (rectangleEnd) node[fitting node] (headerRectangle) {};
		\node[text width=\linewidth, anchor=north west]{
			\bigColoredTitleTwo\\[1mm] %3mm
			{\color{White}\rule{\widthof{\bigColoredTitleTwo}}{1mm}}\\[5mm]
			{
				\fontsize{.6cm}{.72cm}\selectfont\color{White}
				\hspace*{1.5mm}\@subtitle
			}
		};
		
		\fill[mainColor] (dateCenter)[yshift=1mm] circle (1.8cm);
		\fill[Black] (dateCenter)[yshift=1mm] circle (1.4cm); %, draw=Black, ultra thick
		\draw[White](dateCenter) node[text width=1.3cm, align=center] (day) {\fontsize{1cm}{1.2cm}\selectfont\textbf{\dayNumberOnTwoDigit\today}};
		\draw[White](dateCenter) node [node distance = .75cm, above of=day, text width=1.3cm, align=center](month) {\fontsize{.6cm}{1.2cm}\selectfont\textsc{\addfontfeatures{LetterSpace=15.0}\monthThreeLetterName}};
		\draw[White](dateCenter) node[node distance = .65cm, below of=day, text width=1.3cm, align=center] (year) {\fontsize{.4cm}{1.2cm}\selectfont{\addfontfeatures{LetterSpace=20.0}\the\year} };
	\end{tikzpicture}
	\null
	\vfill
	\begin{tikzpicture}[overlay]
		\draw (0,0) node[inner sep=4mm, anchor=west](author){\color{Black}\itshape\bfseries by \runauthor};
		\coordinate[xshift=-\evensidemargin - 1in - \hoffset] (authorSouthMargin) at (author.south west);
		\begin{pgfonlayer}{bg}
			\node[fit=(authorSouthMargin)(author), fill=middleGrey]{};
		\end{pgfonlayer}
	\end{tikzpicture}
	\newpage
	\asymmetricalPage
}
%\newcommand{\bigColoredTitleTwo}{{\fontsize{3cm}{3.6cm}\selectfont\chapterFont\runtitle}}
%\newcommand{\titleRule}{{\color{mainColor}\rule{\linewidth}{1mm}}}
%\newcommand{\titleTwo}[3]{
%	\thispagestyle{empty}
%	\symmetricalPage
%	\null
%	\begin{tikzpicture}[remember picture, overlay]
%	\coordinate[yshift=-5cm](rectangleEnd) at (current page.north east);
%	\coordinate[xshift=-4cm](dateCenter) at (rectangleEnd);
%	\fill[mainColor] (current page.north west) rectangle (rectangleEnd);
%	\end{tikzpicture}
%	\begin{tikzpicture}[remember picture, overlay]
%	\fill[mainColor] (dateCenter)[yshift=1mm] circle (1.8cm);
%	\fill[Black] (dateCenter)[yshift=1mm] circle (1.4cm); %, draw=Black, ultra thick
%	\draw[White](dateCenter) node[text width=1.3cm, align=center] (day) {\fontsize{1cm}{1.2cm}\selectfont\textbf{\dayNumberOnTwoDigit\today}};
%	\draw[White](dateCenter) node [node distance = .75cm, above of=day, text width=1.3cm, align=center](month) {\fontsize{.6cm}{1.2cm}\selectfont\textsc{\addfontfeatures{LetterSpace=15.0}\monthThreeLetterName}};
%	\draw[White](dateCenter) node[node distance = .65cm, below of=day, text width=1.3cm, align=center] (year) {\fontsize{.4cm}{1.2cm}\selectfont{\addfontfeatures{LetterSpace=20.0}\the\year} };
%	\end{tikzpicture}
%	\vspace*{4cm}
%	
%	\titleRule
%	
%	%	\begin{Center}
%	\bigColoredTitleTwo
%	%	\end{Center}
%	
%	\titleRule
%	
%	{
%		\fontsize{.6cm}{.72cm}\selectfont\fontspec{Fira Sans Book}\color{mainColor}
%		\@subtitle
%	}
%	\hfill
%	{
%		\itshape\runauthor
%	}
%	\vfill
%	\newpage
%	\asymmetricalPage
%}



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
	\setlength{\topsep}{\baselineskip} % amount of extra vertical space at top of list
	\setlength{\partopsep}{0pt} % extra length at top if environment is preceded by a blank line (it should be a rubber length)
	\setlength{\parsep}{\baselineskip} % amount of vertical space between paragraphs within an item
	\setlength{\itemsep}{-\baselineskip} % amount of extra vertical space between items
	\setlength{\leftmargin}{1cm} % horizontal distance between the left margins of the environment and the list; must be nonnegative
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
	\setlength{\itemindent}{0pt} % indentation of first line of an item; can be negative
	\setlength{\labelsep}{2mm} % separation between end of the box containing the label and the text of the first line of an item
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
\newenvironment{descr}{%
	\begin{list}{}{%
			\listConfig
			\setlength{\itemsep}{0pt}
	}
}{\end{list}}
	
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Quotation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\quoteStart}{
	\raisebox{-1.5cm}[0mm][0mm]{%
		\fontsize{3cm}{0mm}\selectfont%
		\color{middleGrey}%
		{\fontspec{Lora Bold Italic}“}\hspace*{-6.5mm}%
	}%
}
\NewDocumentCommand{\blockQuote}{o m}{
	\vskip \baselineskip
	\hfill\begin{minipage}{.92\linewidth}
		\mbox{}%
		\setlength{\parindent}{0pt}%
		\setlength{\parskip}{\baselineskip}%
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
	\end{minipage}
	\vskip \baselineskip
}

\DeclareDocumentCommand{\sideQuote}{o m}{
	\marginElement{%
		\llap{\quoteStart}%
		{\itshape#2}
		\IfValueT{#1}{
			\setlength{\parskip}{\baselineskip/2}%
			\begingroup\setlength\topsep{0pt}
			\begin{flushright}
				--- #1
			\end{flushright}
			\endgroup
		}
	}
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

\RequirePackage[margincaption,outercaption]{sidecap}
\sidecaptionvpos{figure}{t} 
\sidecaptionvpos{table}{t}


\RequirePackage{caption}
\DeclareCaptionLabelFormat{lineLabel}{\raisebox{-.3ex}{\tikz\fill[mainColor] (0,0) rectangle (1mm, \baselineskip);}\enspace#1 #2}
\DeclareCaptionStyle{yReportCaptionStyle}{labelsep=quad, labelformat=lineLabel, singlelinecheck=false}
\captionsetup[figure]{style=yReportCaptionStyle, justification=RaggedRight, position=bottom}
\captionsetup[table]{style=yReportCaptionStyle, justification=RaggedRight, position=bottom}

\DeclareCaptionJustification{raggedouter}{\raggedouter}
\captionsetup[SCtable]{style=yReportCaptionStyle, justification=raggedouter}
\captionsetup[SCfigure]{style=yReportCaptionStyle, justification=raggedouter}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{marginnote}

% The mark on the sidenote
\DeclareDocumentCommand{\sideMark}{O{mainColor} m}{{\color{#1}\normalFont#2.{\:}}}

\DeclareDocumentCommand{\marginElement}{m O{0}}{%
	\marginnote{%
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\RaggedRight\footnotesize%
		\else%
		\RaggedLeft\footnotesize%
		\fi%
		#1%
	}[#2\baselineskip]%
}%

\DeclareDocumentCommand{\sideNote}{O{mainColor} m O{0}}{%
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
	}[#3]%
	\unskip%
}%

\RequirePackage{mparhack}
% Sidetable (have to use marginpar since tabular doesn't work with marginnote)
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
		\captionsetup[table]{font={footnotesize}}
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
		\captionsetup[figure]{font={footnotesize}}%
		\IfValueT{#1}{\vspace*{-2mm}\captionof{figure}{#1}}
	}
}
\makeatother
		
		
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Full width environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{whole}{%
	\centering
	\strictpagechecktrue
	\begin{adjustwidth*}{0em}{-\wholeMargin}
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\RaggedRight
		\else%
		\RaggedLeft
		\fi%
}{%
	\end{adjustwidth*}
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





