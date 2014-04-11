require 'pry'
require 'pg'
require_relative 'menu'
 
@db = PG.connect(:dbname =>'facebook', :host => 'localhost')
  
begin
response = menu
  while response.downcase != "q"
    case response
      when 'c'
        create
      when 'r'
        read
      when 'u'
        #let_flat(b)
      when 'd'    
        #evict_tenant(b)
      else
        puts "invalid menu choice."
    end
    puts "Press enter to continue."
    gets
    response=menu
  end
ensure
  @db.close
end



# def create
#     print "first name: "
#     first_name = gets.chomp
#     print "last name: "
#     last_name = gets.chomp

#   sql = "insert into people(first, last) values ('#{first_name}', '#{last_name}')"
#   exec(sql)
  
# end

# def exec(sql)
#   db = PG.connect(:dbname =>'facebook', :host => 'localhost')
#   begin
#     db.exec sql
#   ensure
#     db.close
#   end
# end


# response = menu.downcase
# while response != "q"

#   case response
#     when 'c'
#       create

#     when 'r'
#       read

#     when 'u'
#       let_flat(b)

#     when 'd'    
#       evict_tenant(b)

#     else
#       puts "invalid menu choice."
#   end
#   puts "\npress enter to continue."
#   gets

#   response = menu

# end

