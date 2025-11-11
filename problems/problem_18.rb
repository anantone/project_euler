GRID = 'triangle_pb_18.txt'

file_content = File.open(GRID)
arrays = file_content.read.split("\n").map { |string| string.split }
arrays.reverse!
arrays = arrays.map { |array| array.map { |number| number.to_i } }

sum = arrays[0].max.to_i
idx = 0
(1...arrays.length).each do |num|
  sum += arrays[num][idx..idx+1].max.to_i
  idx = arrays[num].index(arrays[num][idx..idx+1].max)
end
puts sum
