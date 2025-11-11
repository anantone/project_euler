#Find the largest palindrome made from the product of two 3-digit numbers.
class LargestPalindrome

  private

  attr_accessor :factors_range

  def initialize(min_factor, max_factor)
    self.factors_range = (min_factor..max_factor)
  end

  def all_products
    factors_range.to_a.combination(2).map { |pair| pair[0] * pair[1] }.uniq
  end

  def is_palindrome(number)
    number.to_s == number.to_s.reverse
  end

  def all_palindromes
    all_products.select { |product| is_palindrome(product) }
  end

  public

  def largest_palindrome
    all_palindromes.max
  end

end

if __FILE__ == $PROGRAM_NAME
  puts LargestPalindrome.new(100, 999).largest_palindrome
end
