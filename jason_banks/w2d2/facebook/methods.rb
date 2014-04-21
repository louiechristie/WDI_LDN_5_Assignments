def list_people(db)
  db.exec( "select * from people" ) do |result|

      puts "These people are currently in the DB:"

      result.each do |row|
        # do stuff
        print "NAME:\t#{row['first']} " 
        puts "#{row['last']},\t" 
        puts "DOB:\t#{row['dob']},\t" 
        puts "RELATIONSHIP:\t#{row['relationship']},\t"
        puts "FRIENDS:\t#{row['friends']},\t" 
        puts "CITY:\t#{row['city']}"
        puts
      end
    end
end

def add_a_person(db)
  print "\nFirst name: "
  first_name = gets.chomp.capitalize
  print "Last name: "
  last_name = gets.chomp.capitalize
  print "Add additional details (y/n)? "
  choice = gets.chomp.downcase
  while choice != "y" && choice != "n"
    puts "Invalid choice."
    print "Add additional details (y/n? "
    choice = gets.chomp.downcase
  end

  if choice == "y"
    print "Date of birth (yyyy-mm-dd): "
    date_of_birth = gets.chomp
    print "Relationship status: "
    relationship = gets.chomp
    print "Number of friends: "
    number_of_friends = gets.chomp.to_i
    print "City: "
    city = gets.chomp.capitalize
    add_sql = ( "insert into people (first, last, dob, relationship, friends, city) values ('#{first_name}', '#{last_name}', '#{date_of_birth}', '#{relationship}', '#{number_of_friends}', '#{city}')" )
  else
    add_sql = ( "insert into people (first, last) values ('#{first_name}', '#{last_name}')" )
  end

  db.exec add_sql
  puts "#{first_name} #{last_name} has been added.\n"
end

def update_a_person(db)
  
  results_id = []
  
  begin
    db.exec( "select * from people" ) do |result|

      puts "These people are currently in the DB:\n"

      result.each do |row|
        puts "ID: #{row['id']}:\t#{row['first'].capitalize} #{row['last'].capitalize}\n"
      results_id << row['id']
      end
    end
  end

  print "Which profile do you want to update? "
  id = gets.chomp
  puts
  if results_id.include?(id)
    print "What is their updated first name? "
    first_name = gets.chomp.capitalize
    print "What is their updated last name? "
    last_name = gets.chomp.capitalize
    print "What is their updated DoB? (YYYY-MM-DD) "
    dob = gets.chomp
    print "What is their updated relationship? "
    relationship = gets.chomp.downcase
    print "How many friends does #{first_name} have? "
    number_friends = gets.chomp.to_i
    print "What is the updated city? "
    city = gets.chomp.capitalize

    profile_update = "update people set first = '#{first_name}', last = '#{last_name}', dob = '#{dob}', relationship = '#{relationship}', friends = #{number_friends}, city = '#{city}' where id = #{id}"

    
      db.exec(profile_update)
    
  else
    puts "That profile ID was not valid. Please try again."
  end
end

def delete_a_person(db)

  results_id = []
  
  db.exec( "select * from people" ) do |result|
    puts "These people are currently in the DB:\n"
    result.each do |row|
      puts "ID: #{row['id']}:\t#{row['first'].capitalize} #{row['last'].capitalize}"
    results_id << row['id']
    end
  end

  print "Enter ID of person to delete: "
  id_to_delete = gets.chomp.to_i
  
  delete_sql = "delete from people where id = #{id_to_delete}"

  db.exec delete_sql
  puts 
  
end
