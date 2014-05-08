class Bob

	def hey(value)

		if value.split('').last == '?' && value == value.upcase 
			return 'Woah, chill out!'
		elsif value == ""
			return "Fine. Be that way!"
		elsif value.gsub(/\s+/, "") == ""
			return "Fine. Be that way!"
		elsif value.split('').last == '?'
			return "Sure."
		elsif value == value.upcase
			return "Woah, chill out!"
		end

		"Whatever."

	end
		



end