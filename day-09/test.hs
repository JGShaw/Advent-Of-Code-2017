import Test.HUnit
import Stream

testScore expected input = TestCase $ assertEqual "" expected (Stream.score input)


tests = TestList [TestLabel "A single group has a score of 1" (testScore 1 "{}"),
                  TestLabel "Nested groups are scored with increasing counts" (testScore 6 "{{{}}}"),
                  TestLabel "Comma seperated groups are scored with the same count" (testScore 5 "{{},{}}"),
                  TestLabel "Nested and comma seperated groups" (testScore 16 "{{{},{},{{}}}}"),
                  TestLabel "Garbage is ignored" (testScore 1 "{<a>,<a>,<a>,<a>}"), 
                  TestLabel "Garbage in a nested group is ignored" (testScore 9 "{{<ab>},{<ab>},{<ab>},{<ab>}}"),
                  TestLabel "A group inside garbage is ignored" (testScore 1 "{<{}>}"),
                  TestLabel "Escape characters ignore closing garbage tags" (testScore 3 "{{<a!>},{<a!>},{<a!>},{<ab>}}")
                 ]
