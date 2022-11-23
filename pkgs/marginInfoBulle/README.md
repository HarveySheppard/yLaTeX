# marginInfoBulle

## Prerequisites

For this package to work, it is required that infoBulle and yMarginDesign are installed.

## Commands

Each of the commands described bellow has a starred version (`\theCommand*{<the arguments>}`) that remove the marginInfoBulle mark (comparable to the footnote mark, but with the icon corresponding to the command called).

```
\marginInfo[<Title>]{<Text>}
\marginQuestion[<Title>]{<Text>}
\marginWarning[<Title>]{<Text>}
\marginCheck[<Title>]{<Text>}
\marginTips[<Title>]{<Text>}
\marginCritical[<Title>]{<Text>}
```

If no `<title>` is provided, then:
   - "Information" will be the title for the `\marginInfo` command
   - "Question" will be the title for the `\marginQuestion` command
   - "Warning" will be the title for the `\marginWarning` command
   - "Example" will be the title for the `\marginCheck` command
   - "Tip" will be the title for the `\marginTip` command
   - "Difficulty" will be the title for the `\marginCritical` command

To change the default title, use `\RenewTranslation{<lang>}{<key>}{<text>}`, where `<lang>` is the language of the translation (french, english, german, etc.), `<key>` is in the list: info, question, warning, check, tips, critical, and `<text>` is the text of the string.

*Note*: All marginInfoBulle are placed in the closest possible area in the margin par.
This can be the next page or even further if you put a lot of material there.
This comes from the fact that marginInfoBulle uses the marginfix package.

## Translations

marginInfoBulle uses the `translations` package to handle all its translations.
Currently, english, french and german are supported.
To add translations for a language, add a `\NewTranslation{<lang>}{<key>}{<text>}` in your document for all strings you wish to translate.

