=begin

Write a program that can detect palindrome products in a given range.

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

Test suite: palindrome_products_test.rb

=end

class Palindromes
  
  Palindrome = Struct.new(:factors, :value)
  
  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end
  
  def generate
    (min_factor..max_factor).to_a.repeated_combination(2) do |first, second|
      palindromes[first * second] << [first, second] if palindrome?(first * second)
    end
  end
  
  def largest
    palindrome = palindromes.sort_by { |key, value| key }.last
    Palindrome.new(palindrome[1], palindrome[0])
  end
  
  def smallest
    palindrome = palindromes.sort_by { |key, value| key }.first
    Palindrome.new(palindrome[1], palindrome[0])
  end
  
  private
  
  attr_reader :max_factor, :min_factor, :palindromes
  
  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end
end