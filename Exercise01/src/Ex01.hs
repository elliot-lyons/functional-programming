module Ex01 where
import Data.Char (toLower)
import Data.List (group)
import Data.Bits (Bits(xor))
import Control.Concurrent (yield)

name, idno, username :: String
name      =  "Elliot Lyons"  -- replace with your name
idno      =  "20333366"    -- replace with your student id
username  =  "lyonse7"   -- replace with your TCD username


declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: Elliot Lyons"
     , "@@@ lyonse7"
     ]


{- Part 1

Write a function 'lower' that converts a string to lowercase

Hint: 'toLower :: Char -> Char' converts a character to lowercase
if it is uppercase. All other characters are unchanged.
It is imported should you want to use it.

-}

lower :: String -> String

lower = map toLower


{- Part 2

Write a function 'nth' that returns the nth element of a list.
Hint: the test will answer your Qs

-}

nth :: Int -> [a] -> a

nth j xs = xs !! (j - 1)


{- Part 3

Write a function `commonPfx` that compares two sequences
and returns the prefix they have in common.

-}
commonPfx :: Eq a => [a] -> [a] -> [a]

commonPfx [] [] = []
commonPfx (x:xs) [] = []
commonPfx [] (y:ys) = []

commonPfx (x:xs) (y:ys) | x == y = (x:commonPfx xs ys)
                        | x /= y = []



{- Part 4

(TRICKY!) (VERY!)

Write a function `runs` that converts a list of things
into a list of sublists, each containing elements of the same value,
which when concatenated together give the same list

So `runs [1,2,2,1,3,3,3,2,2,1,1,4]`
 becomes `[[1],[2,2],[1],[3,3,3],[2,2],[1,1],[4]]`

Hint:  `elem :: Eq a => a -> [a] -> Bool`

HINT: Don't worry about code efficiency
       Seriously, don't!

-}
runs :: Eq a => [a] -> [[a]]

runs [] = []

runs (x:xs) = beforeRuns(map (:[])((x:xs)))


beforeRuns :: Eq a => [[a]] -> [[a]]

beforeRuns [] = []

beforeRuns(x:xs) | length x > 1 = beforeRuns(concat (map (:[]) (x:xs)))
                 | otherwise = runsOne(x:xs)


runsOne :: Eq a => [[a]] -> [[a]]

runsOne [] = []

runsOne(x) | length x == 1 = x

runsOne (x:y:xs) | x == [] = ([]++runsOne(y:xs))
                 | y == [] = x:[]
                 | xs == [] = runsTwo(x:y:[])
                 | elem (head (x)) y == True = runsOne((x++y):xs)
                 | otherwise = (x:runsOne(y:xs))


runsTwo :: Eq a => [[a]] -> [[a]]

runsTwo [] = []

runsTwo (x) | length x == 1 = x

runsTwo (x:y)    | x == [] = []
                 | y == [] = x:[]
                 | elem (tail (x)) y == True = (x: tail y)  
                 | otherwise = x:y