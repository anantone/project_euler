#Find the sum of all multiples of 3 or 5 below a given number.
class FizzBuzz

  private

  attr_writer :number

  #Define the excluded upper limit.
  def initialize(number)
    self.number = number
  end

  def all_multiples
    (1...number).select { |number| (number % 3).zero? || (number % 5).zero? }
  end

  public

  attr_reader :number

  #Sum the array of multiples
  def sum_of_multiples
    all_multiples.sum
  end

end

if __FILE__ == $PROGRAM_NAME
  a = FizzBuzz.new(1000)
  puts "The sum of multiples of 3 or 5 below %s is %s." % [a.number, a.sum_of_multiples]
end

