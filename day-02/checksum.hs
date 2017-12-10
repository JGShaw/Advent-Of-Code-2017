module Checksum where

import Data.List

checksum1 :: String -> Int
checksum1 input = sum $ map (\line -> maximum line - minimum line) $ linesToInts input

checksum2 :: String -> Int
checksum2 input = sum $ map checksum2' $ linesToInts input

checksum2' :: [Int] -> Int
checksum2' ints = val1 `div` val2
  where
    allPairs = concatMap permutations $ filter (\subseq -> length subseq == 2) $ subsequences ints
    (val1 : val2 : _) = head $ filter (\(x1 : x2 : _) -> x1 `mod` x2 == 0) $ allPairs

linesToInts :: String -> [[Int]]
linesToInts input = map (\line -> map readInt line) $ map words $ lines input

readInt :: String -> Int
readInt s = read s :: Int

readInput1 input = do
  file <- readFile input
  print $ checksum1 file 

readInput2 input = do
  file <- readFile input
  print $ checksum2 file 
