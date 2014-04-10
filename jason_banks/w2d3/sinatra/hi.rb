require "pry"
require "sinatra"
require "sinatra/reloader" if development?

get '/calc' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
  when "+" then @first + @second
  when "-" then @first - @second
  when "*" then @first * @second
  when "/" then @first / @second
  end

  erb :calc
end

# get '/hi' do
#   # binding.pry
#   "<html>
#     <head>
#       <title>Sinatra</title>
#     </head>
#     <body>
#       <h1>Hello World!</h1>
#       <form action='/hi' method='post'>
#         <input type='text' name='city' />
#         <input type='text' name='email' />
#         <input type='submit' />
#       </form>
#     </body>
#   </html>  
#       "
# end

# post '/hi' do
#   "in the post method for 'hi' #{params.inspect}."
# end

# get '/' do
#   "<h1>This is my homepage.</h1>"
# end

# get '/maths/:x/:y' do
#   # binding.pry
#   y = params[:y].to_f
#   x = params[:x].to_f

#   "this is my hompepage. and the result of #{x} to the power of #{y} is #{x**y}."
# end

# get '/add/:x/:y' do
#   @x = params[:x].to_f
#   @y = params[:y].to_f

#   @result = @x + @y

#   erb :calc

# end


# get '/subtract/:x/:y' do
#   @x = params[:x].to_f
#   @y = params[:y].to_f

#   @result = @x - @y

#   erb :subtract

# end












