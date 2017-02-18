# yFullDesign

This package provides commands to create typographic elements that take the full page width and/or height.

**This is a Work in Progress!**

## Warning

I developp most of my packages with flexibility in mind (I will let you judge if it's successful). However, it is not the case for this package. I will try to leave some liberties to the user but it is too complicated for me to make this package as flexible as one could want.

## Showcase
A showcase of this package commands can be found in the [example directory](../../examples/yFullDesign).

## Package options

**marginpar**: Changes the caption width to match the marginpar width and set `marginpar` as the default `<caption align>` value. One should always use this option when using the `marginpar`caption alignement. If the default alignement should however stay left, use `\makeatletter\renewcommand{\yFullDesign@defaultAlign}{left}\makeatother`

## Full Width Images

For all thoses commands, the caption block is drawn only if a caption text is provided.

    \fullPageImage{image/path.jpg}[<caption text>][<caption align>][<caption style>]

This command draw an image which width equals the page one.

    \fullPageTopImage{image/path.jpg}[<caption text>][<caption align>][<caption style>]

This command draw an image which width equals the page one, aligned to the top of the page. Problems are still encountered because the tikz environment used to print the image out is considered to have a null width and height. For that reason, all text written above the figure in the `.tex` file and on the same page as the figure will be hidden by the figure. *I recommend using a `\newpage` before this command!*

**Caption align** can take following values: left, right, inner, outer, marginpar. Default is left

**Caption style** can take following values: light, lightOpaque, dark, darkOpaque. Default is darkOpaque.

**Notes: ** you can specify some tikz `key=value` in the `<caption style>` argument to customize the caption block
