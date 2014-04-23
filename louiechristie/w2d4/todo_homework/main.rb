require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'todo_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  sql = "select * from todos"
  @todos = @db.exec(sql)
  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  @title = params[:title]
  @description = params[:description]

  sql = "insert into todos (title, description) values ('#{sql_string(@title)}', '#{sql_string(@description)}');"

  @db.exec(sql)
  redirect to('/')
end

get '/show/:id' do
  id = params[:id]

  sql = "select * from todos where id = '#{sql_string(id)}';"  
  @todos = @db.exec(sql)
  @todo = @todos[0]
  
  erb :show
end

get '/edit/:id' do
  id = params[:id]


  sql = "select * from todos where id = '#{sql_string(id)}';"  
  @todos = @db.exec(sql)
  @todo = @todos[0]

  erb :edit
end

post '/update/:id' do
  id = params[:id]
  title = params[:title]
  description = params[:description]


  sql = "UPDATE todos
          SET title='#{sql_string(title)}', description='#{sql_string(description)}'
          WHERE id = '#{sql_string(id)}';"  
  @db.exec(sql)

  redirect to("/show/#{params[:id]}")
end

get '/delete/:id' do

  @id = params[:id]

  sql = "delete from todos where id = (#{@id.to_i});"
  @db.exec(sql)

  redirect to('/')
end


def sql_string(value)

"#{value.gsub("'","''")}"
   
end