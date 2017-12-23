module Generator where

import Data.Bits

countMatches :: Int -> Int -> Int -> Int
countMatches 0 _ _ = 0
countMatches tests a b
  | bitsMatch a b = 1 + next
  | otherwise = next
  where
    nextA = (a * 16807) `mod` 2147483647
    nextB = (b * 48271) `mod` 2147483647
    next = countMatches (tests - 1) nextA nextB

bitsMatch :: Int -> Int -> Bool
bitsMatch a b  = (a .&. 0xFFFF) == (b .&. 0xFFFF)

partOneAnswer = countMatches 40000000 618 814
