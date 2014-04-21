require 'pry'
require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pg'

before do
	@db = PG.connect(dbname: 'todo_list', host: 'localhost')
end

after do
	@db.close
end

get '/' do

	erb :index
	
end

get '/new' do

	erb :new

end

post '/create' do

	@title = params[:title]
	@task = params[:task]

	sql = "insert into todolist (title, task) values ('#{@title}', '#{@task}')"

	@db.exec(sql)

  redirect to('/list')

end

get '/list' do

	sql = "select * from todolist"
	@todos = @db.exec(sql)

	erb :list

end

get '/edit/:id' do

	@id = params[:id]

	sql = "select * from todolist where id='#{params[:id]}'"

	@todo = @db.exec(sql).first

	erb :edit

end 

get '/update/:id' do

	@id = params[:id]
	@title = params[:title]
	@task = params[:task]

	sql =  "update todolist set title='#{params[:title]}', task='#{params[:task]}' where id='#{params[:id]}'"

	@db.exec(sql)

	redirect to('/list')

end 

get '/delete/:id' do

	sql = "delete from todolist where id='#{params[:id]}'"

	@db.exec(sql)

  redirect to('/list')

end







