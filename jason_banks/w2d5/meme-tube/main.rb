require "pry"
require "sinatra"
require "sinatra/reloader" if development?
require "pg"

before do

  @db = PG.connect(dbname: 'meme_tube_app', host: 'localhost')

end

after do

  @db.close

end

get '/' do

  featured_sql = "select id from videos"
  featured_video = @db.exec(featured_sql).to_a.sample
  
erb :index

end

get '/upload' do
  













