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

get '/' do 
	@youtube_id = params[:youtube_id]
	@title = params[:title]
	@description = params[:description]
	@genre = params[:genre]
	if @youtube_id && @youtube_id > ""
		sql= "insert into videos (youtube_id, title, description, genre) values ('#{@youtube_id}', '#{@title}', '#{@description}', '#{@genre}') "

		@db.exec(sql)
	end

	erb :video
end

get '/videos' do
	sql = "select * from videos"
	@videos = @db.exec(sql)
	
	erb :video	
end