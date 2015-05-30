/    Write a program that prints the numbers from 1 to 100. But for multiples of
/    three print "Fizz" instead of the number and for the multiples of five print
/    "Buzz". For numbers which are multiples of both three and five print "FizzBuzz".

{:[(x!15)=0;"FizzBuzz";:[(x!5)=0;"Buzz";:[(x!3)=0;"Fizz";x]]]}/:1_!101
/    !101 enumerates a list from 1 to 100
/    1_ drops the first element from the list (1)
/    {}/: will run a function over the list ("map")
/    :[(conditional);(return if true);(return if false)] is K's ifelse control flow.
/    The specific conditional here returns "FizzBuzz", "Buzz", "Fizz", or the
/        original element according to FizzBuzz logic.

