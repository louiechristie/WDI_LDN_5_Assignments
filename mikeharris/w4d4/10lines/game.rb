
def drawgame(game, location)
  (0..game).each do |line_index|
    (0..game).each do |cell_index|
        (cell_index == location[0] && line_index == location[1])? print "*" : print "-"  
    end
   print "\n"
  end
end

def game
  print `clear` 
  game = 50
  location = [0,1]
  direction = { "l" => [-1,0], "r" => [1,0], "u" => [0,-1], "d" => [0,1]}
  drawgame(game, location)

  print"left or right/ up or down? (l/r) (u/d)  q = quit"
  dir = gets.chomp  
  print `clear`
  until dir == "q" 
    location[0] = [[location[0].to_i + direction[dir][0].to_i,game].min,0].max unless direction[dir].nil?
    location[1] = [[location[1].to_i + direction[dir][1].to_i, game].min,0].max unless direction[dir].nil?
     
    drawgame(game, location)
    print "left or right/ up or down? (l/r) (u/d)  q = quit"
    dir = gets.chomp  
    print `clear`
  end
  
end    

game



print "left or right? (l/r)"

direction = gets.chomp

# if direction == "l" 
  
#   game.each do |line|
#     nos = line.length
#     line.each_index do |index|
#       if line[index] == "-" 
#         if index < (nos-1)
#           if direction = 
#           line[index] = line[index+1]
#           line[index + 1] = "-"  
#         else 
#           line[index] = "-" 
#         end
#       end
#     end
#   end   
# end



# drawgame(game)

