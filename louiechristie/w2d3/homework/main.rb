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

def two_decimals(number)
  sprintf "%.2f", number
end