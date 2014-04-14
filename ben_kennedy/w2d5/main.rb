require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'video_app', host: 'localhost')  
  menu_select = "select tags from videos"
  db_tags = @db.exec(menu_select).to_a
  
  @menu_tags = ""
  @menu_tags_final = { }
  db_tags.each { |tag_hash|
    @menu_tags << tag_hash["tags"].gsub("{", "").gsub("}",",")
  }
  @menu_tags.lines(",").uniq { |tag|
    @menu_tags_final[tag] = @menu_tags.lines(",").count(tag)
  }
  @menu = [ ] 
  4.times do
    @menu << @menu_tags_final.key(@menu_tags_final.values.max).gsub(",", "")
    @menu_tags_final.delete(@menu_tags_final.key(@menu_tags_final.values.max))
  end          
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

get '/index/:tag' do
  @index = params["tag"]
    sql_select = "select id, video_name, created_at, tags from videos where tags @> '{#{@index}}'"
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
    sql_select = "select id, video_name, created_at, tags from videos where tags @> '{#{@index}}'"
    @video_list = @db.exec(sql_select).to_a
   erb :index
end

get '/show/:id' do 
  @id = @env["PATH_INFO"].lines(':').pop
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
    sql_update = "update videos set video_name = '#{@video_name}', video_description = '#{@video_description}', video_id = '#{@video_id}', tags = '#{@tags}', updated_at = current_timestamp, posted_by ='#{@posted_by}' where id = '#{params[:id].gsub(":", "")}';"
    @db.exec(sql_update)
  end
  sql_select = "select * from videos where id = '#{params[:id].gsub(":", "")}'"
  @video = @db.exec(sql_select).to_a[0]
  erb :show
end

get '/delete/:id' do 
  @delete = params[:id].gsub(":", "")
  delete_sql = "delete from videos where id = '#{@delete}'"
  @db.exec(delete_sql)
    sql_select = "select id, video_name, created_at, tags from videos"
  @video_list = @db.exec(sql_select).to_a
  erb :index
end