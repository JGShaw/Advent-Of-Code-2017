module Passphrase where

import qualified Data.Set as Set

check :: String -> Bool
check input = (length splitWords) == (length $ Set.fromList splitWords)
  where
    splitWords = words input

checkLines :: String -> Int
checkLines input = length $ filter check $ lines input 

readInput input = do
  file <- readFile input
  print $ checkLines file
