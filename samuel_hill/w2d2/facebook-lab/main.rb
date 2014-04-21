require 'pry'
require 'pg'

require_relative 'menu'
 
# db = PG.connect(:dbname =>'facebook', :host => 'localhost')
# begin
#   

  

  # 

  # db.exec sql
 
# ensure
#   db.close
# end

response = menu
while response != "q"

  case response
  when "1"
    create_person
  when "2"
	read_people
  when "3"
	update_people
  else
    print "Invalid menu choice. Please try again."
  end
puts "\nPress enter to continue."
gets
  response=menu
end