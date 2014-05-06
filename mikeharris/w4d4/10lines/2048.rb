#2048
require 'pry'
game = [["*","-",], ["-","-"]]


def drawgame(game)
  game.each do |line|
    line.each do |cell|
      print cell
    end
   print "\n"
  end
end

drawgame(game)

print "left or right? (l/r)"

direction = gets.chomp

if direction == "l" 
  
  game.each do |line|
    nos = line.length
    line.each_index do |index|
      if line[index] == "-" 
        if index < (nos-1)
          line[index] = line[index+1]
          line[index + 1] = "-"  
        else 
          line[index] = "-" 
        end
      end
    end
  end   
end



drawgame(game)

