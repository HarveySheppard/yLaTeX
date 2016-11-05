# bigGrayStrip
This preamble modifies the look of the Table of Content and chapters.

The color of the strip (gray by default) can be changed by changing the `lightGray` color in the preamble.

The table of content doesn't support more than nine chapter entries. After that, it becomes buggy... Feel free to modifiy the code to adapt it to your needs!

After every `\chapter{}` commands, you should call either `\printMiniToc` or `\newpage`.

If you want to have chapters without the strip, simply put thoses lines in the code since the moment you want to remove them:

```
\titleformat{\chapter}[display]
	{}
	{\thispagestyle{empty}\parbox{4cm}{\hfill\huge \chaptertitlename \hspace*{2mm}}}
	{4pt}
	{
		\begin{minipage}[t]{4.7cm}
			\mbox{}\\
			\null\hfill\fontsize{6.5cm}{1ex}\selectfont\upperNumber{\color{White}\thechapter}
		\end{minipage}
		\hspace*{-5mm}
		\begin{minipage}[t]{\textwidth-4cm}
			\mbox{}\\
			\vspace*{-1.1cm}
			\begin{flushleft}
				\begin{spacing}{5}
					\fontsize{2cm}{1em}\selectfont\chapterfont
	}[\end{spacing}\end{flushleft}\end{minipage}]
\titleformat{name=\chapter, numberless}[display]
	{}
	{\thispagestyle{empty}}
	{0pt}
	{
		\fontsize{2cm}{1em}\selectfont\chapterfont
	}
```
(This is the exact same chapter redefinition as the one in the preamble but with the `\titleBackground` command removed)


**Important:** this code only work if you use XeLaTeX and have Lato (light and regular) and BIRTH OF A HERO fonts installed.
To remove those special fonts and be able to compile it with pdfLaTeX, remove the whole `Font` section as well as all the font commands: `\upperNumber`, `\titlefont`, and `\chapterFont`. Finally, replace the `fontspec` and `polyglossia` packages by the usual `fontenc`, `inputenc` and `babel` packages.
