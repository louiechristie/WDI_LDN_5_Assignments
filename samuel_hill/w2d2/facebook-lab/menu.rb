def menu
  puts `clear`
  puts "********** Welcome to WDI Facebook ********\n"
  puts
  puts "1\t:\tCreate Person"
  puts "2\t:\tList People"
  puts "3\t:\tUpdate Person"
  puts "q\t:\tQuit"
  print "---> \t"
  gets.chomp.downcase
end

# def database

#   db = PG.connect(:dbname =>'facebook', :host => 'localhost')

# end

def create_person

  db = PG.connect(:dbname =>'facebook', :host => 'localhost')

  begin

    print "What is your first name?"
    first_name = gets.chomp
    print "What is your last name?"
    last_name = gets.chomp
    print "What is your DOB? (DD-MM-YYYY)"
    date_of_birth = gets.chomp
    print "What city do you live in?"
    city = gets.chomp

    sql = "insert into people (first, last, dob, city) values ('#{first_name}', '#{last_name}', '#{date_of_birth}', '#{city}')"

    db.exec sql

  ensure
    db.close
  end

end

def read_people

  db = PG.connect(:dbname =>'facebook', :host => 'localhost')

  begin
    db.exec( "select * from people" ) do |result|
    result.each do |row|
      # do stuff
      puts "#{row['first']} #{row['last']}"
    end
  end

  ensure
    db.close
  end

end

def update_people

  db = PG.connect(:dbname =>'facebook', :host => 'localhost')

  puts "What is the name of the person that you want to update?"
  person_edit = gets.chomp

  begin
    db.exec( "select * from people where first = '#{person_edit}'" ) do |result|
    result.each do |row|
      # do stuff
      puts "#{row['id']} #{row['first']} #{row['last']}"
    end
  end

  puts "Who do you want to edit?"

  ensure
    db.close
  end



end


