#Find the largest prime factor of a given number.
class PrimeFactors

  private

  attr_writer :number, :prime_factors

  #Set number and array of prime factors as attributes.
  def initialize(number)
    self.number = number
    self.prime_factors = find_prime_factors(number)
  end

  #Return an array of prime factors of a given number.
  def find_prime_factors(number)
    factors = []
    divisor = 2
    while number > 1
      while (number % divisor).zero?
        factors.push(divisor)
        number /= divisor
      end
     divisor += 1
    end
    factors
  end

  public

  attr_reader :number, :prime_factors

  #Return the largest of array.
  def largest_prime_factor
    prime_factors.max
  end

end

if __FILE__ == $PROGRAM_NAME
  a = PrimeFactors.new(600851475143)
  puts "The largest prime factor of %s is %s." % [a.number, a.largest_prime_factor]
end
