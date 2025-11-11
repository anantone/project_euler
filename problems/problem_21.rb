class AmicableNumbersSum

  private

  attr_accessor :up_to, :amicable_numbers
  attr_writer :sum

  def initialize(up_to)
    self.up_to = up_to
    self.amicable_numbers = find_amicable
    self.sum = amicable_numbers.sum
  end

  def find_amicable
    (1..up_to).to_a.select do |number|
      sum_of_divisors(sum_of_divisors(number)) == number &&
        sum_of_divisors(number) != number
    end
  end

  def sum_of_divisors(number)
    (1...number).select { |candidate| (number % candidate).zero? }.sum
  end

  public

  attr_reader :sum, :amicable_numbers

end

if __FILE__ == $PROGRAM_NAME
  a =  AmicableNumbersSum.new(10000)
  puts "The amicable numbers up to 10000 are: %s." % a.amicable_numbers.to_s
  puts "Their sum is %s." % a.sum
end
