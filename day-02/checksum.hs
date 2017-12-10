module Checksum where

checksum :: String -> Int
checksum input = sum $ map (\line -> (maximum $ map readInt line) - (minimum $ map readInt line)) (map words (lines input))

readInt :: String -> Int
readInt s = read s :: Int

readInput input = do
  file <- readFile input
  print $ checksum file 
