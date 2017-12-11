import Test.HUnit
import Passphrase

testCheck expected input = TestCase $ assertEqual "" expected (Passphrase.check input)
testCheckLines expected input = TestCase $ assertEqual "" expected (Passphrase.checkLines input)

tests = TestList [TestLabel "Case 1" (testCheck True  "aa bb cc dd ee"),
                  TestLabel "Case 2" (testCheck False  "aa bb cc dd aa"),
                  TestLabel "Case 3" (testCheck True  "aa bb cc dd aaa"),

                  TestLabel "Check lines" (testCheckLines 2 "aa bb cc\naa bb aa\naa bb aaa")
                 ]
                 
