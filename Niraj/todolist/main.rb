require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require 'pg'

before do
  @db = PG.connect(dbname: 'todo', host: 'localhost')
end

after do
  @db.close
end

get '/'  do
   sql = "select * from todos"

   @todos = @db.exec(sql)
   erb :index
 end

get '/new' do
   erb :new 
end

post '/create' do 
  @name = params[:name]
  @description = params[:description]

  sql = "insert into todos (name, description) values ('#{@name}', '#{@description}')" 

  @db.exec(sql)

  erb :title
end 


get '/show/:id' do

  sql = "select * from todos where id = #{params[:id]}"

  @item = @db.exec(sql)


  erb :show
end  

get '/edit/:id' do
  # @edit = @db.exec(sql)
  erb :new
end

# post '/update/:id' do
#   @name = params[:name]
#   @description = params [:description]

#   @db.exec(sql)
#   # sql = "update todos set (name, details) values (#{sql_string(@name)}, #{sql_string(@details)})" 
#   sql = "update todos set (name, description) = (#{sql_string(@name)}, #{sql_string(@description)}) where id = #{params[:id]}"
#   redirect to("/show/#{params[:id]}")

#   erb :title
# end

post '/update/:id' do

  @update_name = params[:name]
  @update_task = params[:task]

  sql = "update todos set (name, task) = (#{sql_string(@update_name)}, #{sql_string(@update_task)}) where id = #{params[:id]}" 
  
  @db.exec(sql)

  erb :edit
  redirect to("/show/#{params[:id]}")

end

get '/delete/:id' do

  sql = "delete from todos where id = #{params[:id]}"
  @db.exec(sql)


  redirect to('/')
end