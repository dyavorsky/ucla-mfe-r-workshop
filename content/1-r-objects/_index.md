+++
title = "R Fundamentals"
weight = 10
pre = "<b>1. </b>"
+++


**Submit Attendance:** [link](https://bruinlearn.ucla.edu/courses/144052/quizzes/1035787)

**Files for today:** 
[example](https://www.dropbox.com/scl/fi/bn2tijeqdqrowwxr7hcm0/code0-example.R?rlkey=xi3n0wp8pwv971lm5kucu9s0a&st=2r9g2nf6&dl=1) | 
[vectors](https://www.dropbox.com/scl/fi/e4glf0z1dj1i0ihx7vrbn/code1-vectors.R?rlkey=z3lqab7iad1ueddbkv45xsmvj&st=c6gler1v&dl=1) | 
[matrices](https://www.dropbox.com/scl/fi/7ur3apth3dovnllxc2sbr/code2-matrices.R?rlkey=alwj99ip0k49jrx72p0mliy1e&st=gphx7osq&dl=1) | 
[lists](https://www.dropbox.com/scl/fi/p8ze55kkstismnd98ekhj/code3-lists.R?rlkey=wywa96oeecrwcqx1nwmhzfj3g&st=xt0k3ru3&dl=1) 

---


#### Object Types

- Variables 
  - Variables are named objects; objects result from the evaluation of an expresssion
  - Names can be assigned with an equals sign (`=`) or the assignment operator (`<-`, alt+minus shortcut)
  - For example, with `x <- 2+2`, the expression `2+2` evaluates to a length-one vector holding value 4, to which we have bound the name `x` 
- Many ways to check the "type" of data in an R object
  - My preferred method is to assess the structure of an object using `str()`
  - Additional options include `mode()` / `typeof()` / `class()` among others
- You can check data types or convert between data types
  - For example, using `is.character()` to check or `as.character()` to convert
- Special "values" in R include:
  - `TRUE` and `FALSE` logical values (coerced to 0 and 1 when used in mathematical operations)
  - `NA` indicates a placeholder for a missing value
  - `Inf` and `NaN` result from, eg, dividing by zero
  - `NULL` indicates a placeholder for a missing vector object 
- It is helpful to think that everything in R is either an object or a function (and functions themselves are objects)
  - The expression `2+2` is actually a call to the `+()` function, as in `` `+`(2,2) `` 

    

#### Vectors

- R automatically performs vector recycling when operating on multiple vectors of different lengths
  - This makes a lot of sense when one of the vectors has length-one
  - It can lead to nice "tricks" in very special circumstances
  - However, in general for vectors longer than length-one, it is unusual behavior
- Vector can be subset using square brackets `[]` by:
  - Position number, or a vector of position numbers -- no zero-based indexing like Python or C++
  - Logical vectors, often of the same length as the vector to be subset
  - Element names, if the elements of the vector are named
- Logical tests are extremely common
  - Use double-equals `==` to test for equality
  - Use `!=` to indicate not-equal-to
- R heavily utilizes vectorized functions
  - For example, if `x=c(4,9,16)` then `sqrt(x)` returns `(2,3,4)`



#### Matrices

- Matrices are vectors with a dimension attribute
- Matrix math, ie Linear Algebra, is common in statistical applications
  - Standard operators (`+`, `-`, `*`, `/`) are element-wise 
  - Matrix multiplcation uses the `%*%` operator 
  - Transpose via `t()`
  - Invert via `solve()` or a Choleski decomposition
- Subset a matrix with square brackets `[]`
  - Uses form \[row index, column index\]
  - Blank index indicates "all"
- You can "sweep" a function over the rows or columns
  - Simple functions are built-in, such as `RowSums()` and `ColMeans()`
  - Alternatively, use `apply()`



#### Lists

- Lists are generalized vectors
  - Each element of a vector holds a value, each element of a list "holds" an R object
  - You can nest lists; ie a list element could be another list
  - Most algorithmic functions in R return lists, eg, `lm()`, `kmeans()`, `prcomp()`
- List subsetting / extracting elements
  - Single brackets `[]` return a list object
  - Double brackets `[[]]` or dollar sign `$` extract a list element
- It is common to apply a function to each object in a list
  - `lapply()` returns a list of results, `sapply()` returns a (simplified) vector


