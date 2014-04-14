#WORKING DOCUMENT
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'todo_app', host: 'localhost')
end

after do
  #@db.close
end

get '/' do
  sql = "select * from list"
  @items = @db.exec(sql)
  erb :todo
end

get '/new' do
  erb :new
end

post '/create' do
  @task = params[:task]
  @comments = params[:comments]
  @importance = params[:importance]

  if @task
      sql = "INSERT INTO list (task, comments, importance) VALUES (#{sql_string(@task)}, #{sql_string(@comments)}, '#{@importance}')"
      @db.exec(sql)
  end 
  redirect to('/')
end

get '/show/:id' do
  erb :show
end

get '/edit/:id' do

  erb :edit
end

post '/update/:id' do
  @id = params[:id].to_i
  @task = params[:task]
  @comments = params[:comments]
  @importance = params[:importance]

   sql = "select * from list"
  @items = @db.exec(sql).to_a
binding.pry
  sql = "UPDATE list SET task=#{sql_string(@task)}, comments=#{sql_string(@comments)}, importance='#{@importance}' WHERE id='#{@id}'"
  @db.exec(sql) 
  redirect to('/')
  #redirect to("/show/#{params[:id]}")
end

get '/delete/:id' do
  sql = "DELETE FROM list WHERE id = '#{params[:id]}'"
  @db.exec(sql)
  redirect to('/')
end


def sql_string(value)
  "'#{value.gsub("'","''")}'"
end

