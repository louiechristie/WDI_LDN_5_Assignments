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
  
  if url.match(regex) && url.match(regex).length > 1 
    url.match(regex)[1]
  else 
    ""
  end
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

get '/genres' do
  erb :genres
end

get '/genre/:genre' do
  @genre = params[:genre]
  sql = "select * from videos where genre = '#{@genre}'"
  @videos = @db.exec(sql)

  erb :index
end

post "/search" do
  @query_string = params[:query]
  sql = "SELECT * FROM videos WHERE title ILIKE '%#{@query_string}%'"
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

  redirect to("/")
end

get '/delete/:id' do

  @id = params[:id]

  sql = "delete from videos where id = (#{@id.to_i});"
  @db.exec(sql)

  redirect to('/')
end