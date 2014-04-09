require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

def two_decimals(number)
  sprintf "%.2f", number
end

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
    when 'calculator' then redirect to('/calculator')
    when 'power' then redirect to('/power')
    when 'root' then redirect to('/root')
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
    @result = (@number ** @power)
  end
  erb :power
end

get '/root' do
  if params[:number]
    @number = params[:number].to_f
    @result = (Math.sqrt(@number.to_f))
  end
  erb :root
end

get '/mortgage' do
  if params[:principal] && params[:interest_rate] && params[:number_of_payments]
    @principal = params[:principal].to_f
    @interest_rate = params[:interest_rate].to_f
    @number_of_payments = params[:number_of_payments].to_f

    monthly_interest_rate = (@interest_rate /100)/12
    monthly_payment = @principal * (monthly_interest_rate * (1 + monthly_interest_rate)**@number_of_payments)  /  ( (1 + monthly_interest_rate)**@number_of_payments - 1)

    @result = monthly_payment
  end
  erb :mortgage
end

get '/trip' do
  if params[:distance] && params[:mpg] && params[:cpg] && params[:speed]
    @distance = params[:distance].to_f
    @mpg = params[:mpg].to_f
    @cpg = params[:cpg].to_f
    @speed = params[:speed].to_f

    if @speed >= 60
      reduce = 2 * (@speed - 60)
      @mpg = @mpg - reduce
    end
    @hours = @distance / @speed
    @cost =  (@distance / @mpg) * @cpg
   
  end
  erb :trip
end

get '/bmi' do
  if params[:height1] && params[:h_unit1] && params[:height2] && params[:h_unit2] && params[:weight] && params[:w_unit]
    @height1 = params[:height1].to_f
    @h_unit1 = params[:h_unit1].to_f
    @height2 = params[:height2].to_f
    @h_unit2 = params[:h_unit2].to_f
    @weight = params[:weight].to_f
    @w_unit = params[:w_unit].to_f

    @height1 = 0.3048 * @height1 if @h_unit1 == "feet" 
    @height2 = 2.54 * @height2 if @h_unit2 == "inches"

    @height1 = @height1 + (0.01 * @height2) 

    @weight = @weight * 6.35029 if @w_unit == "stone"

    @result = @weight/((@height1)**2)
  end
  erb :bmi
end
