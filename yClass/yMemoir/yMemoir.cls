%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yMemoir class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Copyright Yves Zumbach 2016
% Licenced under the LaTeX Project Public Licence
% For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at thib1235[at]gmail.com

% Based upon the uiothesis and memoir class


\ProvidesClass{yMemoir}[2016/01/20 A memoir class with a modern look combined with a marginpar]
\NeedsTeXFormat{LaTeX2e}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifyColorBullet
\yColorBullettrue
\DeclareOption{noColorBullet}{
	\yColorBulletfalse
}

\newif\ifyFrenchBullet
\yFrenchBulletfalse
\DeclareOption{frenchBullet}{
	\yFrenchBullettrue
}
\DeclareOption{noFrenchBullet}{
	\yFrenchBulletfalse
}

\newif\ifyFrench
\yFrenchfalse
\DeclareOption{french}{
	\yFrenchfalse
}

\newif\ifyArticle
\yArticlefalse
\DeclareOption{article}{
	\yArticletrue
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\newif\ifySubsectionNumbering
\ySubsectionNumberingtrue
\DeclareOption{noSubsectionNumbering}{
	\ySubsectionNumberingfalse
}

\newif\ifyHeaders
\yHeaderstrue
\DeclareOption{noHeaders}{
	\yHeadersfalse
}

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{memoir}
}

\ExecuteOptions{frenchBullet}

\ProcessOptions\relax



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[a4paper, 10pt, fleqn, openany]{memoir}

\RequirePackage{ifxetex}
\ifxetex
\else
	\ClassWarning{yMemoir}{For this template to work properly, please compile it with XeLaTeX!}
\fi

\typeout{This class is based on my previous work and the uiothesis class.}

\RequirePackage[l2tabu, orthodox]{nag}
\RequirePackage[no-math]{fontspec}

\RequirePackage{polyglossia}
\ifyFrench
	\setdefaultlanguage{french}
\else
	\setdefaultlanguage{english}
\fi

\ClassWarning{yMemoir}{For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at thib1235[at]gmail.com}



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
\RequirePackage{yBanner}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{changepage}
\aliaspagestyle{part}{empty}

\setlength{\parindent}{0pt}
\setlength{\parskip}{\onelineskip}
\setlength{\footskip}{1.5cm}

\settypeblocksize{24.2375cm}{11.5cm}{*} % typeblock size: height width ratio (or {*}{11.5}{2})
\setlrmargins{*}{*}{3} % defines horizontal margin: spine edge ratio (as typeblock width is defined only one value is necessary here)
\setulmargins{*}{*}{1.5} % defines vertical margins: upper lower ratio (typeblock height is defined, only one value is necessary) (or {}{}{1.3})
\setmarginnotes{8mm}{5cm}{\baselineskip} % defines margin par lengths: textpardistance parwidth verticalseparationbetweenpar
\checkandfixthelayout

% No orphans
\clubpenalty = 500 % penalty for a single line of a paragraph staying on the page before
\widowpenalty = 1000 % penalty for a single line of a paragraph going to the page after

% Commands for changing the page layout mid-document
\newcommand{\symmetricalPage}{
	\changepage{}{4.75cm}{-4.75cm}{}{}{}{}{}{} % textheight textwidth evensidemargin oddsidemargin columnsep topmargin headheight headsep footskip
}
\newcommand{\asymmetricalPage}{
	\changepage{}{-4.75cm}{4.75cm}{}{}{}{}{}{} % textheight textwidth evensidemargin oddsidemargin columnsep topmargin headheight headsep footskip
}

% Saving some length as commands
\newlength{\wholemargin}
\setlength{\wholemargin}{\marginparwidth}
\addtolength{\wholemargin}{\marginparsep}

\newlength{\wholewidth}
\setlength{\wholewidth}{\textwidth}
\addtolength{\wholewidth}{\wholemargin}



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
BoldItalicFont=Fira Sans Book Italic
]
% Normal font
\setmainfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans Book,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Book Italic
]
% Font for section, subsection, subsubsection, etc
\newfontfamily{\titlefont}{Josefin Sans}
%[
%	Numbers=OldStyle,
%	BoldFont=Lato Regular,
%	ItalicFont=Lato Light Italic,
%	BoldItalicFont=Lato Italic
%]
\newfontfamily{\chapterNumberFont}{Canter Bold 3D}%{London}%{DiamondsThinItalic}%Abril Fatface}
\newfontfamily{\chapterFont}{CanterBold}
\newfontfamily{\serifFont}{Vollkorn}
\newfontfamily{\boldSectionNumbers}{Oswald}
\newfontfamily{\abril}{Abril Fatface}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{mainColor}{RGB}{211, 47, 47} % Dark red
\definecolor{sectionNumbersColor}{gray}{.75}
\definecolor{subsectionNumbersColor}{gray}{.8}
\definecolor{lightGrey}{gray}{0.92}
\colorlet{bigVerticalLineGrey}{lightGrey}
\definecolor{darkGrey}{gray}{.55}
\definecolor{middleGrey}{gray}{.75}

