--- Write a program that prints the numbers from 1 to 100. But for multiples of
---  three print "Fizz" instead of the number and for the multiples of five print
--- "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

[if (mod x 15) == 0 then "FizzBuzz" else if (mod x 5) == 0 then "Buzz" else if (mod x 3) == 0 then "Fizz" else (show x) | x <- [1..100]]
