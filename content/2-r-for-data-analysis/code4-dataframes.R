# Data Frame (like an Excel spreadsheet)
    # make a list, convert to dataframe
    set.seed(1234)
    mylist <- list(
        col1 = 1:10,
        col2 = round(runif(n=10, min=25, max=75), 2),
        col3 = sample(x=letters[23:26], size=10, replace=TRUE)
    )

    mylist

    df1 <- as.data.frame(mylist)
    df1

    # exact same dataframe, but this time directly
    set.seed(1234)
    df2 <- data.frame(
        col1 = 1:10,
        col2 = round(runif(10, 25, 75), 2),
        col3 = sample(letters[23:26], 10, replace=T)
    )
    df2

# dataframe basics
    length(df1)
    ncol(df1)
    nrow(df1)
    dim(df1)
    names(df1)
    colnames(df1)
    rownames(df1)
    head(df1)
    tail(df1)
    str(df1)
    summary(df1)
    View(df1) # <-- new window! notice the capital "V"

# Factors -- "categorical" variables
    df2
    str(df2)
    
    df2$col3 <- as.factor(df2$col3)
    
    df2
    str(df2)
    
    model.matrix( ~ 0 + df2$col3)
    model.matrix( ~ df2$col3)

    levels(df2$col3)

    as.integer(df2$col3)

    table(df2$col3)

# subset - extract columns like they're list elements
    # dollar sign
    df1$col1

    # double brackets
    df1[[2]]
    df1[["col2"]]
    df1[[col2]] # error -- what is the object 'col2'? it doesn't exist

    # single brackets (returns a data.frame!)
    df1["col3"]
    class(df1["col3"])

    lapply(df1[ , c("col1", "col2")], mean)
    sapply(df1[ , c("col1", "col2")], sum)

# extract subset of rows (like rows of a matrix)
    df1[df1$col2 < 50, "col1"]
    df1[df1$col2 < 50, ]
    
# subset of rows and cols (just put row and col subsetting together)
    df1[1:3, c("col2", "col3")]
    df1[c("col2", "col3")][1:3, ]
    df1[1:3, 2:3]

    colnamevec <- c("col2", "col3")
    df1[1:3, colnamevec]

# create a new column
    df1$newcol <- df1$col1*7 + df1$col2
    df1$newcol
    df1

    # same name overwrites the column
    df1$newcol <- df1$newcol * 2
    df1
    
    # assigning null to a column deletes it
    df1$newcol <- NULL
    df1

# sort the dataframe
    df1$col2
    sort(df1$col2)
    order(df1$col2)

    df1[order(df1$col2), ]
    df1
    
    df1 <- df1[order(df1$col2), ]
    df1
    
# reorder columns
    new_ord <- sort(names(df1), decreasing = TRUE)
    df1 <- df1[ , new_ord]
    df1

# summarizing (collapsing / aggregating / split-apply-combine)
    set.seed(9898)
    df <- data.frame(
        ints = sample(1:100, 100, T),
        lets = sample(letters[1:10], 100, T),
        caps = sample(LETTERS[1:10], 100, T),
        stringsAsFactors = TRUE
    )
    
    str(df)
    summary(df)
    
    # aggregate -- args take lists
    ?aggregate
    aggregate(df$ints, by=df["lets"], mean)
    
    # aggregate -- args take a formula
    aggregate(ints ~ lets, data=df, mean)
    
    # aggregate -- multiple subsetting criteria
    aggregate(df$ints, by=df[, c("lets", "caps")], length)
    aggregate(ints ~ lets + caps, data=df, length)
    
    # table() does counts, but doesn't return a data.frame
    table(df$lets)
    class(table(df$lets))
    as.data.frame(table(df$lets))
    
    table(df$lets, df$caps)
    
    
# Combining dataframes
    
    df1 <- data.frame(
        aa = 1:4,
        bb = c("a", "b", "c", "d"),
        cc = LETTERS[1:4]
    )
    
    df2 <- data.frame(
        aa = 2:5,
        bb = c("w", "x", "y", "z"),
        cc = LETTERS[23:26]
    )
    
    df1
    df2
    
    # stack on top, must have same colnames
    rbind(df1, df2)
    
    # align side-by-side, not usually what you want to do
    names(df2)[2:3] <- c("pp", "qq")
    df2
    cbind(df1, df2)
    
    # merge (aka "join")
    merge(df1, df2, by="aa")          # inner join
    merge(df1, df2, by="aa", all.x=T) # left join
    merge(df1, df2, by="aa", all.y=T) # right join
    merge(df1, df2, by="aa", all=T)   # outer join
    

