require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?


get '/calc' do
  # binding.pry
 @first = params[:first].to_f
 @operator = params[:operator]
 @second = params[:second].to_f

 @result = case @operator
 when '+' then @first + @second
 when '-' then @first - @second
 when '*' then @first * @second
 when '/' then @first / @second
 end

  erb :calc
end

get '/hi' do
  "
  <html>
  <head>
  <title></title>
  </head>
  <p>Hello world from Scotty!</p>
    <form action='/hi' method='post'>
      <input type='number' name='x' />
      <input type='number' name='y' />
      <input type='submit' />
    </form>
  </html>
  "
end

post '/hi' do
  # binding.pry
  y = params[:y].to_f
  x = params[:x].to_f
  @result = x + y


   erb :calc
end