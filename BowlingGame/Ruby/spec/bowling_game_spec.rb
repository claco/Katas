require File.dirname(__FILE__) + '/spec_helper.rb'

describe BowlingGame do
  before(:each) do
    @game = BowlingGame.new
  end
  
  def roll(pins)
    rollMany(1, pins)
  end

  def rollMany(times, pins)
    times.times { @game.roll(pins) }
  end

  it "should score 0 for a gutter game" do
    rollMany(20, 0)
    
    @game.score.should == 0
  end
  
  it "should score 20 for an all ones game" do
    rollMany(20, 1)
    
    @game.score.should == 20
  end
  
  it "should score 16 with one spare" do
    roll(3)
    roll(7)
    roll(3)
    rollMany(17, 0)
    
    @game.score.should == 16
  end
  
  it "should score 24 with one strike" do
    roll(10)
    roll(3)
    roll(4)
    rollMany(16, 0)
    
    @game.score.should == 24
  end
  
  it "should score a perfect game" do
    rollMany(12, 10)
    
    @game.score.should == 300
  end
end