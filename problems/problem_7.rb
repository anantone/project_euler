# Produce the value of the nth prime number.
class NthPrime

  private

  attr_writer :value
  attr_accessor :n

  def initialize(n)
    raise ArgumentError, "n must be a positive integer" if n < 1
    self.n = n
    self.value = primes[-1]
  end

  def primes
    primes = []
    i = 1
    while primes.length < n
      if is_prime(i)
        primes.push(i)
      end
      i += 1
    end
    primes
  end

  def is_prime(number)
    return false if number <= 1
    (2..(number**0.5).to_i).each do |divisor|
      if (number % divisor).zero?
        return false
      end
    end
    true
  end

  public

  attr_reader :value

end

if __FILE__ == $PROGRAM_NAME
  puts NthPrime.new(10001).value
end
