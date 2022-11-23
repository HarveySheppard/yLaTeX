# yMainColor

This package simply defines five colors:
   - a `mainColor`
   - a `secondColor`
   - a `lightGrey` color
   - a `middleGrey` color
   - a `darkGrey` color

In modern web design, those generally all colors used.
This package is a helper for other classes and packages that would require such color.
It avoid problem with each package/class defining its own mainColor, grey sorts, etc.

## Change the default values
Either use `\definecolor{<color name>}{<model>}{<values>}` or `\colorlet{<color name>}{<second color name>}` where color `<color name>` is in the list `mainColor`, `secondColor`, `lightGrey`, `middleGrey` or `darkGrey` and `<second color name>` is an already defined color.
