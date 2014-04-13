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
  featured_sql = "SELECT * FROM videos"
  @featured_video = @db.exec(featured_sql).to_a.sample

  erb :index

end

get '/add' do

  erb :add

end

post '/create' do

  title = params[:title]
  id = params[:id]
  keyword = params[:keyword]
  confirm_sql = "SELECT * FROM videos WHERE id = '#{sql_string(id)}'"
  @confirm_video = @db.exec(confirm_sql).to_a

  if !@confirm_video
    add_sql = "INSERT INTO videos (id, title, keyword) VALUES ('#{sql_string(id)}', '#{sql_string(title)}', '#{sql_string(keyword)}')"
    @db.exec(add_sql)
  end

  redirect to("/show/#{id}")

  
end

get '/show/:id' do
  id = params[:id]
  show_video_sql = "SELECT * FROM videos where id = '#{sql_string(id)}'"
  @show_video = @db.exec(show_video_sql).first

  erb :show

end

def sql_string(value)
  value.gsub("'", "''")
end













