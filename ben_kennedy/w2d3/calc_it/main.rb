require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'basic' then redirect to('/basic')
  when 'advanced' then redirect to('/advanced')
  when 'trip' then redirect to('/trip')
  when 'bmi' then redirect to('/bmi_choice')
  when 'mortgage' then redirect to('/mortgage')
  when 'personality' then redirect to('/personality')
  else redirect to('/')
  end
end

get '/basic' do
  @number1 = params[:number1].to_f
  @operator = params[:operator]
  @number2 = params[:number2].to_f

  case @operator
    when "+"
      @result = @number1 + @number2
    when "-"
        @result = @number1 - @number2
    when "*"
        @result = @number1 * @number2
    when "/"
        @result = @number1 / @number2
    end

  erb :basic
end

get '/advanced' do
  
  @number1 = params[:number1]
  @number2 = params[:number2]
  @number3 = params[:number3]
  
  if @number1 && @number2
    @result1 = @number1.to_f ** @number2.to_f
  end
  if @number3
    @result2 = Math.sqrt(@number3.to_f).round(2)
  end     
  erb :advanced
end

get '/trip' do

  @distance = params[:distance].to_f
  @speed = params[:speed].to_f
  @mpg = [5, params[:mpg].to_f - (@speed - 60) * 2].min.to_f if params[:mpg]
  @price = params[:price].to_f
  @time = (@distance.to_f / @speed).round(1)
  @cost = (@distance / @mpg * @price).round(0) if params[:mpg]
  erb :trip
end

 get '/bmi_choice' do
    case params[:system]
    when 'imperial' then redirect to('/bmi_imperial')
    when 'metric' then redirect to('/bmi_metric')
    end
    erb :bmi_choice
  end

get '/bmi_imperial' do

  height = params[:height]
  weight = params[:weight]
  @bmi = (703 * weight.to_f / height.to_f ** 2).round(0) if height && weight

  erb :bmi_imperial
end

get '/bmi_metric' do
  
  height = params[:height]
  weight = params[:weight]
  @bmi = (weight.to_f / height.to_f ** 2).round(0) if height && weight

  erb :bmi_metric
end

get '/mortgage' do
    
  @principal = params[:principal]
  @rate = params[:rate].to_f / 100 / 12
  @years = params[:years]
  payments = @years.to_i * 12
  @monthly_payment = (@principal.to_f * ((@rate * (1 + @rate) ** payments)/((1 + @rate)**payments - 1))).round(2) if @years && @principal

  erb :mortgage
end
   
get '/personality' do
  
  @display_personality = true if params != {}
  @who_you_are = [
    "A big fat jerk",
    "A kind and loving soul",
    "A person to bring home to your mother",
    "Good lord, words cannot describe",
    "I could take you or leave you",
    "You're not worth the bits required to articulate a description",
    "I LOVE you!!!!!!"].shuffle![0]

  erb :personality
end
