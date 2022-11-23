% !TeX spellcheck = en_US
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yMasterThesis}[2022/06/15 A LaTeX class for my master thesis.]

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{report}
}

\ProcessOptions\relax

\LoadClass[a4paper, fleqn, oneside]{report}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Various packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Somehow, loading this package later makes partial ToC fail
\RequirePackage[
  compact,
  newparttoc,
  newlinetospace,
]{titlesec}
\RequirePackage{titletoc}

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\RequirePackage{amsmath, amsfonts, amssymb, amsthm}
\RequirePackage{thmtools}
\RequirePackage{bookmark}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{caption}
\RequirePackage{changepage}
\RequirePackage[inline]{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{floatrow}
\RequirePackage{fontspec}
\RequirePackage{graphicx}
\RequirePackage{marginfix}
\RequirePackage{marginnote}
\RequirePackage{mdframed}
\RequirePackage{microtype}
\RequirePackage{minted}
\RequirePackage{multicol}
\RequirePackage{pdfpages}
\RequirePackage{pgfplots}
\RequirePackage{placeins}
\RequirePackage{polyglossia}
\RequirePackage{csquotes} % Should be loaded after fvextra to avoid some warnings, minted requires fvextra
\RequirePackage{ragged2e}
\RequirePackage{setspace}
\RequirePackage{ifluatex} % svg package requires some tex primitive to be defined which LuaLaTeX does not provide.
\ifluatex
  \RequirePackage{pdftexcmds}
  \let\pdfstrcmp\pdf@strcmp
  \let\pdffilemoddate\pdf@filemoddate
\fi
\RequirePackage{svg}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\RequirePackage{translations}
\RequirePackage{xfrac}
\RequirePackage{xifthen}
\RequirePackage{xparse}
\RequirePackage{zref-abspos}
% Apparently, it is a good thing to load hyperref last.
\RequirePackage{hyperref}
\RequirePackage[noabbrev]{cleveref} % cleverref needs to be loaded after hyperref
\RequirePackage{geometry} % In some weird cases, geometry might need to be loaded after hyperref

\usetikzlibrary{calc, fadings, graphdrawing, graphs, fit, matrix, positioning, quotes, shapes}
\usegdlibrary{layered} % Load the graph drawing sublibrary called layered, which enables drawing layered graphs.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Language
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setdefaultlanguage{english}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\x}%
\newlength{\y}%

\geometry{
  %showframe,
	a4paper,
	ignorefoot,
	ignorehead,
	right=7.7cm,
	left=2.5cm,
	top=2.5cm,
	bottom=2.5cm,
	footskip=2\baselineskip,
	footnotesep=0mm,
	marginparwidth=4.5cm,
	marginparsep=7mm,
	headheight=0mm,
}
%\reversemarginpar

\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0ex}

\onehalfspacing

