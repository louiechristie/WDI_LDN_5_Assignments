number=1
while number<=2000000
	if number%105==0
		print("PLING PLANG PLONG,")
	elsif number%35==0
        print("PLANG PLONG, ")
    elsif number%21==0
        print("PLING PLONG, ")
	elsif number%15==0
		print("PLING PLANG, ")
    elsif number%7==0
        print("PLONG, ")
    elsif number%3==0
        print("PLING, ")
    elsif number%5==0
        print("PLANG, ")
    else
        print "#{number}, "
    end
    number=number+1
end