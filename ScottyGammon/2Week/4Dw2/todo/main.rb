require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

before do
	@db = PG.connect(dbname: 'todo_app', host: 'localhost')
	sql = "select * from todos"
	@items = @db.exec(sql)
end

after do
	@db.close
end

get '/' do 
	
	erb :todo
end

#get '/new' do
 # erb :new
#end

post "/create" do

	@item = params[:item]
	@completeness = params[:completeness]
	@duedate = params[:duedate]
	if @item && @item > "" && @duedate > ""

		sql= "insert into todos (item, completeness, duedate) values ('#{@item}', '#{@completeness}', '#{@duedate}') "
		
		@db.exec(sql)

	end

	redirect "/"
end

get '/edit/:id'  do 
	

	sql = "select * from todos where id = #{params[:id].to_i}"
	@todo= @db.exec(sql).first #array with hashes in it, ask for first one.
	erb :todo
end

post '/update/:id' do
	@id = params[:id]
	@item = params[:item]
	@completeness = params[:completeness]
	@duedate = params[:duedate]

    sql = "update todos SET item='#{@item}', completeness='#{@completeness}', duedate='#{@duedate}' where id = '#{@id}'"
    @db.exec(sql)

redirect to '/'


 end

get "/delete/:id" do
	@id= params[:id]


sql= "delete from todos where id = #{@id}"

@db.exec(sql)

redirect "/"

end

#=end

# def completed?(boolean)
# 	boolean == 1 ? true : false
# end