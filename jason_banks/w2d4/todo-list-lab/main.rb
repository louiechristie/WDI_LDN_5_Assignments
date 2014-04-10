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

# get '/home' do

#   item = params[:item]
#   description = params[:description]
#   delete = params[:delete]

#   if item && item > ""
#     add_sql = "insert into todos (item, description) values (#{sql_string(item)}, #{sql_string(description)})"
#     @db.exec(add_sql)
#   end

#   if delete && delete > ""
#     del_sql = "delete from todos where id = #{delete}"
#     @db.exec(del_sql)
#   end

#   show_sql = "select * from todos"
#   @todos = @db.exec(show_sql)


#   erb :home

# end



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

  # if item && item > ""
  add_sql = "insert into todos (item, description) values (#{sql_string(item)}, #{sql_string(description)})"
  @db.exec(add_sql)
  # end
  redirect to('/')
end

get '/show/:id' do
  id = params[:id]
  show_sql = "select * from todos where id = #{id}"

  @todo = db.exec(show_sql)

  erb :show
end

get '/edit/:id' do
  erb :edit
end

post '/update/:id' do
  redirect to("/show/#{params[:id]}")
end

get '/delete/:id' do
  redirect to('/')
end

def sql_string(value)
  "'#{value.gsub("'", "''")}'"
end

