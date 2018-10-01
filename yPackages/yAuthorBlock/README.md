# yAuthorBlock

This package provide commands to typeset little blocks containing some informations about the author.


## Usage

To use this package, you must have `\usepackage{fontawesome}` somewhere in your code.
This package does not issue the command itself to avoid conflict with other call to the same command.


## Global Syntax

All informational lines are added using a command of the form `\author<Info>{<text>}[<icon>]` (see below).
All those commands need to be placed inside the `\authorBlock{<informational lines>}`.

## Informational Lines Available

  - `\authorName{<name>}[<icon>]`: display the name of the author, should be the first command to appear
  - `\authorAdressLineOne{<adress line one>}[<icon>]`: display the first line of an address
  - `\authorAdressLineTwo{<adress line two>}[<icon>]`: display the second line of an address
  - `\authorAdressLineThree{<adress line three>}[<icon>]`: display the third line of an address
  - `\authorPhone{<phone number>}[<icon>]`: display the phone number of the author
  - `\authorMail{<mail address>}[<icon>]`: display the email of the author
  - `\authorWebsite{<website address>}[<icon>]`: display the website of the author

All icons are already defined and the optional argument `<icon>` is there only if you want to redefine them.
