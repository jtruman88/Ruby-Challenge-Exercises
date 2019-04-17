class Integer
  def to_roman
    roman = ''
    num = self
    roman << thousands(num) if num >= 1000
    num = num % 1000
    roman << hundreds(num)  if num >= 100
    num = num % 100
    roman << tens(num)      if num >= 10
    num = num % 10
    roman << ones(num)      if num >= 1
    roman
  end
  
  private
  
  def thousands(num)
    convert = {1 => 'M', 2 => 'MM', 3 => 'MMM'}
    roman = convert[num / 1000]
  end
  
  def hundreds(num)
    convert = {
      1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD',
      5 => 'D', 6 => 'DC', 7 => 'DCC', 8 => 'DCCC', 9 => 'CM'
    }
    roman = convert[num / 100]
  end
  
  def tens(num)
    convert = {
      1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL',
      5 => 'L', 6 => 'LX', 7 => 'LXX', 8 => 'LXXX', 9 => 'XC'
    }
    roman = convert[num / 10]
  end
  
  def ones(num)
    convert = {
      1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV',
      5 => 'V', 6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX'
    }
    roman = convert[num]
  end
end

