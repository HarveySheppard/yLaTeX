#YMemoir


## Showcase
A showcase of this template can be seen in the [example directory](../../Example/yMemoir).

##Prerequisites
You must compile this class with XeLaTeX for it to work properly.


##Class options

	. noColorBullet, defines that the bullet point and enumerate numbers are in black; by default, they are in the main color
	. noFrenchBullet, the em dash bullet points are replaced with normal bullet in itemize
	. french, sets the document in french
	. article, this option is useful if you don't use the chapter sectioning. It redefines the section numbering (removes the chapter number to only leave the section number).


## Title page
To create a title page that takes a whole page, call: `\yTitle{<subtitle>}{<title>}{<author/date>}`.

To create a title page with the body text begining on the same page, call: `\yArticleTitle{<subtitle>}{<title>}{<author/date>}`.


## Colors
To redefine the document main color, use the `\definecolor{mainColor}{<model>}{<values>}` (according to the xcolor syntaxe)


## Lists
The yMemoir class defines some commands for listings:

	1. items (equivalent of itemize)
	2. enum (equivalent of enumerate)
	3. descr (equivalent to description)

For definitions, yMemoir implements the `\itemColor{<item>}` command. It typeset definition items in bold, in the mainColor and in the margin.


## Margin notes
To add some note in the margin, use the `\sidenote{<note text>}` command.


## Figures
###Body Figures
The yMemoir class defines an environment for figures with caption in the margin paragraph: `\begin{SCfigure}[][ht!]`. The first argument should be left empty, the second is the float placement. This souhld be the default command used for figures!

**Avoid using the `\begin{figure}` environement!**

###Side Figures
If you want to add a table in the margin, use:

```
\sidefigure[<nameInListOfFigure>]{<caption>}{<figure>}
```

If you want the figure to spread to the margin paragraph width, use `\includegraphics[width=\marginparwidth]{image/path.jpg}` when you include the figure.


## Tables
For all tables, I recommend using the commands descibed in **[Encore à remplir](../)**.

###Body Tables
For body tables, use `tabu` commands inside a `SCtable` environment:

```
\begin{SCtable}[][ht!]
	\begin{tabu}{<cols>}
		\tableHeaderStyle
		first & line & of & the table\\
		other & lines & of & the & table\\
	\end{tabu}
	\caption{<caption text>}
\end{SCtable}
```

If your table spreads across multiple pages, use the `longtabu` environment instead of `tabu`.

For the table to spread to the text width: `\begin{tabu} to \linewidth {<cols>}`. And then <cols> will need to contain command for columns such as `X`.

###Side Tables
If you want to add a table in the margin, use:

```
\sidetable[<nameInListOfTable>]{<caption>}{<table>}
```

If you want the table to spread to the margin paragraph width, use `\begin{tabu} to \marginparwidth {<cols>}`


##Full Width Elements (Table or Figure)
To make an element (generally a table or a figure) across the whole page (document body and margin paragraph), use the `whole` environment. The content will be left or right aligned depending on the page being odd or even. If you want the content to be centered, use the `centered` environment.

Example:

```
\begin{figure}[ht!]
	\begin{whole}
		\includegraphics[width=\linewidth]{image/path.jpg}
		\caption{<caption>}
	\end{whole}
\end{figure}
```

## Quotation

For citations that fill the text width, use the `\blockQuote[<author>]{<citation>}` command.

For citation in the margin, use: `\sidequotation[<author>]{<content>}`.

Finally, for full width quotation, use `\fullQuote[<author>]{<content}`

##Metadata
After calling the yMemoir class, please call the

```
\hypersetup{
	pdftitle={<Title>},
	pdfsubject={<Subject>},
	pdfauthor={<Your name>},
	pdfkeywords={{<keyword 1>}{<keyword 2>}},
}
```
macro and fill it accordingly to your document.

## Page Background
To add the vertical line as seen with the chapter pages, use `\backgroundThisPageColor` or `\backgroundThisPageGrey`.

*Note: in the text, only the grey line should be use. That way, a clear distinction is made between text and chapters.*


## Headers and Footers

###Headers
yMemoir defines some default headers. For them to work, please append the following code just before the `\begin{document}` command:

```
\makeatletter
\let\runauthor\@author
\let\runtitle\@title
\makeatother
```

To disable the headers, pass the `noHeaders` option to the yMemoir class.


###Footers
Use

```
\makeevenhead{yMemoir}{<left>}{<center>}{<right>}
\makeoddhead{yMemoir}{<left>}{<center>}{<right>}
\makeevenfoot{yMemoir}{<left>}{<center>}{<right>}
\makeoddfoot{yMemoir}{<left>}{<center>}{<right>}
```

to change the content of the header and footer.

If you want the footer to not be centered regarding the page but regarding the typeblock, use `\pagestyle{plain}` and

```
\makeevenhead{plain}{<left>}{<center>}{<right>}
\makeoddhead{plain}{<left>}{<center>}{<right>}
\makeevenfoot{plain}{<left>}{<center>}{<right>}
\makeoddfoot{plain}{<left>}{<center>}{<right>}
```

to customize the header and footer content.

## End of Chapter
If you want to, the `\yEndOfChapter` command typeset some ornament for the end of the chapter.

##Ornaments
The yMemoir class does provide four ornaments:

    \yOrnamentOneTop
    \yOrnamentOneBottom
    \yOrnamentTwoTop
    \yOrnamentTwoBottom