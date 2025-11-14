GRID = '0067_triangle.txt'

file_content = File.open(GRID)
arrays = file_content.read.split("\n").map { |string| string.split }
arrays.reverse!
arrays = arrays.map { |array| array.map { |number| number.to_i } }

(1...arrays.length).each do |row|
  (0...arrays[row].length).each do |idx|
    arrays[row][idx] += arrays[row - 1][idx, 2].max
  end
end
puts arrays[-1][0]
