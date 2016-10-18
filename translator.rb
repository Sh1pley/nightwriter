require_relative 'alphabet'

class Translator

  attr_reader :alphabet

  def initialize
    @alphabet = Alphabet.new
  end

  def to_braille_1(string)
    line_1 = ""
    string.each_char do|character|
      line_1 << alphabet.given_alpha(character,0)  
    end
  return line_1
  end

  def to_braille_2(string)
    line_2 = ""
    string.each_char do|character|
      line_2 << alphabet.given_alpha(character,1)  
    end
  return line_2
  end

  def to_braille_3(string)
    line_3 = ""
    string.each_char do|character|
      line_3 << alphabet.given_alpha(character,2)  
    end
  return line_3
  end

  def to_braille(string)
    braille_array = []
    braille_array << to_braille_1(string)
    braille_array << to_braille_2(string)
    braille_array << to_braille_3(string)
    return braille_array
  end

  def indexed_braille(string)
    elements = string.scan(/../)
    output = elements.each_slice(3).map { |e| e }
    return output
  end

  def to_alpha(string)
    string = ""
    to_print = indexed_braille(string)
      to_print.each do |item|
        string << alphabet.to_alpha(item)
      end
    return string
  end
      

end