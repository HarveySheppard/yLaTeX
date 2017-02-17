# YMemoir

This class aim to provide a beautiful class for LaTeX document, combining old typography (margin paragraph) with flat design.

## Showcase
A showcase of this template can be seen in the [example directory](../../examples/yReport).

##Prerequisites
You must compile this class with XeLaTeX for it to work properly. The fonts given in the `.fonts/` folder are required. You also need the `infoBulle` package.

##Starting code
Here is the starting code I use:

```
\documentclass[french]{yReport}

\author{Your name}
\subtitle{Subtitle}
\title{Title}

\hypersetup{
	pdftitle={Title},
	pdfsubject={Subject},
	pdfauthor={Your name},
	pdfkeywords={{keyword 1}{keyword 2}},
}

\makeatletter
\let\runauthor\@author
\let\runtitle\@title
\makeatother

\begin{document}
	\titleTwo
\end{document}
```
