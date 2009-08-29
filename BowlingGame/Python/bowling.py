class BowlingGame:
    """creates a new bowling game"""
    def __init__(self):
        self.__rolls = []

    def roll(self, pins):
        """record the number of pins rolled"""
        self.__rolls.append(pins)
    
    def score(self):
        """calculates the game store"""
        total = 0

        for f in range(10):
            pins = self.__rolls.pop(0)
            
            if pins == 10:
                total += pins + self.__rolls[0] + self.__rolls[1]
            elif pins + self.__rolls[0] == 10:
                total += pins + self.__rolls.pop(0) + self.__rolls[0]
            else:
                total += pins + self.__rolls.pop(0)

        return total
