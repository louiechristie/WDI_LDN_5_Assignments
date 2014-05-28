class Card

  def initialize(card_number)
    @card_number = card_number
    #strip out white space
  end


  def check()
    if is_a_number? && valid_type_of_card? && valid_luhn_number?
      "valid"
    else
      "invalid"
    end
  end


  def is_a_number?
    begin
      !!Integer(@card_number)
    rescue ArgumentError, TypeError
      false
    end
  end

  def valid_type_of_card?
    print "type: "
    puts @card_number[0]

    case @card_number[0].to_i
      when 3
        return check_is_amex?
      when 4
        return check_is_visa?
      when 5
        return check_is_mastercard?
      when 6 
        return check_is_discover?
      else
        return false
    end
  end

  def check_is_amex?
    puts "check_is_amex"
    if (@card_number[0..1] == "34" || @card_number[0..1] == "37") && @card_number.length == 15
      puts "cardnumber length:"
      puts @card_number.length
      return true
    else
      return false
    end
  end

  def check_is_visa?
    puts "check_is_visa"
    if @card_number.length == 13 || @card_number.length == 16
      puts "cardnumber length:"
      puts @card_number.length
      return true
    else
      return false
    end
  end

  def check_is_mastercard?
    if @card_number.length == 16
      puts "cardnumber length:"
      puts @card_number.length
      return true
    else
      return false
    end
  end

  def check_is_discover?
    puts "check_is_discover"
    if @card_number[0..3] == "6011" && @card_number.length == 16
      puts "cardnumber length:"
      puts @card_number.length
      return true
    else
      return false
    end
  end

  def valid_luhn_number?
    return true
  end
end