require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/cosmicalc' do
  erb :cosmicalc
end

post '/navigate' do
  case params[:destination].downcase
  when 'basic' then redirect to('/basic')
  when 'advanced' then redirect to ('/advanced')
  when 'mega_advanced' then redirect to ('/mega_advanced')
  when 'cosmic' then redirect to ('/cosmic')
  else
    @error = "select another cosmic calc destination"
    erb :cosmicalc
  end
end

get '/basic' do
   @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
  when "+" then @first + @second
  when "-" then @first - @second
  when "*" then @first * @second
  when "/" then @first / @second
  end
  erb :basic
end

get '/advanced' do
  @operation = params[:operation]

  case @operation
  when "power" then redirect to ('/power')
  when "square" then redirect to ('/square')
  end
  erb :advanced
end

get '/mega_advanced' do
@mega_operation = params[:mega_operation]

  case @mega_operation
  when "mortgage" then redirect to ('/mortgage')
  when "bmi" then redirect to ('/bmi')
  when "trip" then redirect to ('/trip')
  end
  erb :mega_advanced
end

get '/cosmic' do
  erb :cosmic
end

get '/power' do
  @power_first = params[:first].to_f
  @power_second = params[:second].to_f
  @power_result = @power_first ** @power_second

  erb :power
end

get '/square' do
  @square_first = params[:first].to_f
  @square_second = params[:second].to_f
  @square_result = Math.sqrt(@square_first)
  erb :square
end

get '/mortgage' do
  @principal_amount = params[:principal_amount].to_f
  @interest = params[:interest].to_f
  if @interest
    @interest = @interest / 1200
    @number_payments = params[:number_payments].to_f
    @number_payments = @number_payments * 12
    @mortgage_result = @principal_amount * @interest * ((1 + @interest) ** @number_payments) / ((1 + @interest) ** @number_payments - 1)
  end
  erb :mortgage
end

get '/bmi' do
@weight = params[:weight].to_f
@height = params[:height].to_f
if @height
  @height = @height / 100
  @bmi_result = (@weight / (@height)**2).round(2)
end
  erb :bmi
end

get '/trip' do
  @distance = params[:distance].to_f
  @efficiency = params[:efficiency].to_f
  @price = params[:price].to_f
  @speed = params[:speed].to_f

  @duration_result = (@distance / @speed).round(2)
  @cost_result = ((@distance / @efficiency) * @price).round(2)
  erb :trip
end


