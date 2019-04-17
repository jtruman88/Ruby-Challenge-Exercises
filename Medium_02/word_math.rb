=begin

Write a program that takes a word problem and returns the answer as an integer.

E.g.

What is 5 plus 13?

The program should return 18.

What is 7 minus 5 minus 1?

The program should return 1.

Remember, that these are verbal word problems, not treated as you normally would treat a written problem. This means that you calculate as you move forward each step. This means 3 + 2 * 3 = 15, not 9.

Hint: to solve this problem elegantly, you need to know how the send method works in Ruby. If you haven't seen it before, check it out here.

Test suite: word_math_test.rb

=end

class WordMath
  SIGNS = { 
    'plus' => '+', 'minus' => '-',
    'divided' => '/', 'multiplied' => '*'
  }
  
  def initialize(problem)
    @numbers = get_numbers(problem)
    @signs = get_signs(problem)
  end
  
  def answer
    raise ArgumentError if signs.empty?
    signs.each_with_index.reduce(numbers.first) do |total, (sign, ind)|
      total.send(SIGNS[sign], numbers[ind+1])
    end
  end
  
  private
  
  attr_reader :numbers, :signs
  
  def get_numbers(problem)
    problem.scan(/-?\d+/).map(&:to_i)
  end
  
  def get_signs(problem)
    pattern = Regexp.new("#{SIGNS.keys.join('|')}")
    problem.split.grep(pattern)
  end
end