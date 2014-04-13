require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'memetube_app', host: 'localhost')
end

after do
  @db.close
end

def sql_string(value)
  "#{value.gsub("'","''")}" 
end

def parse_youtube url
   regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
   url.match(regex)[1]
end

def genres
  sql = "select genre from videos group by genre"
  @genres = @db.exec(sql)
end

get '/' do
  sql = "select * from videos"
  @videos = @db.exec(sql)

  erb :index
end

get '/genre/:genre' do
  sql = "select * from videos where genre = '#{params[:genre]}'"
  @videos = @db.exec(sql)

  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  @title = params[:title]
  @description = params[:description]
  @url = params[:url]
  @genre = params[:genre]

  sql = "insert into videos (title, description, url, genre) values (
    '#{sql_string(@title)}', 
    '#{sql_string(@description)}', 
    '#{sql_string(@url)}', 
    '#{sql_string(@genre)}'
    );"

  @db.exec(sql)
  redirect to('/')
end

get '/show/:id' do
  id = params[:id]

  sql = "select * from videos where id = '#{sql_string(id).to_i}';"  
  @videos = @db.exec(sql)
  @video = @videos[0]
  
  erb :show
end

get '/edit/:id' do
  id = params[:id]

  sql = "select * from videos where id = '#{sql_string(id).to_i}';"  
  @videos = @db.exec(sql)
  @video = @videos[0]

  erb :edit
end

post '/update/:id' do
  id = params[:id]
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]

  sql = "UPDATE videos
          SET title='#{sql_string(title)}', 
              description='#{sql_string(description)}', 
              url='#{sql_string(url)}', 
              genre='#{sql_string(genre)}' 
          WHERE id = '#{sql_string(id).to_i}';"  
  @db.exec(sql)

  redirect to("/show/#{params[:id]}")
end

get '/delete/:id' do

  @id = params[:id]

  sql = "delete from videos where id = (#{@id.to_i});"
  @db.exec(sql)

  redirect to('/')
end