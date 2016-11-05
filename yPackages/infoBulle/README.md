# infoBulle Documentation

##Include the package

```
\usepackage{infoBulle}
```

To use that package you will need to install it manually. For more instructions on how to install custom packages, see my article in the wiki of this repository or some other LaTeX documentation around the Web.

## Installation Procedure
This package requires font awesome and XeLaTeX (or XeTeX) to work. InfoBulle, by default, is configured to work with the file `FontAwesome_0.otf`. If you installed the font under a different name, try adding the following code to your preambule:

```
\newfontfamily{\FA}{yourFontAwesomeFileName.otf}
```

It will chage the definition of the font family `\FA` which is the font family used by the fontAwesome package for all its commands.

If it does not work either, then change the configuration directly in the infoBulle package (under the font configuration settings). Please, note that this solution should only be used as a last resort one...



## Brief Documentation
This package defines commands to typeset flat informational blocs. The commands are as follow:

```
\infoInfo{<Title>}{<content>}
\warningInfo{<Title>}{<content>}
\criticalInfo{<Title>}{<content>}
\checkInfo{<Title>}{<content>}
\questionInfo{<Title>}{<content>}
\codeInfo{<Title>}{<content>}
```

## Further Documentation and commands showcase
For further documentation or showcase, please look at the Documentation

## Ancient Version Documentation

The infoBulle package mainly define three commands:

+ \normalInfo{Title}{Content}
+ \warningInfo{Title}{Content}
+ \criticalInfo{Title}{Content}

Use them to insert important information that need to be emphased!

The commands name's tell the importance of the information.