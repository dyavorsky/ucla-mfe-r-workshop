# create a matrix
    mat <- matrix(1:50, nrow=10, ncol=5)
    mat
    
    mat2 <- matrix(1:50, nrow=10, ncol=5, byrow=T)
    mat2    

# matrix is a vector with attributes
    typeof(1:5)
    typeof(mat)
    mode(mat)
    class(mat)
    str(mat)
    
    attributes(1:5) # << no atts for a vector
    attributes(mat) # << dim att for a matrix
    
    attributes(mat)$dim <- NULL
    mat
    class(mat)

    vec <- 1:50
    attributes(vec)
    attributes(vec) <- list(dim=c(10,5))
    vec    
    
# matrix math
    rm(list=ls()) # << a funky-looking command that means "empty the global environment"
    x <- matrix(1:10, 5, 2)
    x
    
    y <- x
    x + y
    
    # vector recycling is still a thing
    x + 3    
    x + c(100, 200, 300)
    
    # element-wise versus matrix multiplication
    x*y
    t(x) %*% y
    crossprod(x, y)
    x %*% t(y)
    
    # matrix operations you would expect
    t(x)
    z <- crossprod(x, y); z
    diag(z)
    iden <- diag(10); iden
    
    mat <- matrix(c(1,2,3,0,1,4,5,6,0), 3, 3); mat
    solve(mat)
    solve(solve(mat))
    
    sqmat <- matrix(c(2,-1,0,-1,2,-1,0,-1,2), 3, 3); sqmat
    chol2inv(chol(sqmat))
    solve(chol2inv(chol(sqmat)))
    
# our first "apply" family function
    mat <- matrix(1:100, 10, 10); mat
    min(mat)
    sum(mat)
    rowSums(mat)
    colSums(mat)
    
    mat
    apply(mat, 1, max)
    apply(mat, 2, max)    
    
# subsetting and element-assignment
    mat <- matrix(1:100, 10, 10); mat
    mat[3,2]
    mat[1:3, 1:2]
    mat[4:5,4] <- c(1000, 2000); mat
    
    sub <- matrix(c(1,1,4,6, 4, 7), nrow=3, ncol=2, byrow=T); sub
    mat[sub]
    
    



## PRACTICE QUESTIONS

#1. Write your own code to extract the diagonal of an nxn matrix
    n <- 8
    mat <- matrix(1:(n^2), nrow=n, ncol=n); mat
   
    
     
#2. Write code to extract the first lower off-diagonal band of a matrix
#   i.e., for the matrix below, extract values (2, 8, 14, 20)
    n <- 5
    mat <- matrix(1:(n^2), nrow=n, ncol=n); mat
    
    
    
#3. Write code to generate a general matrix (i.e., of any dimension n × n) that follows this pattern
    #       [,1] [,2] [,3] [,4] [,5] [,6]
    # [1,]    2    3    4    5    6    7
    # [2,]    3    4    5    6    7    8
    # [3,]    4    5    6    7    8    9
    # [4,]    5    6    7    8    9   10
    # [5,]    6    7    8    9   10   11
    # [6,]    7    8    9   10   11   12
    
    
    
#4. use the "rnorm()" function to take 10,000 random draws from a normal distribution with 
#       mean 3, and standard deviation 5.
#   store these 10,000 draws in a 100x100 matrix and calculate the mean and stdev of each row.
#   then take the average of those 100 means and the average of those 100 stdev's





## CHALLENGE QUESTION

    # Sort each ROW of this matrix into ascending order.
    set.seed(2026)
    mat <- matrix(sample(1:99, 50), nrow=10, ncol=5)

    sorted <- apply(mat, 1, sort)

    # No error. No warning. But the last (largest) value of each sorted row should
    # be exactly what apply(mat, 1, max) gives us:
    sorted[, 5]
    apply(mat, 1, max)

    #   a) Those don't match. Compare dim(mat) with dim(sorted) and explain what
    #      apply() handed back to you.
    #   b) sorted[5, ] DOES match apply(mat, 1, max) exactly. Why does that confirm
    #      the diagnosis rather than contradict it?
    #   c) Fix it with a single extra function call, no loop.
    #   d) Run the column version, apply(mat, 2, sort), and check its shape. The
    #      same bug is present in the same place -- why does this one come out
    #      looking right? What would have to change about 'mat' for the row version
    #      to also come out looking right, and why is that the most dangerous case
    #      of all?
    #   e) Now a second example, with no apply() involved at all.
    #
    #      To "demean" a row is to subtract that row's own mean from every value in
    #      it, so the row averages to zero afterward. Demeaning a column is the same
    #      idea. Run both of these:

    rowdm <- mat - rowMeans(mat)
    coldm <- mat - colMeans(mat)

    #      Both lines run clean. No error, no warning, no complaint of any kind.
    #      Now check each result against the thing it was supposed to zero out:

    round(rowMeans(rowdm), 10)
    round(colMeans(coldm), 10)

    #      The row version is all zeros. The column version is not, and R never
    #      said a word about it. To work out why, you need three numbers and one
    #      fact from earlier in this script:

    length(rowMeans(mat))
    length(colMeans(mat))
    nrow(mat)

    #      The fact is the very first thing we did today -- matrix(1:50, 10, 5)
    #      and matrix(1:50, 10, 5, byrow=T) fill the cells in different orders,
    #      and only one of those is what R does by default. Recycling follows that
    #      same default order.
    #
    #      So: for each of the two subtractions, say which value got subtracted
    #      from which cell, and why that lines up correctly in one case and
    #      scrambles in the other. Then fix the incorrect version.
