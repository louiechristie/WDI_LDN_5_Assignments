require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

before do
	@db = PG.connect(dbname: 'meme_app', host: 'localhost')
end

after do
	@db.close
end

=begin
get '/' do 
	@youtube_id = params[:youtube_id]
	@title = params[:title]
	@description = params[:description]
	@genre = params[:genre]
	if @youtube_id && @youtube_id > ""
		sql= "insert into videos (youtube_id, title, description, genre) values ('#{@youtube_id}', '#{@title}', '#{@description}', '#{@genre}') "		@db.exec(sql)
	end

	erb :video
end

get '/videos' do
	sql = "select * from videos"
	@videos = @db.exec(sql)
	
	erb :video	
=end


get '/'  do
    erb :Navigation
end

get '/show' do
    sql="select * from videos order by title"

  @videos = @db.exec(sql)

  erb :show

end

get '/new'  do
 erb :new 
end

post '/create'  do
    @title = params[:title]
    @description = params[:description]
    @youtube_id = params[:youtube_id]
    @genre = params[:genre]

    sql = "insert into videos (title, description, youtube_id, genre) values('#{@title}', '#{@description}', '#{@youtube_id}', '#{@genre}')"
    @db.exec(sql)
    
 redirect '/show'
end


get '/delete/:id'  do 
     @id = params[:id]
     sql = "delete FROM videos where id = '#{@id}'"
     @db.exec(sql)
    
    redirect to '/show'

end

get '/edit/:id'  do 

     @id = params[:id]
     sql = "select * from videos where id='#{@id}'"
     @videos = @db.exec(sql)[0]
           
   erb  :edit
end


