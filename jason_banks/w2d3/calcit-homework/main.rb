require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'

get '/' do
  erb :home
end

get '/basic' do
  first = params[:first].to_f
  second = params[:second].to_f
  operator = params[:operator]

  @result = case operator
            when "+" then first + second
            when "-" then first - second
            when "*" then first * second
            when "/" then first / second
            end

  erb :basic
end

get '/advanced' do

  first = params[:first].to_f
  second = params[:second].to_f
  square = params[:square].to_f

  if params[:first]
    @result_power = first**second
  elsif params[:square] && square >= 0
    @result_root = Math.sqrt(square)
  elsif params[:square] && square < 0
    @result_root = "unable to determine the square root of a negative number"      
  else
    @result_power = nil
    @result_root = nil
  end
 

  erb :advanced

end

get '/mortgage' do

  principal = params[:principal].to_f
  interest = params[:interest].to_f / 12 / 100
  number = params[:number].to_f

  interest_sub_calc = (1 + interest)**number
  numerator = interest * interest_sub_calc
  denominator = interest_sub_calc - 1
  @result = principal * (numerator / denominator)

  erb :mortgage

end

get '/bmi' do

  @imperial_mass = params[:imperial_mass].to_f
  imperial_height = params[:imperial_height].to_f

  @metric_mass = params[:metric_mass].to_f
  metric_height = params[:metric_height].to_f

  if params[:metric_mass] && params[:imperial_mass].empty?
    @metric_result = @metric_mass / (metric_height**2)
  elsif params[:imperial_mass] && params[:metric_mass].empty?
    @imperial_result = (@imperial_mass / (imperial_height**2)) * 703
  else
    @nothing = true
  end

  erb :bmi

end

get '/trip' do

  distance
  mpg
  cost
  mph


  erb :trip

end












