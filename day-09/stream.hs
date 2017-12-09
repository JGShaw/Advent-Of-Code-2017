module Stream where

score :: String -> (Int, Int)
score input = scoreGroup 0 0 1 input

scoreGroup :: Int -> Int -> Int -> String -> (Int, Int)
scoreGroup tScore tGarbage  _ [] = (tScore, tGarbage)
scoreGroup tScore tGarbage score ('{' : tail) = scoreGroup (tScore + score) tGarbage  (score + 1) tail
scoreGroup tScore tGarbage score ('}' : tail) = scoreGroup tScore tGarbage (score - 1) tail
scoreGroup tScore tGarbage score ('<' : tail) = scoreGroup tScore (tGarbage + garbageCount) score clean
  where
    (garbageCount, clean) = removeGarbage 0 tail
scoreGroup tScore tGarbage score (_ : tail) = scoreGroup tScore tGarbage score tail

removeGarbage :: Int -> String -> (Int, String)
removeGarbage count ('>' : tail) = (count, tail)
removeGarbage count ('!' : _ : tail) = removeGarbage count tail
removeGarbage count (_ : tail) = removeGarbage (count + 1) tail
