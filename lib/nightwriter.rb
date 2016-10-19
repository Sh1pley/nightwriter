require './lib/translator'

first, second = ARGV

input_file = File.open(first)
output_file = File.open(second, 'w')

string = input_file.readline

translator = Translator.new
braille = translator.to_braille(string)

3.times do |i|
  output_file.write(braille[i])
  output_file.write("\n")
end

output_file.close