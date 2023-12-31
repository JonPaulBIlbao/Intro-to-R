# R code snippets from slides for Chapman & Feit 2015
# Slide file: Chapter2/Chapter2-ChapmanFeit

# All code is (c) 2015, Springer. http://r-marketing.r-forge.r-project.org/
# TODAY IS FRIDAY
# ==========
# CHANGES TO GO TO GITHUB FROM GTIHUB
variable1 <- 6+145

# Basic objects
# ==========
x <- c(2, 4 , 6, 8)
x

X


# Vectors
# ==========
xNum  <- c(1, 3.14159, 5, 7)
xNum


c(TRUE)
xLog  <- c(TRUE, FALSE, TRUE, TRUE)
xLog

xl <- c(T,F,F,F,T,T)

xChar <- c("foo", "bar", "boo", "far", "TRUE")
xChar



# Vectors: Type Coercion
# ==========
xMix  <- c(1, TRUE, 3, "Hello, world!") 
xMix


# More about vectors
# ==========
x2 <- c(x, x)
x2

c(x2, 100)
c(x2, "Hello")

x <- c(x,x,x,100)
x

# Forcing coercion
# ==========
xMix
xMix[1]   # we'll see more on indices later
as.numeric(xMix[1])   # forces it to "numeric"
as.numeric(xMix[1]) + 1.5


# Summary
# ==========
summary(xNum)
summary(xChar)


# Math on Vectors
# ==========

x2
x2 + 1
x2 * pi 


# More complex math
# ==========
x
x2    # longer than x
(x+cos(0.5)) * x2     # x is recycled to match x2


# Length and structure
# ==========
length(x)
length(x2)

str(x2)
str(xChar)
str(xLog)

# Sequences
# ==========
1:1000

xSeq <- 1:10
xSeq



1:5*2
1:(5*2)


# Indexing a vector 1
# ==========
xNum
xNum[2:4]
xNum[c(1,3)]

s <- c(2,4)

xNum[s]

f <- xNum>3
xNum>3

xNum[f]

xNum[xNum>3]

myStart <- 2
xNum[myStart:sqrt(myStart+7)]


# Negative indexing
# ==========
xSeq
xSeq[-5:-7]


# Indexing with Boolean
# ==========
xNum
xNum[c(FALSE, TRUE, TRUE, TRUE)]


xNum > 3
xNum[xNum > 3]


# Missing and interesting values
# ==========
my.test.scores <- c(91, 93, NA, NA)

mean(my.test.scores)
max(my.test.scores)
mean(my.test.scores, na.rm=TRUE)
max(my.test.scores, na.rm=TRUE)
var(my.test.scores, na.rm=TRUE)

?mean

# Other ways to omit
# ==========
na.omit(my.test.scores)
mean(na.omit(my.test.scores))
is.na(my.test.scores)
mean(my.test.scores[!is.na(my.test.scores)])
?is.na

# Data frames 1
# ==========
x.df <- data.frame(xNum, xLog, xChar)
x.df

x.df[2,1]
x.df[1,3]


# Data frames 2
# ==========
x.df[1,3]
x.df <- data.frame(xNum, xLog, xChar, stringsAsFactors=FALSE)
x.df[1,3]


# Indexing data frames
# ==========
x.df[2, ]  # all of row 2
x.df[ ,3]  # all of column 3
x.df[2:3, ] 
x.df[ ,1:2] 


# Negative indexing data frames
# ==========
x.df[-3, ]  # omit the third observation
x.df[, -2]  # omit the second column


# Let's create more interesting data
# ==========
rm(list=ls())    # caution, deletes all objects
x

# Store data
# ==========
store.num <- c(3, 14, 21, 32, 54) # store id
store.rev <- c(543, 654, 345, 678, 234)   # store revenue, $K
store.visits <- c(45, 78, 32, 56, 34)     # visits, 1000s
store.manager <- c("Annie", "Bert", "Carla", "Dave", "Ella")

store.df <- data.frame(store.num, store.rev, store.visits,
                        store.manager)
store.df$store.visits

store.df$store.manager

summary(store.df)

store.df$store.num <- as.factor(store.df$store.num)
store.df$store.manager <- as.factor(store.df$store.manager)

# Some data checks
# ==========
summary(store.df)   # always recommended!

store.df$store.manager

mean(store.df$store.rev)


# Read and write CSVs
# ==========

write.csv(store.df, file="store-df.csv", row.names=FALSE)
read.csv("store-df.csv")  # "file=" is optional


# Exercise!
# ==========
##install.packages("car") if needed
library(car)    
data(Salaries)


# One Set of Answers
# ==========
dim(Salaries)                             # or even better: str(Salaries)

summary(Salaries)

sum(Salaries$yrs.service>20)
Salaries$yrs.service>20

summary(Salaries[Salaries$yrs.service == 25,c(2,5) ])      # output not shown

a = 3

str(Salaries)
summary(Salaries)



mean(Salaries[Salaries$discipline =="B", 6])


mean(Salaries[(Salaries$sex=="Female"|Salaries$yrs.service<10), 6])
?Salaries


# Writing Basic Functions
# ==========
se <- function(x) { sd(x) / sqrt(length(x)) }

se(store.df$store.visits)
mean(store.df$store.visits) + 1.96 * se(store.df$store.visits)


# Document your functions inline!
# ==========
se <- function(x) {
  # computes standard error of the mean
  tmp.sd <- sd(x)      # standard deviation
  tmp.N  <- length(x)  # sample size
  tmp.se <- tmp.sd / sqrt(tmp.N)   # std error of the mean
  return(tmp.se)       # return() is optional but clear
}

se(store.df$store.visits)

se


# Other ways to make sequences
# ==========
seq(from=-5, to=28, by=4)
seq(from=-5, to=28, length=6)

rep(c(1,2,3), each=3)
rep(seq(from=-3, to=13, by=4), c(1, 2, 3, 2, 1))


# Infinite and Impossible numbers
# ==========
1/0
log(c(-1,0,1))
sqrt(-2)
sqrt(2i)

10 < Inf


# Loading and saving raw data formats
# ==========
save(store.df, file="store-df-backup.RData")

rm(store.df)        
mean(store.df$store.rev)     # error

load("store-df-backup.RData")
mean(store.df$store.rev)     # works now


# Loading data has silent overwrite
# ==========
store.df <- 5
store.df
load("store-df-backup.RData")
