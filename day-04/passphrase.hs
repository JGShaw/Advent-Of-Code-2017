module Passphrase where

import qualified Data.Set as Set

checkDuplicates :: String -> Bool
checkDuplicates input = (length splitWords) == (length $ Set.fromList splitWords)
  where
    splitWords = words input

checkLines :: (String -> Bool) -> String -> Int
checkLines checker input = length $ filter checker $ lines input 

readInput checker input = do
  file <- readFile input
  print $ checkLines checker file
