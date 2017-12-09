module Captcha where

import qualified Data.Char as Char

solve :: String -> Int
solve input = solve' $ take ((length input) + 1) $ cycle input

solve' :: String -> Int
solve' (h1 : h2 : tl)
  | h1 == h2 = Char.digitToInt h1 + (solve' (h2 : tl))
  | otherwise = solve' (h2 : tl)
solve' (tl : []) = 0
