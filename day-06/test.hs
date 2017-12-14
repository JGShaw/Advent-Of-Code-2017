import Test.HUnit
import Buckets

testRedistribute expected input = TestCase $ assertEqual "" expected (Buckets.redistribute input)

tests = TestList [TestLabel "Example part one" (testRedistribute 5 [0, 2, 7, 0])] 
