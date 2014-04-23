puts "Please enter a number from 1 to 100."
user_input = gets.chomp


(1..100).each do |x| 
  
  if (x % 3 == 0)
  puts "pling"
  
  elsif (x % 5 == 0)
  puts "plang"

  elsif (x % 7 == 0)
  puts "plong"

  else 
  puts x
  end
end