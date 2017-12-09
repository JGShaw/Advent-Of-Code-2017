import Test.HUnit
import Captcha

testCaptchaP1 expected input = TestCase $ assertEqual "" expected (Captcha.solveP1 input)
testCaptchaP2 expected input = TestCase $ assertEqual "" expected (Captcha.solveP2 input)

tests = TestList [TestLabel "P1 Case 1122" (testCaptchaP1 3 "1122"),
                  TestLabel "P1 Case 1111" (testCaptchaP1 4 "1111"),
                  TestLabel "P1 Case 1234" (testCaptchaP1 0 "1234"),
                  TestLabel "P1 Case 91212129" (testCaptchaP1 9 "91212129"),

                  TestLabel "P2 Case 1212" (testCaptchaP2 6 "1212"),
                  TestLabel "P2 Case 1221" (testCaptchaP2 0 "1221"),
                  TestLabel "P2 Case 123425" (testCaptchaP2 4 "123425"),
                  TestLabel "P2 Case 123123" (testCaptchaP2 12 "123123"),
                  TestLabel "P2 Case 12131415" (testCaptchaP2 4 "12131415")
                 ]
