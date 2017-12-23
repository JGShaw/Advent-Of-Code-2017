module Generator where

import Data.Bits

countMatches :: Int -> (Int -> Int) -> Int -> (Int -> Int) -> Int  -> Int
countMatches 0 _ _ _ _ = 0
countMatches tests genA a genB b
  | bitsMatch a b = 1 + next
  | otherwise = next
  where
    nextA = genA a
    nextB = genB b
    next = countMatches (tests - 1) genA nextA genB nextB

bitsMatch :: Int -> Int -> Bool
bitsMatch a b  = (a .&. 0xFFFF) == (b .&. 0xFFFF)

p1A :: Int -> Int
p1A x = (x * 16807) `mod` 2147483647

p1B :: Int -> Int
p1B x = (x * 48271) `mod` 2147483647

p2A :: Int -> Int
p2A x
  | ans `mod` 4 == 0 = ans
  | otherwise = p2A ans
  where
    ans = p1A x

p2B :: Int -> Int
p2B x
  | ans `mod` 8 == 0 = ans
  | otherwise = p2B ans
  where
    ans = p1B x

partOneAnswer = countMatches 40000000 p1A 618 p1B 814
partTwoAnswer = countMatches 5000000 p2A 618 p2B 814
