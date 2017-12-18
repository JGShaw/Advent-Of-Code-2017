module Buckets where

import qualified Data.Set as Set
import qualified Data.Sequence as Seq
import Data.Maybe

redistribute :: [Int] -> Int
redistribute input = Set.size $ tick (Seq.fromList input) $ Set.singleton (Seq.fromList input)

tick :: Seq.Seq Int -> Set.Set (Seq.Seq Int) -> Set.Set  (Seq.Seq Int)
tick buckets explored
  | Set.member newBuckets explored = newExplored
  | otherwise = tick newBuckets newExplored
  where
    largestBucket = maximum buckets
    largestIndex = (fromJust $ Seq.elemIndexL largestBucket buckets) + 1
    newBuckets = redisMaxBucket largestBucket largestIndex $ Seq.update largestIndex 0 buckets 
    newExplored = Set.insert newBuckets explored

redisMaxBucket :: Int -> Int -> Seq.Seq Int -> Seq.Seq Int
redisMaxBucket 0 _ buckets = buckets
redisMaxBucket remaining index buckets = redisMaxBucket (remaining - 1) ((index + 1) `mod` Seq.length buckets) $ Seq.adjust ((+) 1) index buckets
