# class Bob

#   def hey(value)
#     if value.empty? || value.strip.empty?
#       "Fine. Be that way!"
#     elsif value == value.upcase && value != value.downcase
#       "Woah, chill out!"
#     elsif value.end_with?('?')
#       "Sure."
#     else
#       "Whatever."
#     end
#   end

# end



# OR

# class Bob

# def hey(value)
#   case
#   when value == value.upcase && value !== value.downcase
#     "Woah, chill out!"
#   when value.chars.last == '?'
#     "Sure."
#   else
#     "Whatever."
#     end
#   end


# end




#OR refactoring


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
  value == value.upcase && value !== value.downcase
end

private
def is_a_question?(value)
  value.chars.last == '?'
end

private
def is_silence?(value)
  value.strip.empty?
end





