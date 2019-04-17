=begin

Implement the classic method for composing secret messages called a square code.

The input is first normalized: The spaces and punctuation are removed from the English text and the message is down-cased.

Then, the normalized characters are broken into rows. These rows can be regarded as forming a rectangle when printed with intervening newlines.

For example, the sentence:

If man was meant to stay on the ground god would have given us roots

is 54 characters long.

Broken into 8-character columns, it yields 7 rows.

Those 7 rows produce this rectangle when printed one per line:

ifmanwas
meanttos
tayonthe
groundgo
dwouldha
vegivenu
sroots

The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:

imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau

Write a program that, given an English text, outputs the encoded version of that text.

The size of the square (number of columns) should be decided by the length of the message. If the message is a length that creates a perfect square (e.g. 4, 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit neatly into a square, choose the number of columns that corresponds to the smallest square that is larger than the number of characters in the message.

For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use a rectangle 3 characters wide.

Output the encoded text grouped by column.

Test suite: crypto_square_test.rb

=end

class Crypto
  def initialize(text)
    @text = text
  end
  
  def normalize_plaintext
    self.text = text.downcase.delete('^a-z0-9')
  end
  
  def size
    length = normalize_plaintext.length
    Math.sqrt(length).ceil
  end
  
  def plaintext_segments
    normalize_plaintext.scan(/[a-z0-9]{1,#{size}}/)
  end
  
  def ciphertext
    encode(plaintext_segments)
  end
  
  def normalize_ciphertext
    encode(plaintext_segments, ' ')
  end
  
  private
  
  attr_accessor :text
  
  def encode(plaintext, ending='')
    strings = split(plaintext_segments)
    ciph = ''
    until strings[0].empty?
      strings.each do |arr|
        next if arr.empty?
        ciph << arr.shift
      end
      ciph << ending
    end
    ciph.strip
  end
  
  def split(segments)
    segments.map { |str| str.split('') }
  end
end

crypto = Crypto.new('Madness, and then illumination.')
p crypto.normalize_ciphertext