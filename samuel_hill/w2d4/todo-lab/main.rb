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

  redirect to('/')

end

get '/list' do

	sql = "select * from todolist"
	@todos = @db.exec(sql)

	erb :list

end

get '/show/:id' do
  erb :show
end

get '/edit/:id' do

	redirect to("/show/#{params[:id]}")

end  

get '/delete/:id' do
	
	sql = "delete from todolist where id='#{params[:id]}'"

	@db.exec(sql)

  redirect to('/list')

end







