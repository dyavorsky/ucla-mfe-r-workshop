+++
title = "R for Data Analysis"
weight = 20
pre = "<b>2. </b>"
+++

**Submit Attendance:** [link](https://bruinlearn.ucla.edu/courses/144052/quizzes/1035788)

**Files for today:** 
[data.frames](https://www.dropbox.com/scl/fi/mthl5r8885xozbmgoqvky/code4-dataframes.R?rlkey=y6ag3dyaq4ryfgva95sg6vdzt&st=jvugg1o5&dl=1) | [data.table](https://www.dropbox.com/scl/fi/0f3feqrswpf1pc6vy4g3k/code5-datatable.R?rlkey=039ntyue2hh9xaunf7raagrma&st=cwg8upwv&dl=1) | 
[tidyverse](https://www.dropbox.com/scl/fi/urjkwrh4gtobm5hm2bosi/code6-tidyverse.R?rlkey=ecp3xtv3e26588r1xifm5gwig&st=58pjeoaj&dl=1) 

---


#### Data.frames

- Data.frames are an extremely useful object for analysis
  - You can think of them as an Excel table
  - However, they are list objects in R with certain constraints and special properties
  - Each element of the list (ie column of a data.frame) is a vector of the same length
  - These vectors (ie data.frame columns) can store values of different types
- To subset a data.frame, use the list and vector subsetting operations already discussed
- To add a new column, syntax is the same as adding a new list element
- Sorting is simply subsetting the dataframe with all rows (in a different order) returned
- Common analytic operations
  - Use `aggregate()` to perform a common split-apply-combine summary analysis
  - Use `merge()` to combine multiple data.frames based on the values of select key columns
- Categorical variables are called "factors" in R
  - Offer efficient storage when the number of levels (values of the categorical variable) is much fewer than the number of rows of the data.frame
  - Many algorithms handle them appropriately, eg, gender in the linear regression `lm(height ~ weight + gender)`



#### Data Input/Output

- R is generally fantastic at getting data in and out of R, but we'll focus only on 2 common approaches:
  - `read.csv()` brings data in, stored as a data.frame object
  - `write.csv()` does exactly what you think
  - `save()` write one or more objects to disk in an efficient R-specific storage format
  - `load()` reads in `saved` objects



#### Data.table

- Data Table Overview 
  - Created by Matt Dowle, now maintained by others
  - Check out its homepage [here](https://rdatatable.gitlab.io/data.table/) and be sure to read the vignettes!
  - Mature, stable project that provides enhancements to the Base R data.frame object
  - Provides concise syntax that is efficient to read and write
  - Is fast, with many operations internally parrellelized 
  - Has no dependencies other than Base R.
- Syntax `dt[i,j,by]` matches SQL commands: where, select, group by
  - `i` subsets rows, no need to refer to `dt$` or extra comma when requesting all columns in the subset, eg `dt[i]` not `df[df$i,]` 
  - `j` selects columns using `list()` or `.()`, or creates columns using `:=`
  - aggregation occurs when a vector of grouping variable(s) is specified in `by`
  - altogether this makes split-apply-combine a single, concise command
- `.SD` and `.SDcols` are used to operate on multiple columns
- Data Table also provides:
  - a set of `set_` convenience functions, my favorite is `set_names()`
  - fast data input/out with `fread()` and `fwrite()`
  - fast rolling joins



#### Tidyverse

- Tidyverse overview
  - Created by Hadley Wickham, now assisted by Posit team
  - A collection of R packages that share common principles and are designed to work together seamlessly
  - Enhanced the Base R data.frame with the tibble
  - Two stand-out packages are **dplyr** for common operations with data.frames and **ggplot2** for plotting
  - Tidyverse functions encourage pipe `|>` operations, which make code supremely readable and beginner-programmer-friendly
  - Pipe is `cmd + shift + m` on Mac and `ctrl + shift + m` on Windows
- dplyr verbs for working with data.frames/tibbles:
- the 5 verbs and group_by
  - 1. `filter()` selects rows
  - 2. `arrange()` orders by row
  - 3. `select()` chooses columns
  - 4. `mutate()` creates new columns
  - 5. `summarize()` with `group_by()` split-apply-combine aggregations
  - You'll stumble accross other gems such as `distinct()`, `count()`, `sample_n()`, `transmute()`, `slice()`, `n()`, etc.
- Offers the best syntax for reshaping data from wide to long (or vice-versa) with `pivot_wider()` and `pivot_longer()`



