# infoBulle Documentation


## Include the Package

```
\usepackage{infoBulle}
```

To use that package you will need to install it manually. For more instructions on how to install custom packages, see my article in the wiki of this repository or some other LaTeX documentation around the Web.


## Installation Procedure

This package requires font awesome and XeLaTeX or LuaLaTeX to work. 

Font awesome should be installed on your szstem and visible to XeLaTeX or LuaLaTeX depending on which you use.
Default font awesome files are fetched the following way:

```
\setfontfamily{\FA}{Font Awesome 5 Free Regular}
\setfontfamily{\FASolid}{Font Awesome 5 Free Solid}
```

If your font awesome font files are named differently, please add the following code after you call the `infoBulle` package:

```
\setfontfamily{\FA}{<font awesome regular file>}
\setfontfamily{\FASolid}{<font awesome solid file>}
```


## Brief Documentation

This package defines commands to typeset flat informational blocs. The commands are as follow:

```
\infoInfo{<Title>}{<content>}
\warningInfo{<Title>}{<content>}
\criticalInfo{<Title>}{<content>}
\checkInfo{<Title>}{<content>}
\questionInfo{<Title>}{<content>}
\tipsInfo{<Title>}{<content>}
```


## Further Documentation and commands showcase

For further documentation or showcase, please look at the Documentation

