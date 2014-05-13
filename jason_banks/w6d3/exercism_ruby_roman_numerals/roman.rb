class Fixnum

  def initialize
  end

  def to_roman
    return_string = ""
    # (self).times { |i| return_string << "I" }
    if ((self + 1) / 5) > 0
      if (self / 5) == 1
        return_string << "IX"
      elsif (self / 5) > 0
        return_string << "V"
        (self % 5).times { return_string << "I" }
      else
        return_string << "IV"
      end
    else
      self.times { |i| return_string << "I"}
    end

    return_string

    
  end



end