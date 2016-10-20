require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_it_can_create_a_translator
    translator = Translator.new
    assert translator
  end
  def test_it_has_an_alphabet_when_created
    translator = Translator.new
    assert translator.alphabet
  end

  def test_it_can_return_line1_given_1_alpha
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

  def test_it_can_return_line_given_2_alphas
    translator = Translator.new
    braille = "0.00"
    assert_equal braille, translator.to_braille_line("an", 0)
  end

  def test_it_can_determine_upcase_and_downcase_it
    translator = Translator.new
    line = ""
    assert_equal "a", translator.check_upcase("A", line, 0)
  end

  def test_check_upcase_wont_add_space_to_special_characters
    translator = Translator.new
    line = ""
    translator.check_upcase("!", line, 0)
    assert_equal "", line
  end

  def test_it_can_return_line_given_a_capital_letter
    translator = Translator.new
    braille = "..0."
    assert_equal braille, translator.to_braille_line("A", 0)
  end

  def test_it_can_return_line_given_a_capital_and_lowercase
    translator = Translator.new
    braille = "..0.0."
    assert_equal braille, translator.to_braille_line("Aa", 0)
  end

  def test_to_braille_line_works_given_1_number
    translator = Translator.new
    braille = ".00."
    assert_equal braille, translator.to_braille_line("#1", 0)
  end

  def test_to_braille_line_works_given_2_numbers
    translator = Translator.new
    braille = ".00.00"
    assert_equal braille, translator.to_braille_line("#13", 0)
  end

  def test_to_braille_works_with_capitals
    translator = Translator.new
    braille = ["..0.0.", "..0.0.", ".0...."]
    assert_equal braille, translator.to_braille("Bb")
  end

  def test_to_braiile_works_with_numbers
    translator = Translator.new
    braille = [".00.0.", ".0..0.", "00...."]
    assert_equal braille, translator.to_braille("#12")
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