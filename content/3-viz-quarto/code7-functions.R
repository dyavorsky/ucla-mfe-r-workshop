# FUNCTIONS

# example 1
    plus_two <- function(q) {
        q+2
    }
    plus_two(4)
    plus_two("hi") #error
    
# example 2
    two_x_three_y <- function(x, y=5) {
        #defensive programming
        if(is.data.frame(x)) stop("No dataframes allowed!")
        
        # create new variables LOCAL to the function
        a <- 2
        b <- 3
        
        # return something to the user
        return(a*x + b*y)
    }
    
    #example of defensive programming in the correlation function
    cor
    
    # how the x and y arguments work
    two_x_three_y(x=2, y=1)
    two_x_three_y(2, 1)
    two_x_three_y(4)
    two_x_three_y(y=3, 4) # this works, but don't do this
    two_x_three_y(x=data.frame(1:10), y=10) # error!
    
    x <- 4
    two_x_three_y(x=x, y=1)
    two_x_three_y(x, 1)
    
    y # error!
    b # error!

# example 3
    rm(list=ls())
    
    x_plus_y <- function(x=1, y=1) {
        stopifnot(is.numeric(x), is.numeric(y))
        
        # last calculation returned even without "return()"
        x + y
    }
    
    x_plus_y(3, 4)
    x_plus_y()
    
    x <- 10
    y <- 10
    x_plus_y()    # 2, not 20!
    x_plus_y(x,y) # 20!

# example 4
    rm(list=ls())
    
    # using global variables inside of functions is **bad** practice!
    e3 <- function() x + 10
    
    # this is because changing the global value changes the function's result
    x <- 5
    e3()
    
    x <- 15
    e3()

# example 5
    mm <- matrix(1:100, 10, 10)
    
    # usually we use an existing function with apply, like mean
    apply(mm, 1, mean)
    
    # but we can also use our own functions
    myfun <- function(x) mean(x) + 1000
    apply(mm, 1, myfun)
    
    # or you can use an anonymous function
    # e.g., how many numbers are multiples of 3 per row
    apply(mm, 1, function(x) sum(x%%3 == 0) )
    apply(mm, 1,        \(x) sum(x%%3 == 0) )
    


# CONTROL STATEMENTS
    
    # if, else, and ifelse
    if(1:10 == 2) {
        print("Yes")
    } else {
        print("No")
    }
    
    # you need the vectorized ifelse() function
    ifelse(1:10 == 2, "yes", "no")
    
    # with assignment
    x <- if(any(1:10 == 2)) {
                sum(1:10==2)
            } else {
                "none"
            }
    x
    
    if(any(1:10 == 2)) {
        x <- sum(1:10==2)
    } else {
        x <- "none"
    }
    x
    
    y <- ifelse(1:10 == 2, "is 2", "not two")
    y
    
    
    # loops
    for (i in 1:5) {
        print(paste("My number is", i))
    }
    i
    
    for (i in 1:5) {
        paste("My number is", i)
    }
    
    for (i in 1:3) print(i+2)
    
    
    x <- letters[1:4]
    for (i in x) {
        print(i)
    }
    i
    
    result_list <- vector(mode="list", length=10)
    for (i in seq(result_list)) {
        result_list[i] <- i*100
    }
    unlist(result_list)

    
    
## PRACTICE QUESTIONS
    
    #1. This function should replace NAs with zeros. Finish it by replacing the ...'s
    na_to_zero <- function(vec_with_nas) {
        stopifnot(is.vector(...))
        fixed_vec <- ifelse(is.na(...), ..., ...)
        return(fixed_vec)
    }
    
    
    #2. Write a function that takes in this dataframe (example_df) and calculates the  
    #   correlation between the first column and every other column using a loop.
    set.seed(234)
    example_df <- mapply(function (x) sample(1:(x*10), 10, T), 1:5)
    
    corr_with_col1 <- function(...) {
        ...
    }
    
    
    #3. Use an apply function and an anonymous function to calculate sum(x^2 - 10) 
    #   for each vector in the following list
    testlist <- list(
        x1 = 1:10,
        x2 = 11:20,
        x3 = 21:30
    )

    
    
    
    
        
    


## CHALLENGE QUESTION

    rm(list = ls())

    # An earlier piece of analysis left this behind in your environment:
    x <- c(1, 2, 3)

    # ...and here is a function that standardizes a vector to mean 0, sd 1:
    standardize <- function(vec) {
        (vec - mean(x)) / sd(x)
    }

    a <- c(10, 20, 30, 40)
    b <- c(5, 5, 6, 7)

    mean(standardize(a))    # should be 0
    sd(standardize(b))      # should be 1

    #   a) Both checks fail and R never complains. Find the typo. How many
    #      characters does the fix change?
    #   b) Explain, using the scoping rules from example 4 above, why the function
    #      ran at all instead of erroring.
    #   c) Run rm(x), then call standardize(a) again. You now get an error. Argue
    #      that the error is the BETTER outcome.
    #   d) standardize() is deterministic and returns the same wrong answer every
    #      time, so re-running it proves nothing. Describe the check that would
    #      actually have caught this, and explain why running your script top to
    #      bottom in a fresh R session is that check.
    #   e) rm(list=ls()) at the top of a script protects you from some of this but
    #      not all of it. What does it miss? (Think about attached packages, and
    #      about options set earlier in the session.)
