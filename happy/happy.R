# A happy number is a number defined by the following process: Starting with any positive integer,
# replace the number by the sum of the squares of its digits, and repeat the process until the number
# either equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
# Those numbers for which this process ends in 1 are happy numbers, while those that do not end in 1
# are unhappy numbers (or sad numbers).  In any language you like, write me a program to determine
# whether a number is happy or not.

library(magrittr)

square <- function(x) x*x

# Take a number and turn it into a vector of digits
digits <- function(num) {
  num %>% as.character %>% strsplit(., "") %>% lapply(., as.numeric) %>% unlist
}

is.happy <- function(num) {
  if (num == 1) { return(TRUE) }
  if (num == 4) { return(FALSE) }
  num %>% digits %>% sapply(., square) %>% sum %>% is.happy
}
