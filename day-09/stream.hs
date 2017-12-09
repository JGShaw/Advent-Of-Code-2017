module Stream where

score :: String -> (Int, Int)
score input = scoreGroup 0 0 1 input

scoreGroup :: Int -> Int -> Int -> String -> (Int, Int)
scoreGroup tScore tGarbage  _ [] = (tScore, tGarbage)
scoreGroup tScore tGarbage score ('{' : tail) = scoreGroup (tScore + score) tGarbage  (score + 1) tail
scoreGroup tScore tGarbage score ('}' : tail) = scoreGroup tScore tGarbage (score - 1) tail
scoreGroup tScore tGarbage score ('<' : tail) = scoreGroup tScore tGarbage score (removeGarbage tail)
scoreGroup tScore tGarbage score (_ : tail) = scoreGroup tScore tGarbage score tail

removeGarbage :: String -> String
removeGarbage ('>' : tail) = tail
removeGarbage ('!' : _ : tail) = removeGarbage tail
removeGarbage (_ : tail) = removeGarbage tail


