require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?

require 'pg'

before do
      @db = PG.connect(:dbname =>'todo', :host => 'localhost')
end

after do 
    @db.close
end


get '/'  do
    redirect '/show'
end

get '/new'  do
 erb :new 
end

post '/create'  do
    @title = params[:title]
    @todo = params[:todo]
    
    sql = "insert into todo (title, todo) values('#{@title}', '#{@todo}')"
    @db.exec(sql)
    
 redirect '/show'
end


get '/show' do
  sql="select * from todo"
  @todolist = @db.exec(sql)

  erb :show
end

get '/delete/:id'  do 
     @id = params[:id]
     sql = "delete FROM todo where id = '#{@id}'"
     @db.exec(sql)
      
redirect to '/show'

end

get '/edit/:id'  do 

     @id = params[:id]
     sql = "select * from todo"
     @todolist = @db.exec(sql)

     @todolist.each do |item|
        if item["id"] == @id
              @entry_to_edit = item
        end
     end 

      
   erb  :edit

end

post '/update/:id' do
   @id = params[:id]
   @title = params[:title]
   @todo = params[:todo]

    sql = "update todo SET title='#{@title}', todo='#{@todo}' where id = '#{@id}'"
    @db.exec(sql)

redirect to '/'


 end




