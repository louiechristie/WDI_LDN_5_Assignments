class Bob
  def hey(value)
    case
    # tell if shouted at
    #if uppercase and there is at least one letter
      when is_shouting?(value)
        return "Woah, chill out!"
      when is_a_question?(value)
        return "Sure."
      when is_silence?(value)
        return "Fine. Be that way!"
      else
        "Whatever."
      end
  end


end

private
  def is_shouting?(value)
    value == value.upcase && value != value.downcase
  end
private
  def is_a_question?(value)
    value.end_with?("?")
  end
private
  def is_silence?(value)
    value.strip.empty?
  end
