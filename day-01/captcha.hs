module Captcha where

import qualified Data.Char as Char

solveP1 :: String -> Int
solveP1 input = solve' input (rotate 1 input)

solveP2 :: String -> Int
solveP2 input = solve' input $ rotate (length input `div` 2) input

solve' :: String -> String -> Int
solve' in1 in2 = sum $ map (\(x1, x2) -> if x1 == x2 then (Char.digitToInt x1) else 0) $ zip in1 in2

rotate :: Int -> String -> String
rotate n s = take (length s) $ drop n $ cycle s
