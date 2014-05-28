

class Card


  def initialize(card_number)
    @card_number = card_number
    @type
  end


  def check()
    
    

    if is_a_number?() && valid_type_of_card?() && valid_luhn_number?()
      return "valid"
    else
      return "invalid"
    end
    // check is a valid type of card

    // check Luhn alogrithm

  end


  def is_a_number?
    begin
      !!Integer(@card_number)
    rescue ArgumentError, TypeError
      false
    end
  end

  def valid_type_of_card?
    case @card_number[0]
    when 1..2
      return false
      break
    when 3
      return check_is_amex?
    when 4
      return check_is_visa?
    when 5
      return check_is_mastercard?
    when 6 
      return check_is_discover?
    when 7..9
      return false
      break
  end

  def check_is_amex?
    if 
    (
      @cardnumber[0] == 3
      && (@card_number[1] == 4 || @card_number[1] == 7) 
      && @cardnumber.length == 15
    )
      return true
    else
      return false
    end

  end

  def check_is_visa?
    return false
  end

  def check_is_mastercard?
    return false
  end

  def check_is_discover?
    return false
  end

end