class Bob



  def hey(value)
    value = value.to_s
    case 
    when is_shouting?(value)
      "Woah, chill out!"
    when is_a_question?(value)
      "Sure."
    when is_silence?(value)
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end

  private
  def is_shouting?(value)
    # handle shouting - all uppercase, or some change between upper and lowercase to handle just numbers
    value == value.upcase && value != value.downcase
  end

  private
  def is_a_question?(value)
    value.end_with?('?')
  end

  private
  def is_silence?(value)
    value.strip.empty?
  end




end