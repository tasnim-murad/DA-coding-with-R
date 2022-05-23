##################################
##                              ##
##  Random Numbers and          ##
##       Random Sampling in R   ##
##                              ##
##################################

# Clear memory and load packages
rm(list=ls())
library(tidyverse)


# 1) case uniform distribution random sampling
n <- 10
x <- runif( n , min = 0 , max = 10 )
x

# 2) Set the seed for the computer for rng
set.seed(123)
x <- runif( n , min = 0 , max = 10 )

rm( x , n )


# Play around with n
n <- 10000
y <- rnorm( n , mean = 1 , sd = 2 )
df <- tibble( var1 = y )
ggplot( df , aes( x = var1 ) ) +
  geom_histogram( aes( y = ..density.. ) , fill = 'navyblue') +
  stat_function( fun = dnorm , args = list( mean = 1 , sd = 2 ) ,
                 color = 'red' , size = 1.5 )

# There are some other type of distributions:
#   rbinom, rexp ,rlnorm, etc.


#####
# Random sampling from a data/variable:

sp500 <- read_csv('https://osf.io/h64z2/download')
head(sp500)


# Sample_1 is without replacement
set.seed(123)
sample_1 <- sample_n( sp500 , 1000 , replace = FALSE )
head(sample_1)
# Sample_2 with replacement -> useful for bootstrapping
sample_2 <- sample_n( sp500 , 1000 , replace = TRUE )

# alternatively:
set.seed(123)
sample_1a <- slice_sample( sp500 , n = 1000 , replace = FALSE )
set.seed(123)
sample_1b <- tibble( VALUE = sample( sp500$VALUE , 1000 , replace = FALSE ) )
set.seed(123)
sample_1c <- sp500[sample.int( 1000 , replace = FALSE ),]
# Note: all the other are the same except sample_1c, this is due to the fact 
#   that set.seed controls for the output of the function, but the function may alter the seed.

