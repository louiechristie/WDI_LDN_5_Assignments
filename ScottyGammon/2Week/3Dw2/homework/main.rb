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
  when 'Trip' then redirect to('/trip')
  when 'Mortgage' then redirect to('/mortgage')
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

get '/trip' do
    @trip_dist=params[:trip_dist].to_f
    @trip_mpg=params[:trip_mpg].to_f
    @trip_mpgcost=params[:trip_mpgcost].to_f
    @trip_speed = params[:trip_speed].to_f

    @trip_mpg = @trip_mpg - [0, @trip_speed - 60].max * 2

    if @trip_dist
      @trip_time = (@trip_dist / @trip_speed).round(2) 
      @trip_cost = (@trip_dist / @trip_mpg * @trip_mpgcost).round(2)
    end

  erb :trip
end

get '/mortgage' do
  @mort_prin = params[:mort_prin].to_f
  @mort_rate = params[:mort_rate].to_f
  @mort_years = params[:mort_years].to_f
  if @mort_years
    @mort_rate = @mort_rate /1200
    @mort_nos_payments = @mort_years * 12


    @mort_monthly_payment = (@mort_prin * @mort_rate  * ((1 + @mort_rate)**@mort_nos_payments) / ((1 + @mort_rate)**@mort_nos_payments - 1)  ).round(2)
  end


  erb :mortgage
end