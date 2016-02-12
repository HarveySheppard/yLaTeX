%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yInvoice Class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Based on the commands and typography from the dapper-invoice class by Michael Kropat

\ProvidesClass{yMemoir}[2016/01/20 A memoir class with a modern look combined with a marginpar]
\NeedsTeXFormat{LaTeX2e}

% To handle key=value options in class definition
\RequirePackage{kvoptions}

\RequirePackage{ifthen}
\SetupKeyvalOptions{%
	prefix=yInvoice@
}
% Default currency option is "franc suisse"
\DeclareStringOption[swissFranc]{currency}[swissFranc]
\ProcessKeyvalOptions*

\RequirePackage{eurosym}

\ifthenelse{\equal{\yInvoice@currency}{dollar}}{\newcommand{\currencysym}{\$}}{}
\ifthenelse{\equal{\yInvoice@currency}{euro}}{\newcommand{\currencysym}{\euro}}{}
\ifthenelse{\equal{\yInvoice@currency}{pound}}{\newcommand{\currencysym}{\textsterling}}{}
\ifthenelse{\equal{\yInvoice@currency}{swissFranc}}{\newcommand{\currencysym}{.--}}{}

\DeclareOption*{
	\ClassWarning{yInvoice}{Unknown option: \CurrentOption}
}

\ProcessOptions\relax


\LoadClass[a4paper, 10pt, oneside, fleqn]{article}
\RequirePackage[no-math]{fontspec}

\RequirePackage{polyglossia}
\setdefaultlanguage{english}

\typeout{For commercial use of this Work or a Derived or Compiled Work (as defined in the LPPL v1.3c), contact me before at thib1235[at]gmail.com}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Various packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{microtype}
%\RequirePackage{graphicx}
\RequirePackage[german=swiss]{csquotes}
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{ragged2e}
\RequirePackage{xparse}
\RequirePackage[useregional]{datetime2}

\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{shapes}
\usetikzlibrary{fpu}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\definecolor{mainColor}{RGB}{150, 150, 150} % a sort of light gray
\definecolor{mainColor}{RGB}{211, 47, 47} % some dark red
\definecolor{lightGrey}{gray}{.6}
\definecolor{middleGrey}{gray}{.3}

