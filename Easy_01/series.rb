=begin

Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:

- 012
- 123
- 234

And the following 4-digit series:

- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

use test suite in series_test.rb
=end

class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

#  def slices(length)
#    raise ArgumentError if length > number.length
#    sliced = []
#    ind = 0
#    range = length - 1
#    loop do
#      break if range >= number.length
#      inner = ind
#      sliced[ind] = []
#      loop do
#        break if inner > range
#        sliced[ind] << number[inner].to_i
#        inner += 1
#      end
#      ind += 1
#      range += 1
#    end
#
#    sliced
#  end

  def slices(length)
    raise ArgumentError if length > number.length
    slices = []
    range = length - 1
    number.chars.each_with_index do |_, ind|
      break if range >= number.length
      slices << number[ind..range].chars.map(&:to_i)
      range += 1
    end
    slices
  end
end
