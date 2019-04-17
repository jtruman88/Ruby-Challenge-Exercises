=begin

Write a program that given a phrase can count the occurrences of each word in that phrase.

For example, if we count the words for the input "olly olly in come free", we should get:

olly: 2
in: 1
come: 1
free: 1

use word_count_test.rb for testing

=end

class Phrase
  attr_reader :text
  
  def initialize(text)
    @text = text
  end
  
  def word_count
    counts = Hash.new(0)
    words = text.scan(/\b\w+'?\w*\b/).each do |word|
      counts[word.downcase] += 1
    end
    counts
  end
end