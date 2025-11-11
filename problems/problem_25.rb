# Find index of first term in Fibonacci sequence to have "length" digits.
class FibonacciLength

  private

  attr_writer :length, :index

  def initialize(length)
    self.length = length
    self.index = nth
  end

  def nth()
    fibonacci = fibonacci_generator()
    index = 2
    candidate = fibonacci.next()
      while candidate.to_s.length < length
        index += 1
        candidate = fibonacci.next()
      end
    index
  end

  def fibonacci_generator()
    Enumerator.new do |enum|
      fibonacci = [1, 1]
      while true
        enum.yield fibonacci[-1]
        fibonacci.push(fibonacci[-1] + fibonacci[-2])
      end
    end
  end

  public

  attr_reader :length, :index

end

if __FILE__ == $PROGRAM_NAME
  a = FibonacciLength.new(1000)
  puts "The index of the first term in the Fibonacci sequence to have %s digits is %s." % [a.length, a.index]
end
