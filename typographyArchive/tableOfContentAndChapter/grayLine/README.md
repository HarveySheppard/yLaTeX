# grayLine
This preamble modifies the look of the Table of Content and chapters.

The table of content doesn't support more than ten chapter entries. After that, it becomes buggy... Feel free to modifiy the code to adapt it to your needs!

After every `\chapter{}` commands, you can should call `\printMiniToc` to show the chapter's number and table of content.


**Important:** this code only work if you use XeLaTeX and have Lato (light and regular) and BIRTH OF A HERO fonts installed.
To remove those special fonts and be able to compile it with pdfLaTeX, remove the whole `Font` section as well as all the font commands: `\upperNumber`, `\titlefont`, and `\chapterFont`. Finally, replace the `fontspec` and `polyglossia` packages by the usual `fontenc`, `inputenc` and `babel` packages.
