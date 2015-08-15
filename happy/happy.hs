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
