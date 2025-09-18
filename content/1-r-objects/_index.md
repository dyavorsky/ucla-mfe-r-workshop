+++
title = "R Fundamentals"
weight = 10
pre = "<b>1. </b>"
+++


**Submit Attendance:** [link](https://bruinlearn.ucla.edu/courses/144052/assignments/1849057)

**Files for today:** 
[example](https://www.dropbox.com/scl/fi/ez0xnkyc8qt0433wjfkb8/code0-example.R?rlkey=4ob16mh6bq977lpwl86md0lz4&dl=0) | 
[vectors](https://www.dropbox.com/scl/fi/m1zeebn0073iww6f11iqb/code1-vectors.R?rlkey=2pl9fu0g5yas7066e65ak117t&dl=0) | 
[matrices](https://www.dropbox.com/scl/fi/v32dww1swn4kqp6i3sns0/code2-matrices.R?rlkey=df5t07qvoyrk8xrjlx2wwyx02&dl=0) | 
[lists](https://www.dropbox.com/scl/fi/a0rhx4i3two19tryywitr/code3-lists.R?rlkey=mwi4vy24p4isnw43dakbsa189&dl=0) 

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


