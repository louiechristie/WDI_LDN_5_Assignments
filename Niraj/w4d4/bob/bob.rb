class Bob

    def hey(value)
    if value.strip.length == 0
      return "Fine. Be that way!"

    elsif value == value.upcase && value != value.downcase
      return "Woah, chill out!"

    elsif value[-1] == "?"
      return "Sure."

    end

      "Whatever."
    end

end
