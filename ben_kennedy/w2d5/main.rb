require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'video_app', host: 'localhost')  
end

after do
  @db.close
end

get '/'  do 


   erb :home 
end

get '/index'  do 
    sql_select = "select id, video_name, created_at, tags from videos"
    @video_list = @db.exec(sql_select).to_a
   erb :index 
end
  
get '/new' do 
 
  erb :create
end

post '/create' do 
  @video_name = params[:video_name]
  @video_description = params[:video_description]
  @video_id = params[:video_id]
  @tags = "{"+ params[:tags] + "}"
  @posted_by = params[:posted_by]
  if @video_name && @video_description && @video_id && @posted_by
    sql_add = "insert into videos (video_name, video_description, video_id, tags, created_at, posted_by) values ('#{@video_name}', '#{@video_description}', '#{@video_id}', '#{@tags}', current_timestamp, '#{@posted_by}');"
    @db.exec(sql_add)
  end
   erb :index
end

get '/show/:id' do 
  @id = @env["PATH_INFO"].chars.pop
  sql_select = "select * from videos where id = '#{@id}'"
  @video = @db.exec(sql_select).to_a[0]
erb :show
end

get '/edit/:id' do 
  @edit = params[:id].gsub(":", "")
  sql_select = "select * from videos where id = '#{@edit}'"
  @video = @db.exec(sql_select).to_a[0]
  erb :edit
end

post '/update/:id' do 
  @video_name = params[:video_name]
  @video_description = params[:video_description]
  @video_id = params[:video_id]
  @tags = "{"+ params[:tags] + "}"
  @posted_by = params[:posted_by]
  if @video_name && @video_description && @video_id && @posted_by
    sql_update = "insert into videos (video_name, video_description, video_id, tags, updated_at, posted_by) values ('#{@video_name}', '#{@video_description}', '#{@video_id}', '#{@tags}', current_timestamp, '#{@posted_by}');"
    @db.exec(sql_update)
  end
  sql_select = "select * from videos where id = '#{params[:id].gsub(":", "")}'"
  @video = @db.exec(sql_select).to_a[0]
  erb :show
end

get '/delete/:id' do 
  # @delete = params[:delete]
  # delete_sql = "delete from list where id = '#{@delete}'"
  # @db.exec(delete_sql)
  # sql_select = "select * from list"
  # @task_list = @db.exec(sql_select).to_a  
  # erb :home
end