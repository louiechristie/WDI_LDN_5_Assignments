def menu
  puts `clear`
  puts "*** Facebook ***"
  puts "c : Create"
  puts "r : Read"
  puts "u : Update"
  puts "d : Delete"
  puts "q : Quit"
  print '---> '
  gets.chomp
end

def read
  @db.exec("select * from people") do |result|

    puts "The following people are in the database:\n"
    result.each do |row|
    puts "#{row['first']} #{row['last']}"
    end   
  end
end

def create
  print "First name: "
  first_name = gets.chomp
  print "Last name: "
  last_name = gets.chomp
  sql = "insert into people(first, last) values ('#{first_name}', '#{last_name}')"
  @db.exec sql
  puts "#{first_name} #{last_name} has been added to the databse."
end

def update

end

def delete
  print "Which person would you like deleted?\n First name:"
  first_name = gets.chomp
  print "Last name:"
  last_name = gets.chomp
 sql = "delete from people where first = #{first_name} and last = #{last_name}"
end





