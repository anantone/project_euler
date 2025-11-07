=begin
Calculate largest product of 4 numbers in a line (including diagonals) in a 20*20 provided grid of numbers.
TODO would be extending to a product of n numbers in a m*m provided grid?
=end
class ProductGrid

  private

  attr_accessor :grid
  attr_writer :products

  def initialize(grid)
    self.grid = File.read(grid).split("\n").map do |line|
      line.split(' ').map { |number| number.to_i }
    end
    self.products = lines + columns + diagonals1 + diagonals2
  end

  def lines
    grid.each_with_object([]) do |line, products|
      (0..line.length - 4).each do |i|
        products.push(line[i] * line[i+1] * line[i+2] * line[i+3])
      end
    end
  end

  def columns
    grid.transpose.each_with_object([]) do |line, products|
      (0..line.length - 4).each do |i|
        products.push(line[i] * line[i+1] * line[i+2] * line[i+3])
      end
    end
  end

  def diagonals1
    (0..grid.length - 4).each_with_object([]) do |i, products|
      (0..grid.length - 4).each do |j|
        products.push(grid[i][j] * grid[i+1][j+1] * grid[i+2][j+2] * grid[i+3][j+3])
      end
    end
  end

  def diagonals2
    (0..grid.length - 4).each_with_object([]) do |i, products|
      (0..grid.length - 4).each do |j|
        products.push(grid[i][j] * grid[i+1][j-1] * grid[i+2][j-2] * grid[i+3][j-3])
      end
    end
  end

  public

  attr_reader :products

  def maximum_product
    products.max
  end

end

if __FILE__ == $PROGRAM_NAME
  puts ProductGrid.new('grid_pb_11.txt').maximum_product
end
