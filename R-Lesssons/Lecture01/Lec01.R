#'---
#' title: "Lecture 1"
#' output: word_document
#'---
#'

#' Trying R
#' ========
#'
#' Working in the Console
#' ----------------------
#' Try entering some expressions
1 + 1
(2+3)/2

#' What is the "[1]"? We'll see soon

#'
#' You don't have to type everything
#'----------------------------------
#' * Place the cursor anywere on a line containing R code
#' * Press Ctrl-Enter
#' * Highlight and Ctrl-Enter to execute several lines
#' 
#' Try it
2*3 + 1

#'
#' Creating variables
#' ------------------
ageAtEntry = 30
ageAtDeath = 71

#' Look at the environment tab: do you see the variables? 
#' (the commands will also appear in the history tab)

#'
#' Showing values in the console
#' -----------------------------
#' In general, entering the name of something all by
#' itself causes its contents to be displayed.
#' Try running each of these
ageAtEntry
ageAtDeath

#'
#' R Suggestions
#' -------------
#' In the console, start typing `age` SLOWLY
#' Note that R gives you suggestions. Use the arrow keys to
#' pick the one you want, Enter or Tab to select.

#' Do it again with the incorrect capitalization
ageAtEntry

#'
#' Suggestions for function names
#' ------------------------------
#' Type `sqrt` SLOWLY
#' F1 bring up more help
#' Hit enter: note the automatic parentheses

#'
#' Requesting suggestions
#' ----------------------
#' The tab key will request suggestions
#' Try tab at the end of
sq

#' 
#' More console features
#' ---------------------
#' * Try using the up/down arrow keys
#' * Change the value of `ageAtScreening` to 18 using the arrow keys
#' * To clear the console, use Edit > Clear Console or Ctrl-L

#'
#' Reading a dataset into R
#' ------------------------
#' click on the files tab: note the file "airquality.csv"
#' 
#' we can read it into R using
#' aq = read.csv('airquality.csv')
#' 
#' Put the cursor inside the quotes and hit tab
aq = read.csv('airquality.csv')

#' Ctrl-enter on that line: do you see the dataset in 
#' environment?

#'
#' Peeking inside a dataset
#' ------------------------
#' * Click on the blue arrow next to the name of the dataset
#' * Click on the name of the dataset

#'
#' Using variables inside a dataset
#' --------------------------------
#' Try (Ctrl-Enter)
ozone

#'
#' Making the variables visible
#' ----------------------------
library(PubH6002)
use(aq)

#' now try (Ctrl-Enter)
ozone

#' Note: Do you see what the [] are?
#'
#' plotting
#' --------
#' try (Ctrl-Enter) the following
hist(ozone)

#' Errors
#' ======
#'
#' Unexpected something
#' --------------------
#' Try (Ctrl-Enter) the following
1 + , 2

x = (1+2))

#' If you see "unexpected" look for a misplaced or extra
#' character (it will usually be obvious)

#'
#' Incomplete statement (The "+" tar pit)
#' --------------------------------------
#' Try the following
2 *

#' Press Esc to force the current statement to end

#'
#' Object not found
#' ----------------
#' Ctrl-Enter the following
hist(Ozone)

#' If an object isn't found, it's usually either 
#' a) spelled/capitalized wrong, or b) hidden inside a dataset

#'
#' Looking for an object
#' ---------------------
#' * Look in the environment
#' * Look inside datasets
#' * Use tab (R's suggestion mechanism)

#'
#' Could not find function
#' -----------------------
#' Try
Hist(ozone)


#'
#' Bad arguments to operator
#' -------------------------
#'
'1' + 1


#' General strategies for errors
#' -----------------------------
#' * Look for clues in the error message: 
#'   what part of the line is it complaining about?
#' * Look for the obvious: capitalization, extra parens, extra commas
#' * Did you put quotes where they're not needed? or forgot them?
#' * Try individual parts of the statement, especially individual variables.
#' * It gets easier with practice!

#'
#' More work with datasets and variables
#' ======================================
#' 
#' Summarizing a dataset
#' ---------------------
#' Try
summary(aq)

#' 
#' Summarizing a variable
#' ----------------------
summary(ozone)

#' Plotting one variable against another
#' -------------------------------------
#' R's form is:  Y-variable ~ X-variable
#' 
#' Try
plot(solarR ~ temp)

#' Try plotting Ozone against temperature (use R's 
#' suggestions)
plot()

#'
#' What happens if you plot the dataset aq?
 
#' 
#' Creating a word document
#' ------------------------
#' Try File > Compiler Notebook ...
