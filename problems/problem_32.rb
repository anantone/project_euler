class PandigitalProducts

  private

  attr_writer :products
  attr_accessor :size

  def initialize size
    self.size = size
    self.products = all_products
  end

  def all_products
    (4000...8000).each_with_object([]) do |k, products|
        unidigital_factors(k).each do |pair|
          identity = pair[0].to_s + pair[1].to_s + k.to_s
          if is_pandigital?(identity.to_i) && identity.length == size
            products.push(k)
          end
        end
      end.uniq
  end

  def factors number
    (1..number).each_with_object([]) do |divisor, factors|
      if number % divisor == 0
        factors.push([divisor, number / divisor])
      end
    end.map { |pair| pair.sort }.uniq
  end

  def unidigital_factors number
    factors(number).select do |pair|
      is_unidigital?((pair[0].to_s + pair[1].to_s).to_i)
    end
  end

  def is_unidigital? number
    number.digits.length == number.digits.uniq.length
  end

  def is_pandigital? number
    sorted_digits = number.digits.sort
    sorted_digits.each_index.all? { |index| index + 1 == sorted_digits[index] }
  end

  public

  attr_reader :products

  def sum
    products.sum
  end

end
