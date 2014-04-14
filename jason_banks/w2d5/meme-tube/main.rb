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
  
  if title.empty? || id.empty? || tag.empty?
    @incomplete = "Incomplete details provided."
    erb :add
  else
    confirm_sql = "SELECT * FROM videos WHERE id = '#{sql_string(id)}'"
    @confirm_video = @db.exec(confirm_sql).first
    if @confirm_video
      erb :add
    else
      add_sql = "INSERT INTO videos (id, title, tag) VALUES ('#{sql_string(id)}', '#{sql_string(title)}', '#{sql_string(tag)}')"
      @db.exec(add_sql)
      redirect to("/view/#{sql_string(id)}")
    end 
  end
end

get '/view/:id' do
  id = params[:id]
  view_video_sql = "SELECT * FROM videos where id = '#{sql_string(id)}'"
  @view_video = @db.exec(view_video_sql).first

  erb :view

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

get '/edit/:id' do

  id = params[:id]
  edit_sql = "SELECT * FROM videos WHERE id = '#{id}'"
  @edit_video = @db.exec(edit_sql).first
  binding.pry

  erb :edit

end

post '/update/:id' do

  title = params[:title]
  id = params[:id]
  tag = params[:tag]
  binding.pry

  update_sql = "UPDATE videos SET title = '#{sql_string(title)}', tag = '#{sql_string(tag)}' WHERE id = '#{id}'"
  binding.pry
  @db.exec(update_sql)

  redirect to("/view/#{id}")

end

get '/delete/:id' do

  binding.pry

  id = params[:id]
  delete_sql = "DELETE FROM videos WHERE id = '#{id}"

  redirect to("/viewall")

end

def sql_string(value)
  value.gsub("'", "''")
end




