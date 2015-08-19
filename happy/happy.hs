-- A happy number is a number defined by the following process: Starting with any positive integer,
-- replace the number by the sum of the squares of its digits, and repeat the process until the number
-- either equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
-- Those numbers for which this process ends in 1 are happy numbers, while those that do not end in 1
-- are unhappy numbers (or sad numbers).  In any language you like, write me a program to determine
-- whether a number is happy or not.

module Main where
import Data.List
 
square x = x * x
 
digits = unfoldr mdiv
 where mdiv 0 = Nothing
       mdiv n = Just (m, d)
         where (d, m) = divMod n 10
 
happy :: Integer -> Bool
happy 1 = True
happy 4 = False
happy n = happy . sum . map square . digits $ n
