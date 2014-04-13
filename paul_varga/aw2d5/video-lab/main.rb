require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'PG'

before do 
  @db = PG.connect(dbname: 'video_app', host: 'localhost')
end

after do
  @db.close
end

get '/' do
  sql = 'select * from videos'
  @index = @db.exec(sql)

  gsql = 'select genre from videos group by videos.genre'
  @genre = @db.exec(gsql)

  erb :index
end

get '/category/:genre' do

  sql = "select * from videos where genre = '#{params[:genre]}'"
  binding.pry
  result = @db.exec(sql)
  @videos = result[0]

  erb :category
end

get '/new' do
  erb :new
end

post '/create' do
  @title = params[:title]
  @description = params[:description]
  @video_id = params[:video_id]
  @genre = params[:genre]  

  sql = "insert into videos (title, description, video_id, genre) values (#{sql_string(@title)}, #{sql_string(@description)}, #{sql_string(@video_id)}, #{sql_string(@genre)})"

  @db.exec(sql)

  erb :new
  redirect to('/')
end

def sql_string(value)
  "'#{value.gsub("'", "''")}'"
end

get '/show/:id' do

  sql = "select * from videos where id = #{params[:id]}"
  result = @db.exec(sql)
  @video = result[0]

  erb :show
end

get '/delete/:id' do
  
 sql = "delete from videos where id = #{params[:id]}"

  @db.exec(sql)

 redirect to('/')

end

get '/edit/:id' do

  sql = "select * from videos where id = #{params[:id].to_i}"

  @input = @db.exec(sql).first

  erb :edit
end

post '/update/:id' do

  @update_title = params[:title]
  @update_description = params[:description]
  @update_video_id = params[:video_id]
  @update_genre = params[:genre]

  sql = "update videos set (title, description, video_id, genre) = (#{sql_string(@update_title)}, #{sql_string(@update_description)}, #{sql_string(@update_video_id)}, #{sql_string(@update_genre)}) where id = #{params[:id]}" 
  
  @db.exec(sql)

  redirect to("/show/#{params[:id]}")
end
