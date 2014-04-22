def menu
   puts `clear`
   puts "*** WDI Facebook ***\n\n"
   puts '1 : List'
   puts '2 : Create Person'
   puts '3 : Edit info'
   puts '4 : Delete'
   puts "Q : Quit\n\n"
   print '--> '
   gets.chomp
 end

 def list_people
  @db.exec( "select * from people" ) do |result|
    
    puts "These people are currently in the DB:"

    result.each do |row|
      puts "#{row['first']} #{row['last']} #{row['id']}"
    end
  end
 end

 def create_person
  print "first name: "
  first_name = gets.chomp
  print "last name: "
  last_name = gets.chomp

  sql = "insert into people (first, last) values ('#{first_name}', '#{last_name}')"

  @db.exec sql
 end

 def edit_person
   print "Whose info do you want to edit? "
   list_people
   id = gets.to_i

   print "first name: "
   first_name = gets.chomp
   print "last name: "
   last_name = gets.chomp

   sql = "update people set first = '#{first_name}', last = '#{last_name}' where id = #{id}"
   @db.exec sql
   puts " Stuff happened, and a person's info was update *magic*!"
 end

 def delete_person
   print "Who do you want to delete from your list? "
   list_people
   puts "Type in the ID: "
   id = gets.to_i

   sql = "select * from people where id = #{id}"       #we went and got that person and stored it 
   person = @db.exec(sql).first


   sql = "delete from people where id = #{id}"
   @db.exec sql
   puts "#{id} has been removed from your database - #{person['first']} is no more."
 end