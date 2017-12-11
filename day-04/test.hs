import Test.HUnit
import Passphrase

testCheckDuplicates expected input = TestCase $ assertEqual "" expected (Passphrase.checkDuplicates input)
testCheckLines expected input = TestCase $ assertEqual "" expected (Passphrase.checkLines checkDuplicates input)

tests = TestList [TestLabel "Case 1" (testCheckDuplicates True  "aa bb cc dd ee"),
                  TestLabel "Case 2" (testCheckDuplicates False  "aa bb cc dd aa"),
                  TestLabel "Case 3" (testCheckDuplicates True  "aa bb cc dd aaa"),

                  TestLabel "Check lines" (testCheckLines 2 "aa bb cc\naa bb aa\naa bb aaa")
                 ]
                 
