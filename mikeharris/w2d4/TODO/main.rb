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
    @title = params[:title]
    @todo = params[:todo]

    sql_all = "select * from todo"
    @todolist = @db.exec(sql_all)

    if @title && @title > "" 
      sql = "insert into todo (title, todo) values('#{@title}', '#{@todo}')"
      @db.exec(sql)
      @todolist = @db.exec(sql_all)
      

    end

  erb :todo 

end


get '/delete/:x'  do 

     @id_to_del = params[:x]
     sql = "delete FROM todo where id = '#{@id_to_del}'"
     @db.exec(sql)
      
redirect to '/'

end

get '/edit/:x'  do 

     @id_to_edit = params[:x]
     sql = "select * from todo"
     @todolist = @db.exec(sql)

     @todolist.each do |item|
        if item["id"] == @id_to_edit
              @entry_to_edit = item
        end
     end 

      
   erb  :edit

end

get '/change' do
   @id = params[:id]
   @title = params[:title]
   @todo = params[:todo]

    sql = "update todo SET title='#{@title}', todo='#{@todo}' where id = '#{@id}'"
    @db.exec(sql)

redirect to '/'


 end




