require 'minitest/autorun'
require 'minitest/pride'
require_relative 'alphabet'

class AlphabetTest < Minitest::Test

  def test_it_can_create_an_alphabet
    alphabet = Alphabet.new
    assert alphabet
  end
  
  def test_it_wont_return_if_alpha_not_in_alphabet
    alphabet = Alphabet.new
    refute alphabet.given_alpha("aa", 0)
  end

  def test_it_can_return_braille_at_position_0
    alphabet = Alphabet.new
    braille = "0."
    assert_equal braille, alphabet.given_alpha("a", 0)
  end

  def test_it_can_return_braille_at_position_1
    alphabet = Alphabet.new
    braille = ".."
    assert_equal braille, alphabet.given_alpha("a", 1)
  end

  def test_it_can_return_braille_at_position_2
    alphabet = Alphabet.new
    braille = ".."
    assert_equal braille, alphabet.given_alpha("a", 2)
  end

  def test_it_wont_return_if_braille_not_in_alphabet
    alphabet = Alphabet.new
    refute alphabet.given_braille(["00","00","00"])
  end

  def test_it_can_return_alpha_given_braille_sequence
    alphabet = Alphabet.new
    alpha = "a"
    assert_equal alpha, alphabet.given_braille(["0.", "..", ".."])
  end  

  def test_it_can_locate_capital
    result = Alphabet.new
    assert_equal "^", result.given_braille(["..","..",".0"])
  end

  def test_it_can_write_capital_in_braille
    result = Alphabet.new
    assert_equal ["..","..",".0"], result.given_alpha("^", 0..2)
  end

  def test_it_can_write_numbers_in_braille
    result = Alphabet.new
    assert_equal ["00", ".0", ".."], result.given_alpha("4", 0..2)
  end

  def test_it_can_read_numbers_in_braille
    result = Alphabet.new
    assert_equal "7", result.given_braille_number(["00", "00", ".."])
  end

  def test_it_can_refute_wrong_inputs
    result = Alphabet.new
    refute result.given_alpha("&", 5)
  end

  # def test_it_can_write_letter_and_number
  #   result = Alphabet.new
  #   assert_equal ["0.", "..", ".."], result.given_alpha("a", 0..2)
  #   # assert_equal []
  # end
end
