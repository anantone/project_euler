class AbundantNumbers

  private

  attr_writer :upper_limit

  def initialize(upper_limit)
    self.upper_limit = upper_limit
  end

  def is_abundant?(number)
    divisors(number).sum > number
  end

  def divisors(number)
    (1..number/2).each_with_object([]) do |candidate, divisors|
      divisors.push(candidate) if (number % candidate).zero?
    end
  end

  public

  attr_reader :upper_limit

  def abundant_numbers
    (1..upper_limit).to_a.select do |number|
      is_abundant?(number)
    end
  end

end

class NonAbundantSums < AbundantNumbers

  private

  attr_accessor :maximum
  attr_writer :non_abundant_sums

  def initialize(maximum)
    self.maximum = maximum
    self.non_abundant_sums = (1..maximum).to_a.select { |number| !abundant_sum?(number) }
  end

  def abundant_numbers_to_maximum
    AbundantNumbers.new(maximum).abundant_numbers
  end

  def abundant_sum?(number)
    pairs = abundant_numbers_to_maximum.repeated_combination(2).with_object([]) do |pair, pairs|
      pairs.push(pair)
    end
    pairs.any? { |pair| pair.sum == number }
  end

  public

  attr_reader :non_abundant_sums

  def sum_of
    non_abundant_sums.sum
  end
end

if __FILE__ == $PROGRAM_NAME
  puts NonAbundantSums.new(28123).sum_of
end
