=begin

Write a program that can generate the lyrics of the 99 bottle bear song. See the test suite for the entire song.

Bonus Point!
After you've come up with a solution that can pass the tests, try a bonus solution with the restriction that there can't be any conditionals (if or case statements) in your code.

Use test suite from beer_song_test.rb

=end
class DefaultVerse
  def verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end
end

class VerseTwo
  def verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
  end
end

class VerseOne
  def verse(num)
    "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class FinalVerse
  def verse(num)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class BeerSong
  attr_reader :verse_switch
  
  def initialize
    @verse_switch = Hash.new(DefaultVerse).merge({0 => FinalVerse, 1 => VerseOne, 2 => VerseTwo})
  end
  
  def verse(num)
    verse_switch[num].new.verse(num)
  end
  
  def verses(*nums)
    song = []
    nums.max.downto(nums.min) do |num|
      song << verse_switch[num].new.verse(num)
    end
    song.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end

song = BeerSong.new
puts song.verses(99, 98)