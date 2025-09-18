+++
title = "Visualization & Reporting"
weight = 30
pre = "<b>3. </b>"
+++

**Submit Attendance:** [link](https://bruinlearn.ucla.edu/courses/144052/assignments/1849383)

**Files for today:** 
[functions](https://www.dropbox.com/scl/fi/jkdf6kn4l8gyev4100piv/code7-functions.R?rlkey=w31olrnn36dij6vu8wmn46ggr&dl=0) | 
[base plots](https://www.dropbox.com/scl/fi/d62i6mf2ytct6zxik8wzi/code8-base-plots.R?rlkey=yklnplvuivgs5opd083t1t9v0&dl=0) | 
[ggplot2](https://www.dropbox.com/scl/fi/39lflh337hph1sf62viny/code9-ggplot.R?rlkey=lcwczxbaje1z7narfjc1oh2xk&dl=0) | 
[quarto](https://www.dropbox.com/scl/fi/zjsb6l7lxxe9fgqtb5gdc/code10-quarto.qmd?rlkey=7rcix3pnzx2jh7teljue7w39e&dl=0) | 
[solutions](https://www.dropbox.com/scl/fi/5028ib2riey1ke48obbhg/solutions.R?rlkey=npad67gw5qloktjjrqxtsd1qx&dl=0)

---


#### Functions and Control Flow

- Use the `function()` function to create your own function
- Functions have:
  - Formals, which are the list of arguments that control how you call the function
  - A body, which returns the last evaluated expression or whater you put in `return()` 
  - An environment, which determines scoping (ie, how the function finds the values associated with named objects)
- There are some R-specific things to be aware of
  - Lazy evaluation
  - Things that appear to have the same name, eg `fun(x=x)`
  - Anonymous "lambda" functions
- Control Flow
  - `if() {...} else {...}`, and `ifelse()`
  - `with` assignment
  - loops via `foreach()` and `while()`



#### Base Plots

- R has excellent plotting capabilities, but often requires lots of code to fully customize the plot
- Base plots are static
  - No resizing or zooming
  - Adding elements to a plot is done by layering on top, not modifying what exists
- You'll often want to change:
  - The color `col`, point character `pch`, fill color `fill`, line width `lwd`, or size via character expansion `cex`
  - The title `main`, horizonal axis label `xlab`, and vertical axis label `ylab`
  - Margins via `par(mar=c(...))`
  - Any many other features, several highlighted in these [[article1](https://towardsdatascience.com/base-plotting-in-r-eb365da06b22), [article2](https://www.jumpingrivers.com/blog/styling-base-r-graphics/)]
- Add elements to your plot with:
  - `lines()`, `curve()`, `text()`, or `points()`
  - or customize the `axis()`
  - and add a `legend()`
- To combine multiple plots:
  - Use `par(mfrow=c(x,y))`
  - Control outer margins with `par(oma=c(...))`
  - Place a title via `title()` 
  - `layout()` offer richer arrangements of subplots



#### ggplot2

- An introduction:
  - The ggplot2 package is Hadley Wickmham's implementation of a Grammar of Graphics described in Leland Wilkinson 2005 [book](https://www.jumpingrivers.com/blog/styling-base-r-graphics/)
  - It is immensely popular, with re-implementations in Python and Julia
  - It is powerful and expressive method of creating graphics, and well documented with a [website](https://ggplot2.tidyverse.org/), [book](ggplot2-book.org), and many other resources
- Every ggplot involves
  - A dataset usually via `ggplot(data)`
  - Aesthetic mappings from variables in the dataset to plot elements, eg, `aes(x=height, y=weight)`
  - One or more geometric objects (eg, points in a scatterplot via `geom_point()`)
- You'll often want to annotate basic elements with `labs()` such as `x`, `y`, `title`, and `subtitle`
- More advanced aspects of the plotting system involve
  - A statistical transformation of the data
  - A scale to control the mapping from data to aesthetic attributes
  - A coordinate system
  - Facets, for creating small multiples of plots
- The theme system provides fine control over the non-data elements of the plot



#### Quarto

- [Quarto](https://quarto.org/) is an open-source scientified and technical publishing system created by the team at Posit
- A Quarto document
  - Can be a Jupyter Notebook or a plain text .qmd file with a YAML header
  - Consisting of Pandoc markdown and code chunks
  - Renders to multiple output formats including PDF, MS Word, HTML
  - Enables reproducible research and literate programming
  - Will likely be the mode via which you compose your homework assignments
- Pandoc markdown syntax:
  - Is quite simple and the basics can be learned in an hour
  - Includes Latex math equations, citations, cross references, and more
- Code chunks:
  - Begin and end with three back ticks `` ` `` (near escape key on keyboard)
  - Support a variety of languages, including R, Python, Julia, C++, BASH





