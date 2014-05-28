

class Card


  def initialize(card_number)
    @card_number = card_number
  end


  def check()
    
    if is_a_number?(@card_number)
      return "valid"
    else
      return "invalid"
    end
  end


  def is_a_number?(string)
    begin
      !!Integer(string)
    rescue ArgumentError, TypeError
      false
    end
  end

end