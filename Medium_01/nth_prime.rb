class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    
    primes = [2]
    n = 3
    until primes.length == num
      primes << n if is_prime?(n)
      n += 1
    end
    
    primes.last
  end
  
  def self.is_prime?(num)
    2.upto(num-1) do |n|
      return false if num % n == 0
    end
    
    true
  end
end