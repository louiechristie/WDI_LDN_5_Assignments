require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?

require 'pg'

before do
      @db = PG.connect(:dbname =>'memetube', :host => 'localhost')
end

after do 
    @db.close
end

get '/'  do
    erb :main 
end

get '/show' do 
  sql = ("select genre from videos group by genre order by genre")
  @genre_list = @db.exec(sql)
  if params[:filter] 
    sql="select * from videos WHERE genre='#{params[:filter]}'"
  else
    sql="select * from videos order by title"
  end
  @users_videos = @db.exec(sql)

  erb :show
end

get '/show/:id' do
  @id = params[:id]

  sql = "select url from videos where id='#{@id}'"

  @url = @db.exec(sql)[0]["url"]

  erb :playclip 
end

get '/new'  do
 erb :new 
end

post '/create'  do
    @title = params[:title].capitalize
    @description = params[:description]
    @url = params[:url]
    @genre = params[:genre].capitalize

    sql = "insert into videos (title, description, url, genre) values('#{@title}', '#{@description}', '#{@url}', '#{@genre}')"
    @db.exec(sql)
    
 redirect '/show'
end


get '/delete/:id'  do 
     @id = params[:id]
     sql = "delete FROM videos where id = '#{@id}'"
     @db.exec(sql)
    
    redirect to '/show'

end

get '/edit/:id'  do 

     @id = params[:id]
     sql = "select * from videos where id='#{@id}'"

     # change to sql to extract from database.  doh
     @users_videos = @db.exec(sql)[0]
           
   erb  :edit

end

post '/update/:id' do
    @id = params[:id]
    @title = params[:title].capitalize
    @description = params[:description]
    @url = params[:url]
    @genre = params[:genre].capitalize

    
    sql = "update videos SET title='#{@title}', description='#{@description}', url='#{@url}', genre ='#{@genre}' where id = '#{@id}'"
    @db.exec(sql)

redirect to '/show'


 end




