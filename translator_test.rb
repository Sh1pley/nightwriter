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

  def test_it_can_convert_a_single_alpha_to_braille
    translator = Translator.new
    braille = ["0.", "00", ".."]
    assert_equal braille, translator.to_braille("h")
  end

  def test_it_can_convert_two_alphas_to_braille
    translator = Translator.new
    braille = [["0.", "00", ".."], ["0.", ".0", ".."]]
    assert_equal braille, translator.to_braille("he")
  end

  def test_it_can_convert_single_braille_to_alpha
    ##Still need to_alpha_method
    skip
    translator = Translator.new
    alpha = "h"
    assert_equal alpha, translator.to_alpha(["0.", "00", ".."])
  end

  def test_it_can_convert_two_brailles_to_alpha
    ##Still need to_alpha_method
    skip
    translator = Translator.new
    alpha = "he"
    assert_equal alpha, translator.to_alpha([["0.", "00", ".."], ["0.", ".0", ".."]])
  end

end