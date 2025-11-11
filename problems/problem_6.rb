#Calculate the difference between the sum of the squares and the square of the sum of the natural numbers up to a given number.
class Squares

  private

  attr_writer :square_of_sum, :sum_of_squares, :difference

  def initialize(number)
    self.square_of_sum = (number * number.next/2)**2
    self.sum_of_squares = number * number.next * (2 * number + 1)/6
    self.difference = square_of_sum - sum_of_squares
  end

  public

  attr_reader :square_of_sum, :sum_of_squares, :difference

end

if __FILE__ == $PROGRAM_NAME
  puts Squares.new(100).difference
end
