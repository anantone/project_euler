=begin
Generate Fibonacci sequence up to provided "upper limit".

Calculate the sum of even numbers in sequence, sum of odd numbers, sum of numbers.
=end
class FibonacciSums

  private

  attr_writer :fibonacci

  #Generate Fibonacci sequence up to "upper limit".
  def initialize(upper_limit)
    self.fibonacci = [1, 2]
    while fibonacci[-1] < upper_limit
      fibonacci.push(fibonacci[-1] + fibonacci[-2])
    end
  end

  public

  attr_reader :fibonacci

  #Sum of even numbers in the generated sequence.
  def sum_evens
    fibonacci.select { |number| (number % 2).zero? }.sum
  end

  #Sum of odd numbers in the generated sequence.
  def sum_odds
    fibonacci.select { |number| (number % 2).nonzero? }.sum
  end

  #Sum of numbers in the generated sequence.
  def sum
    fibonacci.sum
  end

end

if __FILE__ == $PROGRAM_NAME
  puts Fibonacci.new(4000000).sum_evens
end
