% !Mode:: "TeX:UTF-8"


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%																			   %
%																			   %
%									RVTM Class								   %
%																			   %
%																			   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Copyright Harvey Sheppard 2017
%-------------------------------------------------------------------------------

% This work is distributed under the Creative Common 3.0 NC-BY-SA licence
%-------------------------------------------------------------------------------


\ProvidesClass{RVTM}[2017/07/07 A class that tries to provide beautiful typos in simple commands]

\NeedsTeXFormat{LaTeX2e}

\ifx\directlua\@undefined%
	\ClassError{RVTM}{For this class to work, please compile it with LuaLaTeX.}{}
\stop\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% All options passed to the rvtm class are passed to the report class
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{report}
}

\ProcessOptions\relax



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic Global Settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper, openright, twoside, 12pt]{report}

% Checks that no deprecated commands are used
\RequirePackage[l2tabu, orthodox]{nag}

% Adds system font support to the document, requires XeTeX (or XeLaTeX or LuaLaTeX)
\RequirePackage{fontspec}

% Loads language support
\RequirePackage{polyglossia}

% Loads functionnalities required for the key value interface of rvtm
\RequirePackage{pgfkeys}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Needed packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LaTeX packages
%-------------------------------------------------------------------------------
% Main Package that provide easy interfaces for a lot of other packages
\RequirePackage{interfaces}
% Package/Class Creation
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
% Calculations
\RequirePackage{calc}
% Colors
\RequirePackage{xcolor}
% Translation handling
\RequirePackage{translations}
% Custom Lists
\RequirePackage{tocloft}
% Sectionning Commands Customization
\RequirePackage{titlesec}
% Table of Contents Customization
\RequirePackage{titletoc}
% hyperreferences
\RequirePackage[unicode]{hyperref}
% Bookmark Generation
\RequirePackage{bookmark}
% Headers
\RequirePackage{fancyhdr}
% Margin Content
\RequirePackage{marginfix}
% Alignement
\RequirePackage{ragged2e}
% Microtypography
\RequirePackage[final]{microtype}
% Images
\RequirePackage{graphicx}
% Quoting
\RequirePackage[autostyle=true]{csquotes}
%Spacing
\RequirePackage{setspace}
% Counter Display
\RequirePackage{fmtcount}
% More Counters
\RequirePackage{totcount}
% Minipages that have the width of their content
\RequirePackage{varwidth}
% Check odd and even pages
\RequirePackage{changepage}
% Fonts
\usepackage{fontawesome}
% TikZ
\RequirePackage{tikz}
% Provide \pgfplotsforeachungrouped
\RequirePackage{pgfplots}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{fit}
\usetikzlibrary{patterns}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}
\usetikzlibrary{fadings}
\usetikzlibrary{shadows}
\usetikzlibrary{shadows.blur}
% Multicolumns
\RequirePackage{multicol}
% Captions at the beginnings of chapters
\RequirePackage{epigraph}

% Custome packages
%-------------------------------------------------------------------------------

%! Those packages can all be downloaded from www.github.com/HarveySheppard/yLaTeX
\RequirePackage{yMarginDesign}
\RequirePackage{yMainColor}
\RequirePackage{yPrintImageToArea}
\RequirePackage{yCards}
\RequirePackage{yBanner}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfkeys{/rvtm/.is family}

