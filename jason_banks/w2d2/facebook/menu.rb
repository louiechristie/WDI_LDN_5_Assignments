def menu
  puts `clear`
  puts "*** Facebook Lite\n\n"
  puts "1: List People"
  puts "2: Add a Person to Facebook"
  puts "3: Update a Person's information"
  puts "4: Delete a Person from Facebook"
  # puts "5: List individual" if time
  puts "Q: Quit"
  print "| "
  gets.chomp.downcase
end