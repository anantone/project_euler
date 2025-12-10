class LargestPandigitalPrime

  attr_accessor :digits

  def initialize(digits)
    self.digits = digits
  end

  def pandigital_primes
    pp = []
    i = (10 ** digits) - 1
    i.downto(i/10) do |i|
      pp.push(i) if prime?(i) && pandigital?(i)
    end
    pp
  end

  def largest
    pandigital_primes.max
  end


  def pandigital?(number)
    sorted_digits = number.digits.sort
    sorted_digits.each_index.all? { |index| index + 1 == sorted_digits[index] }
  end

  def prime?(number)
    return false if number <= 1
    (2..(number**0.5).to_i).each do |divisor|
      if (number % divisor).zero?
        return false
      end
    end
    true
  end

end


