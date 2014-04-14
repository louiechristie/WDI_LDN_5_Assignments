require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?
require 'pg'

before do
  @db = PG.connect(dbname: 'todo_list', host: 'localhost')  
end

after do
  @db.close
end

get '/'  do  #index
    sql_select = "select * from list"
    @task_list = @db.exec(sql_select).to_a  
  erb :home 
end
  
get '/new' do 
  sql_select = "select * from list"
  @task_list = @db.exec(sql_select).to_a  
  erb :create
end

post '/create' do 
  @task_name = params[:task_name]
  @description = params[:description]
  if @task_name && @description
    sql = "insert into list (task_name, description, completed) values ('#{@task_name}', '#{@description}', 'f');"
    @db.exec(sql)
  end
    sql_select = "select * from list"
    @task_list = @db.exec(sql_select).to_a   
  erb :home
end

get '/show/:id' do 

erb :wip
end

get '/edit/:id' do 

  @edit = params[:edit]

  sql_select = "select * from list"
  @task_list = @db.exec(sql_select).to_a  
  erb :edit
end

post '/update/:id' do 
  @edit = params[:id].gsub(":","")
  @task_name = params[:task_name]
  @description = params[:description]
  binding.pry
  if @task_name && @description
    update_sql = "update list set task_name = '#{@task_name}', description = '#{@description}' where id = '#{@edit}'"
    @db.exec(update_sql)
  end
  sql_select = "select * from list"
  @task_list = @db.exec(sql_select).to_a  
erb :home
end

get '/delete/:id' do 

erb :wip
end