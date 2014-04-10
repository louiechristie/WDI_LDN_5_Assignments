require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do 
  @db = PG.connect(dbname: 'todo', host: 'localhost')
end

after do 
  @db.close
end

get '/' do
  sql = "select * from todos"
  
  @index = @db.exec(sql)
  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  @name = params[:name]
  @task = params[:task]

  sql = "insert into todos (name, task) values (#{sql_string(@name)}, #{sql_string(@task)})"

  @db.exec(sql)

  erb :new
  redirect to('/')
end

get '/show/:id' do

  sql = "select * from todos where id = #{params[:id]}"
  result = @db.exec(sql)
  @item = result[0]

  erb :show
end

get '/edit/:id' do
  erb :edit
end

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

def sql_string(value)
  "'#{value.gsub("'", "''")}'"
end
