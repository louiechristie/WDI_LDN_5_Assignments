require 'minitest/autorun'
require 'fileutils'
require_relative 'card'
require_relative 'cardfile'


class TestCard < MiniTest::Unit::TestCase
  
  def setup
    @card = Card.new("4408041234567893")
    @input_file = File.new("input.txt", "r")
    @expected_output_file = File.new("expected_output.txt", "r")
    @output_file = File.new("output.txt", "w")
  end

  def test_double_1
    assert_equal 2, @card.double_and_sum_digits(1) 
  end

  def test_double_2
    assert_equal 4, @card.double_and_sum_digits(2) 
  end

  def test_double_3
    assert_equal 6, @card.double_and_sum_digits(3) 
  end

  def test_double_4
    assert_equal 8, @card.double_and_sum_digits(4) 
  end

  def test_double_5
    assert_equal 1, @card.double_and_sum_digits(5) 
  end

  def test_double_6
    assert_equal 3, @card.double_and_sum_digits(6) 
  end

  def test_double_7
    assert_equal 5, @card.double_and_sum_digits(7) 
  end

  def test_double_8
    assert_equal 7, @card.double_and_sum_digits(8) 
  end

  def test_double_9
    assert_equal 9, @card.double_and_sum_digits(9) 
  end

  def test_is_valid
    card = Card.new("4408041234567893")
    assert_equal "valid", card.check 
  end

  def test_is_not_valid
    card = Card.new("4417123456789112")
    assert_equal "invalid", card.check 
  end

  def test_is_valid_with_spaces
    card = Card.new("4408 0412 3456 7893")
    assert_equal "valid", card.check 
  end

  def test_is_valid_without_spaces
    card = Card.new("4417 1234 5678 9112")
    assert_equal "invalid", card.check 
  end

  def test_is_a_number
    card = Card.new("not a number")
    assert_equal "invalid", card.check 
  end
  
  def test_valid_visa
    card = Card.new("4111111111111111")
    assert_equal "valid", card.check
  end
  
  def test_invalid_visa
    card = Card.new("4111111111111")
    assert_equal "invalid", card.check
  end

  def test_complicated_number
    card = Card.new("4012888888881881")
    assert_equal "valid", card.check
  end

  def test_valid_amex
    card = Card.new("378282246310005")
    assert_equal "valid", card.check
  end

  def test_valid_discover
    card = Card.new("6011111111111117")
    assert_equal "valid", card.check
  end

  def test_valid_mastercard
    card = Card.new("5105105105105100")
    assert_equal "valid", card.check
  end

  def test_invalid_card_type
    card = Card.new("9111111111111111")
    assert_equal "invalid", card.check
  end

  def test_input_same_as_input
    assert(FileUtils.compare_file(@input_file, @input_file)) 
  end

  def test_output_same_as_expected_output
    CardFile.process(@input_file, @output_file)

    assert(FileUtils.compare_file(@output_file, @expected_output_file))
  end

end