\newcommand{\symmetricalPage}{
	\fancyhfoffset[L]{0mm}
	\newgeometry{
		ignorefoot,
		ignorehead,
		left=3cm,
		right=3cm,
		top=3cm,
		bottom=3cm,
		marginparwidth=0cm,
		marginparsep=0mm
	}
}
\newcommand{\asymmetricalPage}{
	\restoregeometry
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% https://tex.stackexchange.com/questions/5036/how-to-prevent-latex-from-hyphenating-the-entire-document
\newcommand{\noHyphen}{%
  \righthyphenmin=62
  \lefthyphenmin=62
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setmainfont{Source Serif 4}[
  Numbers={Proportional,OldStyle}
]
\setsansfont{Source Sans 3}[
  Numbers={Proportional,OldStyle}
]
\setmonofont{Source Code Pro}

\newfontfamily{\FA}{font_awesome_6_free_400.otf}
\newfontfamily{\FASolid}{font_awesome_6_free_900.otf}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\providecolor{gray_00}{HTML}{000000}
\providecolor{gray_05}{HTML}{0B0A0F}
\providecolor{gray_10}{HTML}{15151E}
\providecolor{gray_20}{HTML}{2B293D}
\providecolor{gray_30}{HTML}{403E5B}
\providecolor{gray_40}{HTML}{55527A}
\providecolor{gray_50}{HTML}{6B6798}
\providecolor{gray_60}{HTML}{8885AD}
\providecolor{gray_70}{HTML}{A6A4C1}
\providecolor{gray_80}{HTML}{C4C2D6}
\providecolor{gray_90}{HTML}{E1E1EA}
\providecolor{gray_95}{HTML}{F0F0F5}
\providecolor{gray_99}{HTML}{FCFCFD}
\providecolor{gray_100}{HTML}{FFFFFF}

\colorlet{text_color}{gray_05}
\colorlet{link_color}{gray_40}

\providecolor{blue_50}{HTML}{0080FF}
\providecolor{green_50}{HTML}{00FF66}
\providecolor{yellow_50}{HTML}{FFE100}
\providecolor{orange_50}{HTML}{FFB300}
\providecolor{red_50}{HTML}{FF0015}
\providecolor{purple_50}{HTML}{9000FF}

\colorlet{main_color}{blue_50}
\colorlet{secondary_color}{purple_50}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\urlstyle{rm}
\hypersetup{
	pdfborder={1 1 0},
	pdfcreator=LaTeX,
	colorlinks=true,
	linkcolor=link_color,
	linktoc=all,
	urlcolor=link_color,
	citecolor=link_color,
	filecolor=link_color,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Math
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareMathOperator{\weightedMedian}{{\mathnormal{median_q}}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Headers/Footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\fancypagestyle{fancy}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyhf{}
	\cfoot{\hypersetup{linkcolor=text_color}\thepage}
	\fancyhfoffset[L]{-\marginparsep - \marginparwidth}
}
\pagestyle{fancy}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PgfPlots and Co.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\colorlet{color0}{blue_50}
\colorlet{fillcolor0}{color0!30!white}
\colorlet{color1}{red_50}
\colorlet{fillcolor1}{color1!30!white}
\colorlet{color2}{green_50}
\colorlet{fillcolor2}{color2!30!white}
\colorlet{color3}{yellow_50}
\colorlet{fillcolor3}{color3!30!white}
\colorlet{color4}{purple_50}
\colorlet{fillcolor4}{color4!30!white}
\colorlet{color5}{orange_50}
\colorlet{fillcolor5}{color5!30!white}

\pgfplotsset{
  compat = newest,
  cycle list={
    {color0},
    {color1},
    {color2},
    {color3},
    {color4},
    {color5},
    {color0},
    {color1},
    {color2},
    {color3},
    {color4},
    {color5},
  },
  area style/.style={
    axis on top,
    cycle list={
      {color0,fill=fillcolor0,mark=none},
      {color1,fill=fillcolor1,mark=none},
      {color2,fill=fillcolor2,mark=none},
      {color3,fill=fillcolor3,mark=none},
      {color4,fill=fillcolor4,mark=none},
      {color5,fill=fillcolor5,mark=none},
      {color0,fill=fillcolor0,mark=none},
      {color1,fill=fillcolor1,mark=none},
      {color2,fill=fillcolor2,mark=none},
      {color3,fill=fillcolor3,mark=none},
      {color4,fill=fillcolor4,mark=none},
      {color5,fill=fillcolor5,mark=none},
    },
  },
}
\usepgfplotslibrary{external}
\tikzexternalize
\tikzsetexternalprefix{figures/}

\tikzset{%
  dc tag/.style={
    align=center,
    font=\small,
  },
  dc legend/.style={align=left,anchor=west},
  dc sector/.style={draw=white, thick, fill=\Cj,line join=round}
}

\pgfkeys{/DiagCirc/.cd,
  % liste of \Name/Value
  value list/.store in=\Value@list,
  % circular : 360 - semi circular 180
  angle max/.store in=\Angle@max,
  angle max=180,
  % radius of the diagram
  radius/.store in=\R@dius,
  radius=3cm,
  % composition of the legend
  % \V value
  % \N name
  % \P percent
  % \A angle
  % \Cj color
  legend/.store in=\L@gend,
  legend=,
  % location of the legend
  legend location/.store in=\Legend@Loc,
  legend location={($(\R@dius,\R@dius)+(.5,-.5)$)},   
  % poisition of the node in the sector
  % 0 center, 1 on the edge, 1.++ external
  factor/.store in=\F@ctor,
  factor=0.85,%
  % composition of the node in the sector
  tags/.store in=\T@gs,
  tags=\N\\\pgfmathprintnumber{\P}\%,
  % correction of round errors in percents
  percent corr/.store in=\C@rrP,
  percent corr=,
  % correction of round errors in angles
  angle corr/.store in=\C@rrA,
  angle corr=,
  % Shift applied to all sectors
  shift all/.store in=\Shift@ll,
  shift all=0mm,
  % individual shift
  shift sector/.store in=\Shift@j,
  shift sector=,
  % more nodes in the sectors, or new legeng
  sup loop/.store in=\Sup@Loop,
  sup loop=,
  % code of the diagram
  diagram/.code={%
    % Calculation of the sum
    \pgfmathsetmacro\S@m{0}
    \foreach \i/\y in \Value@list {\xdef\S@m{\S@m+\i}}  
    \pgfmathsetmacro\S@m{\S@m}
    \pgfmathsetmacro\C@eff{\Angle@max/\S@m}

    % beginning of the first sector
    \xdef\@ngleA{180}

    % main loop
    \foreach \V/\N [count=\j from 0] in \Value@list {%

      % calculation of the current angle
      \pgfmathsetmacro\A{\V*\C@eff}

      % superior limit of the sector
      \pgfmathsetmacro\@ngleB{\@ngleA-\A} ;

      % mean angle
      \pgfmathsetmacro\MedA{(\@ngleA+\@ngleB)/2} ;        

      % color
      \pgfmathtruncatemacro\@k{mod(\j,5)}
      \def\cj{color\@k}
      \def\Cj{fillcolor\@k}

      % Shift
      \ifthenelse{\equal{\Shift@j}{}}{%
        \edef\Sh@ft{\Shift@ll}%
      }{%
        \pgfmathparse{array({\Shift@j},\j)}
        \edef\Sh@ft{\Shift@ll+\pgfmathresult} 
      }

      % drawing of the sector
      \draw[dc sector,shift={(\MedA:\Sh@ft)}] (0,0)
        -- (\@ngleA:\R@dius) arc (\@ngleA:\@ngleB:\R@dius)
          node[midway] (DC\j) {} -- cycle ;

      % low limit of the next sector
      \xdef\@ngleA{\@ngleB} ;

      % current percent correction
      % TODO No percentage correction
      % TODO Draw sectors with border color.
      \pgfmathsetmacro\P{\V/\S@m*100}
      \ifthenelse{\equal{\C@rrP}{}}{}{%
        \pgfmathparse{array({\C@rrP},\j)}
        \pgfmathsetmacro\P{\P+\pgfmathresult}
      }

      % current angle and correction
      \pgfmathtruncatemacro\A{round(\A)}
      \ifthenelse{\equal{\C@rrA}{}}{}{%
        \pgfmathparse{array({\C@rrA},\j)}
        \pgfmathtruncatemacro\A{\A+\pgfmathresult}  
        \edef\A{\A\,\degre}
      }

      % the sector node
      \ifthenelse{\equal{\T@gs}{}}{}{%
        \DiagNode[dc tag]{\F@ctor} {\T@gs} ;
      }

      % the legend
      \ifthenelse{\equal{\L@gend}{}}{}{%
        \begin{scope}[shift=\Legend@Loc]
          \draw[fill=\Cj] (0,-.5*\j)
            rectangle ++(.25,.25) ++(0,-.15)
            node[dc legend] {\strut\L@gend} ;
        \end{scope}
      }

      % some more stuff
      \Sup@Loop ;
    }
  } % end of diagram code
}

\newcommand{\DiagNode}[2][]{\node[#1] at ($(0,0)!#2!(DC\j)$)}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\declaretheoremstyle[
  headfont={\sffamily\scshape\color{gray_10}},
  notefont={\sffamily\mdseries\bfseries\color{gray_30}},
  notebraces={\hspace*{1ex}}{},
  headpunct={\newline},
  spaceabove=\parskip,
  spacebelow=0mm,
]{mytheoremstyle}
\declaretheorem[style=mytheoremstyle]{definition}
\declaretheorem[style=mytheoremstyle]{property}
\declaretheorem[style=mytheoremstyle]{proposition}
\declaretheorem[style=mytheoremstyle]{scenario}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentCommand{\pageBackground}{}{%
  \AddToHookNext{shipout/background}{%
    \begingroup%
    \tikzset{external/export=false}%%
    \begin{tikzpicture}[
        remember picture,
        overlay,
      ]
      \fill[
        gray_90,
      ] (current page.north west) rectangle (current page.south east);
    \end{tikzpicture}
    \endgroup%
  }
  \thispagestyle{empty}%
}

\DeclareDocumentCommand{\yTitle}{m}{%
  \begingroup%
    \large\sffamily\scshape\bfseries\color{gray_30}%
    #1%
  \endgroup%
}

\DeclareDocumentCommand{\yTitleContrasted}{m}{%
  \begingroup%
    \large\sffamily\scshape\bfseries\color{gray_20}%
    #1%
  \endgroup%
}

\newcounter{image_sectioning_horizontal}
\newcounter{image_sectioning_vertical}

\setcounter{secnumdepth}{3}
\newlength{\majorSectionVerticalOffset}
\setlength{\majorSectionVerticalOffset}{45mm}
\newlength{\majorSectionTextOffset}
\setlength{\majorSectionTextOffset}{0.37\paperheight - 1in - \voffset - \topmargin - \headheight - \headsep}
\DeclareDocumentCommand{\partTypo}{m}{
  \begingroup%
  \global\stepcounter{image_sectioning_vertical}%
  \thispagestyle{empty}%
  \tikzset{external/export=false}%
  \begin{tikzpicture}[
      remember picture,
      overlay,
    ]
    \fill[
      gray_90,
    ] (current page.north west) rectangle (current page.south east);
    \begin{scope}
      \clip (current page.north west) rectangle (current page.south east);
      \node[
        anchor=center,
        inner sep=0mm,
      ] at (current page) {\printImageToMinArea{\paperwidth}{\paperheight}{images/sectioning/vertical/\arabic{image_sectioning_vertical}/img.jpg}};
    \end{scope}
    \node[
      anchor=west,
      font=\sffamily\scshape\Large,
      text=gray_30,
      minimum height=\baselineskip,
    ] (label) at ([yshift=-\majorSectionVerticalOffset]current page text area.north west) {part \thepart};
    \node[
      anchor=north west,
      font=\huge\sffamily\scshape\bfseries\noHyphen,
      text=gray_40,
    ] at ([yshift=-\baselineskip]label.west) {#1};
  \end{tikzpicture}%
  \endgroup%
  \startcontents[parts]%
  \vspace*{\majorSectionTextOffset}%
}
\titleformat{\part}
  [block] % Shape, i.e. whether the title is typeset as a single block, multiple paragraphs, etc.
  {} % Format to apply to the title and the label
  {} % Label
  {0mm} % Horizontal separation between label and title body, must be a length (will be vertical in display shape)
  {\partTypo} % The code preceding the title body
% Left margin
% Vertical space before the title
% The separation between the title and text
\titlespacing*{\part}{0pt}{0mm}{*0}
% \titleclass{\part}{top}

% Command to typeset the second page of a part.
\DeclareDocumentCommand{\partSecondPage}{}{%
  \pageBackground%
  \printparttableofcontents%
  \marginElement{\input{images/sectioning/vertical/\arabic{image_sectioning_vertical}/readme.tex}}%
  \yTitleContrasted{Summary}\\[2mm]
}

% Boolean to print margin toc.
\newbool{@printmargintoc}
% Set default value to true.
\booltrue{@printmargintoc}

\newbool{@printmarginimagecaption}
\booltrue{@printmarginimagecaption}

% Command to prevent printing of margin toc.
\DeclareDocumentCommand{\nomargintoc}{}{\boolfalse{@printmargintoc}}
\DeclareDocumentCommand{\nomarginimagecaption}{}{\boolfalse{@printmarginimagecaption}}
\DeclareDocumentCommand{\chapterTypo}{s m}{%
  \begingroup%
  \thispagestyle{fancy}%
  \tikzset{external/export=false}%
  \global\stepcounter{image_sectioning_horizontal}%
  \begin{tikzpicture}[%
      remember picture,
      overlay,
    ]
    \fill[
      gray_90,
    ] (current page.north west) rectangle ($(current page.north east) + (0, -0.37*\paperheight)$);
    \begin{scope}
      \clip (current page.north west) rectangle ([yshift=-0.37\paperheight]current page.north east);
      \node[
        anchor=center,
        inner sep=0mm,
      ] at ([yshift=-0.185\paperheight]current page.north) {\printImageToMinArea{\paperwidth}{0.37\paperheight}{images/sectioning/horizontal/\arabic{image_sectioning_horizontal}/img.jpg}};
    \end{scope}
    \node[
      anchor=west,
      font=\sffamily\scshape\large,
      minimum height=\baselineskip,
      text=gray_95,
    ] (label) at ([yshift=-\majorSectionVerticalOffset]current page text area.north west) {\IfBooleanF{#1}{\chaptertitlename\ \thechapter}};
    \node[
      anchor=north west,
      font=\LARGE\sffamily\scshape\bfseries\noHyphen,
      text=gray_90,
    ] at ([yshift=-\baselineskip]label.west) {#2};
  \end{tikzpicture}
  \endgroup%
  \vspace*{\majorSectionTextOffset}%
  \IfBooleanTF{#1}{%
    \vspace*{7mm}%
    \marginElement{\vspace*{6mm}\input{images/sectioning/horizontal/\arabic{image_sectioning_horizontal}/readme.tex}}%
  }{%
    \ifbool{@printmargintoc}{%
      \startcontents%
      \printchaptertableofcontents%
      \ifbool{@printmarginimagecaption}{%
        \marginElement{\input{images/sectioning/horizontal/\arabic{image_sectioning_horizontal}/readme.tex}}%
      }{}
    }{
      \ifbool{@printmarginimagecaption}{%
        \marginElement{\vspace*{9mm}\input{images/sectioning/horizontal/\arabic{image_sectioning_horizontal}/readme.tex}}%
      }{}
    }%
  }%
  \global\booltrue{@printmargintoc}%
  \global\booltrue{@printmarginimagecaption}%
}
\titleformat{name=\chapter}
  [block]
  {}
  {}
  {0mm}
  {\chapterTypo}
\titleformat{name=\chapter, numberless}
  [block]
  {}
  {}
  {0mm}
  {\chapterTypo*}
\titlespacing*{\chapter}{0pt}{0mm}{0mm}
\titlespacing*{name=\chapter, numberless}{0pt}{0mm}{0mm}

\titleformat{\section}{\color{gray_40}\sffamily\scshape\Large\bfseries\noHyphen}{\thesection}{1ex}{}
\titlespacing*{\section}{0pt}{*1}{*0}

\titleformat{\subsection}{\color{gray_30}\sffamily\scshape\large\bfseries\noHyphen}{\thesubsection}{1ex}{}
\titlespacing*{\subsection}{0pt}{*1}{*0}

\titleformat{\subsubsection}{\color{gray_30}\sffamily\scshape\bfseries\noHyphen}{\thesubsubsection}{1ex}{}
\titlespacing*{\subsubsection}{0pt}{*1}{*0}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Table of content / ToC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\contentsmargin{0mm}

\DeclareDocumentCommand{\printtableofcontents}{}{%
	\begingroup%
  \setlength{\parskip}{0mm}%
	\setcounter{tocdepth}{0}%
	\hypersetup{linkcolor=text_color}%
	\tableofcontents%
	\endgroup%
}

\titlecontents*{part}
  [0mm] % Left indent
  {\vspace{\baselineskip}\sffamily\bfseries} % Above code
  {\uppercase} % Numbered entry format
  {\uppercase} % Numberless entry format
  {} % Filler

\titlecontents{chapter}
  [6mm] % Left indent
  {\vspace{0.3\baselineskip}\sffamily\scshape} % Above code
  {\contentslabel[\textcolor{link_color}{\bfseries\thecontentslabel}]{6mm}} % Numbered entry format
  {\hspace*{-6mm}} % Numberless entry format
  {,\hspace*{1ex}{\normalfont\sffamily\itshape p.\ \thecontentspage}} % Filler

\DeclareDocumentCommand{\printparttableofcontents}{}{%
  \marginElement{%
    {%
      \vspace*{1mm}%
      \yTitleContrasted{Chapters}\\[2mm]
      \normalsize%
      \printcontents[parts]{p}{0}[0]{\hypersetup{linkcolor=text_color}}%
    }%
  }% 
}

\titlecontents{pchapter}
  [6mm] % Left indent
  {\sffamily} % Above code
  {\contentslabel[\bfseries\color{link_color}\thecontentslabel]{6mm}\noHyphen} % Numbered entry
  {\hspace*{-6mm}\noHyphen} % Numberless entry
  {,\hspace*{1ex}\mbox{\emph{p.~\thecontentspage}}} % Filler

\DeclareDocumentCommand{\printchaptertableofcontents}{}{%
  \marginElement{%
    {%
      \vspace*{9mm}
      \yTitle{Contents}\\[2mm]
      \printcontents{c}{1}[1]{\hypersetup{linkcolor=text_color}}%
    }%
  } 
}

\titlecontents{csection}
  [6mm] % Left indent
  {\sffamily} % Above code
  {\contentslabel[\bfseries\color{link_color}\thecontentslabel]{6mm}\noHyphen} % Numbered entry
  {\hspace*{-6mm}\noHyphen} % Numberless entry
  {,\hspace*{1ex}\mbox{\emph{p.~\thecontentspage}}} % Filler



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Full-Width Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentEnvironment{fullwidth}{}{%
  \begin{adjustwidth}{}{-\marginparsep-\marginparwidth}%
}{%
  \end{adjustwidth}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Floats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareCaptionFont{myCaptionFont}{\sffamily\scshape\bfseries\color{gray_30}}
\DeclareCaptionLabelSeparator{myCaptionLabelSeparator}{\hspace*{1ex}}
\captionsetup{
  labelfont=myCaptionFont,
  justification=RaggedRight,
  labelsep=myCaptionLabelSeparator,
}

\DeclareFloatVCode{parskip}{{\vspace{\parskip}}}
\newlength{\twoparskip}
\setlength{\twoparskip}{1.5\parskip}
\DeclareFloatVCode{twoparskip}{{\vspace\twoparskip}}
\DeclareFloatSeparators{marginparsep}{\hspace\marginparsep}
\floatsetup[figure]{
	precode=twoparskip, margins=hangright,
  floatwidth=\textwidth,
  font={normalsize},
  capposition=beside,
  captionskip=0mm,
  capbesideposition={top,right},
  capbesidewidth=sidefil,
  capbesidesep=marginparsep,%
  footposition=caption,
  footskip=0.5\baselineskip,
  footfont={small},
	postcode=twoparskip,
}
\floatsetup[widefloat]{%
	capposition=bottom,
	captionskip=\baselineskip,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Enumitem
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlist{
  topsep=0mm,
}
\setlist[description]{font=\scshape\sffamily\color{gray_40}}
\setlist[enumerate]{font=\scshape\sffamily\bfseries\color{gray_40}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Minted
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usemintedstyle{pastie}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Hooks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{\color{text_color}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Backgrounding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{background}
\renewcommand{\thebackground}{\arabic{page}-\arabic{background}}
\newcommand{\backgroundAnchor}[1]{\leavevmode\zsavepos{background-#1}}

% outer_space inner_space
\DeclareDocumentCommand{\startBackground}{}{
	\backgroundAnchor{begin-\thebackground}%
	\\%
}
%
\newlength{\depthLength}
\settodepth{\depthLength}{p}

\newlength{\backgroundTempLength}

% outer_space inner_space
\DeclareDocumentCommand{\stopBackground}{}{
	\backgroundAnchor{end-\thebackground}%
}

\tikzset{background/.style = {fill=gray_90}}
\DeclareDocumentCommand{\drawBackground}{t^ t_}{%
  \begingroup%
  \tikzset{external/export=false}%
	\leavevmode%
	\stepcounter{background}%
	\zsavepos{background-draw-\thebackground}%
	\begin{tikzpicture}[remember picture, overlay, inner sep=0mm]
		\def\yTop{\zposy{background-begin-\thebackground}sp - \zposy{background-draw-\thebackground}sp}
		\IfBooleanT{#1}{%
			\def\yTop{\y1}
		}
		\def\yBottom{\zposy{background-end-\thebackground}sp   - \zposy{background-draw-\thebackground}sp}
		\IfBooleanT{#2}{%
			\def\yBottom{\y2}
		}
		\fill[background] let
		\p1=(current page.north west),
		\p2=(current page.south east) in
		(\x1, \yTop) rectangle
		(\x2, \yBottom);
	\end{tikzpicture}%
	\ignorespaces%
	\endgroup%
}

\DeclareDocumentCommand{\thumbUp}{}{%
  \textcolor{green_50!20!gray_40}{\FASolid\symbol{"F164}}%
}

\DeclareDocumentCommand{\thumbDown}{}{%
  \textcolor{red_50!20!gray_40}{\FASolid\symbol{"F165}}%
}

\DeclareDocumentCommand{\benefitsSummary}{s m o}{%
  \drawBackground%
  \begin{minipage}{\linewidth+\marginparsep+\marginparwidth}
    \startBackground%
    \vspace*{0mm}\\%
    \IfBooleanF{#1}{%
      \begingroup%
      \bfseries%
      \sffamily%
      \large%
      Summary%
      \endgroup\\*[4mm]%
    }
    \begin{minipage}[t]{.5\linewidth-.5\columnsep}
      \begin{itemize}[
          labelindent=0mm,
          labelsep=0mm,
          label=\thumbUp,
          align=left,
        ]
        #2
      \end{itemize}
    \end{minipage}%
    \hspace*{\columnsep}%
    \begin{minipage}[t]{.5\linewidth-.5\columnsep}
      \IfValueT{#3}{%
        \begin{itemize}[
            labelindent=0mm,
            labelsep=0mm,
            label=\thumbDown,
            align=left,
          ]
          #3
        \end{itemize}
      }%
    \end{minipage}
    \vspace*{0mm}\\%
    \stopBackground%
  \end{minipage}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%																			   %
%																			   %
%								yMarginDesign								   %
%																			   %
%																			   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Global Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pgfkeys{
	/yMarginDesign/.cd,
	alignment/.code = \RaggedRight,
	emph color/.initial = gray_10,
	text color/.initial = text_color,
	size/.code = \footnotesize,
	titleFormat/.code = \sffamily\color{gray_30}\bfseries\scshape,
	marginparskip/.initial = 3mm,
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin Paragraphs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Typeset a paragraph in the margin
\DeclareDocumentCommand{\marginElement}{m}{%
	\marginpar{{%
			\pgfkeys{/yMarginDesign/alignment}%
			\pgfkeys{/yMarginDesign/size}%
			\color{\pgfkeysvalueof{/yMarginDesign/text color}}
      \setlist{
        noitemsep,
        left=0mm,
      }%
      #1\par\vspace*{\baselineskip}%
	}}\unskip%
}%

\newcounter{marginnote}

% Typeset a paragraph in the margin with a number (as a footnote) 
\DeclareDocumentCommand{\marginNote}{m}{%
  \stepcounter{marginnote}%
  \hyper@anchor{from-\theHmarginnote}%
  {%
    \bfseries%
    \sffamily%
    \hyper@link{}{to-\theHmarginnote}{\textsuperscript{\textcolor{\pgfkeysvalueof{/yMarginDesign/emph color}}{\themarginnote}}}%
  }%
	\marginElement{%
	  \hyper@anchor{to-\theHmarginnote}%
	  {%
	    \sffamily%
	    \bfseries%
      \hyper@link{}{from-\theHmarginnote}{\textcolor{\pgfkeysvalueof{/yMarginDesign/emph color}}{\themarginnote.}}~%
	  }%
	  \ignorespaces%
		#1%
	}%
}%

% Typeset a paragraph in the margin exactly at the exact position where the command is called
\DeclareDocumentCommand{\forcedMarginElement}{m}{%
  \marginnote{{%
    \pgfkeys{/yMarginDesign/alignment}%
    \pgfkeys{/yMarginDesign/size}%
    \color{\pgfkeysvalueof{/yMarginDesign/text color}}
		#1%
  }}%
}

% Typeset a paragraph in the margin exactly at the exact position where the command is called with a number (as a footnote)
\DeclareDocumentCommand{\forcedMarginNote}{m}{%
	\printMarginNoteMark
	\ignorespaces%
	\forcedMarginElement{%
		\sideMark[#1]{\thefootnote}%
		\ignorespaces%
		#1%
	}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin Design Elements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareDocumentCommand{\marginTitle}{m}{{\pgfkeys{/yMarginDesign/titleFormat}#1}\\}

\DeclareDocumentCommand{\marginPar}{}{\\*[\parskip]}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		yPrintImageToArea
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Command that print an image that fills an minimum area
%-------------------------------------------------------------------------------
% horizontal length, vertical length, image path
\newlength{\tempTitlepageImageHeight}%
\DeclareDocumentCommand{\printImageToMinArea}{m m m}{%
	\settototalheight{\tempTitlepageImageHeight}{\includegraphics[width=#1]{#3}}%
	\ifthenelse{\lengthtest{\tempTitlepageImageHeight<#2}}{%
		\includegraphics[height=#2]{#3}%
	}{%
		\includegraphics[width=#1]{#3}%
	}%
}%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Margin Info Bulle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\mdfdefinestyle{marginInfoBulle}
{
	skipabove=0mm,
	skipbelow=0mm,
	innertopmargin=1mm,
	innerbottommargin=2mm,
	innerleftmargin=3mm,
	innerrightmargin=0mm,
	leftmargin=0mm,
	rightmargin=0mm,
	rightline=false,
	topline=false,
	bottomline=false,
	linewidth=1mm,
	frametitlebelowskip=1mm,
	frametitleaboveskip=2mm,
}

% Arguments: 1)boolean footnotemark  2)icon  3)color  4)title default string  5)title string  6)content
\DeclareDocumentCommand{\marginInfoAbstract}{s m m m m m}{%
	\IfBooleanF{#1}{%
		{%
			\textsuperscript{\color{#3}#2}%
		}%
	}%
	\marginElement{%
		\begin{mdframed}[
		    style=marginInfoBulle,
		    linecolor=#3,
		    backgroundcolor=#3!10,
		    frametitle={%
          \parbox{\linewidth}{%
					  \mbox{}%
					  \parbox[t]{.5cm}{\leavevmode\color{#3}#2}%
					  \parbox[t]{\linewidth-.5cm}{\bfseries\sffamily\IfNoValueTF{#5}{#4}{#5}}%
				  }%
			  },
			]%
			\sffamily#6%
		\end{mdframed}%
	}%
}

\DeclareDocumentCommand{\marginEvaluationAbstract}{m m}{%
	\leavevmode\marginElement{%
    {\color{gray_40}\sffamily\bfseries\scshape#1\hspace*{1ex}}%
    {#2}%
    % \parbox[t]{.5cm}{\leavevmode\color{gray_40}\sffamily\bfseries\scshape#1}%
    % \parbox[t]{\linewidth-.5cm}{#2}%
	}%
}

\NewTranslation{english}{difficulty}{Difficulty}
\DeclareDocumentCommand{\marginCritical}{s o m}{%
	\IfBooleanTF{#1}
	{\marginInfoAbstract*{\FASolid\symbol{"F00D}}{red_50}{\GetTranslation{difficulty}}{#2}{#3}}
	{\marginInfoAbstract{\FASolid\symbol{"F00D}}{red_50}{\GetTranslation{difficulty}}{#2}{#3}}%
}

\NewTranslation{english}{info}{Information}
\DeclareDocumentCommand{\marginInfo}{s o m}{%
	\IfBooleanTF{#1}
	{\marginInfoAbstract*{\FASolid\symbol{"F129}}{blue_50}{\GetTranslation{info}}{#2}{#3}}
	{\marginInfoAbstract{\FASolid\symbol{"F129}}{blue_50}{\GetTranslation{info}}{#2}{#3}}%
}

\NewTranslation{english}{tips}{Tip}
\DeclareDocumentCommand{\marginTips}{s o m}{%
	\IfBooleanTF{#1}
	{\marginInfoAbstract*{\FA\symbol{"F0EB}}{blue_50}{\GetTranslation{tips}}{#2}{#3}}
	{\marginInfoAbstract{\FA\symbol{"F0EB}}{blue_50}{\GetTranslation{tips}}{#2}{#3}}%
}

\NewTranslation{english}{question}{Question}
\DeclareDocumentCommand{\marginQuestion}{s o m}{%
	\IfBooleanTF{#1}
	{\marginInfoAbstract*{\FASolid\symbol{"F128}}{purple_50}{\GetTranslation{question}}{#2}{#3}}
	{\marginInfoAbstract{\FASolid\symbol{"F128}}{purple_50}{\GetTranslation{question}}{#2}{#3}}%
}

\NewTranslation{english}{check}{Example}
\DeclareDocumentCommand{\marginCheck}{s o m}{%
	\IfBooleanTF{#1}
	{\marginInfoAbstract*{\FASolid\symbol{"F00C}}{green_50}{\GetTranslation{check}}{#2}{#3}}
	{\marginInfoAbstract{\FASolid\symbol{"F00C}}{green_50}{\GetTranslation{check}}{#2}{#3}}%
}

\NewTranslation{english}{warning}{Warning}
\DeclareDocumentCommand{\marginWarning}{s o m}{%
	\IfBooleanTF{#1}
	{\marginInfoAbstract*{\FASolid\symbol{"F12A}}{orange_50}{\GetTranslation{warning}}{#2}{#3}}
	{\marginInfoAbstract{\FASolid\symbol{"F12A}}{orange_50}{\GetTranslation{warning}}{#2}{#3}}%
}

\NewTranslation{english}{benefit}{Benefit}
\DeclareDocumentCommand{\marginBenefit}{m}{%
	\marginEvaluationAbstract{\thumbUp}{#1}% \FASolid\symbol{"F164}
}

\NewTranslation{english}{drawback}{Drawback}
\DeclareDocumentCommand{\marginDrawback}{m}{%
	\marginEvaluationAbstract{\thumbDown}{#1}% \FASolid\symbol{"F165}
}

