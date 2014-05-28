class Card

  def initialize(card_number)
    @card_number = card_number.gsub(/\s+/, "")     #strip out white space
    @card_type = "Unknown"
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
    puts "type: "
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
    if (@card_number[0..1] == "34" || @card_number[0..1] == "37") && @card_number.length == 15
      @card_type = "AMEX"
      return true
    else
      return false
    end
  end

  def check_is_visa?
    if @card_number.length == 13 || @card_number.length == 16
      @card_type = "VISA"
      return true
    else
      return false
    end
  end

  def check_is_mastercard?
    if @card_number.length == 16
      @card_type = "MasterCard"
      return true
    else
      return false
    end
  end

  def check_is_discover?
    if @card_number[0..3] == "6011" && @card_number.length == 16
      @card_type = "Discover"    
      return true
    else
      return false
    end
  end

  def valid_luhn_number?

    @card_number.reverse!

    array = []

    for i in 0..(@card_number.length-1)
      if i % 2 == 0
        array << @card_number[i].to_i
      else
        array << double_and_sum_digits(@card_number[i].to_i)
      end
    end

    array.reverse!

    puts "array"
    puts array.inspect

    number = array.reduce{ |sum, x| sum + x }

    puts "number"
    puts number

    if number % 10 == 0
      return true
    else
      return false
    end
  end


  def double_and_sum_digits(num)
    double = num * 2
    string = double.to_s
    result = string.split('').reduce{ |sum, x| sum.to_i + x.to_i }.to_i
  end

end