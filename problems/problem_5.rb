class EvenlyDivisibleByRange

  private

  attr_accessor :range

  def initialize(min_range, max_range)
    self.range = (min_range..max_range)
  end

  def evenly_divisible(candidate)
    range.all? { |number| (candidate % number).zero? }
  end

  public

  def find_smallest
    candidate = 1
    while !evenly_divisible(candidate)
      candidate += 1
    end
    return candidate
  end

end

if __FILE__ == $PROGRAM_NAME
  puts EvenlyDivisibleByRange.new(1, 20).find_smallest
end