\DeclareDocumentCommand{\rvtmConfiguration}{m}{\pgfkeys{/rvtm/.cd,#1}}

% Language Options
%-------------------------------------------------------------------------------
\pgfkeys{%
	% Language option
	/rvtm/language/.code = \setdefaultlanguage{#1},
	/rvtm/language/.value required,
	/rvtm/language = english,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\clubpenalty=2000 %penalty for breaking after the first line of a par
\widowpenalty=2000 %penalty for breaking before the last line of a par
\brokenpenalty=700 %penalty for page breaking after hyphenated line
\tolerance=500 %Allow LaTeX to break lines too often. It prevents line for overflowing in the margins
\finalhyphendemerits=5000 % Demerit added when the penultimate line of a par is hyphenated
\doublehyphendemerits=10000 % Demerit added when two consecutive lines are hyphenated



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Global Lengths
%-------------------------------------------------------------------------------
\RequirePackage[
%	showframe,
	a4paper,
	twoside,
	top=45mm,
	bottom=45mm,
	inner=45mm,
	outer=45mm,
	ignorehead,
	ignorefoot,
	ignoremp,
	nomarginpar,
	headsep=1.5\baselineskip,
	footskip=5\baselineskip,
	headheight=15pt,
]{geometry}

\setlength{\columnsep}{8mm}
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}

% Alternative Layouts
%-------------------------------------------------------------------------------

\DeclareDocumentCommand{\smallmarginlayout}{}{%
	\newgeometry{
		top=25mm,
		bottom=25mm,
		inner=25mm,
		outer=25mm,
		ignorehead,
		ignorefoot,
		nomarginpar,
	}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Lengths
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\innerMargin}
\setlength{\innerMargin}{1in + \oddsidemargin}

\newlength{\outerMargin}
\setlength{\outerMargin}{1in + \hoffset + \evensidemargin}

\setlength{\columnsep}{7mm}
\setlength{\multicolsep}{0mm}

\newlength{\rvtm@temp@a@length}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Global Fonts and Font Settings
%-------------------------------------------------------------------------------
\defaultfontfeatures{Ligatures=TeX}

%? Is the french spacing option needed all the time or only for french documents or not at all?
\frenchspacing

% Configuring the default features for Junicode (the main font of the document)
\defaultfontfeatures[Junicode]{
	Numbers = OldStyle,
	WordSpace = .75,
	Contextuals = {Alternate, WordFinal},
	Fractions = On,
	Ligatures = {Common, Rare},
}

% Serif Font (default font)
\setmainfont{Junicode}

% Source Code Font
\setmonofont{Source Code Pro}

% Sans Font
\setsansfont{Fira Sans}[%
Numbers=OldStyle,%
BoldFont=Fira Sans Medium,
]

% Special Fonts
%-------------------------------------------------------------------------------
\newfontface{\geometricslim}{Slim Joe}
\newfontface{\geometricbold}{Big John}
\newfontface{\highcontrastfont}{Playfair Display Bold}
\newcommand{\quotationfont}{\highcontrastfont}
\newcommand{\chapterfont}{\highcontrastfont}
\newfontface{\rvtmtocchapterpagefont}{Quicksand Light}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Utilities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentCommand{\emaillink}{m}{%
	{\hypersetup{urlcolor=black}\href{mailto:#1}{#1}}%
}

% Found at http://tex.stackexchange.com/questions/11707/how-to-force-output-to-a-left-or-right-page
\DeclareDocumentCommand{\clearToLeftPage}{}{%
	\clearpage%
	\ifodd\value{page}\hbox{}\newpage\fi%
}

\newcommand{\noHyphen}{\hyphenpenalty10000\exhyphenpenalty10000\righthyphenmin62\lefthyphenmin62\tolerance=1\emergencystretch=\maxdimen\hbadness=10000}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfkeys{
	/rvtm/footer/.cd,
	page number shape/line width/.store as dimen,
	page number shape/line width = 1pt,
}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{{\itshape\chaptername\ \thechapter}, #1}{}}
\fancypagestyle{rvtm}{
	\fancyhf{}
	\fancyhead[RO]{{\renewcommand{\\}{ }\leftmark}}
	\fancyhead[LE]{\textsc{\@title}}
	\fancyfoot[C]{%
		\begin{tikzpicture}
		\node [
		circle,
		draw,
		line width=\pgfkeysvalueof{/rvtm/footer/page number shape/line width},
		] {\thepage};
		\end{tikzpicture}
	}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhfoffset[L, R]{0pt}
}
\fancypagestyle{rvtmfooteronly}{
	\fancyhf{}
	\fancyfoot[C]{%
		\begin{tikzpicture}
			\node [
				circle,
				draw,
				line width=\pgfkeysvalueof{/rvtm/footer/page number shape/line width},
			] {\thepage};
		\end{tikzpicture}
	}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
	\fancyhfoffset[L, R]{0pt}
}
\pagestyle{rvtm}
\assignpagestyle{\chapter}{rvtmfooteronly}
\assignpagestyle{\part}{rvtmfooteronly}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Layers
%-------------------------------------------------------------------------------
% Declare Background Layer
\pgfdeclarelayer{bg}
% Set the Order of the Layers (main is the standard layer)
\pgfsetlayers{bg,main}

% Commands to draw hexagons
%-------------------------------------------------------------------------------
\DeclareDocumentCommand{\hexagon}{O{Black} m m O{}}{
	\fill [#1, #4] ($ (#2) + (0:#3) $) -- ($ (#2) + (60:#3) $) -- ($ (#2) + (120:#3) $) -- ($ (#2) + (180:#3) $) -- ($ (#2) + (240:#3) $) -- ($ (#2) + (300:#3) $) -- cycle;
}

% Random seed
%-------------------------------------------------------------------------------

\pgfmathsetseed{\directlua{tex.print(tostring(os.time()))}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Style Declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentCommand{\rvtmnewstyle}{m m}{%
	\pgfkeys{%
		/rvtm/#1/.style={/rvtm/.cd,#2}%
	}%
}

\DeclareDocumentCommand{\rvtmapptostyle}{m m}{%
	\pgfkeys{
		/rvtm/#1/.append style = {#2}
	}%
}

\DeclareDocumentCommand{\rvtmapplystyle}{m}{%
	\pgfkeys{/rvtm/#1}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yBanner Default Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ybannernewstyle{rvtm}{
	color=darkGrey,
	inner sep=5mm,
	additional horizontal space=6mm,
	endings/outer width=1.5cm,
}
\ybannerapplystyle{rvtm}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Hyper-references
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={0 0 0},
	pdfcreator=LaTeX,
	colorlinks=true,
	linkcolor=black,
	linktoc=all,
	urlcolor=black,
	citecolor=black,
	filecolor=black,
	breaklinks
}
\RequirePackage{memhfixc} %fix some problem with hyperref

% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
	\do\)\do\,\do\?\do\'\do+\do\=\do\#\do-}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Chapters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfkeys{
	/rvtm/chapters/.cd,
	fontsize/.store as dimen,
	fontsize = 1.5cm,
	line length/.store as dimen,
	line length = \linewidth,
	line width/.store as dimen,
	line width=2pt,
	space between text and line/.store as dimen,
	space between text and line=2mm,
}
\pgfkeys{
	/rvtm/chapters/.cd,
	fontsize skip/.store as dimen,
	fontsize skip = 1.2\pgfkeysvalueof{/rvtm/chapters/fontsize},
}

% Chapter Text Font
\DeclareDocumentCommand{\@chapterTextFormating}{m}{%
	\begin{tikzpicture}
		\node[
			font=\fontsize{\pgfkeysvalueof{/rvtm/chapters/fontsize}}{\pgfkeysvalueof{/rvtm/chapters/fontsize skip}}\chapterfont\selectfont,
			text width=\textwidth,
			align=center,
		] (chaptertext) {\noHyphen#1};
		\draw[line width=\pgfkeysvalueof{/rvtm/chapters/line width}] ($(chaptertext.north) + (-.5*\pgfkeysvalueof{/rvtm/chapters/line length}, \pgfkeysvalueof{/rvtm/chapters/space between text and line})$) -- ($(chaptertext.north) + (.5*\pgfkeysvalueof{/rvtm/chapters/line length}, \pgfkeysvalueof{/rvtm/chapters/space between text and line})$);
		\draw[line width=\pgfkeysvalueof{/rvtm/chapters/line width}] ($(chaptertext.south) + (-.5*\pgfkeysvalueof{/rvtm/chapters/line length}, -\pgfkeysvalueof{/rvtm/chapters/space between text and line})$) -- ($(chaptertext.south) + (.5*\pgfkeysvalueof{/rvtm/chapters/line length}, -\pgfkeysvalueof{/rvtm/chapters/space between text and line})$);
	\end{tikzpicture}
}

\titleformat{\chapter}[block]
{} % format
{} % label
{0mm} % sep
{% code before
	\@chapterTextFormating%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Epigraphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfkeys{
	/rvtm/epigraph/.cd,
	width/.code = {\setlength{\epigraphwidth}{#1}},
	width=.75\textwidth,
}

\setlength{\epigraphrule}{0pt}

\renewcommand{\epigraphflush}{center}
\renewcommand{\textflush}{center}

\DeclareDocumentCommand{\rvtmepigraph}{m O{}}{%
	\epigraph{\enquote{\itshape#1}}{\vspace{3mm}---\ #2}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Table Of Content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\regtotcounter{chapter}

\pgfkeys{
	/rvtm/toc/.cd,
	left column width/.store as dimen,
	left column width=.5\textwidth,
	right column width/.store as dimen,
	right column width=.45\paperwidth,
}
\pgfkeys{
	/rvtm/toc/title/.cd,
	fontsize/.store as dimen,
	fontsize = 1.5cm,
	font/.code = {\geometricslim\addfontfeatures{LetterSpace=-10.0}},
	translation string/.code = {\GetTranslation{Overview}},
	bar thickness/.store as dimen,
	bar thickness=3mm,
	bar length/.store as dimen,
	bar length=.8\linewidth,
}
\pgfkeys{
	/rvtm/toc/chapter label/.cd,
	fontsize/.store as dimen,
	fontsize=5mm,
	color/.store as color,
	color=darkGrey,
	font/.initial = {\itshape},
}
\pgfkeys{
	/rvtm/toc/chapter text/.cd,
	fontsize/.store as dimen,
	fontsize=5mm,
	color/.store as color,
	color=middleGrey,
	font/.initial = {\geometricbold\bfseries},
}

\definecolor{rvtmtoccolor}{RGB}{206, 179, 28}

% Default page number fontsize (randomized afterwards)
\newlength{\@rvtm@toc@chapter@page@fontsize}
\newtoggle{@rvtm@toc@print@chapter@number@right}
\togglefalse{@rvtm@toc@print@chapter@number@right}
\newlength{\@rvtm@toc@leftorrightxshift}
% Used to compute the height of the next page number fontsize
\newlength{\@rvtm@toc@chapter@page@space@left}
\setlength{\@rvtm@toc@chapter@page@space@left}{1.5\paperheight}
\newtoggle{rvtmtoccustomchapterpagelineentryangle}
\togglefalse{rvtmtoccustomchapterpagelineentryangle}
\newtoggle{rvtmtocchapterpagecomputingfirstentry}
\toggletrue{rvtmtocchapterpagecomputingfirstentry}
\pgfmathsetmacro{\@rvtm@toc@chapter@page@last@computed@line@angle}{0}
\pgfmathsetmacro{\@rvtm@toc@chapter@page@first@line@angle}{0}
\pgfmathsetmacro{\@rvtm@toc@chapter@page@optimal@angular@distance}{0}
\newlength{\@rvtm@toc@chapter@page@line@begin@x}
\newlength{\@rvtm@toc@chapter@page@line@begin@y}
\newlength{\@rvtm@toc@chapter@page@line@end@south@west@y}
\newlength{\@rvtm@toc@chapter@page@line@end@south@east@y}
\newlength{\@rvtm@toc@chapter@page@line@end@north@west@y}
\newlength{\@rvtm@toc@chapter@page@line@end@north@east@y}
\newlength{\@rvtm@toc@chapter@page@line@end@x}
\newlength{\@rvtm@toc@chapter@page@line@end@y}
\newlength{\@rvtm@toc@chapter@page@line@radius}
\newlength{\@rvtm@toc@chapter@page@line@length@x}

\pgfkeys{
	/rvtm/toc/chapter page/.cd,
	color/.store as color,
	color=rvtmtoccolor,
	yshift/.store as dimen,
	yshift=10mm,
	xshift/.store as dimen,
	xshift=5mm,
	initial yshift/.store as dimen,
	initial yshift=7mm,
	line width/.store as dimen,
	line width=2pt,
	distance from chapter text to line/.store as dimen,
	distance from chapter text to line = 5mm,
	font/.code = {\rvtmtocchapterpagefont\addfontfeatures{LetterSpace=-15.0}},
}

\pgfmathsetlength{\@rvtm@toc@chapter@page@fontsize}{1.3*(\paperheight/(\totvalue{chapter}))+\pgfkeysvalueof{/rvtm/toc/chapter page/yshift}/2}

\AtBeginDocument{
	\pgfplotsforeachungrouped \x in {1,2,...,\totvalue{chapter}}{%
		\expandafter\newlength\csname @rvtm@toc@chapter@page@\x @fontsize\endcsname%
		\expandafter\setlength\csname @rvtm@toc@chapter@page@\x @fontsize\endcsname{2cm}%
		\expandafter\newlength\csname @rvtm@toc@chapter@page@\x @xshift\endcsname%
		\expandafter\setlength\csname @rvtm@toc@chapter@page@\x @xshift\endcsname{0cm}%
		\expandafter\newlength\csname @rvtm@toc@chapter@page@\x @yshift\endcsname%
		\expandafter\setlength\csname @rvtm@toc@chapter@page@\x @yshift\endcsname{0cm}%
		\expandafter\pgfmathsetmacro\csname @rvtm@toc@chapter@page@\x @line@end@xshift\endcsname{.1}%
		\expandafter\pgfmathsetmacro\csname @rvtm@toc@chapter@page@\x @line@end@angle\endcsname{180}
	}
	
	\pgfplotsforeachungrouped \x in {1,2,...,\totvalue{chapter}}{%
		\pgfmathsetlength{\csname @rvtm@toc@chapter@page@\x @fontsize\endcsname}{%
			min(
				mod(\x,2) == 1 ? (rand*.4 + 1)*(1/(\totvalue{chapter} - \x + 1))*\@rvtm@toc@chapter@page@space@left : (rand*.4 + 1.1)*(1/(\totvalue{chapter} - \x + 1))*\@rvtm@toc@chapter@page@space@left,%
				\paperheight*2/5
			)	
			}%
		\pgfmathsetlength{\csname @rvtm@toc@chapter@page@\x @xshift\endcsname}{rand*\pgfkeysvalueof{/rvtm/toc/chapter page/xshift}}%
		\pgfmathsetlength{\csname @rvtm@toc@chapter@page@\x @yshift\endcsname}{rnd*\pgfkeysvalueof{/rvtm/toc/chapter page/yshift}}%
		\addtolength{\@rvtm@toc@chapter@page@space@left}{-\csuse{@rvtm@toc@chapter@page@\x @fontsize}}
		\addtolength{\@rvtm@toc@chapter@page@space@left}{\csuse{@rvtm@toc@chapter@page@\x @yshift}}
	}
}

\DeclareDocumentCommand{\rvtmtoctitle}{}{%
	\begingroup%
	\pgfkeys{/rvtm/toc/title/font}%
	\fontsize{\pgfkeysvalueof{/rvtm/toc/title/fontsize}}{1.2\pgfkeysvalueof{/rvtm/toc/title/fontsize}}\selectfont%
	\pgfkeys{/rvtm/toc/title/translation string}%
	\endgroup%
}

\DeclareDocumentCommand{\rvtmtocbar}{}{%
	\rule{\pgfkeysvalueof{/rvtm/toc/title/bar length}}{\pgfkeysvalueof{/rvtm/toc/title/bar thickness}}
}

\DeclareDocumentCommand{\rvtmtoc}{}{%
	\smallmarginlayout%
	\begingroup%
	\contentsmargin{0mm}%
	% remove hyphenation in titles
	\noHyphen%
	% Allow to draw on the table of content page, other wise blank pages are added between the ToC and the big vertical line
	\let\clearpage\relax%
	\let\cleardoublepage\relax%
	% Only show chapter (and part) in the toc
	\setcounter{tocdepth}{0}%
	\begin{tikzpicture}[remember picture, overlay]
		\coordinate[yshift=-\pgfkeysvalueof{/rvtm/toc/chapter page/initial yshift}] (@rvtm@toc@previous@page) at (current page.north east);
	\end{tikzpicture}
	% Print the ToC
	\null\vfill%
	\begin{minipage}{\pgfkeysvalueof{/rvtm/toc/left column width}}%
		\begin{center}%
			\noindent\rvtmtoctitle\\[3mm]%
			\noindent\rvtmtocbar\\[5mm]%
			\@starttoc{toc}%
			\vspace*{5mm}%
			\noindent\rvtmtocbar%
		\end{center}
	\end{minipage}
	\vfill\vfill\null%
	\endgroup%
	\restoregeometry%
}

\DeclareDocumentCommand{\formatchapterentry}{m}{%
	\null\hfill\begin{tikzpicture}[remember picture,]
		\node[
			anchor=south,
			font=\pgfkeysvalueof{/rvtm/toc/chapter label/font}\fontsize{\pgfkeysvalueof{/rvtm/toc/chapter label/fontsize}}{1.2\pgfkeysvalueof{/rvtm/toc/chapter label/fontsize}}\selectfont,
			align=center,
			text=\pgfkeysvalueof{/rvtm/toc/chapter label/color},
		] at (0,0) {\chaptertitlename\ \thecontentslabel};
		\node[
			anchor=north,
			font=\pgfkeysvalueof{/rvtm/toc/chapter text/font}\fontsize{\pgfkeysvalueof{/rvtm/toc/chapter text/fontsize}}{1.2\pgfkeysvalueof{/rvtm/toc/chapter text/fontsize}}\selectfont,
			align=center,
			text=\pgfkeysvalueof{/rvtm/toc/chapter text/color},
		] (chaptertext) at (0,0) {%
			\begin{varwidth}{\pgfkeysvalueof{/rvtm/toc/title/bar length}}%
				\center%
				#1%
			\end{varwidth}};
	\end{tikzpicture}\hfill\null%
	\begingroup%
	\begin{tikzpicture}[remember picture, overlay, inner sep=0mm, node distance=0mm, outer sep=0mm]
		% Print the number left or right in the chapter page column?
		\iftoggle{@rvtm@toc@print@chapter@number@right}{%
			\newcommand{\anchor}{north east}
			\setlength{\@rvtm@toc@leftorrightxshift}{0mm}
		}{
			\newcommand{\anchor}{north west}
			\setlength{\@rvtm@toc@leftorrightxshift}{-\pgfkeysvalueof{/rvtm/toc/right column width}}
		}
		% Print the number
		\path let
			\p1=(@rvtm@toc@previous@page.south),
			\p2=(current page.east) in
		node [
			anchor=\anchor,
			font=\fontsize{\csuse{@rvtm@toc@chapter@page@\thecontentslabel @fontsize}}{1.2\csuse{@rvtm@toc@chapter@page@\thecontentslabel @fontsize}}\selectfont\pgfkeys{/rvtm/toc/chapter page/font},
			xshift=\the\csuse{@rvtm@toc@chapter@page@\thecontentslabel @xshift},
			yshift=\the\csuse{@rvtm@toc@chapter@page@\thecontentslabel @yshift},
		] (@rvtm@toc@previous@page) at ($(\x2, \y1) + (\@rvtm@toc@leftorrightxshift,0mm)$) {\hypersetup{linkcolor=\pgfkeysvalueof{/rvtm/toc/chapter page/color}}\thecontentspage};
		% Compute next line entry angle so that all lines have almost the same angular difference between neighbors lines.
		\coordinate (rvtmtoccurrententrylinebegin) at ($(chaptertext.east) + (\pgfkeysvalueof{/rvtm/toc/chapter page/distance from chapter text to line},0)$);
		\iftoggle{rvtmtoccustomchapterpagelineentryangle}{%
			\pgfmathsetmacro{\angle}{\csuse{@rvtm@toc@chapter@page@\thecontentslabel @line@end@angle}}
		}{%
%			\typeout{************************************************}
%			\typeout{yChapter \thecontentslabel}
			\pgfextractx{\@rvtm@toc@chapter@page@line@begin@x}{\pgfpointanchor{rvtmtoccurrententrylinebegin}{center}}
			\pgfextracty{\@rvtm@toc@chapter@page@line@begin@y}{\pgfpointanchor{rvtmtoccurrententrylinebegin}{center}}
			\pgfextractx{\@rvtm@toc@chapter@page@line@end@x}{\pgfpointanchor{@rvtm@toc@previous@page}{west}}
			\pgfmathsetlength{\@rvtm@toc@chapter@page@line@length@x}{%
					\@rvtm@toc@chapter@page@line@end@x - \@rvtm@toc@chapter@page@line@begin@x%
			}
%			\typeout{X-Length: \the\@rvtm@toc@chapter@page@line@length@x}
			\iftoggle{rvtmtocchapterpagecomputingfirstentry}{%
				% For the first point, we anchor the end of the line at the west coordinate of the number.
				\pgfextracty{\@rvtm@toc@chapter@page@line@end@y}{\pgfpointanchor{@rvtm@toc@previous@page}{west}}
				\pgfmathsetmacro{\@rvtm@toc@chapter@page@last@computed@line@angle}{%
					atan(%
						(\@rvtm@toc@chapter@page@line@end@y - \@rvtm@toc@chapter@page@line@begin@y)
						/
						(\@rvtm@toc@chapter@page@line@length@x)
					)%
				}
				\global\let\@rvtm@toc@chapter@page@first@line@angle\@rvtm@toc@chapter@page@last@computed@line@angle
				\pgfmathparse{2*\@rvtm@toc@chapter@page@first@line@angle / (\totvalue{chapter} - 1)}
				\global\let\@rvtm@toc@chapter@page@optimal@angular@distance\pgfmathresult
				\global\togglefalse{rvtmtocchapterpagecomputingfirstentry}
%				\typeout{Computing first entry!}
			}{%
				\pgfextracty{\@rvtm@toc@chapter@page@line@end@north@west@y}{\pgfpointanchor{@rvtm@toc@previous@page}{north west}}
				\pgfextracty{\@rvtm@toc@chapter@page@line@end@south@west@y}{\pgfpointanchor{@rvtm@toc@previous@page}{south west}}
				\pgfextracty{\@rvtm@toc@chapter@page@line@end@north@east@y}{\pgfpointanchor{@rvtm@toc@previous@page}{north east}}
				\pgfextracty{\@rvtm@toc@chapter@page@line@end@south@east@y}{\pgfpointanchor{@rvtm@toc@previous@page}{south east}}
				\pgfmathsetmacro{\@rvtm@toc@chapter@page@min@angle}{%
					min (
						atan( (\@rvtm@toc@chapter@page@line@end@south@west@y - \@rvtm@toc@chapter@page@line@begin@y) / (\@rvtm@toc@chapter@page@line@length@x) )%
					,%
						atan( (\@rvtm@toc@chapter@page@line@end@south@east@y - \@rvtm@toc@chapter@page@line@begin@y) / (\@rvtm@toc@chapter@page@line@length@x) )%
					)
				}
				\pgfmathsetmacro{\@rvtm@toc@chapter@page@max@angle}{%
					max (%
						atan((\@rvtm@toc@chapter@page@line@end@north@west@y - \@rvtm@toc@chapter@page@line@begin@y) / (\@rvtm@toc@chapter@page@line@length@x))%
					,%
						atan((\@rvtm@toc@chapter@page@line@end@north@east@y - \@rvtm@toc@chapter@page@line@begin@y) / (\@rvtm@toc@chapter@page@line@length@x))%
					)
				}
				\pgfmathsetmacro{\@rvtm@toc@chapter@page@optimal@angle}{%
					\@rvtm@toc@chapter@page@first@line@angle - \@rvtm@toc@chapter@page@optimal@angular@distance * (\thecontentslabel - 1)
				}
				\pgfmathsetmacro{\@rvtm@toc@chapter@page@last@computed@line@angle}{%
					max( \@rvtm@toc@chapter@page@min@angle , min( \@rvtm@toc@chapter@page@max@angle , \@rvtm@toc@chapter@page@optimal@angle ) )
				}
%				\typeout{First line angle: \@rvtm@toc@chapter@page@first@line@angle}
%				\typeout{Optimal angular distance: \@rvtm@toc@chapter@page@optimal@angular@distance}
%				\typeout{Max angle: \@rvtm@toc@chapter@page@max@angle}
%				\typeout{Min angle: \@rvtm@toc@chapter@page@min@angle}
%				\typeout{Optimal angle: \@rvtm@toc@chapter@page@optimal@angle}
%				\typeout{Selected angle: \@rvtm@toc@chapter@page@last@computed@line@angle}
			}
			\pgfmathsetlength{\@rvtm@toc@chapter@page@line@radius}{ (\@rvtm@toc@chapter@page@line@length@x) / cos (\@rvtm@toc@chapter@page@last@computed@line@angle)}
		}
		% Draw the line between the chapter entry in the toC and the chapter page, trying to have the same angular distance between all lines.
		\setlength{\rvtm@temp@a@length}{\csuse{@rvtm@toc@chapter@page@\thecontentslabel @line@end@xshift}\csuse{@rvtm@toc@chapter@page@\thecontentslabel @fontsize}}
		\draw [
			\pgfkeysvalueof{/rvtm/toc/chapter page/color},
			line width=\pgfkeysvalueof{/rvtm/toc/chapter page/line width}
		] (rvtmtoccurrententrylinebegin) -- +(%
			[xshift=\rvtm@temp@a@length]
			\@rvtm@toc@chapter@page@last@computed@line@angle:\@rvtm@toc@chapter@page@line@radius);
	\end{tikzpicture}%
	\endgroup%
	\iftoggle{@rvtm@toc@print@chapter@number@right}{%
		\global\togglefalse{@rvtm@toc@print@chapter@number@right}%
	}{%
		\global\toggletrue{@rvtm@toc@print@chapter@number@right}%
	}%
}

\titlecontents{chapter}%
[0pt] % left
{} % Above code
{\formatchapterentry} % numbered entry format (the last command can take as argument the chapter's text)
{} % number-less entry format
{} % filler code
[] % Below code



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Special Pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%	Framed page
%-------------------------------------------------------------------------------

\pgfkeys{
	/rvtm/framedpage/.is family,
	/rvtm/framedpage/.cd,
	line width/.store as dimen,
	line width=2mm,
	line color/.store as color,
	line color = black,
	text width/.store as dimen,
	text width = .5\textwidth,
	vertical offset/.store as dimen,
	horizontal offset/.store as dimen,
	offset/.code = {
		\pgfkeys{/rvtm/framedpage/vertical offset=#1, /rvtm/framedpage/horizontal offset=#1}
	},
	offset=2cm,
	above space/.code = {\vfill},
	below space/.code = {\vfill},
	left space/.code = {\hfill},
	right space/.code = {\hfill},
}

\DeclareDocumentEnvironment{framedpage}{}{%
	\newpage%
	\symmetricalLayout%
	\null%
	\thispagestyle{empty}
	\begin{tikzpicture}[remember picture, overlay]
		\draw[
			\pgfkeysvalueof{/rvtm/framedpage/line color},
			line width=\pgfkeysvalueof{/rvtm/framedpage/line width}
		]
		($(current page.north west) + (\pgfkeysvalueof{/rvtm/framedpage/horizontal offset}, -\pgfkeysvalueof{/rvtm/framedpage/vertical offset})$) --
		($(current page.north east) + (-\pgfkeysvalueof{/rvtm/framedpage/horizontal offset}, -\pgfkeysvalueof{/rvtm/framedpage/vertical offset})$) --
		($(current page.south east) + (-\pgfkeysvalueof{/rvtm/framedpage/horizontal offset}, \pgfkeysvalueof{/rvtm/framedpage/vertical offset})$) --
		($(current page.south west) + (\pgfkeysvalueof{/rvtm/framedpage/horizontal offset}, \pgfkeysvalueof{/rvtm/framedpage/vertical offset})$) -- cycle;
	\end{tikzpicture}
	\pgfkeys{/rvtm/framedpage/above space}%
	\pgfkeys{/rvtm/framedpage/left space}\begin{minipage}{\pgfkeysvalueof{/rvtm/framedpage/text width}}
}{%
	\end{minipage}\pgfkeys{/rvtm/framedpage/right space}\null%
	\pgfkeys{/rvtm/framedpage/below space}%
	\null%
	\newpage%
	\restoregeometry%
}

\pgfkeys{
	/rvtm/framedpage/title/.cd,
	font/.code = {\geometricbold},
	size/.store as dimen,
	size=2em,
	below skip/.store as dimen,
	below skip=2mm,
}

\DeclareDocumentCommand{\framedpagetitle}{m}{%
	\begingroup%
	\pgfkeys{/rvtm/framedpage/title/font}%
	\fontsize{\pgfkeysvalueof{/rvtm/framedpage/title/size}}{1.2\pgfkeysvalueof{/rvtm/framedpage/title/size}}%
	\selectfont%
	#1\\[\pgfkeysvalueof{/rvtm/framedpage/title/below skip}]%
	\endgroup%
}


%	Black page
%-------------------------------------------------------------------------------

\pgfkeys{
	/rvtm/blackpage/.cd,
	background/.store as color,
	background = black,
	text color/.store as color,
	text color = white,
	text width/.store as dimen,
	text width = .5\textwidth,
	above space/.code={\vfill\vfill},
	below space/.code = {\vfill},
	left space/.code = {\strictpagechecktrue\checkoddpage\ifoddpage\relax\else\hfill\fi},
	right space/.code = {},
	vertical offset/.store as dimen,
	horizontal offset/.store as dimen,
	offset/.code = {\pgfkeys{/rvtm/blackpage/vertical offset=#1, /rvtm/blackpage/horizontal offset=#1}},
	offset=0mm,
}

\DeclareDocumentEnvironment{blackpage}{}{%
	\newpage%
	\null%
	\thispagestyle{empty}
	\begin{tikzpicture}[remember picture, overlay]
		\fill[
			\pgfkeysvalueof{/rvtm/blackpage/background}
		]
		($(current page.north west) + (\pgfkeysvalueof{/rvtm/blackpage/horizontal offset}, -\pgfkeysvalueof{/rvtm/blackpage/vertical offset})$) rectangle
		($(current page.south east) + (-\pgfkeysvalueof{/rvtm/blackpage/horizontal offset}, \pgfkeysvalueof{/rvtm/blackpage/vertical offset})$);
	\end{tikzpicture}
	\pgfkeys{/rvtm/blackpage/above space}%
	\null\pgfkeys{/rvtm/blackpage/left space}\begin{minipage}{\pgfkeysvalueof{/rvtm/blackpage/text width}}
	\color{white}
}{%
	\end{minipage}\pgfkeys{/rvtm/blackpage/right space}\null%
	\pgfkeys{/rvtm/blackpage/below space}%
	\null%
	\newpage%
}


%	Background Photo for Double Page
%-------------------------------------------------------------------------------

\pgfkeys{
	/rvtm/bpdp/.cd,
	photo width/.store as dimen,
	photo width = 2\paperwidth,
	photo height/.store as dimen,
	photo height=\paperheight,
	page style/.initial = empty,
}

\DeclareDocumentEnvironment{bpdp}{m}{%
	\clearToLeftPage%
	\thispagestyle{\pgfkeysvalueof{/rvtm/bpdp/page style}}%
	\smallmarginlayout%
	\begingroup%
	\newcommand{\bpdpphotopath}{#1}%
	\begin{tikzpicture}[remember picture, overlay]%
		\node at (current page.east) {\printImageToMinArea{\pgfkeysvalueof{/rvtm/bpdp/photo width}}{\pgfkeysvalueof{/rvtm/bpdp/photo height}}{#1}};
	\end{tikzpicture}%
}{%
	\endgroup%
	\restoregeometry%
	\newpage%
}

\DeclareDocumentCommand{\bpdpnewpage}{}{%
	\newpage%
	\thispagestyle{\pgfkeysvalueof{/rvtm/bpdp/page style}}%
	\begin{tikzpicture}[remember picture, overlay]%
	\node at (current page.west) {\printImageToMinArea{\pgfkeysvalueof{/rvtm/bpdp/photo width}}{\pgfkeysvalueof{/rvtm/bpdp/photo height}}{\bpdpphotopath}};
	\end{tikzpicture}%
}


%	Quotation page
%-------------------------------------------------------------------------------

\pgfkeys{
	/rvtm/quotation page/.cd,
	fontsize/.store as dimen,
	fontsize = 1.4cm,
	font/.code = {\quotationfont},
	text/.store as color,
	text = black,
	background/.store as color,
	background = white,
}
\pgfkeys{
	/rvtm/quotation page/.cd,
	fontsize skip/.store as dimen,
	fontsize skip=1.4\pgfkeysvalueof{/rvtm/quotation page/fontsize},
}
\pgfkeys{
	/rvtm/quotation page/quote mark/.cd,
	fontsize/.store as dimen,
	fontsize=4cm,
	text vertical drop/.store as dimen,
	text vertical drop = 1cm,
	text/.initial = {''},
	text color/.store as color,
	text color = black,
	inner circle color/.store as color,
	inner circle color = black,
	outer circle color/.store as color,
	outer circle color = black,
}

\DeclareDocumentEnvironment{quotationpage}{o o o}{%
	\newpage
	\smallmarginlayout
	\thispagestyle{empty}%
	\begingroup%
	\IfValueT{#2}{\rvtmapplystyle{#2}}
	\IfValueT{#3}{\pgfkeys{/rvtm/.cd,#3}}
	\begin{tikzpicture}[remember picture, overlay, inner sep=0mm]
		\fill[\pgfkeysvalueof{/rvtm/quotation page/background}] (current page.south east) rectangle (current page.north west);
	\end{tikzpicture}
	\pgfkeys{/rvtm/quotation page/font}%
	\fontsize{\pgfkeysvalueof{/rvtm/quotation page/fontsize}}{\pgfkeysvalueof{/rvtm/quotation page/fontsize skip}}\selectfont%
	\null\vfill\vspace{-1cm}%
	{\null\hfill%
		\begin{tikzpicture}
		\node[
			yshift=-\pgfkeysvalueof{/rvtm/quotation page/quote mark/text vertical drop},
			font=\fontsize{\pgfkeysvalueof{/rvtm/quotation page/quote mark/fontsize}}{0pt}\selectfont,
			text=\pgfkeysvalueof{/rvtm/quotation page/quote mark/text color},
		] at (0,0) {\pgfkeysvalueof{/rvtm/quotation page/quote mark/text}};
		\draw[\pgfkeysvalueof{/rvtm/quotation page/quote mark/inner circle color}, ultra thick] (0,0) circle (1.4cm);
		\draw[\pgfkeysvalueof{/rvtm/quotation page/quote mark/outer circle color}, dotted, thick] (0,0) circle (1.8cm);
		\end{tikzpicture}
	\hfill\null}\\[-1cm]%
	\noindent\itshape\color{\pgfkeysvalueof{/rvtm/quotation page/text}}
}{	\\%
	\vfill\vfill%
	\IfValueT{#1}{
		\begin{center}
			\yBanner[font=\Large]{#1}
		\end{center}%
		\vfill%
	}%
	\endgroup%
	\newpage%
	\restoregeometry%
}

\rvtmnewstyle{black quotation page}{%
	quotation page/.cd,
	text = white,
	background = black,
	quote mark/.cd,
	text color = white,
	inner circle color = white,
	outer circle color = white,
	/ybanner/text color = black,
	/ybanner/color = lightGrey,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Horizontal dotted lines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfkeys{
	/rvtm/dotted line/.cd,
	fill/.store as color,
	fill=black,
	radius/.store as dimen,
	radius = 1mm,
	space between dots/.store as dimen,
	space between dots = 2mm,
	above skip/.store as dimen,
	above skip=\baselineskip,
	below skip/.store as dimen,
	below skip=\baselineskip,
}

\DeclareDocumentCommand{\hdottedline}{o o}{%
	\begingroup%
	\IfValueT{#1}{\pgfkeys{/rvtm/.cd,#1}}
	\IfValueT{#2}{\pgfkeys{/rvtm/dotted line/.cd,#2}}
	\noindent%
	\begin{tikzpicture}[remember picture]
		\path let
			\p1 = (current page text area.east)
		in coordinate (dottedlineend) at (\x1, 0);
		\draw [\pgfkeysvalueof{/rvtm/dotted line/fill}, line width=\pgfkeysvalueof{/rvtm/dotted line/radius}, line cap=round, dash pattern=on 0pt off 2\pgflinewidth] (0,0) -- (dottedlineend);
		\draw [opacity=0] (0,\pgfkeysvalueof{/rvtm/dotted line/above skip}) circle (0);
		\draw [opacity=0] (0,-\pgfkeysvalueof{/rvtm/dotted line/below skip}) circle (0);
	\end{tikzpicture}%
	\endgroup%
}

\rvtmnewstyle{white dotted line}{
	dotted line/.cd,
	fill = white,
}




