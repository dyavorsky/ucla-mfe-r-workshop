# basic math on "scalars"
    2 + 3
    6 * 7
    log(exp(10)) #natural log, as in "ln"!
    sqrt(81)
    abs(-41)

# variables (assigning a name to the result of an expression)
    x <- 10    # <--- (alt minus shortcut)
    y = 9.1
    x * y

    My_result91 <- x * y
    My_result91
    my_result91 # error - R is case sensitive!

# mode / typeof / class / structure
    mode("me")
    mode(4.1)
    typeof(4.1)
    typeof(4L)
    class(as.Date("2010-01-13"))

    str("me")
    str(TRUE)
    str(4L)
    str(4.1)
    str(as.Date("2010-01-13"))
    
# checking / casting
    is.numeric(4.1)
    is.character("2010-01-13") 
    is.character("4")
    as.numeric("4")
    as.numeric(FALSE)
    as.numeric(TRUE)
    is.logical(1)
    is.logical(TRUE)
    TRUE + 4
    
# vectors (row or column, no difference)
    # sequences
    c(2, 4, 6, 8)
    seq(from=2, to=8, by=2)
    1:4*2
    1:4^2
    
    # repeat
    rep(4, times=3)
    rep(6:8, 2)
    rep(6:8, each=2)
    
    # must be the same type
    rm(x, y)
    x <- c(1, 3, "Q")
    y <- 4:10
    c(x, y)
    
    # MANY functions are "vectorized"
    x <- 1:3
    y <- 7:9
    x + y
    sqrt(x)
    log(y)
    as.character(x+y)
    
    # vector recycling
    x <- 1:10
    y <- c(10, 100)
    x+y
    cbind(x, y, sum=x+y)
    1:10 + 1
    1:10 + 1:2
    1:10 + 1:3
    
    # subsetting
    rm(list=ls())
    x <- 10:20
    x
    x[1]
    x[4]
    x[c(1,4)]
    x[1,4] # error!
    x[1:4]
    x
    x[-1]
    x[-(1:8)]
    
    # logical operators
    x <- 1:3
    x
    x == 1
    x != 2
    x < 3
    x >= 2
    !(x>=2)
    x>0 & x<=2
    any(x==2)
    all(x<2)
    
    # logical vectors and subsetting
    x <- 10:20
    y <- x %in% c(10,13)
    x
    y
    x[y]
    x[c(TRUE, FALSE)] #watch out for recycling!
    
    # everything is a function
    x <- 1:5
    `>`(x,2)
    x > 2
    
    # handy functions: length, seq_along, which, paste
    x <- letters[1:10]
    length(x)
    seq_along(x)
    which(x %in% c("d", "a", "n"))
    
    paste(c("a", "b", "c"), c("x", "y", "z"))
    paste0(c("a", "b", "c"), c("x", "y", "z"))
    
    sentence <- c("I'm", "learning", "R")
    paste(sentence, collapse = " ")
    paste("hi", "there", sep=" | ")
    paste0("path/to/folder/", "myfile.csv")
    
    # replacing elements
    x <- 1:10; rm(y)
    x[2] <- 250; x
    x[2:4] <- 100; x
    x[1:4] <- c(50, 30); x
    x[x<50] <- NA; x
    
    # naming elements
    myvec <- c(one=1, two=2, three=3, dan=100)
    myvec
    urvec <- c(why=2, "so"=3, inconsistent="4") #or is it?
    urvec
    
# NULL, NA, NaN, Inf
    x <- 5:8
    x[2] <- NA
    x
    length(x)
    x[5]
    x[is.na(x)] <- 0

    y <- NULL
    length(y)
    
    400/0 # Inf
    0/0   # NaN

# built in vectors
    print(pi, digits=20)
    letters
    LETTERS
    month.abb
    month.name
    exp(1)
    colors()    

# math functions for vectors
    x <- 1:100
    mean(x)
    sd(x)
    max(x)
    summary(x)
    sum(x)
    cumsum(x)
    cumsum(x)[c(99, 100)]
    
    x[30:40] <- NA
    mean(x)
    mean(x, na.rm=TRUE)

# pesudo random numbers
    hist(rnorm(1000))
    hist(rnorm(1000, mean=10, sd=0.5))
    hist(rnorm(10))

    rnorm(3)
    set.seed(1234)
    rnorm(3)
    set.seed(1234)
    rnorm(3)


    
    
## PRACTICE QUESTIONS
    
    #1. Use "which" and "letters" to find the position in the alphabet of the vowels
      
    
      
    #2. Generate the sequence 1^2, 2^2, ... 20^2
        
    
    
    #3. Write code without using the which() function that does the same thing as which(x==3):
        x <- c(2,4,3,1,0,3)
        which(x==3)
        
        
        
    #4. How many english colornames does R recognize that are longer than 8 characters? (use "nchar") 
    #   Hint: use ?nchar to see its help file
        
        
        
    #5. Thanksgiving is the 4th Thursday of November.  Professor Rossi's birthay is Nov 25.  
    #   Find all years between (and including) 1950-2050 in which his birthday is on Thanksgiving. 
    #   (hint1: you'll probably want to use "seq" and "as.Date", possibly also "weekdays" or other functions not yet discussed)
    #   (hint2: if Nov 25 is on a Thursday, must it be the 4th Thursday of the November?)
        
    
    
    
    
    
    
    


## CHALLENGE QUESTION

    # Monthly excess return = each month's return minus the risk-free rate for the
    # quarter that month falls in. The code below runs with no error and no warning.
    # It even produces the correct *average* excess return. Most of the twelve
    # monthly values are nevertheless wrong.

    set.seed(2026)
    monthly_return <- round(rnorm(12, mean=0.01, sd=0.04), 4)  # Jan ... Dec
    quarterly_rf   <- c(0.004, 0.005, 0.006, 0.007)            # Q1, Q2, Q3, Q4

    excess <- monthly_return - quarterly_rf

    mean(excess)      # the check you would naturally run
    sum(excess < 0)   # months that lost money net of the risk-free rate

    #   a) R did something to quarterly_rf before subtracting. What, exactly?
    #      Print the 12 values it effectively used.
    #   b) Why no warning here, when 1:10 + 1:3 earlier in this script did warn?
    #   c) Fix it by changing only the line that creates 'excess'. No loops.
    #   d) Report sum(excess < 0) before and after the fix.
    #   e) The lesson: mean(excess) is IDENTICAL before and after, even though most
    #      of the monthly values changed. Explain why. Then state, in one sentence,
    #      what that implies about using a summary statistic to check your work.