\newcommand{\inColor}[1]{{\bfseries\color{mainColor}#1}}



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
	\backgroundThisPageColor
	\isOddPage{
		\begin{tikzpicture}[remember picture, overlay]
		\coordinate[xshift=-\bigVerticalLineWidth/2, yshift=-5.8cm] (numberCenter) at (current page.north east);
		\draw[White] (numberCenter) node{
			\chapterNumberFont\fontsize{6.5cm}{7.8cm}\selectfont
			\color{White}
			\thechapter
		};
		\end{tikzpicture}
	}{
		\begin{tikzpicture}[remember picture, overlay]
		\coordinate[xshift=\bigVerticalLineWidth/2, yshift=-5.8cm] (numberCenter) at (current page.north west);
		\draw[White] (numberCenter) node{
			\chapterNumberFont\fontsize{6.5cm}{7.8cm}\selectfont
			\color{White}
			\thechapter
		};
		\end{tikzpicture}
	}
}
{0pt} % sep
{ % code before
	\alignLeftOrRight
	\fontsize{2.5cm}{3cm}\chapterFont\selectfont	
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

\titleformat*{\section}{\Huge\titlefont}
\titleformat*{\subsection}{\huge\titlefont}
\titleformat*{\subsubsection}{\LARGE\titlefont}

%Titling spacing: left before after [right]
\titlespacing*{\chapter}{0mm}{3mm}{1cm}
%\titlespacing*{name=\chapter,numberless}{0pt}{10pt}{0pt} %starred version of chapter default: 0pt, 50pt, 40pt
\titlespacing*{\section}{0mm}{-4mm}{-4mm}
\titlespacing*{\subsection}{0mm}{-3mm}{-3mm}
\titlespacing*{\subsubsection}{0mm}{2mm}{1.5mm}

% Section number in margin
\makeatletter
\ifyArticle
\counterwithout{section}{chapter}
\fi

\setsecnumformat{%
	\@ifundefined{#1@cntformat}%
	{% Subsection style (everything that has numbers and that is not a section in fact)
		\fontsize{1cm}{1.2cm}\boldSectionNumbers\color{subsectionNumbersColor}%
		\rlap{\hspace*{-2mm}\raisebox{-2mm}[0pt][0pt]{\csname the#1\endcsname}}%
		\hspace*{-1.5pt}% This horizontal space aligns the first section letter with the typeblock border
	}%       default
	{% Section sytyle
		\fontsize{1.6cm}{1.8cm}\boldSectionNumbers\color{sectionNumbersColor}%
		\rlap{\hspace*{-5mm}\raisebox{-3mm}[0pt][0pt]{\csname the#1\endcsname}}%
		\hspace*{-1.5pt}% This horizontal space aligns the first section letter with the typeblock border
	}%
}%
\newcommand\section@cntformat{}

\makeatother

\ifySubsectionNumbering
	\setsecnumdepth{subsection}
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page style
\renewcommand{\chaptermark}[1]{\markboth{#1}{}} % change leftmark so that it only contains chapter name
\makepagestyle{yMemoir}
\ifyHeaders
	\makeoddhead{yMemoir}{}{}{\textit{\runauthor}, \leftmark\ \& \inColor{\textsc{\runtitle}}}
	\makeevenhead{yMemoir}{\inColor{\textsc{\runtitle}} \& \leftmark, \textit{\runauthor}}{}{}
\fi
\makeevenfoot{yMemoir}{}{\thepage}{}
\makeoddfoot{yMemoir}{}{\thepage}{}
\makerunningwidth{yMemoir}[17.3cm]{17.3cm} % style footwidth headwidth	16.25cm = 21cm - 2.375cm - 1.325cm = pagewidth - innermargin - outermargin
\makeheadposition{yMemoir}{flushright}{flushleft}{flushright}{flushleft} % eheadpos oheadpos efootpos ofootpos

% Empty part page style
\aliaspagestyle{part}{empty}

\pagestyle{yMemoir}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{arrows}
\usetikzlibrary{shapes}

\newlength{\bigVerticalLineWidth}
\setlength{\bigVerticalLineWidth}{\paperwidth}
\addtolength{\bigVerticalLineWidth}{-\spinemargin}
\addtolength{\bigVerticalLineWidth}{-\textwidth}

\newlength{\bigVerticalLinePartOfMarginParSep}
\setlength{\bigVerticalLinePartOfMarginParSep}{\marginparsep/4}
\setlength{\bigVerticalLinePartOfMarginParSep}{3\bigVerticalLinePartOfMarginParSep}

\addtolength{\bigVerticalLineWidth}{-\bigVerticalLinePartOfMarginParSep}

\newcommand{\backgroundThisPageColor}{\bigVerticalLine{mainColor}}
\newcommand{\bigVerticalLine}[1]{
	\strictpagechecktrue
	\checkoddpage
	\ifoddpage%
		\begin{tikzpicture}[remember picture, overlay]
		\fill[fill=#1] (current page.south east) rectangle ++(-\bigVerticalLineWidth, \paperheight);
		\end{tikzpicture}
	\else%
		\begin{tikzpicture}[remember picture, overlay]
		\fill[fill=#1] (current page.south west) rectangle ++(\bigVerticalLineWidth, \paperheight);
		\end{tikzpicture}
	\fi%
}

\newcommand{\backgroundThisPageGrey}{\bigVerticalLine{bigVerticalLineGrey}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\yBigColoredTitle}[1]{\inColor{\fontsize{1.3cm}{1.56cm}\selectfont #1}}
\newcommand{\yArticleTitle}[3]{%
	\thispagestyle{empty}%
	\begin{minipage}[t]{\widthof{\yBigColoredTitle{#1}}}%
		{\fontsize{.6cm}{.66cm}\selectfont\color{mainColor}%
			#2%
		}\\[2mm]%
		\yBigColoredTitle{#1}\\[-5mm]%
		\begin{FlushRight}%
			#3%
		\end{FlushRight}%
	\end{minipage}%
	\title{#1}%
	\vspace*{2cm}
}
\newcommand{\yTitle}[3]{%
	\symmetricalPage
	\yArticleTitle{#1}{#2}{#3}
	\clearpage
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
	\setlength{\topsep}{\onelineskip} % amount of extra vertical space at top of list
	\setlength{\partopsep}{0pt} % extra length at top if environment is preceded by a blank line (it should be a rubber length)
	\setlength{\parsep}{\onelineskip} % amount of vertical space between paragraphs within an item
	\setlength{\itemsep}{-\onelineskip} % amount of extra vertical space between items
	\setlength{\leftmargin}{1cm} % horizontal distance between the left margins of the environment and the list; must be nonnegative
	\setlength{\rightmargin}{0cm} % horizontal distance betwen the right margins of the enviroment and the list; must be nonnegative
	\setlength{\itemindent}{0pt} % indentation of first line of an item; can be negative
	\setlength{\labelsep}{2mm} % separation between end of the box containing the label and the text of the first line of an item
}

% Enumeratable list
\newenvironment{enum}{%
	\begin{list}{
			\ifyColorBullet
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
			\ifyColorBullet
				\color{mainColor}
			\fi
			\ifyFrenchBullet
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
}}{\end{list}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Quotation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand{\blockQuote}{o m}{
	\vskip \baselineskip
	\hfill\begin{minipage}{.92\linewidth}
		\mbox{}%
		\setlength{\parindent}{0pt}%
		\setlength{\parskip}{\onelineskip}%
		\llap{
			\raisebox{-.5cm}[0mm][0mm]{
				\fontspec{Fira Sans Bold}\fontsize{6em}{7.2em}\selectfont%
				\color{middleGrey}%
				<<\hspace*{-4.5mm}%
			}}{\itshape#2}
		\IfValueT{#1}{
			\setlength{\parskip}{\onelineskip/2}%
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
	\marginelement{
		\llap{
			\raisebox{-.5cm}[0mm][0mm]{
				\fontspec{Fira Sans Bold}\fontsize{6em}{7.2em}\selectfont%
				\color{middleGrey}%
				<<\hspace*{-4.5mm}%
		}}{\itshape#2}
		\IfValueT{#1}{
			\setlength{\parskip}{\onelineskip/2}%
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
		\llap{
			\raisebox{-.5cm}[0mm][0mm]{
				\fontspec{Fira Sans Bold}\fontsize{6em}{7.2em}\selectfont%
				\color{middleGrey}%
				<<\hspace*{-4.5mm}%
		}}{\itshape#2}
		\IfValueT{#1}{
			\setlength{\parskip}{\onelineskip/2}%
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
\captionsetup[figure]{justification=RaggedRight, singlelinecheck=false}
\captionsetup[table]{justification=RaggedRight,	singlelinecheck=false, position=bottom}

\DeclareCaptionJustification{raggedouter}{\raggedouter}
\captionsetup[SCtable]{justification=raggedouter, singlelinecheck=false}
\captionsetup[SCfigure]{justification=raggedouter, singlelinecheck=false}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{marginnote}

% The mark on the sidenote
\newcommand{\sidemark}[1]{#1.{\:}}

\newcommand{\marginelement}[2][0]{%
	\marginnote{%
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\RaggedRight\footnotesize%
		\else%
		\RaggedLeft\footnotesize%
		\fi%
		#2%
	}[#1\onelineskip]%
}%

\newcommand{\sidenote}[2][0]{%
	\footnotemark%
	\ignorespaces%
	\marginelement[#1]{%
		\sidemark{\thefootnote}%
		\ignorespaces#2%
	}%
	\unskip%
}%

\RequirePackage{mparhack}
% Sidetable (have to use marginpar since tabular doesn't work with marginnote)
\makeatletter
\newcommand{\sidetable}[3][]{% caption listEntry table
	\marginpar{%
		\strictpagechecktrue%
		\checkoddpage%
		\ifoddpage%
		\captionsetup[table]{font={footnotesize},%
			justification=RaggedRight,%
			singlelinecheck=false}%
		\justifying\footnotesize%
		\else%
		\captionsetup[table]{font={footnotesize},%
			justification=RaggedLeft,%
			singlelinecheck=false}%
		\RaggedLeft\footnotesize%
		\fi%
		\@afterindentfalse\@afterheading
		\vspace*{6mm} % compensate the table space added above the first line by the gape command
		#3
		\captionof{table}[#1]{#2}
		
	}
}	

% Sidefigure
\newcommand{\sidefigure}[3][]{%
	\marginelement{%
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\captionsetup[figure]{font={footnotesize},%
			justification=RaggedRight,%
			singlelinecheck=false}
		\RaggedRight
		\else
		\captionsetup[figure]{font={footnotesize},%
			justification=RaggedLeft,%
			singlelinecheck=false}
		\RaggedLeft
		\fi
		\@afterindentfalse\@afterheading
		#3
		\captionof{figure}[#1]{#2}
	}
}
\makeatother



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Full width environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{whole}{%
	\centering
	\strictpagechecktrue
	\begin{adjustwidth*}{0em}{-\wholemargin}
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

\newlength{\foreminusspine}
\setlength{\foreminusspine}{\foremargin}
\addtolength{\foreminusspine}{-\spinemargin}

% Centered environment
\newenvironment{centered}{%
	\begin{adjustwidth*}{0em}{-\foreminusspine}
		\centering
	}{%
\end{adjustwidth*}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		End-of-chapter ornament
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\DeclareDocumentCommand{\yOrnamentTwoTop}{O{} O{}}{
	\begin{center}
		\yOrnamentTwoSkeleton{#1}{#2}{1}
	\end{center}
}

\DeclareDocumentCommand{\yOrnamentTwoBottom}{O{} O{}}{
	\begin{center}
		\yOrnamentTwoSkeleton{#1}{#2}{-1}
	\end{center}
}

\DeclareDocumentCommand{\yOrnamentTwoSkeleton}{m m m}{ % tikzpictureArgument drawArgument verticalMultiplicxationFactor
	\begin{tikzpicture}[inner sep=0mm, #1]
	\draw[mainColor, ultra thick, #2] (-3.5, 0) -- (-2.5, 0) -- (-2, #3*.5) -- (-1.5, 0) -- (-.5, 0) -- (.5, #3*1) -- (0, #3*1.5) -- (-.5, #3*1) -- (.5, 0) -- (1.5, 0) -- (2, #3*.5) -- (2.5, 0) -- (3.5, 0);
	\end{tikzpicture}
}


\DeclareDocumentCommand{\yOrnamentOneTop}{O{} O{}}{
	\begin{center}
		\yOrnamentOneSkeleton{#1}{#2}{1}
	\end{center}
}

\DeclareDocumentCommand{\yOrnamentOneBottom}{O{} O{}}{
	\begin{center}
		\yOrnamentOneSkeleton{#1}{#2}{-1}
	\end{center}
}

\DeclareDocumentCommand{\yOrnamentOneSkeleton}{m m m}{ % tikzpictureArgument drawArgument verticalMultiplicxationFactor
	\begin{tikzpicture}[inner sep=0mm, #1]
	\draw[mainColor, ultra thick, #2] (-3, 0) -- (-1.5, 0) -- (-1, #3*.5) -- (-.5, 0) -- (.5, #3*1) -- (0, #3*1.5) -- (-.5, #3*1) -- (.5, 0) -- (1, #3*.5) -- (1.5, 0) -- (3, 0);
	\end{tikzpicture}
}

\newcommand{\yEndOfChapter}{\yOrnamentOneBottom}
