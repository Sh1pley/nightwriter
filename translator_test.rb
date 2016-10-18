require 'minitest/autorun'
require 'minitest/pride'
require_relative 'translator'

class TranslatorTest < Minitest::Test

  def test_it_can_create_a_translator
    translator = Translator.new
    assert translator
  end
  def test_it_has_an_alphabet_when_created
    ##Need to add attr_reader for alphabet
    skip
    translator = Translator.new
    assert translator.alphabet
  end

  def test_it_can_return_line1_given_1_character
    translator = Translator.new
    braille = "0."
    assert_equal braille, translator.to_braille_1("h")
  end

  def test_it_can_return_line2_given_1_character
    translator = Translator.new
    braille = "00"
    assert_equal braille, translator.to_braille_2("h")
  end

  def test_it_can_return_line3_given_1_character
    translator = Translator.new
    braille = ".."
    assert_equal braille, translator.to_braille_3("h")
  end

  def test_it_can_return_line1_given_2_characters
    translator = Translator.new
    braille = "0.0."
    assert_equal braille, translator.to_braille_1("he")
  end

  def test_it_can_return_line2_given_2_characters
    translator = Translator.new
    braille = "00.0"
    assert_equal braille, translator.to_braille_2("he")
  end

  def test_it_can_return_line3_given_2_characters
    translator = Translator.new
    braille = "...."
    assert_equal braille, translator.to_braille_3("he")
  end

end