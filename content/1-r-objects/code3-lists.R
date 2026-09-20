# vector recap
myvec <- c(ele1 = 7,
           ele2 = 8,
           ele3 = 9)

myvec[1]
myvec[1:2]
myvec["ele1"]

# lists
mylist <- list(alpha = 1:10,
               beta  = matrix(1:50, 10, 5),
               gamma = c("hi", "there") )

# 3 ways to extract list elements
    mylist$alpha
    mylist[[1]]
    mylist[1]

    class(mylist$alpha) # int
    class(mylist[[1]])  #  <-- double brackets gets you a vector (ie, the list element itself)
    class(mylist[1])    #  <-- single brackets gets you a subset of the list (which is a list) watch out!

    mylist$beta[4,3]
    mylist[["beta"]][4,3]
    mylist["beta"][4,3] #error -- can't subset list with [x,y] (ie, two dimensions)

    length(mylist)
    length(mylist[[1]])
    length(mylist[1])

# lapply and sapply
    newlist <- list(
        a = 1:10,
        b = 20:29,
        c = 100:150
    )
    
    newlist
    
    mean(newlist[[1]])
    mean(newlist[[2]])
    mean(newlist[[3]])

    lapply(newlist, mean)
    sapply(newlist, mean)
    unlist(lapply(newlist, mean))




## PRACTICE QUESTIONS

    #1. Consider two families: the SSS family and the YYY family. Here's a list that has two
    #   elements (SSS and YYY), each is a (sub)list.  These sublists each have two vectors.
    #   Write code to "extract" the 'Alison' element (bonus points if you do this multiple ways).
    
    fams <- list(
        SSS = list(parents = c("Ron", "Su"), kids = c("Alison", "Elisabeth")),
        YYY = list(parents = c("Lorie", "Bill"), children = c("Dan", "Nick", "Matt"))
    )
    
    
    
    #2. I use split to make a list below.
    #   Use an `apply` function to find the mean of each list element of xx
        xx <- split(matrix(1:100, 10, 10), 1:10)


        
        


## CHALLENGE QUESTION

    # Three summaries of a portfolio. All three lines run. All three print a number.
    # Only one of them is right, and it is right for the wrong reason.

    port <- list(
        ticker        = c("AAA", "BBB", "CCC"),
        value         = c(100, 250, 75),
        weight_target = c(0.30, 0.50, 0.20),
        weight_actual = c(0.24, 0.58, 0.18)
    )

    sum(port$val)                    # total portfolio value
    sum(port$weight * port$value)    # value-weighted total
    length(port$w)                   # how many weight vectors are there?

    #   a) For each line, say exactly which list element R looked up. Two of them
    #      found nothing at all -- name the rule that decides between "find it
    #      anyway" and "find nothing".
    #   b) Neither failure raised an error. Explain how sum() and length() turn a
    #      missing element into a plausible-looking number instead of a complaint.
    #   c) Line 1 gives the correct total. Why is that MORE dangerous than lines 2
    #      and 3, not less?
    #   d) Rewrite all three with [[ ]] and the full names. Then run port[["val"]]
    #      and explain why [[ ]] is safer here but still not actually safe.
    #   e) Write one line that checks, before any arithmetic, that the names you
    #      are about to use really exist. (Hint: %in% and names().)
