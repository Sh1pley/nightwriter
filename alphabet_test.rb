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
    refute alphabet.given_alpha("aa")
  end

  def test_it_can_return_braille_given_alpha
    alphabet = Alphabet.new
    braille = ["0.", "..", ".."]
    assert_equal braille, alphabet.given_alpha("a")
  end

  def test_it_wont_return_if_braille_not_in_alphabet
    alphabet = Alphabet.new
    refute alphabet.given_braille(["00","00","00"])
  end

  def test_it_can_return_alpha_given_braille
    alphabet = Alphabet.new
    alpha = "a"
    assert_equal alpha, alphabet.given_braille(["0.", "..", ".."])
  end  

end