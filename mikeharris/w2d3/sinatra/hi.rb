require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?


get '/calc' do  
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second  
    when '/' then @first / @second  
    end  



  erb :calc 



end





# get '/hi/:name' do |name|
#     "<p>Hello World, from #{params[:name]}</p>  <p>Hi</p>  <p><a href = '/bye'> go this way to the bye page </a>"
# end

# get '/bye' do
#   "<p>good bye World, from scotty</p>  <p>bye</p> <"
# end

# get '/' do
#   "this is my homepage  <a href = '/hi'> go this way</a>"
# end

# get '/power/:x' do 
#   x = params[:x].to_f
#   "here is yournos to the power #{x**x} "
# end

# get '/add/:x/:y' do 
#   x = params[:x].to_f
#   y = params[:y].to_f
  
#   @result = x + y

#   erb :calc 
# end

# get '/sub/:x/:y' do 
#   x = params[:x].to_f
#   y = params[:y].to_f
  
#   @result = x - y

#   erb :calc 
# end


# get '/hi' do 
#   "hello"

# end

# post '/hi' do 
#   "in the post method for hi"

# end

# get '/slim'   do
#   slim :index

# end 



