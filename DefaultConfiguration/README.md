# Default Configuration

This part of the repo is not maintained.
The files are left for those who would still be interested.
However, I highly recommend using the yClasses instead.

## XeLaTeX Config

The `xelatexPackage.tex` file was my default configuration for XeLaTeX. It requires the following:

+ Have the Lato font (regular, regular italic, light, light italic) installed on the system
+ Have the Source Code Pro font (regular, light, light italic) installed on the system
+ Have the BIRTH OF A HERO font installed on the system

If you don't have those fonts, you can simply change the font settings with the ones you want or just delete it to use the default font.

Of course, you need to compile that file with XeLaTeX. If you are using MiKTex or TexLive full, it shouldn't be a problem as XeLaTeX will automatically be installed. Otherwise, you will need to install it manually.


### Design in use
The XeLateX config use the `bigGrayStrip` typo for titles and table of content and the `flatTable` typo for table that you can find in this repo under the `/typographyArchive/` folder.

For every table that you create, insert the following line at the beginning of the first table line:

```
\begin{tabu}{lll}
	\rowfont{\bfseries\sffamily\leavevmode\color{white}}
	\rowcolor{mainColor}
	my text & in the & first line\\
	...
\end{tabu}
```

If you don't like the typo, simply delete the "Colors", "Titling", "Toc and Mini-ToC", "Tikz" and "Table" sections as well as the three lines of code inside the document environment.
