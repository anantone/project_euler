class AbundantNumbers
  def initialize(upper_limit)
    @upper_limit = upper_limit
  end

  def abundant?(number)
    sum_of_divisors(number) > number
  end

  def sum_of_divisors(number)
    return 0 if number <= 1

    sum = 1 # 1 is always a divisor
    sqrt = Math.sqrt(number).to_i

    (2..sqrt).each do |i|
      if (number % i).zero?
        sum += i
        sum += number / i unless i * i == number
      end
    end

    sum
  end

  attr_reader :upper_limit

  def abundant_numbers
    (1..@upper_limit).select { |number| abundant?(number) }
  end
end

class NonAbundantSums
  attr_reader :maximum, :non_abundant_sums

  def initialize(maximum)
    @maximum = maximum
    @abundant_nums = AbundantNumbers.new(maximum).abundant_numbers.to_set
    @non_abundant_sums = calculate_non_abundant_sums
  end

  def sum_of
    non_abundant_sums.sum
  end

  private

  def calculate_non_abundant_sums
    (1..maximum).reject { |number| abundant_sum?(number) }
  end

  def abundant_sum?(number)
    @abundant_nums.any? do |abundant|
      next if abundant >= number

      @abundant_nums.include?(number - abundant)
    end
  end
end

puts NonAbundantSums.new(28_123).sum_of if __FILE__ == $PROGRAM_NAME
