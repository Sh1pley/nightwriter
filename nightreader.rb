require_relative 'translator'

first, second = ARGV

input_file = open(first)
line_1 = input_file.readline.chomp
line_2 = input_file.readline.chomp
line_3 = input_file.readline.chomp

length = line_1.length
ordered_line = ""
(0..length-1).step(2) do |index|
  ordered_line << line_1[index]
  ordered_line << line_1[index+1]
  ordered_line << line_2[index]
  ordered_line << line_2[index+1]
  ordered_line << line_3[index]
  ordered_line << line_3[index+1]
end
