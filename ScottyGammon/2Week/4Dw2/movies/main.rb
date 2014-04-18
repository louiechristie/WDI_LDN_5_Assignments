require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'httparty'
require 'json'
require 'pg'

before do
	@db = PG.connect(dbname: 'movies_app', host: 'localhost')
end

after do
	@db.close
end

get '/' do 
	@title = params[:title]
	if @title && @title > ""
		@title = @title.downcase.tr!(" ", "+")
		url = "http://www.omdbapi.com/?t=#{@title}"
		html = HTTParty.get(url)
		@hash = JSON(html)

		sql= "insert into movies (title, year, rated, released, runtime, genre, director, writers, actors, plot, poster) values ('#{@hash['Title']}', '#{@hash['Year']}', '#{@hash['Rated']}', '#{@hash['Released']}', '#{@hash['Runtime']}', '#{@hash['Genre']}', '#{@hash['Director']}', '#{@hash['Writer']}', '#{@hash['Actors']}', '#{@hash['Plot']}', '#{@hash['Poster']}') "

		
		@db.exec(sql)

	end

	erb :movie
end

get '/movies' do
	sql = "select * from movies"
	@movies = @db.exec(sql)

erb :movies
	
end