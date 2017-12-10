import Test.HUnit
import Spiral

testSpiral expected input = TestCase $ assertEqual "" expected (Spiral.countMoves input)

tests = TestList [TestLabel "Case 1" (testSpiral 0 1),
                  TestLabel "Case 12" (testSpiral 3 12),
                  TestLabel "Case 23" (testSpiral 2 23),
                  TestLabel "Case 1024" (testSpiral 31 1024)
                 ]
                 
