require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

before do
	@db = PG.connect(dbname: 'memetube', host: 'localhost')
end

after do
	@db.close
end

get '/' do

	erb :add

end

# get '/add' do

# 	erb :add

# end

post '/create' do

	@title = params[:title]
	@url = params[:url]
	@description = params[:description]
	@tag = params[:tag]

	sql = "insert into videos (title, url, description, tag) values ('#{@title}', '#{@url}', '#{@description}', '#{@tag}')"

	@db.exec(sql)

  redirect to('/list')

end

get '/list' do

	sql = "select * from videos"
	@videos = @db.exec(sql)

	erb :list

end

get '/delete/:id' do

	sql = "delete from videos where id='#{params[:id]}'"

	@db.exec(sql)

  redirect to('/list')

end

get '/edit/:id' do

	@id = params[:id]

	sql = "select * from videos where id='#{params[:id]}'"

	@video = @db.exec(sql).first

	erb :edit

end 

get '/update/:id' do

	@id = params[:id]
	@title = params[:title]
	@description = params[:description]
	@tag = params[:tag]

	sql = "update videos set title='#{params[:title]}', description='#{params[:description]}', tag='#{params[:tag]}' where id='#{params[:id]}'"

	@db.exec(sql)

	redirect to('/list')

end 

get '/tags' do

	sql = "select tag from videos group by videos.tag"
	@videos = @db.exec(sql)

	erb :tags

end

get '/results/:tag' do

	sql = "select * from videos where tag='#{params[:tag]}'"

	@videos = @db.exec(sql)

	erb :results

end


