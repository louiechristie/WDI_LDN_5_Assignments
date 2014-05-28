require 'minitest/autorun'
require_relative 'card'

class TestCard < MiniTest::Unit::TestCase
  
  def setup
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
    skip
    card = Card.new("4408 0412 3456 7893")
    assert_equal "valid", card.check 
  end

  def test_is_valid_without_spaces
    skip
    card = Card.new("4417 1234 5678 9112")
    assert_equal "invalid", card.check 
  end

  def test_is_a_number
    skip
    card = Card.new("not a number")
    assert_equal "invalid", card.check 
  end
  
  def test_valid_visa
    skip
    card = Card.new("4111111111111111")
    assert_equal "valid", card.check
  end
  
  def test_invalid_visa
    skip
    card = Card.new("4111111111111")
    assert_equal "invalid", card.check
  end

  def test_complicated_number
    skip
    card = Card.new("4012888888881881")
    assert_equal "valid", card.check
  end

  def test_valid_amex
    skip
    card = Card.new("378282246310005")
    assert_equal "valid", card.check
  end

  def test_valid_discover
    skip
    card = Card.new("6011111111111117")
    assert_equal "valid", card.check
  end

  def test_valid_mastercard
    skip
    card = Card.new("5105105105105100")
    assert_equal "valid", card.check
  end

  def test_invalid_card_type
    skip
    card = Card.new("9111111111111111")
    assert_equal "invalid", card.check
  end

end