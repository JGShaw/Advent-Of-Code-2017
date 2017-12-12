module Maze where

import qualified Data.Sequence as Seq

solve :: (Int -> Seq.Seq Int -> Seq.Seq Int) ->  [Int] -> Int
solve updater input = solve' updater (Seq.fromList input) 0 0

solve' :: (Int -> Seq.Seq Int -> Seq.Seq Int) ->  Seq.Seq Int -> Int -> Int -> Int
solve' updater state position moves
  | position >= (length state) || position < 0 = moves
  | otherwise = solve' updater newState newPosition $! newMoves
  where
    newState = updater position state 
    newPosition = position + (Seq.index state position)
    newMoves = moves + 1

p1Update :: Int -> Seq.Seq Int -> Seq.Seq Int
p1Update position state = Seq.adjust ((+) 1) position state

p2Update :: Int -> Seq.Seq Int -> Seq.Seq Int
p2Update position state = Seq.adjust ((+) change) position state
  where
    change = if (Seq.index state position) >= 3 then -1 else 1

readInput updater input = do
  file <- readFile input
  print $ solve updater  $ map read $ lines file
