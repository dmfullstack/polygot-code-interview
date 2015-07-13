quicksort :: (Ord a) => [a] -> [a]
quicksort list = case list of
  [] -> [] 
  (x:xs) -> quicksort [a | a <- xs, a <= x] ++ [x] ++ quicksort [a | a <- xs, a > x]

main :: IO ()
main = print $ quicksort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8])
