class Bob

  #my version (1 failure):

  # def hey(value)
  #   #do some stuff to work out if I've been shouted at
  #   if value == value.upcase && !(value =~ /[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/).nil?
  #     "Woah, chill out!"
  #   elsif value[value.length - 1] == "?"
  #     "Sure." 
  #   elsif value =~ /^\s*$/
  #     "Fine. Be that way!"
  #   else
  #     "Whatever."
  #   end
  # end

  #Michael's Version

  def hey(value)
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