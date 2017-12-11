module Passphrase where

import qualified Data.Set as Set
import qualified Data.List as List

checkDuplicates :: String -> Bool
checkDuplicates input = (length splitWords) == (length $ Set.fromList splitWords)
  where
    splitWords = words input

checkAnagrams :: String -> Bool
checkAnagrams input = (length $ uniquePerms) == (length $ Set.fromList uniquePerms)
  where
    splitWords = words input
    permutations = map List.permutations splitWords
    uniquePerms = concatMap (\x -> Set.toList $ Set.fromList x) permutations

checkLines :: (String -> Bool) -> String -> Int
checkLines checker input = length $ filter checker $ lines input 

readInput checker input = do
  file <- readFile input
  print $ checkLines checker file
