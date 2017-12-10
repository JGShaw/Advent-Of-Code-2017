import Test.HUnit
import Checksum

testChecksum expected input = TestCase $ assertEqual "" expected (Checksum.checksum input)

tests = TestList [TestLabel "Case 1" (testChecksum 18 "5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8"),
                 TestLabel "Case 2" (testChecksum 15 "5\t5\t5\n1\t2\t3\t4\t5\t6\n10\t0\t5\t7\t4\t2\t6\t8\t9\t5\t3\t2\t5\t4\t5\t6\t7\t8")
                 ]
                 
