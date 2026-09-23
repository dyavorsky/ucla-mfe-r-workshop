# ggplot2

library(ggplot2)

data(mtcars)

# need to specify:
# (1) data, (2) aesthetic mappings, (3) geometry
ggplot(mtcars) + 
    geom_point(aes(x=wt, y=mpg))

# hard-coded elements go outside of the aesthetic
ggplot(mtcars) + 
    geom_point(aes(x=wt, y=mpg), color="blue")

# this isn't what you want
ggplot(mtcars) + 
    geom_point(aes(x=wt, y=mpg, color="blue"))

# elements based on the data do go in the aesthetic
ggplot(mtcars) + 
    geom_point(aes(x=wt, y=mpg, color=as.factor(cyl)))

# add transparency (good when plotting many many points)
ggplot(mtcars) + 
    geom_point(aes(x=wt, y=mpg, color=as.factor(cyl)), alpha=0.5)

# themes allow for quick customization
ggplot(mtcars, aes(wt, mpg)) + 
    geom_point() + 
    theme_bw()

# facets are for plotting small-multiples

mtcars |> 
ggplot() + 
    geom_point(aes(x=wt, y=mpg, color=as.factor(cyl))) + 
    facet_wrap(~cyl)

# bbc's theme
install.packages("remotes")
remotes::install_github("bbc/bbplot")

ggplot(mtcars, aes(wt, mpg)) + 
    geom_point() + 
    bbplot::bbc_style()

# all labels
ggplot(mtcars, aes(wt, mpg)) + 
    geom_point() + 
    ggtitle("My first scatterplot!") + 
    xlab("Weight") + 
    ylab("Miles per Gallon (MPG)") + 
    theme_bw()

# add regression line
ggplot(mtcars, aes(wt, mpg)) + 
    geom_point() +
    geom_smooth(method="lm", col="red", se=F)

ggplot(mtcars, aes(wt, mpg)) + 
    geom_point() +
    geom_smooth()

# histogram instead of scatterplot
ggplot(mtcars) + 
    geom_histogram(aes(wt))

ggplot(mtcars) + 
    geom_histogram(aes(wt), bins=10)

ggplot(mtcars) + 
    geom_histogram(aes(wt), binwidth=0.05)



## PRACTICE QUESTIONS

    # 1. Use the 'diamonds' dataset in the 'ggplot2' package to make the following plot:
    #      x is 'log(carat)', y is 'log(price)' --- ie, aes(x=log(carat), y=log(price))) 
    #      color the points with a different color for each level of 'clarity'
    #      (you may find that transparency is nice addition here)
    #      be sure to label the x-axis and y-axis, and add a title
    #
    #   Add the regression line.




## CHALLENGE QUESTION

    library(ggplot2)
    data(mtcars)

    # The brief: "plot mpg against weight, colour the points by cylinder count,
    # and add the regression line."

    ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(cyl))) +
        geom_point(size = 2) +
        geom_smooth(method = "lm", se = FALSE) +
        theme_bw()

    #   a) The brief asked for one regression line. How many appear? Explain what
    #      colour= is doing besides choosing colours.
    #   b) Not one of the lines drawn has the slope of lm(mpg ~ wt, data=mtcars).
    #      Report that overall slope, and the slope of each line on the plot.
    #   c) Move ONE argument to get a single overall line while keeping the points
    #      coloured. Which argument, and where does it go?
    #   d) Two of the three per-cylinder slopes are less than half the overall
    #      slope. So "weight costs you about 5.3 mpg per 1000 lbs" and "within a
    #      cylinder class, weight costs you about 2.2 to 2.8" are both true of the
    #      same 32 cars. Explain how, and name what the cylinder count is doing in
    #      that comparison.
    #   e) You are asked: "does weight hurt fuel economy, and by how much?" Which
    #      version of this plot do you show, and what do you say about the other?
