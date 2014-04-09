require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'Math' then redirect to('/math')
  when 'BMI' then redirect to('/bmi')
  when 'Mortgage' then redirect to('/mortgage')
  when 'Trip' then redirect to('/trip')
  when 'Space' then redirect to('/space')
  else  
    @error = "Invalid Page Selected"
    erb :home
  end
end


get '/math' do
  case params[:destination].downcase
  when 'basic' then redirect to('/basic')
  when 'advanced' then redirect to('/advanced')


  erb :math
end

get '/bmi' do
  erb :bmi
end

get '/mortgage' do
  erb :mortgage
end

get '/trip' do
  erb :trip
end

get '/space' do
  erb :space
end




get '/power/:number/:number2' do
  number = params[:number].to_f
  number2 = params[:number2].to_f
  "This is my homepage, and the result of #{number_1} to the power of #{number_2} is #{number_1**number_2}."
end

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


get '/add/:number/:number2' do
  @number = params[:number].to_f
  @number2 = params[:number2].to_f
  @symbol = "+" 
  @result = @number + @number2

  erb :calc
end

get '/subtract/:number/:number2' do
  @number = params[:number].to_f
  @number2 = params[:number2].to_f
  @symbol = "-"
  @result = @number - @number2
  
 
  erb :calc
end
