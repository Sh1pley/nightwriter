require_relative 'alphabet'
require 'pry'

class Translator

  attr_reader :alphabet

  def initialize
    @alphabet = Alphabet.new
  end


  def to_braille_line(string, index)
    line = ""
    string.each_char do|character|
      check_upcase(character, line, index)
      line << alphabet.given_alpha(character, index)  
    end
    line
  end

  def check_upcase(character, line, index)
    if character == character.upcase
      line << alphabet.given_alpha("^", index)
      character.downcase!
    end
  end

  def to_braille(string)
    braille_array = []
    braille_array << to_braille_line(string, 0)
    braille_array << to_braille_line(string, 1)
    braille_array << to_braille_line(string, 2)
    braille_array
  end

  def indexed_braille(string)
    string.scan(/../).each_slice(3).map { |e| e }
  end

  def to_alpha(string)
    final_string = ""
    indexed_braille(string).each do |item|
      final_string << alphabet.given_braille(item)
    end
    final_string
  end
end