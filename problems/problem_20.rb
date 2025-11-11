#Calculate the sum of digits of the factorial of a given number.
class FactorialDigitSum

  private

  attr_accessor :number
  attr_writer :digit_sum

  def initialize(number)
    self.number = number
    self.digit_sum = sum_of_digits
  end

  def factorial
    (1..number).inject(:*)
  end

  def sum_of_digits
    factorial.to_s.split('').map { |n| n.to_i }.sum
  end

  public

  attr_reader :digit_sum

end

if __FILE__ == $PROGRAM_NAME
  puts FactorialDigitSum.new(100).digit_sum
end
