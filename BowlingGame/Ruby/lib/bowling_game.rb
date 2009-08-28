$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class BowlingGame
  VERSION = '0.0.1'

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end
  
  def score
    total = 0
    
    10.times { |i|
      pins = @rolls.shift

      if pins == 10
        total += pins + @rolls[0] + @rolls[1]
      elsif pins + @rolls.first == 10
        total += pins + @rolls.shift + @rolls.first
      else
        total += pins + @rolls.shift
      end
    }
    
    total
  end
end