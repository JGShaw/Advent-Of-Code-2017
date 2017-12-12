import Test.HUnit
import Maze

testSolve updater expected input = TestCase $ assertEqual "" expected (Maze.solve updater input)

tests = TestList [TestLabel "Example part one" (testSolve Maze.p1Update  5 [0,3,0,1,-3]),
                  TestLabel "Example part two" (testSolve Maze.p2Update  10 [0,3,0,1,-3])] 
