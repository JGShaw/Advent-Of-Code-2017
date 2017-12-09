import Test.HUnit
import Captcha

testCaptcha expected input = TestCase $ assertEqual "" expected (Captcha.solve input)

tests = TestList [TestLabel "Case 1122" (testCaptcha 3 "1122"),
                  TestLabel "Case 1111" (testCaptcha 4 "1111"),
                  TestLabel "Case 1234" (testCaptcha 0 "1234"),
                  TestLabel "Case 91212129" (testCaptcha 9 "91212129")
                 ]
