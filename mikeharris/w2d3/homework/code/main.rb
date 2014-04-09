require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

 # <li><a href='/'>Home</a></li>
 #        <li><a href='/BMI'>BMI</a></li>
 #        <li><a href='/Maths'>Maths</a></li>
 #        <li><a href='/Trip'>Trip</a></li>
 #        <li><a href='/Mortgage'>Mortgage</a></li>


post '/navigate' do
  case params[:destination].downcase
  when 'BMI' then redirect to('/BMI')
  when 'Maths' then redirect to('/Maths')
  when 'Trip' then redirect to('/Trip')
  when 'Mortgage' then redirect to('/Mortgage')
  else 
    @error = "jsg;har;"
    erb :home
  end
end

get '/BMI' do
  erb :BMI
 end

# get '/weather' do
#   erb :weather
# end

# get '/gossip' do
#   erb :gossip
# end

# get '/celebrity' do
#   erb :celebrity
# end
