# (1..100).each do |i|

#   if i % 3 == 0 && i % 5 == 0 && i % 7 == 0
#     print "Pling Plang Plong"
#   elsif i % 3 == 0 && i % 5 == 0
#     print "Pling Plang"
#   elsif i % 3 == 0 && i % 7 == 0
#     print "Pling Plong"
#   elsif i % 5 == 0 && i % 7 == 0
#     print "Plang Plong"
#   elsif i % 3 == 0
#     print "Pling"
#   elsif i % 5 == 0
#     print "Plang"
#   elsif i % 7 == 0
#     print "Plong"
#   else
#     print i
#   end
#   puts
# end

hash = {3=> "Pling", 5=> "Plang", 7=> "Plong"}

(1..100).each do |i|
  if i % 3 != 0 && i % 5 != 0 && i % 7 != 0
    puts i
  else
    hash.each do |number, drop|
      if i % number == 0
        print drop
      end
    end
  end
  puts
end

      
    