\newcommand{\inLightGrey}[1]{{\color{lightGrey}#1}}
\newcommand{\inMiddleGrey}[1]{{\color{middleGrey}#1}}
\newcommand{\inColor}[1]{{\bfseries\color{mainColor}#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontawesome}
\defaultfontfeatures{Ligatures=TeX}
\frenchspacing
% For source code
\setmonofont{Source Code Pro Light}[
BoldFont=Source Code Pro,
]
% Normal font
\setsansfont{Fira Sans Light}[
BoldFont=Fira Sans SemiBold,
ItalicFont=Fira Sans Light Italic,
BoldItalicFont=Fira Sans SemiBold Italic
]
% Normal font
\setmainfont{Fira Sans Light}[
BoldFont=Fira Sans SemiBold,
ItalicFont=Fira Sans Light Italic,
BoldItalicFont=Fira Sans SemiBold Italic
]
% Font for section, subsection, subsubsection, etc
\newfontfamily{\josefin}{Josefin Sans}
\newfontfamily{\abril}{Abril Fatface}
\newfontfamily{\FA}{fontawesome-webfont.ttf}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
	xetex,
%	showframe,
	a4paper,
	ignoreheadfoot,
	left=2.5cm,
	right=2.5cm,
	top=2.5cm,
	bottom=2.5cm,
	nohead,
	marginparwidth=0cm,
	marginparsep=0mm
]{geometry}
\setlength{\skip\footins}{1cm}
\setlength{\footnotesep}{2mm}
\setlength{\parskip}{1ex}
\setlength{\parindent}{0ex}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{array}
\RequirePackage{tabu}
\RequirePackage{longtable}

\definecolor{tableLineOne}{gray}{.98}
\definecolor{tableLineTwo}{gray}{.95}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={1 1 0},
	pdftitle={Title},
	pdfauthor={Your name},
	pdfsubject={},
	pdfcreator=LaTeX,
	pdfkeywords={{keyword 1}{keyword 2}},
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
%		yInvoice general commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\printInvoiceHeader}{
	\printTitle
	\printHeader
	\printBalancePrice
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Title commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Business name
\newcommand{\yInvoice@businessName}{}
\newcommand{\business}[1]{\renewcommand{\yInvoice@businessName}{#1}}

% Invoice number
\RequirePackage{fmtcount} % allow to prepend zeros in front of number
\newcommand{\yInvoice@invoiceNumber}{}
\newcommand{\invoiceNumber}[1]{\newcounter{invoiceNumberCounter}\setcounter{invoiceNumberCounter}{#1}\renewcommand{\yInvoice@invoiceNumber}{\padzeroes[3]{\decimal{invoiceNumberCounter}}}}

\newcommand{\printTitle}{
	\vspace*{1cm}
	\begingroup
		\fontsize{1cm}{1.2cm}\selectfont\inColor{\yInvoice@businessName}\hfill\textsc{Invoice \#\yInvoice@invoiceNumber}\\
	\endgroup
	\null\hfill\inMiddleGrey{\today}
	
	\vspace*{1.5cm}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Header commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Client commands
\newcommand{\yInvoice@clientName}{}
\newcommand{\yInvoice@clientAdressLineOne}{}
\newcommand{\yInvoice@clientAdressLineTwo}{}
\newcommand{\yInvoice@clientAdressLineThree}{}
\DeclareDocumentCommand{\client}{m m m O{}}{
	\renewcommand{\yInvoice@clientName}{#1}
	\renewcommand{\yInvoice@clientAdressLineOne}{#2}
	\renewcommand{\yInvoice@clientAdressLineTwo}{#3}
	\renewcommand{\yInvoice@clientAdressLineThree}{#4}
}

% Project commands
\newcommand{\yInvoice@project}{}
\newcommand{\project}[1]{\renewcommand{\yInvoice@project}{#1}}

% Contact commands
\newcommand{\yInvoice@contact}{}
\newcommand{\yInvoice@contactPhone}{}
\newcommand{\yInvoice@contactMail}{}
\DeclareDocumentCommand{\contact}{m O{} O{}}{
	\renewcommand{\yInvoice@contact}{#1}
	\renewcommand{\yInvoice@contactPhone}{#2}
	\renewcommand{\yInvoice@contactMail}{#3}
}

% Yourself commands
\newcommand{\yInvoice@yourName}{}
\newcommand{\yInvoice@yourAdressLineOne}{}
\newcommand{\yInvoice@yourAdressLineTwo}{}
\newcommand{\yInvoice@yourAdressLineThree}{}
\newcommand{\yInvoice@yourPhone}{}
\newcommand{\yInvoice@yourMail}{}
\DeclareDocumentCommand{\yourself}{m m m O{} O{} O{}}{
	\renewcommand{\yInvoice@yourName}{#1}
	\renewcommand{\yInvoice@yourAdressLineOne}{#2}
	\renewcommand{\yInvoice@yourAdressLineTwo}{#3}
	\renewcommand{\yInvoice@yourAdressLineThree}{#4}
	\renewcommand{\yInvoice@yourPhone}{#5}
	\renewcommand{\yInvoice@yourMail}{#6}
}

% Bank commands
\newcommand{\yInvoice@bankAdresse}{}
\newcommand{\yInvoice@bankIban}{}
\DeclareDocumentCommand{\bank}{m m}{
	\renewcommand{\yInvoice@bankAdresse}{#1}
	\renewcommand{\yInvoice@bankIban}{#2}
}

\newcommand{\printHeader}{	
	\parbox[b]{\textwidth}{
		\parbox[t]{.5\textwidth}{
			\mbox{}\\
			\begin{tabular}{rl}
				\arrowtarget\inColor{Payable to} & \yInvoice@yourName\\
				& \yInvoice@yourAdressLineOne\\
				& \yInvoice@yourAdressLineTwo\\
				\ifdefempty{\yInvoice@yourAdressLineThree}{}{& \yInvoice@yourAdressLineThree\\}
				\ifdefempty{\yInvoice@yourPhone}{}{\inLightGrey{\faMobile} & \yInvoice@yourPhone\\}
				\ifdefempty{\yInvoice@yourMail}{}{\inLightGrey{\faEnvelopeO} & \yInvoice@yourMail\\}
				\\
				\inColor{Bank account} & \yInvoice@bankAdresse\\
				\textsc{\inLightGrey{iban}}& \yInvoice@bankIban
			\end{tabular}
		}\parbox[t]{.5\textwidth}{
			\mbox{}\\%
			\null\hfill\begin{tabular}{rl}
				\inColor{Client} & \yInvoice@clientName\\
				 & \yInvoice@clientAdressLineOne\\
				 & \yInvoice@clientAdressLineTwo\\
				 \ifdefempty{\yInvoice@clientAdressLineThree}{}{& \yInvoice@clientAdressLineThree\\}
				\\
				\inColor{Project} & \yInvoice@project\\
				\ifdefempty{\yInvoice@contact}{}{\\
					\inColor{Contact} & \yInvoice@contact\\
					\ifdefempty{\yInvoice@contactPhone}{}{\inLightGrey{\faMobile} & \yInvoice@contactPhone\\}
					\ifdefempty{\yInvoice@contactMail}{}{\inLightGrey{\faEnvelopeO} & \yInvoice@contactMail\\}
				}
			\end{tabular}
		}
		\\\mbox{}
	}
	
	\vspace*{1.5cm}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Arrow commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\yInvoice@arrowSpace}{1.5em}
\newcommand*{\tikzmark}[1]{\hspace*{\yInvoice@arrowSpace}\tikz[overlay,remember picture]\node({#1}){};}
\newcommand*{\arrowbase}{\tikzmark{@p1}}
\newcommand*{\arrowtarget}{\tikzmark{@p2}}
\newcommand*{\drawarrow}{
	\tikz[overlay,remember picture] {
		\draw[->,thick,color=lightGrey] ($(@p1)+(.5em,1.5ex)$) -| ($(@p2)+(-2em,0.7ex)$) -- ($(@p2)+(-0.5em,0.7ex)$);
	}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Price Formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formatting numbers
\RequirePackage{siunitx}
\sisetup{round-integer-to-decimal, group-separator={'}}

\newcommand{\formatPrice}[1]{
	\ifthenelse{\equal{\yInvoice@currency}{swissFranc}}{
		\formatNumber{#1}\currencysym
	}{
		\currencysym\formatNumber{#1}
	}
}
\newcommand{\addCurrency}[1]{
	\ifthenelse{\equal{\yInvoice@currency}{swissFranc}}{
		#1\currencysym
	}{
	\currencysym#1
}
}
\newcommand{\formatNumber}[1]{
	\num[group-separator={'}, group-minimum-digits=3, round-mode=places, round-precision=2]{#1}
}
\newcommand{\yInvoice@balancePrice}{}
\newcommand{\balancePrice}[1]{\renewcommand{\yInvoice@balancePrice}{#1}}
\newcommand{\printBalancePrice}{
	\arrowbase\quad
	\parbox{.4\textwidth}{
		{
			\fontsize{1cm}{1.2cm}\josefin\selectfont
			\ifthenelse{\equal{\yInvoice@currency}{swissFranc}}{
				\yInvoice@balancePrice\currencysym
			}{
				\currencysym\yInvoice@balancePrice
			}
		}\\[1mm]
		\inMiddleGrey{due \duedate}
	}
	\drawarrow
	
	\vspace*{1cm}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Date commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For due date
\RequirePackage{datenumber}
\newcommand{\yInvoice@dueIn}{0}
\newcommand{\duein}[1]{\renewcommand{\yInvoice@dueIn}{#1}}
\newcommand*{\duedate}{%
	\setdatetoday%
	\addtocounter{datenumber}{\yInvoice@dueIn}%
	\setdatebynumber{\thedatenumber}%
	\datedate%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Table commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{environ}
\NewEnviron{costsDescription}[2]{
	\begin{tabu} to \linewidth {lllXllll}
		\rowfont{\bfseries\sffamily\leavevmode\color{white}}
		\rowcolor{mainColor}
		& Short name & Date & Description & Hours & Rate & Amount & \\
\BODY
		\summaryline{Total}{#1}
		\summaryline{Paid}{#2}
		\summaryline{Balance Due}{\yInvoice@balancePrice}
	\end{tabu}
}


\newcommand{\costEntry}[6]{
	& #1 & #2 & #3 & #4 & \addCurrency{#5} & \addCurrency{#6} & \\
}

\newcommand{\summaryline}[2]{
	\rowcolor{White}
	& \multicolumn{5}{r}{\inColor{#1}} & \addCurrency{#2} & \\[-3mm]
}


\taburowcolors[2] 2{tableLineOne .. tableLineTwo}
\tabulinesep = ^4mm_3mm







