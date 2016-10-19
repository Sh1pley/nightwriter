require 'minitest/autorun'
require 'minitest/pride'
require_relative 'translator'

class TranslatorTest < Minitest::Test

  def test_it_can_create_a_translator
    translator = Translator.new
    assert translator
  end
  def test_it_has_an_alphabet_when_created
    translator = Translator.new
    assert translator.alphabet
  end

  def test_it_can_return_line_given_1_alpha
    translator = Translator.new
    braille = "0."
    assert_equal braille, translator.to_braille_line("h", 0)
  end

  def test_it_can_return_line2_given_1_alpha
    translator = Translator.new
    braille = "00"
    assert_equal braille, translator.to_braille_line("h", 1)
  end

  def test_it_can_return_line3_given_1_alpha
    translator = Translator.new
    braille = ".."
    assert_equal braille, translator.to_braille_line("h", 2)
  end

  def test_it_can_determine_upcase_and_downcase_it
    translator = Translator.new
    character = "A"
    line = ""
    index = 0
    assert_equal "a", translator.check_upcase(character, line, index)
  end

  def test_it_can_convert_string_with_one_braille_to_nested_array
    translator = Translator.new
    string = "0....."
    assert_equal [["0.", "..", ".."]], translator.indexed_braille(string)
  end

  def test_it_can_convert_string_with_two_brailles_to_nested_array
    translator = Translator.new
    string = "0.....00.00."
    assert_equal [["0.", "..", ".."],["00", ".0", "0."]], translator.indexed_braille(string)
  end

  def test_it_can_return_alpha_given_string_with_1_braille
    translator = Translator.new
    alpha = "a"
    assert_equal alpha, translator.to_alpha("0.....")
  end

  def test_it_can_return_alpha_given_string_with_2_brailles
    translator = Translator.new
    alpha = "an"
    assert_equal alpha, translator.to_alpha("0.....00.00.")
  end

  def test_it_can_convert_letters_to_upcase
    result = Translator.new
    assert_equal "A", result.to_upcase("^a")
  end

  def test_to_alpha_works_with_to_upcase
    result = Translator.new
    assert_equal "B", result.to_alpha(".....00.0...")
  end
  
end