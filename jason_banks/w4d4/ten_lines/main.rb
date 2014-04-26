puts "***\tThis is the game of life.\t***\n\nGo!"
gets.chomp
fate = 1
n = 1
while fate == 1 do print "Go!\n"
  gets.chomp
  n += 1
  fate = [1,0].sample end
n > 4 ? result = "You win. You were so great and your memory will be cherished." : result = "You lose. That's life.\nMaybe in your next life you will get to be someone who is successful."
puts result
