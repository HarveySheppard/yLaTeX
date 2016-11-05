#YInvoice
**This work is my adaptation of the original [dapper-invoice](https://github.com/mkropat/dapper-invoice) class to which almost all credits are to be given.**

##Showcase
A showcase of this template ca be seen in the [example directory](../../examples/yInvoice).


##Default template
Here is the default code one should write when using yInvoice:

    \documentclass{yInvoice}
    
    \business{<Your (business) name>}
    \invoiceNumber{<invoice number>}
    \client{<client name>}{<client adress line 1>}{<client adress line 2>}[<client adress line 3>]
    \project{<project name>}
    \contact{<contact name>}[<contact phone number>][<contact mail>]
    \yourself{<your name>}{<your adress line 1>}{<your adress line 2>}[<your adress line 3>][<your phone number>][<your email>]
    \bank{<bank name>}{<your iban>}
    \duein{<invoice due in # days>}
    \balancePrice{<balance price>}
    
    \begin{document}
    	\printInvoiceHeader
    	
    	\begin{costsDescription}{<total price including already paid>}{<already paid>}
    		\costEntry{<Entry name>}{<date>}{<entry description>}{<hours number>}{<price per hour>}{<total cost>}
    	\end{costsDescription}

        \vfill
        \textit{<Your name>}
    \end{document}