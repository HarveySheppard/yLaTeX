# flatTable

This preamble defines some flat table typo.

You can easily change the lines colors by changing those three lines:

```
\definecolor{tableHeader}{RGB}{211, 47, 0}
\definecolor{tableLineOne}{RGB}{245, 245, 245}
\definecolor{tableLineTwo}{RGB}{224, 224, 224}
```


To declare a flat table, use one of the folowing commands: 

```
\begin{tabu}{columns}
```
or

```
\begin{tabu} to <width> {columns}
```


Before the first row, add: `\rowfont{\bfseries\sffamily\leavevmode\color{white}} \rowcolor{tableHeader}`. It will colorize it to the header color and put the text in white.


Example:

```
\begin{tabu} to \textwidth {l X X[1.2] X[1.2] l}
			\rowfont{\bfseries\sffamily\leavevmode\color{white}}
			\rowcolor{tableHeader}
			& Ressource & Comment en gagner & Comment en perdre & \\
			& Argent & Compléter des quêtes,\newline Dans les coffres & Achats & \\
			& Énergie verte & Planter une graine,\newline Se régénère avec le temps & Utiliser la violence,\newline Lancer un sort & \\
			& Coefficient de naturalité & Faire preuve de naturalité,\newline Compléter des sous-quêtes & Utiliser la violence & \\
		\end{tabu}
```

Note that I put an empty column at the beginning and the end of the table (the two `l` columns). This add some extra padding at the beginning and the end of the table and makes it feel more flat, more readable.

This solution is kind of hacky. So if you ever find one better, I will be glad to hear it! The tricky part here, is that the space must be INSIDE the colored lines. So you can't add a  `@{\hspace*{\tabcolsep}}` because the space is added *before* the table not inside.


