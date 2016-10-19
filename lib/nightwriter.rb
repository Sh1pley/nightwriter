require_relative 'translator'

first, second = ARGV

input_file = open(first)
string = input_file.readline

translator = Translator.new
braille_array = translator.to_braille(string)

output_file = open(second, 'w')
line_1 = braille_array[0]
line_2 = braille_array[1]
line_3 = braille_array[2]

output_file.write(line_1)
output_file.write("\n")
output_file.write(line_2)
output_file.write("\n")
output_file.write(line_3)
output_file.write("\n")