=begin

Create a clock that is independent of date.

You should be able to add and subtract minutes to it. Two clocks that represent the same time should be equal to each other.

use Test suite clock_test.rb

=end

class Clock
  def initialize(hr, min)
    @hour = hr % 24
    @minutes = min
  end
  
  def self.at(hr, mins = 0)
    new(hr, mins)
  end
  
  def +(mins)
    self.hour += (minutes + mins) / 60
    self.hour %= 24
    self.minutes += mins
    self.minutes %= 60
    self
   end
  
  def -(mins)
    self + (-mins)
  end
  
  def ==(other)
    self.hour == other.hour && self.minutes == other.minutes
  end
  
  def to_s
    format('%02d:%02d', hour, minutes)
  end
  
  protected
  
  attr_accessor :hour, :minutes
end