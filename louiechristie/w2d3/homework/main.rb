require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'calculator' then redirect to('/calculator')
  when 'power' then redirect to('/power')
  else redirect to('/')
  end
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

get '/power' do
  if params[:number] && params[:power]
    @number = params[:number].to_f
    @power = params[:power].to_f
    @p_result = (@number ** @power)
  end

  erb :power
end
