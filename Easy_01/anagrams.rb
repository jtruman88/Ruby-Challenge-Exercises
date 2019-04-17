=begin

Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

use anagrams_test.rb for testing

=end

class Anagram
  attr_reader :test
  
  def initialize(test)
    @test = test
  end
  
  def match(words)
    words.select { |word| anagram?(word) }
  end
  
  private
  
  def anagram?(word)
    test.downcase.chars.sort.join == word.downcase.chars.sort.join &&
    test.downcase != word.downcase
  end
end