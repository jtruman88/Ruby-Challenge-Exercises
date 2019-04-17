=begin

Write a program that, given a word, computes the scrabble score for that word.

Letter Values
You'll need these:

Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
Examples
"cabbage" should be scored as worth 14 points:

3 points for C
1 point for A, twice
3 points for B, twice
2 points for G
1 point for E

And to total:

3 + 2*1 + 2*3 + 2 + 1
= 3 + 2 + 6 + 3
= 5 + 9
= 14

=end

class Scrabble
  attr_reader :word

  VALUES = {
    1 => %w[a e i o u l n r s t],
    2 => %w[d g],
    3 => %w[b c m p],
    4 => %w[f h v w y],
    5 => %w[k],
    8 => %w[j x],
    10 => %w[q z]
  }
  
  def initialize(word)
    @word = verify_input(word)
  end
  
  def verify_input(word)
    verified = word == nil ? '' : word.gsub(/[^a-zA-Z]/, '')
  end

  def score
    points = 0
    VALUES.each do |value, letters|
      word.chars.each { |ch| points << value}
    end
    word.each_char do |ch|
      VALUES.each do |value, letters|
        if letters.include?(ch.downcase)
          points += value
          break
        end
      end
    end
    points
  end
  
  def self.score(word)
    self.new(word).score
  end
end