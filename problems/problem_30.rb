class DigitPowers

  MAX = 1000000

  private

  attr_accessor :power
  attr_writer :numbers

  def initialize(power)
    self.power = power
    self.numbers = (2..MAX).select { |number| equal_to_sum_of_digits?(number) }
  end

  def equal_to_sum_of_digits?(number)
    number == number.to_s.chars.map { |num| num.to_i ** power }.sum
  end

  public

  attr_reader :numbers

  def list
    numbers
  end

  def sum
    numbers.sum
  end

end
