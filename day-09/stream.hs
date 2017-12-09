module Stream where

score :: String -> Int
score input = scoreGroup 1 input

scoreGroup :: Int -> String -> Int
scoreGroup _ [] = 0
scoreGroup score ('{' : tail) = score + (scoreGroup (score + 1) tail)
scoreGroup score ('}' : tail) = scoreGroup (score - 1) tail
scoreGroup score ('<' : tail) = scoreGroup score (removeGarbage tail)
scoreGroup score (_ : tail) = scoreGroup score tail

removeGarbage :: String -> String
removeGarbage ('>' : tail) = tail
removeGarbage ('!' : _ : tail) = removeGarbage tail
removeGarbage (_ : tail) = removeGarbage tail
