fizzbuzz <- function(n) {
  out <- ifelse(n %% 15 == 0, 'FizzBuzz',
           ifelse(n %% 5 == 0, 'Buzz',
             ifelse(n %% 3 == 0, 'Fizz', n)))
  lapply(as.list(out),
         function(x) { if (!is.na(as.numeric(x))) { as.numeric(x) } else { x }})
}
print(fizzbuzz(seq(100)))
