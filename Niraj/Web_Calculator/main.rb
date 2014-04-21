require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :menu
end

get '/simple' do 
 
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]
    
  @result = case @operator
    when "+" then @first + @second
    when "-" then @first - @second
    when "*" then @first * @second
    when "/" then @first / @second
  end

  erb :simple  
end


get '/advanced' do 
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
    when "√" then Math.sqrt(@first)
    when "**²" then @first ** @second
  end

  erb :advanced  
end


get '/mortgage' do
  @amount = params[:amount].to_i
  @payments = params[:payments].to_i
  @interest = params[:interest].to_i

  unless params[:amount].nil?
  @loan_term = (1 + @interest) ** @payments
  @repayment = @amount * (@interest * @loan_term) / (@loan_term -1)


end
  erb :mortgage
end


get '/trip' do
  if params[:distance] && params[:mpg] && params[:cpg] && params[:speed]
     @distance = params[:distance].to_f
     @mpg = params[:mpg].to_f
     @gallon = params[:gallon].to_f
     @speed = params[:speed].to_f


   
     @time = @distance / @speed
     @cost =  (@distance / @mpg) * @gallon

    
  end
   erb :trip
 end


get '/bmi' do

  if params[:height] && params[:height_unit] && params[:height2] && params[:height_unit2] && params[:weight] && params[:weight_unit] 
  
  @height = params[:height].to_f
  @height_unit = params[:height_unit].to_f
  @height2 = params[:height2].to_f
  @height_unit2 = params[:height_unit2].to_f
  @weight = params[:weight].to_f
  @weight_unit = params[:wei].to_f

  @height1 = 0.3048 * @height if @height_unit == "feet"
  @height2 = 2.54 * @height2 if @height_unit2 == "inches"

  @height = @height + @height2
  @weight = @weight * 6.350 if @weight_unit == "stone"

  @result = @weight/((@height)**2)
end
  erb :bmi
end
