require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'simple maths' then redirect to('/simple')
  when 'advanced maths' then redirect to('/advanced')
  when 'martgage' then redirect to('/mortgage')
  when 'bmi' then redirect to('/bmi')
  when 'trip' then redirect to('/trip')
  when 'timealive' then redirect to('/timealive')  
  else 
    @error = "invalid page selected."
    erb :home
  end
end

get '/simple' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
  when '+' then @first + @second
  when '-' then @first - @second
  when '*' then @first * @second
  when '/' then @first / @second
  end

  erb :simple
end

get '/advanced' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
  when '**' then @first ** @second
  when 'square' then Math.sqrt(@first)
  end

  erb :advanced
end

get '/mortgage' do
  @principal = params[:principal].to_f
  @yearly_interest_rate = params[:yearly_interest_rate].to_f / 1200
  @number_of_years = params[:number_of_years].to_f * 12

  @result = (@principal * ((@yearly_interest_rate * (1 + @yearly_interest_rate)**@number_of_years) / (((1 + @yearly_interest_rate)**@number_of_years)-1))).round(2)

  erb :mortgage
end

get '/bmi' do
  case params[:system]
  when 'bmi_imperial' then redirect to('/bmi_imperial')
  when 'bmi_metric' then redirect to('/bmi_metric')  
  end
  erb :bmi
end

get '/bmi_metric' do
  
  @weight = params[:weight].to_f
  @height = params[:height].to_f
  
  @result = (@weight / (@height**2)).round(2)

  erb :bmi_metric
end

get '/bmi_imperial' do
  
  @weight = params[:weight].to_f
  @height = params[:height].to_f
  
  @result = ((@weight / (@height**2))*703).round(2)

  erb :bmi_imperial
end

get '/trip' do
  
  @distance = params[:distance].to_f
  @fuel_efficiency = params[:fuel_efficiency].to_f
  @cost_per_gallon = params[:cost_per_gallon].to_f
  @speed = params[:speed].to_f
  
  if @speed > 60
    @fuel_efficiency - ((@speed - 60) * 2)
  end

  @duration = (@distance / @speed).round(2)
  @cost = (@cost_per_gallon * (@distance / @fuel_efficiency)).round(2)

  erb :trip
end

get '/timealive' do
  
  @year_of_birth = params[:year_of_birth].to_f
  @month_of_birth = params[:month_of_birth].to_f
  @day_of_birth = params[:day_of_birth].to_f

  @current_year = params[:current_year].to_f
  @current_month = params[:current_month].to_f
  @current_day = params[:current_day].to_f

  @result = ((@current_year - @year_of_birth)*365)
  + (((@current_month - @month_of_birth)*30).abs)
  + ((@current_day - @day_of_birth).abs)

  erb :timealive
end


