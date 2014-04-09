require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'sports' then redirect to('/sports')
  when 'weather' then redirect to('/weather')
  when 'gossip' then redirect to('/gossip')
  when 'celebrity' then redirect to('/celebrity')
  when 'calculator' then redirect to('/calculator')
  else redirect to('/')
  end
end

get '/sports' do
  erb :sports
end

get '/weather' do
  erb :weather
end

get '/gossip' do
  erb :gossip
end

get '/celebrity' do
  erb :celebrity
end

get '/calculator' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
  when '+' then @first + @second
  when '-' then @first - @second
  when '*' then @first * @second
  when '/' then @first / @second
  end

  erb :calculator
end
