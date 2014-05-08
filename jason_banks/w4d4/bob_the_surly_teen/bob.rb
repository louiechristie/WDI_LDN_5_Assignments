class Bob

  def hey (value)
    if value == value.upcase 
      "Woah, chill out!"
    elsif value.end_with?("?")
      "Whatever."
    elsif ((0..9).map { |i| value.include?(i.to_s) }).include? true
      "Sure."
    elsif value.end_with?("?")
      "Sure."
    else    
      "Whatever."
    end
  end



end