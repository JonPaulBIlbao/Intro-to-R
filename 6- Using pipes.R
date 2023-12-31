
### Using PIPES is a way of creating a sequence of multiple operations
###  They can greatly simplify your code and make your operations more intuitive


library(tidyverse)
library(magrittr)
library(dplyr)

### Some basic examples of piping

### without pipes
print("this symbol %>% represents a pipe in R")
### with pipes
"this symbol %>% represents a pipe in R" %>% print()

### without pipes
mean(1:10)
### with pipes
(1:10) %>% mean


###  When using the %>% operator the default is the argument that you are 
###  forwarding will go in as the first argument of the function that follows the %>%
mtcars <- mtcars


### without pipes
summary(mtcars)
### with pipes
mtcars %>%  summary()


### without pipes
results <- group_by(mtcars,cyl)
results <- summarise(results, meanMPG=mean(mpg))

### with pipes
mtcars %>% group_by(cyl) %>%  summarise(meanMPG=mean(mpg))

### However, in some functions the argument you are forwarding does not go 
### into the default first position. In these cases, you place “.” to signal 
### which argument you want the forwarded expression to go to.

mtcars %>%
  filter(carb > 1) %>%
  lm(mpg ~ cyl + hp, data = .) %>%
  summary()

### More examples
### without pipes
summary(cust.df[cust.df$age>40,])
### with pipes
cust.df  %>% filter(age>40) %>% summary()

### Look at these examples
cust.df %>%
  filter(age >40) %>%
  group_by(email) %>%
  summarize(online.spend = mean(online.spend, na.rm = TRUE))

### The final summary command does not work, why?
cust.df %>%
  filter(email=="yes") %>%
  plot(age ~ credit.score,data=.) %>%
  summary()


### ADVANCED: using "tee" pipes it works
cust.df %>%
  filter(email=="yes") %T>%
  plot(age ~ credit.score,data=.) %>%
  summary()

### It would be better using email as factor
cust.df %>%
  mutate(email=factor(email)) %>% 
  filter(email=="yes") %T>%
  plot(age ~ credit.score,data=.) %>%
  summary()


### Is this the first time you're introduced to the worlwide known IRIS DATASET?
### Now you're now becoming a true data scientist!!!!!
### https://en.wikipedia.org/wiki/Iris_flower_data_set

### The Iris dataset was used in R.A. Fisher's classic 1936 paper, 
### The Use of Multiple Measurements in Taxonomic Problems

### It includes three iris species with 50 samples each as well as 
### some properties about each flower.


summary(iris)


### https://www.r-bloggers.com/2022/03/how-to-use-pipes-to-clean-up--r-code/
### Look at the beautiful use of pipes

iris %>%
  # first filter and keep only sepals greater than 5cm long and 3cm wide:
  filter(Sepal.Length > 5 & Petal.Length > 3) %>%
  # then approximate sepal and petal area by multiplying length and width:
  mutate(Sepal.Area = Sepal.Length * Sepal.Width,
         Petal.Area = Petal.Length * Petal.Width) %>%
  # after that group by species to summarize the mean 
  # sepal/petal area of each species:
  group_by(Species) %>%
  summarize(avg.sepal.area = mean(Sepal.Area),
            avg.petal.area = mean(Petal.Area))
