# yMarginDesign

This package provides a few commands to typeset material in the margin.
It makes use of the marginfix package.
This implies that the marginpar will normally not overlap one another and that the marginpars that are too long to be displayed on the current page will be moved to the next one.

Content is aligned to the inner of the page.
For the alignment to work multiple compilations might be required.

## Warning
This package might be incompatible with the memoir class

## Configuration

All configuration for yMarginDesign package should happen in the following command: `\yMarginDesignConfiguration{<options>}`.
`<options>` follows the pgfkeys syntaxe (the same as the tikz one).

Following configuration options are available:
   - `alignment/.code = {<alignment code>}`.
   By default `<alignment code>` is equal to `\strictpagechecktrue\checkoddpage\ifoddpage\RaggedRight\else\RaggedLeft\fi`.
   You can change those command with any alignment command you like (`\RaggedLeft` for example).
   If you set `alignment/.code = {}`, the LaTeX default alignment will be applied: justified.
   - `color=<color>`, change the marginNoteMark color.

## Commands

`\marginElement{<text>}` put a paragraph in the margin with `<text>` as text.

`\marginNote{<text>}` put a footnote-like number in the text, then typeset a paragraph in the margin, beginning with the same footnote-like number and with `<text>` as text.

`\forcedMarginElement{<text>}` put a paragraph in the margin with `<text>` as text at the exact same height as the command was declared.
The `\forcedMarginElement{}` will *not* be placed using marginfix placement routine.
This implies that `\forcedMarginElement{}` might overlap or go outside the page's margin par area.
This command might be useful to declare side caption for figures or tables.
It should not be used otherwise.

`\forcedMarginNote{<text>}` put a footnote-like number in the text, then typeset a paragraph in the margin, beginning with the same footnote-like number and with <text> as text.
The `\forcedMarginNote{}` will *not* be placed using marginfix placement routine.
This implies that `\forcedMarginNote{}` might overlap or go outside the page's margin par area.
This command should not be used.

`\marginTitle{<text>}` should be used inside a `\marginElement{}` or a `\marginNote{}` command.
It formats `<text>` as some sort of title.
This command is merely an utility to have to same margin title style all over the document and can (should) be redefined to match the author wishes.
