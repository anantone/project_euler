FILENAME = 'problem_13.txt'

file = File.open(FILENAME)
file_data = file.readlines.map(&:chomp)
puts file_data.map { |number| number.to_i }.sum.to_s[0..9]
