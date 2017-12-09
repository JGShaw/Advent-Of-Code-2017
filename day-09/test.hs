import Test.HUnit
import Stream

testScore expected input = TestCase $ assertEqual "" expected (fst $ Stream.score input)
testGarbageCount expected input = TestCase $ assertEqual "" expected (snd $ Stream.score input)

tests = TestList [TestLabel "A single group has a score of 1" (testScore 1 "{}"),
                  TestLabel "Nested groups are scored with increasing counts" (testScore 6 "{{{}}}"),
                  TestLabel "Comma seperated groups are scored with the same count" (testScore 5 "{{},{}}"),
                  TestLabel "Nested and comma seperated groups" (testScore 16 "{{{},{},{{}}}}"),
                  TestLabel "Garbage is ignored" (testScore 1 "{<a>,<a>,<a>,<a>}"), 
                  TestLabel "Garbage in a nested group is ignored" (testScore 9 "{{<ab>},{<ab>},{<ab>},{<ab>}}"),
                  TestLabel "A group inside garbage is ignored" (testScore 1 "{<{}>}"),
                  TestLabel "Escape characters ignore closing garbage tags" (testScore 3 "{{<a!>},{<a!>},{<a!>},{<ab>}}"),
                  
                  TestLabel "Empty garbage has a count of zero" (testGarbageCount 0 "{<>}"),
                  TestLabel "Non-special garbage characters are counted" (testGarbageCount 17 "{<random charactors>}"),
                  TestLabel "Opening garbage tags are counted" (testGarbageCount 3 "{<<<<>}"),
                  TestLabel "Group tags inside garbage are counted" (testGarbageCount 2 "{<{}>}"),
                  TestLabel "Escaped characters are not counted" (testGarbageCount 0 "{<!!>}"),
                  TestLabel "Multiple escaped characters are not counted" (testGarbageCount 0 "{<!!!>>}")
                 ]
