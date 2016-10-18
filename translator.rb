require_relative 'alphabet'

class Translator
  def initialize
    alphabet = Alphabet.new
  end

  def to_braille(string)
    output_array = []
    string.each_char do|character|
      output_array << alphabet.given_alpha(character)  
    end
  return output_array  
  end
end