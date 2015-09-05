# XeLaTeX

The `xelatexPackage.tex` file is *my* default configuration for XeLaTeX. It requires the following:

+ Have Lato (regular, regular italic, light, light italic) installed on the system
+ Have Source Code Pro (regular, light, light italic) installed on the system
+ Have BIRTH OF A HERO installed on the system

If you don't have those fonts, you can simply change the font settings with the ones you want or just delete it to use the default font.

Of course, you need to compile that file with XeLaTeX. If you are using MiKTex or TexLive full, it shouldn't be a problem as XeLaTeX will automatically be installed. Otherwise, you will need to install it manually.


##This config file typo
This config use the `bigGrayBand` typo for titles and table of content and the `flatTable` typo for table that you can find in this repo under the `/typographyArchive/` folder.

For every table that you create, insert the following line at the beginning of the first table line:

```
\begin{tabu}{lll}
	\rowfont{\bfseries\sffamily\leavevmode\color{white}}
	\rowcolor{mainColor}
	my text & in the & first line\\
...
```

If you don't like the typo, simply delete the "Colors", "Titling", "Toc and Mini-ToC", "Tikz" and "Table" sections as well as the three lines of code inside the document environment. 