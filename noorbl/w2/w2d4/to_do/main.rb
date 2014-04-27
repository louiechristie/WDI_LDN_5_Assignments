require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'to_do_app', host: 'localhost')
end

after do
  @db.close
end


get '/' do
  erb :home
end

get '/new' do
  erb :new
end

post '/create' do
    @title = params[:title]
  @description = params[:description]

sql = "insert into to_dos (title, description) values (#{sql_string(@title)}, #{sql_string(@description)})"
@db.exec sql

  redirect to('/existing')
end


get '/existing' do
  sql = "select * from to_dos"
  @to_dos = @db.exec sql
  erb :existing
end


get '/edit/:id' do
  sql = "select * from to_dos where id = #{params[:id].to_i}"
  @to_do = @db.exec(sql).first
  erb :edit
end

post '/update/:id' do
  @title = params[:title]
  @description = params[:description]

  sql = "update to_dos set title = #{sql_string(@title)}, description = #{sql_string(@description)} where id = #{params[:id].to_i}"

  @db.exec sql
  
  redirect to("/existing")
end


get '/delete/:id' do
  sql = "delete from to_dos where id = #{params[:id].to_i}"
  @db.exec sql
  redirect to('/existing')
end



def sql_string(value)

  "'#{value.to_s.gsub("'", "''")}'"
  end