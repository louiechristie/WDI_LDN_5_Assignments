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
    else  
    @error = "Invalid Page Selected"
    erb :home
  end
  erb :math
end

get '/basic' do
  
end

get '/advanced' do
  
end




# get '/power/:number/:number2' do
#   number = params[:number].to_f
#   number2 = params[:number2].to_f
#   "This is my homepage, and the result of #{number_1} to the power of #{number_2} is #{number_1**number_2}."
# end

# get '/calc' do
#   @first = params[:first].to_f
#   @second = params[:second].to_f
#   @operator = params[:operator]

#   @result = case @operator
#     when "+" then @first + @second
#     when "-" then @first - @second
#     when "*" then @first * @second
#     when "/" then @first / @second
#   end
#   erb :calc
# end


# get '/add/:number/:number2' do
#   @number = params[:number].to_f
#   @number2 = params[:number2].to_f
#   @symbol = "+" 
#   @result = @number + @number2

#   erb :calc
# end

# get '/subtract/:number/:number2' do
#   @number = params[:number].to_f
#   @number2 = params[:number2].to_f
#   @symbol = "-"
#   @result = @number - @number2
  
 
#   erb :calc
# end


get '/bmi' do
    @weight = params[:weight].to_f
    @height = params[:height].to_f
    @units = params[:units]
   
  if @weight <= 0
    @result = 0
    @message = "You must enter a positive weight."
  elsif @height <= 0
    @result = 0
    @message = "You must enter a positive height."
  else
     case @units
      when "empirical"
        @result = ((@weight) / (@height) ** 2 ) * 703
        @message = "Your BMI is #{@result.round(1)}."
      when " metric"
        @result = (@weight) / (@height) ** 2
        @message = "Your BMI is #{@result.round(1)}."
     end
  end
  erb :bmi
end

get '/mortgage' do
    @principal = params[:principal].to_f
    @interest = params[:interest].to_f * 0.01 / 12
    @frequency = params[:frequency].to_f

  if @principal < 0
    @message = "Please insert a positive principal loan amount."
  elsif @interest < 0
    @message = "Please insert a positive interest amount."
  elsif @frequency < 0
    @message = "Please insert a positive amount of payments needed." 
  else 
    @result = (@principal * (( @interest * ( (1+@interest)**@frequency) )/ ( ( (1+@interest)**@frequency) - 1 ) )).round(2)
    @message = "Your monthly mortgage is $#{@result}."
  end
  erb :mortgage
end

get '/trip' do
    @distance = params[:distance].to_f
    @efficiency = params[:efficiency].to_f
    @gas = params[:gas].to_f
    @speed = params[:speed].to_f

 time =  (@distance / @speed).round(1)
 cost = (@distance * @gas / @efficiency).round(2)

  if @distance < 0
    @message = "Please insert a positive distance."
  elsif @efficiency < 0
    @message = "Please insert a positive fuel efficiency."
  elsif @gas < 0
    @message = "Please insert a positive gas cost." 
  elsif @speed < 0
    @message = "Please insert a positive speed." 
  else 
    @message = "Your trip will take #{time} hours and $#{cost}."
  end
  erb :trip
end

get '/space' do
    @weight = params[:weight].to_f
    

  if @weight < 0
    @message = "Please insert a positive weight."
  else 
    @result = (@weight * 0.378).round(1)
    @message = "Your will weigh #{@result} pounds on Mars!"
  end

  erb :space
end



