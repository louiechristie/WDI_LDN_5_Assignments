require 'pry'

numbers = (1..105).to_a

numbers.each do |number|

	if number % 3 != 0  && number % 5 != 0 && number % 7 != 0
		 print "#{number}"
	end

	if number % 3 == 0
		 print "pling"
	end

	if number % 5 == 0 
		 print "plang"
	end

	if number % 7 == 0
		 print "plong"
	end

	print ", "
		
end

