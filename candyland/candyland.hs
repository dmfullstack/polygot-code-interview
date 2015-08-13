module Main where

import System.IO
import System.Random
import Data.List
import Control.Applicative
import Control.Lens

data Color = Purple | Yellow | Blue | Orange | Green | Pink deriving Show
data Label = Blank | CandyCane | Gumdrop deriving Show
data Space = Space {spColor :: Color, spSticky :: Bool, spLabel :: Label} deriving Show
type Course = IO [Space]

purple_space :: Space
purple_space = Space { spColor = Purple, spSticky = False, spLabel = Blank }

sticky_purple_space :: Space
sticky_purple_space = Space { spColor = Purple, spSticky = True, spLabel = Blank }

purple_spaces :: Course
purple_spaces = shuffle (replicate 15 purple_space ++ [sticky_purple_space])

yellow_space :: Space
yellow_space = Space { spColor = Yellow, spSticky = False, spLabel = Blank }

sticky_yellow_space :: Space
sticky_yellow_space = Space { spColor = Yellow, spSticky = True, spLabel = Blank }

yellow_spaces :: Course
yellow_spaces = shuffle (replicate 16 yellow_space ++ [sticky_yellow_space])

blue_space :: Space
blue_space = Space { spColor = Blue, spSticky = False, spLabel = Blank }

sticky_blue_space :: Space
sticky_blue_space = Space { spColor = Blue, spSticky = True, spLabel = Blank }

blue_spaces :: Course
blue_spaces = shuffle (replicate 16 blue_space ++ [sticky_blue_space])

orange_space :: Space
orange_space = Space { spColor = Orange, spSticky = False, spLabel = Blank }

sticky_orange_space :: Space
sticky_orange_space = Space { spColor = Orange, spSticky = True, spLabel = Blank }

orange_spaces :: Course
orange_spaces = shuffle (replicate 16 orange_space ++ [sticky_orange_space])

green_space :: Space
green_space = Space { spColor = Green, spSticky = False, spLabel = Blank }

sticky_green_space :: Space
sticky_green_space = Space { spColor = Green, spSticky = True, spLabel = Blank }

green_spaces :: Course
green_spaces = shuffle (replicate 16 green_space ++ [sticky_green_space])

candy_cane_pink_space :: Space
candy_cane_pink_space = Space { spColor = Pink, spSticky = False, spLabel = CandyCane }

gumdrop_pink_space :: Space
gumdrop_pink_space = Space { spColor = Pink, spSticky = False, spLabel = Gumdrop }

pink_spaces :: Course
pink_spaces = shuffle (replicate 8 candy_cane_pink_space ++ replicate 8 gumdrop_pink_space)

detuple6 :: [(a,a,a,a,a,a)] -> [a]
detuple6 ((a,b,c,d,e,f):xs) = a : b : c : d : e : f : detuple6 xs
detuple6 _          = []

course :: Course
course = detuple6 <$> (zip6 <$> purple_spaces <*> yellow_spaces <*> blue_spaces <*> orange_spaces <*> green_spaces <*> pink_spaces)

shuffle :: [a] -> IO [a]
shuffle l = shuffle' l []
  where shuffle' [] acc = return acc
        shuffle' l acc = do k <- randomRIO(0, length l - 1)
                            let (lead, x:xs) = splitAt k l
                            shuffle' (lead ++ xs) (x:acc)


data Direction = Backward | Forward deriving Show
data Card = Card {cColor :: Color, cLabel :: Label, cDirection :: Direction} deriving Show
type Deck = IO [Card]

purple_card :: Card
purple_card = Card { cColor = Purple, cLabel = Blank, cDirection = Forward }

yellow_card :: Card
yellow_card = Card { cColor = Yellow, cLabel = Blank, cDirection = Forward }

blue_card :: Card
blue_card = Card { cColor = Blue, cLabel = Blank, cDirection = Forward }

orange_card :: Card
orange_card = Card { cColor = Orange, cLabel = Blank, cDirection = Forward }

green_card :: Card
green_card = Card { cColor = Green, cLabel = Blank, cDirection = Forward }

candy_cane_forward_pink_card :: Card
candy_cane_forward_pink_card = Card { cColor = Pink, cLabel = CandyCane, cDirection = Forward }

candy_cane_reverse_pink_card :: Card
candy_cane_reverse_pink_card = Card { cColor = Pink, cLabel = CandyCane, cDirection = Backward }

gumdrop_forward_pink_card :: Card
gumdrop_forward_pink_card = Card { cColor = Pink, cLabel = Gumdrop, cDirection = Forward }

gumdrop_reverse_pink_card :: Card
gumdrop_reverse_pink_card = Card { cColor = Pink, cLabel = Gumdrop, cDirection = Backward }

deck :: Deck
deck = shuffle (replicate 10 purple_card ++ replicate 9 yellow_card ++ replicate 10 blue_card ++ replicate 10 orange_card ++ replicate 9 green_card ++ replicate 2 candy_cane_forward_pink_card ++ replicate 2 gumdrop_forward_pink_card ++ replicate 2 candy_cane_reverse_pink_card ++ replicate 2 gumdrop_reverse_pink_card)
