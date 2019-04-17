=begin

Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

The rules are as follows:

If the phone number is less than 10 digits assume that it is bad number
If the phone number is 10 digits assume that it is good
If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
If the phone number is 11 digits and the first number is not 1, then it is a bad number
If the phone number is more than 11 digits assume that it is a bad number

use Test Suite phone_number_test.rb

=end

class PhoneNumber
  def initialize(ph_number)
    @ph_number = ph_number
  end
  
  def number
    return '0000000000' unless valid_number?
    ph_number
  end
  
  def area_code
    number[0..2]
  end
  
  def to_s
    number.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end
  
  protected
  
  attr_accessor :ph_number
  
  def get_digits
    ph_number.gsub!(/\D/, '')
  end
  
  def trim_first
    self.ph_number = ph_number[1..-1]
  end
  
  def wrong_num_of_digits?
    ph_number.length < 10 || ph_number.length > 11
  end
  
  def num_has_letter?
    ph_number.match?(/[a-z]/i)
  end
  
  def eleven_and_starts_with_one?
    if ph_number.length == 11
      if ph_number[0] == '1'
        trim_first
        true
      else
        false
      end
    else
      true
    end
  end
  
  def valid_number?
    return false if num_has_letter?
    get_digits
    return false if wrong_num_of_digits?
    return false unless eleven_and_starts_with_one?
    true
  end
end