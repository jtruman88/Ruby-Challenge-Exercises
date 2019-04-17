=begin

Consider a character set consisting of letters, a space and a point. Words consist of one or more, but at more 20 letters. An input text consists of one or more words separated from each other by one or more spaces and terminated by zero or more spaces followed by a point. Input should be read from, and including, the first letter of the first word, up to and including the terminatig point. The output text is to be produced such that successive words are separated by a single space with the last word being terminated by a single point. Odd indexed words are copied in reverse order while even words are merely echoed. For example, the input string:

"whats the matter with kansas." becomes "whats eht matter htiw kansas."

BONUS: the characters must be read and printed one at a time.

=end

class OddWords
  attr_reader :text
  
  def initialize(text)
    @text = text
  end
  
  def reverse_odds
    words = text.scan(/\b[a-zA-Z]+\b/)
    words.map.with_index { |word, ind| ind.odd? ? word.reverse : word }.join(' ') << '.'
  end
end

test = OddWords.new("hello   word  world   .")
puts test.reverse_odds