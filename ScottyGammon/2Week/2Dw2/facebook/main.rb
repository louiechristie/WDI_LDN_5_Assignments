require 'pry'
require 'pg'
require_relative 'menu'

@db = PG.connect(:dbname =>'facebook', :host => 'localhost')



def create
  print "first name:"
  first_name = gets.chomp
  print "last name:"
  last_name = gets.chomp
  sql = "insert into people (first, last) values ('#{first_name}', '#{last_name}')"
  @db.exec sql
end

def read
  @db.exec( "select * from people" ) do |result|
    
    puts "These people are currently in the DB"
    result.each do |row|
      puts "#{row['first']} #{row['last']}"
    end
  end
end

response = menu.downcase
while response != "q"
  case response
  when "c"
    create
  when "r"
    read
  when "u"
    #todo- write this method
  when "d"
    #todo- write this method
  end
gets
  response = menu
end