class Palindrome
  attr_reader :value, :factors
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes
  attr_accessor :factors_range, :palindrome_products, :largest, :smallest

  def initialize(min_factor: 1, max_factor:)
    self.factors_range = (min_factor..max_factor)
  end

  def generate
    self.palindrome_products = factors_range.to_a.combination(2).map { |pair| [pair[0] * pair[1], [pair[0], pair[1]]] }.select { |product| is_palindrome(product[0]) }
  end

  def is_palindrome(number)
    number.to_s == number.to_s.reverse
  end

  def largest
    value, factors = palindrome_products.max
    self.largest = Palindrome.new(value, factors)
  end

  def smallest
    value, factors = palindrome_products.min
    self.smallest = Palindrome.new(value, factors)
  end

end