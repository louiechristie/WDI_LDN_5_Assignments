require 'pry'
require 'pg'
require_relative 'menu'
 
@db = PG.connect(:dbname =>'facebook', :host => 'localhost')
begin
  response = menu
   while response.upcase != 'Q'
     case response
      when '1'
        list_people

      when '2'
        create_person
        
      when '3'
        edit_person

      when '4'
        delete_person
    end
    puts "press enter to continue"
    gets
    response = menu
  end
ensure
  @db.close
end


     
     
      
       