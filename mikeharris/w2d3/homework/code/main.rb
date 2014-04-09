require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

 # <li><a href='/'>Home</a></li>
 #        <li><a href='/BMI'>BMI</a></li>
 #        <li><a href='/Maths'>Maths</a></li>
 #        <li><a href='/Trip'>Trip</a></li>
 #        <li><a href='/Mortgage'>Mortgage</a></li>


post '/navigate' do
  case params[:destination].downcase
  when 'BMI' then redirect to('/BMI')
  when 'Maths' then redirect to('/Maths')
  when 'Trip' then redirect to('/Trip')
  when 'Mortgage' then redirect to('/Mortgage')
  else 
    @error = "jsg;har;"
    erb :home
  end
end

get '/BMI' do
  @weight=params[:weight].to_f
  @height=params[:height].to_f
  @units= params[:units]
  @factor = 1   
  if @units == "imperial" 
    @factor = 703
  end  
  if @weight 
      @BMIresult = (@weight / (@height ** 2) * @factor).round(2)
  end

  erb :BMI
 end


get '/Maths' do
  erb :Maths
end

get '/Maths/Basic' do
  @maths_basic_first = params[:maths_basic_first].to_f
  @maths_basic_second = params[:maths_basic_second].to_f
  @maths_basic_op = params[:maths_basic_op]

  if @maths_basic_first 
    
    case @maths_basic_op
      when "+"
          @maths_basic_result = @maths_basic_first + @maths_basic_second
      when "-"
          @maths_basic_result = @maths_basic_first - @maths_basic_second
      when "*"
          @maths_basic_result = @maths_basic_first * @maths_basic_second
      when "/"
          @maths_basic_result = @maths_basic_first / @maths_basic_second
      end
  end

  erb :MathsBasic
end

get '/Maths/Advanced' do
  @maths_adv_first = params[:maths_adv_first].to_f
  @maths_adv_second = params[:maths_adv_second].to_f
  @maths_adv_op = params[:maths_adv_op]

  if @maths_adv_first 
    
      case @maths_adv_op
      when "power"
          @maths_adv_result = @maths_adv_first ** @maths_adv_second
      when "sqrt"
          @maths_adv_result = Math.sqrt(@maths_adv_first)
      end
  end

  erb :MathsAdvanced
end


get '/Trip' do
    @trip_dist=params[:trip_dist].to_f
    @trip_mpg=params[:trip_mpg].to_f
    @trip_mpgcost=params[:trip_mpgcost].to_f
    @trip_speed = params[:trip_speed].to_f

    @trip_mpg = @trip_mpg - [0, @trip_speed - 60].max * 2

    if @trip_dist
      @trip_time = (@trip_dist / @trip_speed).round(2) 
      @trip_cost = (@trip_dist / @trip_mpg * @trip_mpgcost).round(2)
    end

  erb :Trip
end

get '/Mortgage' do
  @mort_prin = params[:mort_prin].to_f
  @mort_rate = params[:mort_rate].to_f
  @mort_years = params[:mort_years].to_f
  if @mort_years
    @mort_rate = @mort_rate /1200
    @mort_nos_payments = @mort_years * 12


    @mort_monthly_payment = (@mort_prin * @mort_rate  * ((1 + @mort_rate)**@mort_nos_payments) / ((1 + @mort_rate)**@mort_nos_payments - 1)  ).round(2)
  end


  erb :Mortgage
end

get '/Pieceofstring' do

  @string_length=params[:string_length].to_f

  if @string_length
    @string_actual = @string_length + rand(100)
  end

erb :pieceofstring


end



