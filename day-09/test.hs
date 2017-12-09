import Test.HUnit
import Stream

testScore expected input = TestCase $ assertEqual "" expected $ Stream.score input


tests = TestList [TestLabel "A single group has a score of 1" (testScore 1 "{}"),
                  TestLabel "Nested groups are scored with increasing counts" (testScore 6 "{{{}}}")
                 ]
