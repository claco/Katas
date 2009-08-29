import unittest
from bowling import BowlingGame

class BowlingTests(unittest.TestCase):
    def setUp(self):
        """setup test"""
        self.game = BowlingGame()
    
    def roll(self, pins):
        """rolls once"""
        self.rollMany(1, pins)

    def rollMany(self, times, pins):
        """rolls many"""
        for i in range(times):
            self.game.roll(pins)
    
    def testGameExists(self):
        """can create a game"""
        game = BowlingGame()

    def testGutterGame(self):
        """score 0 for gutter game"""
        self.rollMany(20, 0)
        assert self.game.score() == 0

    def testAllOnes(self):
        """score 20 for all ones game"""
        self.rollMany(20, 1)
        assert self.game.score() == 20

    def testOneSpare(self):
        """score 16 for one spare"""
        self.roll(3)
        self.roll(7)
        self.roll(3)
        self.rollMany(17, 0)
        assert self.game.score() == 16

    def testOneStrike(self):
        """score 24 for one strike"""
        self.roll(10)
        self.roll(3)
        self.roll(4)
        self.rollMany(16, 0)
        assert self.game.score() == 24

if __name__ == '__main__':
    unittest.main()