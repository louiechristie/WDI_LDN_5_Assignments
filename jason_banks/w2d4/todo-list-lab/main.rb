require "pry"
require "sinatra"
require "sinatra/reloader" if development?
require "pg"

before do

  @db = PG.connect(dbname: 'to-do-list', host: 'localhost')

end

after do

  @db.close

end

get '/' do
  list_sql = "select * from todos"
  @todos = @db.exec(list_sql)

  erb :index
end

get '/new' do
  erb :new
end

post '/create' do

  item = params[:item]
  description = params[:description]

  add_sql = "insert into todos (item, description) values (#{sql_string(item)}, #{sql_string(description)})"
  @db.exec(add_sql)

  redirect to('/')
end

get '/show/:id' do
  id = params[:id].to_i
  show_sql = "select * from todos where id = #{id}"
  @todo = @db.exec(show_sql)

  erb :show
end

get '/edit/:id' do
  id = params[:id].to_i
  edit_sql = "select * from todos where id = #{id}"
  @todo = @db.exec(edit_sql)

  erb :edit
end

post '/update/:id' do
  item = params[:item]
  description = params[:description]
  id = params[:id].to_i

  update_sql = "update todos set item = #{sql_string(item)}, description = #{sql_string(description)} where id = #{id}"
  @db.exec(update_sql)

  redirect to("/show/#{params[:id]}")
end

get '/delete/:id' do

  item = params[:item]
  description = params[:description]
  id = params[:id].to_i

  del_sql = "delete from todos where id = #{id}"
  @db.exec(del_sql)

  redirect to('/')
end

def sql_string(value)
  "'#{value.gsub("'", "''")}'"
end

