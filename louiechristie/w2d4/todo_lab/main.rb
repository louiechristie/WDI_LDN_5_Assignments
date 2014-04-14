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
  erb :home
end

get '/create' do

  @title = params[:title]
  @description = params[:description]

  if @title && @title > "" && @description && @description > ""

    sql = "insert into todos (title, description) values ('#{sql_string(@title)}', '#{sql_string(@description)}');"

    @db.exec(sql)
  end

  erb :create
end

get '/read' do
  sql = "select * from todos"
  @todos = @db.exec(sql)

  erb :read
end

get '/update' do
  erb :update
end

get '/delete' do

  @id = params[:id]

if @id && @id > ""

  sql = "delete from todos where id = (#{@id.to_i});"
  puts sql
  @db.exec(sql)
end

  sql = "select * from todos"
  @todos = @db.exec(sql)

  erb :delete
end

def sql_string(value)

"#{value.gsub("'","''")}"
   
end

