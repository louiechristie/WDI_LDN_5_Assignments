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
  keyword = params[:keyword].downcase
  @incomplete = ""
  
  if title.empty? || id.empty? || keyword.empty?
    @incomplete = "Incomplete details provided."
    redirect to("/add")
  end

  confirm_sql = "SELECT * FROM videos WHERE id = '#{sql_string(id)}'"
  @confirm_video = @db.exec(confirm_sql).first

  if @confirm_video
    redirect to("/add")
  else
    add_sql = "INSERT INTO videos (id, title, keyword) VALUES ('#{sql_string(id)}', '#{sql_string(title)}', '#{sql_string(keyword)}')"
    @db.exec(add_sql)
    redirect to("/show/#{sql_string(id)}")
  end 
end

get '/show/:id' do
  id = params[:id]
  show_video_sql = "SELECT * FROM videos where id = '#{sql_string(id)}'"
  @show_video = @db.exec(show_video_sql).first

  erb :show

end

get '/viewall' do

  videos_sql = "SELECT * FROM videos ORDER BY title"
  @videos = @db.exec(videos_sql)

  erb :viewall

end

get '/keywords' do

  keywords_sql = "SELECT keyword FROM videos ORDER BY keyword"
  @keywords = @db.exec(keywords_sql)

  erb :keywords

end

get '/keywords/:keyword' do

  keyword = params[:keyword]
  videos_by_keyword_sql = "SELECT * FROM videos WHERE keyword = '#{keyword}'"
  @videos_by_keyword = @db.exec(videos_by_keyword_sql)

  erb :keyword

end

def sql_string(value)
  value.gsub("'", "''")
end













