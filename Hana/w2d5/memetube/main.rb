#WORKING DOCUMENT
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'memetube', host: 'localhost')
end

after do
  #@db.close
end

get '/' do
  sql = "SELECT * FROM videos"
  @videos = @db.exec(sql)
  erb :home
end


post '/create' do
  @title = params[:title]
  @url = params[:url]
  @description = params[:description]
  @genre = params[:genre]

  if @url
      sql = "INSERT INTO videos (title, url, description, genre) VALUES (#{sql_string(@title)}, #{sql_string(@url)}, #{sql_string(@description)}, #{sql_string(@genre)})"
      @db.exec(sql)
  end 
  redirect to('/')
end

get '/edit/:id' do
  sql = "select * from videos where id = #{params[:id].to_i}"
  @videos = @db.exec(sql).first
  erb :edit
end

post '/update/:id' do
  @id = params[:id]
  @title = params[:title]
  @url = params[:url]
  @description = params[:description]
  @genre = params[:genre]


  sql = "UPDATE videos SET title='#{@title}', url='#{@url}', description='#{@description}', genre='#{@genre}' WHERE id='#{@id}'"
  @db.exec(sql) 
  redirect to('/')
 
end

get '/delete/:id' do
  sql = "DELETE FROM videos WHERE id=#{params[:id].to_i}"

  @db.exec(sql)
  redirect to('/')
end

get '/display/:genre' do
  sql = "SELECT * FROM videos WHERE genre=#{params[:genre]}"
  binding.pry
  @videos = @db.exec(sql)
  erb :display
end


def sql_string(value)
  "'#{value.gsub("'","''")}'"
end

