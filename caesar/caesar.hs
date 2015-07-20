import Data.Ord
import Data.Char

caesar :: [Char] -> Int -> [Char]
caesar msg shift = chr . (+shift) . ord <$> msg

main :: IO ()
main = print $ caesar "HELLO" 5
