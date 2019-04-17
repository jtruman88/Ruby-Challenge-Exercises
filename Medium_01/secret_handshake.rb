=begin

Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.
handshake = SecretHandshake.new 9
handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
handshake.commands # => ["jump","wink"]
The program should consider strings specifying an invalid binary as the value 0.

Use Test suite from secret_handshake_test.rb

=end

class SecretHandshake
  NUM_TO_STEPS = {
    1 => "wink", 10 => "double blink",
    100 => "close your eyes", 1000 => "jump"
  }

  def initialize(pattern)
    @pattern = pattern
  end

  def commands
    handle_input
    reverse = reversed?
    steps = get_steps
    steps.map! { |step| NUM_TO_STEPS[step] }
    reverse ? steps : steps.reverse
  end

  protected

  attr_accessor :pattern

  def handle_input
    self.pattern = if pattern.is_a?(String)
                pattern.to_i
              else
                pattern.to_s(2).to_i
              end
  end

  def reversed?
    if pattern.to_s.length > 4
      remove_front
      true
    else
      false
    end
  end

  def remove_front
    self.pattern %= 10000
  end

  def get_steps
    steps = []
    num = 1000
    until num == 0
      steps << num if pattern / num == 1
      self.pattern %= num
      num /= 10
    end
    steps
  end
end
