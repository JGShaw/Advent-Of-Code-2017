import Test.HUnit
import Checksum

testChecksum1 expected input = TestCase $ assertEqual "" expected (Checksum.checksum1 input)
testChecksum2 expected input = TestCase $ assertEqual "" expected (Checksum.checksum2 input)

tests = TestList [TestLabel "Case 1 P1" (testChecksum1 18 "5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8"),
                  TestLabel "Case 2 P1" (testChecksum1 15 "5\t5\t5\n1\t2\t3\t4\t5\t6\n10\t0\t5\t7\t4\t2\t6\t8\t9\t5\t3\t2\t5\t4\t5\t6\t7\t8"),

                  TestLabel "Case 1 P2" (testChecksum2 9 "5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5")
                 ]
                 
