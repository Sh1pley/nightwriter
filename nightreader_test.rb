require 'minitest/autorun'
require 'minitest/pride'
require_relative 'reader_test'

class NightreaderTest < Minitest::Test

  def test_it_can_read_from_file
    expected = "test"
    result = Reader.new
    assert expected == result.text
  end  

  def test_text_can_be_seperated_into_chars
    result = Reader.new
    assert_equal 4, result.letters.count
  end

  def test_it_can_output_an_array_from_text
    result = Reader.new
    assert_equal Array, result.letters.class
  end

  def test_text_arrays_can_be_split_into_2_digit_indexes
    result = Reader.new
    assert_equal 2, result.output[0].length
  end

  def test_output_array_is_3_indexes
    result = Reader.new
    assert_equal 3, result.output.count
  end

end