# getting data in and out of R
    
    # write a data.frame to a .csv file
    # write.csv(data_frame_name, file="/path/to/file/filename.csv")
    
    write.csv(df1, "df1.csv")
    write.csv(df1, "df1.csv", row.names=F)
    
    # data in (from .csv file to an R data.frame object)
    # my_df <- read.csv("path/to/file/filename.csv")
    
    new_df <- read.csv("df1.csv")
    
    
    # save one or more objects into a RData file
    # save(obj1, obj2, file="path/to/file/filename.RData")
    
    save(df1, df2, "robjs.RData")
    
    # read those R objects back in (they will already be named)
    # load("path/to/file/filename.RData") 
    
    load("robjs.RData")  # <-- note no assignment here (ie, no =, no <-)

        
    
    
## PRACTICE QUESTIONS

    # load the "mtcars" dataset like this:
    data(mtcars)
    
    #1. Are any variables factors?
    
    
    
    #2. calculate the average miles per gallon of cars in the mtcars dataset
    
    
    
    #3. how many cars (ie, observations or rows) have each number of cylinders? (use "table")
    
    
    
    #4. make a new variable called "carname".  Populate that column with the rownames of the mtcars dataframe
    
    
    
    #5. create a dummy (T/F or 0/1) variable to indicate which cars are Mercedes:
          # one option is to use grepl("^Merc", mtcars$carname).  See ?regex
          # aside: the name grep comes from a command line tool 
          #        g/re/p (Globally search for a Regular Expression and Print matching lines)
          #        the "l" in grepl is because this R function returns Logical values 
    
    
    
    #6. calculate the correlation between the miles per gallon and the weight of the Mercedes cars
    
    
    
    #7. What is the mpg of Mercedes cars?  What is the average mpg of non-Mercedes cars? 
    #   Use aggregate() to find your answer.
    
    
    
    
## ADDITIONAL PRACTICE QUESTIONS
    
    # use the flights data to answer these questions
    # for info on the data, see it's help file:  ?nycflights13::flights
    install.packages("nycflights13")
    data(flights, package="nycflights13")
    
    
    #1. What is the average airtime per destination?
    
    
    
    #2. Calculate the monthly average departure delay and arrival delay by NY airport ("origin")
    
    
    
    #3. Add the variable "tdf" to the data.frame, where "tdf" is the total number of daily flights.
    #   That is, "tdf" is a count of the number of flights that departed each day
    #   As a check, Jan 1, 2013 had 842 flights that day (you should get the same number for Jan 1)
    #   Hint: this may require a merge
    

    
    #4. Delete the variable time_hour from the data.frame

    


## CHALLENGE QUESTION

    # Four trades, priced from a reference table. The merge runs cleanly.

    trades <- data.frame(
        ticker = c("AAA", "BBB", "CCC", "AAA"),
        shares = c(10, 20, 30, 40)
    )

    reference <- data.frame(
        ticker = c("AAA", "AAA", "BBB", "CCC"),   # someone loaded AAA twice
        sector = c("Tech", "Tech", "Fin", "Ind"),
        price  = c(10, 10, 5, 2)
    )

    m <- merge(trades, reference, by="ticker")
    sum(m$shares * m$price)          # portfolio value

    #   a) nrow(trades) is 4. What is nrow(m)? Explain the arithmetic of the join
    #      that produced that number.
    #   b) The line above reports 1160. The true portfolio value is 660. Show
    #      exactly which rows contributed the extra 500.
    #   c) Note that the duplicate rows in 'reference' are IDENTICAL -- no
    #      conflicting price, nothing to spot by eye. Write one line that would
    #      have caught the problem before the merge. (Hint: length(unique()),
    #      anyDuplicated(), or compare nrow() before and after.)
    #   d) Fix it without editing 'trades' and without deleting rows by hand,
    #      but you may delete rows programmatically with, eg, anyDuplicated()

