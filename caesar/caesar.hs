import Data.Ord
import Data.Char

caesar :: [Char] -> Int -> [Char]
caesar msg shift = chr . (+shift) . ord <$> msg

main :: IO ()
main = do
    print "Enter what you would like to caesar shift..."
    input <- getLine
    print "Enter the shift amount..."
    shift <- getLine
    print $ caesar input $ read shift
