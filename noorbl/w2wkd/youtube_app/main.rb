require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'youtube_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  erb :home
end

post '/add_vid' do
  @title = params[:title]
  @description = params[:description]
  @video_id = params[:video_id]
  @genre = params[:genre]

sql = "insert into videos (title, description, video_id, genre) values (#{sql_string(@title)}, #{sql_string(@description)}, #{sql_string(@video_id)}, #{sql_string(@genre)})"
@db.exec sql

  redirect to('/index')
end

get '/index' do
  sql = "select * from videos"
  @videos = @db.exec sql
  erb :index
end

# get '/index/genre' do
#   @id = params[:id]
#   @genre = params[:genre]

# get '/genre/:id' do


get '/edit/:id' do
  sql = "select * from videos where id = #{params[:id].to_i}"
  @video = @db.exec(sql).first #array with hashes in it, and you want one record from that array
  erb :edit
end

post '/update/:id' do
  @title = params[:title]
  @description = params[:description]
  @video_id = params[:video_id]
  @genre = params[:genre]

  sql = "update videos set title = #{sql_string(@title)}, description = #{sql_string(@description)}, video_id = #{sql_string(@video_id)}, genre = #{sql_string(@genre)} where id = #{params[:id].to_i}"

  @db.exec sql

  redirect to('/index')
end


get '/delete/:id' do
  sql = "delete from videos where id = #{params[:id].to_i}"
  @db.exec sql
  redirect to('/index')
end

def sql_string(value)

  "'#{value.to_s.gsub("'", "''")}'"
  end


