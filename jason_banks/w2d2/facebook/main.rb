require "pry"
require "pg"
require_relative "menu.rb"
require_relative "methods.rb"

db = PG.connect(:dbname => "facebook", :host => "localhost")


begin

  response = menu
  while response != 'q'
    case response
    when "1"
      list_people(db)
    when "2"
      add_a_person(db)
    when "3"
      update_a_person(db)
    when "4"
      delete_a_person(db)
    else
      puts "Invalid entry.\n\n"
    end

    puts "Press enter to continue."
    gets.chomp

    response = menu
  end

  puts "Thank you for using Facebook.\n\n"



  ensure
    db.close
end