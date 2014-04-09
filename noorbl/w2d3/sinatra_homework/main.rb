require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/CosmiCalc' do
  erb :CosmiCalc

  post '/navigae' do
    case params[:destination].downcase
    when 'basic' then redirect to('/basic')
    when 'advanced' then redirect to ('/advanced')
    when 'mega_advanced' then redirect to ('/mega_advanced')
    when 'cosmic' then redirect to ('/cosmic')
    else
      @error = "select another cosmic calc destination"
      erb :home
    end
end

get '/basic' do
  erb :basic
end

get '/advanced' do
  erb :advanced
end

get '/mega_advanced' do
  erb :mega_advanced
end

get '/cosmic' do
  erb :cosmic
end