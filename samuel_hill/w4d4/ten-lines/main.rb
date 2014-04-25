numbers = (1..3000)
numbers.each do |number|
	if number.even?
		print '/*/'
	elsif number % 5 == 0 || number % 4 == 0
		print '*'
	else
		print '**/*/**'
	end 
end
print 'ITS SNOWING!'