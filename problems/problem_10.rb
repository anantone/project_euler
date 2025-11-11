# Calculate the sum of the prime numbers which are lower than a given number.
class SumOfPrimes

  private

  attr_accessor :max, :sum

  def initialize(number)
    self.max = number - 1
    self.sum = sum_of
  end

  def sum_of
    (1..max).to_a.select { |number| is_prime(number) }.sum
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

  attr_reader :sum

end

if __FILE__ == $PROGRAM_NAME
  puts "Enter a number: "
  number = gets.chomp.to_i
  puts "The sum of prime numbers lower than %s is %s." % [number, SumOfPrimes.new(number).sum]
end
