=begin

Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.

The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.

# "102012"
    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302

use trinary_test.rb for testing

=end

class Trinary
  BASE = 3
  
  attr_reader :tri
  
  def initialize(tri)
    @tri = tri
  end
  
  def to_decimal
    return 0 unless valid_input?
    dec = 0
    tri.reverse.chars.each_with_index do |num, ind|
      dec += num.to_i * (BASE**ind)
    end
    dec
  end
  
  def valid_input?
    !(tri.to_i <= 0 || tri.chars.any? { |num| ('3'..'9').to_a.include?(num) })
  end
end