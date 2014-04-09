require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'Basic Calc' then redirect to('/basic')
  when 'Advanced Calc' then redirect to('/advanced')
  when 'gossip' then redirect to('/gossip')
  when 'celebrity' then redirect to('/celebrity')
  else redirect to ('/')
  end
end

get '/basic' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  @operator= params[:operator]
  

  @result = case @operator
  when '+' then @first + @second
  when '-' then @first - @second
  when '*' then @first * @second
  when '/' then @first / @second
  end

  erb :basic
end

get '/advanced' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  @operator= params[:operator]

  @result = case @operator
  when '^' then @first ** @second
  when "√" then Math.sqrt(@first)
  end

  erb :advanced
end

get '/gossip' do
  erb :gossip
end

get '/celebrity' do
  erb :celebrity
end
