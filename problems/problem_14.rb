#Which starting number, under a given number, produces the longest Collatz sequence?
module CollatzConjecture

  def self.max_steps_in_range(top_range)
    max_steps = 0
    number = 0
    (1...top_range).each do |candidate|
      if steps(candidate) > max_steps
        max_steps = steps(candidate)
        number = candidate
      end
    end
    puts "The answer is %d with %d steps." % [number, max_steps]
  end

  def self.steps(number)
    raise ArgumentError if number <= 0
    count = 0
    until number == 1
      count += 1
      number = number.even? ? number / 2 : number * 3 + 1
    end
    count
  end

end

if __FILE__ == $PROGRAM_NAME
  CollatzConjecture.max_steps_in_range(1_000_000)
end
