module Spiral where

countMoves :: Int -> Int
countMoves i = ring + closestAxis - 1
  where
    ring = (getRing i) + 1
    closestAxis = minimum [abs (i - (plusY ring)), abs (i - (minusY ring)), abs (i - (plusX ring)), abs (i - (minusX ring))]   

getRing :: Int -> Int
getRing num = y `div` 2
  where
    x = ceiling $ sqrt (fromIntegral num)
    y = if even x then x + 1 else x

plusX :: Int -> Int
plusX n = equation 11 8 n
minusX :: Int -> Int
minusX n = equation  7 4 n
plusY :: Int -> Int
plusY n = equation 5 2 n
minusY :: Int -> Int
minusY n = equation 9 6 n

equation :: Int -> Int -> Int -> Int
equation x y n = (4 * (n^2)) - (x * n) + y

firstValueLargerThan :: Int -> Int
firstValueLargerThan i = head $ filter (\x -> x > i) fillMemory

fillMemory :: [Int]
fillMemory = [1..]
