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
  tag = params[:tag].downcase
  @incomplete = ""
  
  if title.empty? || id.empty? || tag.empty?
    @incomplete = "Incomplete details provided."
    redirect to("/add")
  end

  confirm_sql = "SELECT * FROM videos WHERE id = '#{sql_string(id)}'"
  @confirm_video = @db.exec(confirm_sql).first

  if @confirm_video
    redirect to("/add")
  else
    add_sql = "INSERT INTO videos (id, title, tag) VALUES ('#{sql_string(id)}', '#{sql_string(title)}', '#{sql_string(tag)}')"
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

get '/tags' do

  tags_sql = "SELECT tag, count(tag) FROM videos GROUP BY tag ORDER BY tag"
  @tags = @db.exec(tags_sql)

  erb :tags

end

get '/tags/:tag' do

  tag = params[:tag]
  videos_by_tag_sql = "SELECT * FROM videos WHERE tag = '#{tag}'"
  @videos_by_tag = @db.exec(videos_by_tag_sql)

  erb :tag

end

def sql_string(value)
  value.gsub("'", "''")
end













