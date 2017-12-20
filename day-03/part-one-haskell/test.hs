import Test.HUnit
import Spiral

testSpiral expected input = TestCase $ assertEqual "" expected (Spiral.countMoves input)
testFirstValueLargerThan expected input = TestCase $ assertEqual "" expected (Spiral.firstValueLargerThan input)

tests = TestList [TestLabel "Case 1" (testSpiral 0 1),
                  TestLabel "Case 12" (testSpiral 3 12),
                  TestLabel "Case 23" (testSpiral 2 23),
                  TestLabel "Case 1024" (testSpiral 31 1024)
 
                  --TestLabel "Larger than 2" (testFirstValueLargerThan 4 2),
                  --TestLabel "Larger than 11" (testFirstValueLargerThan 23 11),
                  --TestLabel "Larger than 27" (testFirstValueLargerThan 54 27),
                  --TestLabel "Larger than 130" (testFirstValueLargerThan 133 130),
                  --TestLabel "Larger than 310" (testFirstValueLargerThan 330 310)
                 ]
                 
