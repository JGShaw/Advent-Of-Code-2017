import Test.HUnit
import Generator

testCountMatches expected input = TestCase $ assertEqual "" expected (Generator.countMatches input 65 8921)

tests = TestList [TestLabel "Part one provided example" (testCountMatches 1 5)
                 ]
                 
