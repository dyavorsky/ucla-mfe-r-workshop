+++
title = "R for Data Analysis"
weight = 20
pre = "<b>2. </b>"
+++

**Submit Attendance:** [link](https://bruinlearn.ucla.edu/courses/144052/quizzes/1035788)

**Files for today:** 
[data.table](https://www.dropbox.com/scl/fi/0f3feqrswpf1pc6vy4g3k/code5-datatable.R?rlkey=039ntyue2hh9xaunf7raagrma&st=cwg8upwv&dl=1) | 
[tidyverse](https://www.dropbox.com/scl/fi/urjkwrh4gtobm5hm2bosi/code6-tidyverse.R?rlkey=ecp3xtv3e26588r1xifm5gwig&st=58pjeoaj&dl=1) | 
[functions](https://www.dropbox.com/scl/fi/zhuipxrfsilzqbu2s5pzz/code7-functions.R?rlkey=o8a4xee365df6bvtxq0s2rhcf&st=ba6zdahe&dl=1)

---


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


#### Functions and Control Flow

- Use the `function()` function to create your own function
- Functions have:
  - Formals, which are the list of arguments that control how you call the function
  - A body, which returns the last evaluated expression or whater you put in `return()` 
  - An environment, which determines scoping (ie, how the function finds the values associated with named objects)
- There are some R-specific things to be aware of
  - Lazy evaluation
  - Things that appear to have the same name, eg `fun(x=x)`
  - Anonymous "lambda" functions
- Control Flow
  - `if() {...} else {...}`, and `ifelse()`
  - `with` assignment
  - loops via `foreach()` and `while()`
