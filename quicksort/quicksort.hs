quicksort :: (Ord a) => [a] -> [a]
quicksort list = case list of
  [] -> [] 
  (x:xs) -> (quicksort $ filter (<=x) xs) ++ [x] ++ (quicksort $ filter (>x) xs)

main :: IO ()
main = print $ quicksort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8])
