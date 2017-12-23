import Test.HUnit
import Generator

testCountMatches genA genB expected input = TestCase $ assertEqual "" expected (Generator.countMatches input genA 65 genB 8921)

tests = TestList [TestLabel "Part one provided example" (testCountMatches Generator.p1A Generator.p1B 1 5),
                  TestLabel "Part one provided example" (testCountMatches Generator.p2A Generator.p2B 309 5000000)
                 ]
                 
