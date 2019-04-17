=begin

Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.

Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
There are a few more rules for edge cases, and there are regional variants too.

use Test suite in pig_latin_test.rb

=end

class PigLatin
  VOWELS = %w[a e i o u]
  
  def self.translate(phrase)
    words = phrase.split(' ')
    words.map! do |word|
      if starts_with_vowel?(word) || starts_with_edge?(word)
        build_for_vowel(word)
      else
        build_for_con(word)
      end
    end
    words.join(' ')
  end
  
  def self.starts_with_vowel?(word)
    VOWELS.include?(word[0])
  end
  
  def self.starts_with_edge?(word)
    (word[0] == 'y' && !VOWELS.include?(word[1])) ||
      (word[0] == 'x' && !VOWELS.include?(word[1]))
  end
  
  def self.build_for_vowel(word)
    word << 'ay'
  end
  
  def self.build_for_con(word)
      word.sub!(/([^#{VOWELS}]*qu|[^#{VOWELS}]+)(\w+)/, '\2\1ay')
  end
end