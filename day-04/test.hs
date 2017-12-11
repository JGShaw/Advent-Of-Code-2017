import Test.HUnit
import Passphrase

testCheckDuplicates expected input = TestCase $ assertEqual "" expected (Passphrase.checkDuplicates input)
testCheckLines expected input = TestCase $ assertEqual "" expected (Passphrase.checkLines checkDuplicates input)
testCheckAnagrams expected input = TestCase $ assertEqual "" expected (Passphrase.checkAnagrams input)

tests = TestList [TestLabel "Duplicates Case 1" (testCheckDuplicates True  "aa bb cc dd ee"),
                  TestLabel "Duplicates Case 2" (testCheckDuplicates False  "aa bb cc dd aa"),
                  TestLabel "Duplicates Case 3" (testCheckDuplicates True  "aa bb cc dd aaa"),

                  TestLabel "Check lines" (testCheckLines 2 "aa bb cc\naa bb aa\naa bb aaa"),

                  TestLabel "Anagrams Case 1" (testCheckAnagrams True "abcde fghij"),
                  TestLabel "Anagrams Case 2" (testCheckAnagrams False "abcde xyz ecdab"),
                  TestLabel "Anagrams Case 3" (testCheckAnagrams True "a ab abc abd abf abj"),
                  TestLabel "Anagrams Case 4" (testCheckAnagrams True "iiii oiii ooii oooi oooo"),
                  TestLabel "Anagrams Case 5" (testCheckAnagrams False "oiii ioii iioi iiio")
                 ]
                 
