#Find Pythagorean triplet, when there is only one
class UniquePythagoreanTriplet

  private

  attr_accessor :sum
  attr_writer :x, :y, :z

  def initialize(sum)
    self.sum = sum
    self.x,
    self.y,
    self.z = find_triplet
  end

  def find_triplet
    triplets = (1...(sum / 3)).map do |a|
      b = (sum**2 - 2 * sum * a) / (2 * sum - 2 * a)
      c = sum - a - b
      [a, b, c] if a < b && b < c && a**2 + b**2 == c**2
    end.compact
    if triplets.length.zero? || triplets.length > 1
      raise ValueError "not a unique triplet"
    else
      triplets.flatten
    end
  end

  public

  attr_reader :x, :y, :z

  def product
    x * y * z
  end

end
