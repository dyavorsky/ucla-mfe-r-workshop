# The Tidyverse

install.packages(tidyverse) # <-- you only ever need to do this once
library(tidyverse)

# tibbles
data(mtcars)
mtcars
mtcars[ , "wt"]

mtcars <- as_tibble(mtcars)
str(mtcars)
mtcars
mtcars[ , "wt"]

# the "pipe" (cmd + shift + m)
sapply(mtcars, mean)
mtcars %>% sapply(mean)

# R now has a "native" pipe |> 
mtcars |> sapply(mean)

# the 5 verbs and group_by
    
    data(mtcars)
    mtcars$carname <- rownames(mtcars)
    mtcars <- as_tibble(mtcars)

    #1. filter() selects rows
    filter(mtcars, wt<3)
    mtcars |> filter(wt<3)
    
    #2. arrange() orders by row
    mtcars |> arrange(desc(cyl), wt)

    #3. select() chooses columns
    mtcars |> select(mpg, disp)
    mtcars |> select(mpg:disp)
    mtcars |> select(-(mpg:disp))

    #4. mutate() creates new columns
    mtcars |> mutate(ismerc = grepl("Merc", carname))

    #5. summarize() with group_by() does aggregations
    mtcars |> 
        group_by(cyl) |> 
        summarise(avgwt=mean(wt), 
                  carcount=n())
    
    #put these together
    newtibble <- 
        mtcars |> 
            mutate(ismerc = grepl("Merc", carname)) |> 
            group_by(cyl, ismerc) |> 
            summarize(avgwt = mean(wt), ncars=n()) |> 
            arrange(desc(ncars))
    newtibble
    
# reshaping data from wide to long
    
    data(iris)
    pivot_longer(data = iris, 
                 cols = Sepal.Length:Petal.Width, 
                 names_to = "measurement_name", 
                 values_to = "measurement_value")
    
    
    
## PRACTICE QUESTIONS
    
    # use the flights data to answer these questions
    data(flights, package="nycflights13")
    
    #1. Convert the flights data.frame to a tibble.
    
    
    
    #2. What is the average airtime per destination?
    
    
    
    #3. Calculate the monthly average departure delay and arrival delay by NY airport ("origin")
    
    
    
    #4. Add the variable "tdf" to the data.table, where "tdf" is the total number of daily flights.
    #   That is, "tdf" is a count of the number of flights that departed each day
    #   As a check, Jan 1, 2013 had 842 flights that day (you should get the same number for Jan 1)
    
    
    
    #5. Delete the variable time_hour from the data.table
    
    


## CHALLENGE QUESTION

    library(dplyr)
    data(flights, package="nycflights13")

    # "What share of flights left late?"

    late   <- flights |> filter(dep_delay >  0)
    ontime <- flights |> filter(dep_delay <= 0)

    nrow(late)
    nrow(ontime)
    nrow(late) / (nrow(late) + nrow(ontime))

    #   a) Every flight is either late or not late, so nrow(late) + nrow(ontime)
    #      should equal nrow(flights). Report all three numbers and the gap.
    #   b) Identify the missing rows. Why did filter() drop them silently instead
    #      of keeping them, warning, or erroring?
    #   c) Those rows are not noise -- for a question about delays they are arguably
    #      the most important flights in the dataset. What are they, and what does
    #      their disappearance do to your headline number?
    #   d) Report the share of late flights three ways: out of the rows filter()
    #      kept, out of all rows, and out of flights that actually departed. All
    #      three are defensible. Say which one you would publish and what caveat
    #      you would have to publish beside it.
    #   e) Write a version of the pipeline that makes the dropped rows impossible
    #      to miss -- the result should report how many rows it set aside.
