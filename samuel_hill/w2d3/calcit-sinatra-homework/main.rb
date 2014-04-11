require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do

	erb :index
	
end

get '/simple' do

	@first = params[:first].to_f
	@operator = params[:operator]
	@second = params[:second].to_f

	@result = case @operator
		when "+" then @first + @second
		when "-" then @first - @second
		when "/" then @first / @second
		when "*" then @first * @second
	end

	erb :simple
end

get '/advanced' do

	@first = params[:first].to_f
	@second = params[:second].to_f
	@third = params[:third].to_f

	@result_power = @first ** @second

	@result_square = Math.sqrt(@third)

	erb :advanced
end

get '/trip' do

	@distance = params[:distance].to_f
	@mpg = params[:mpg].to_f
	@fuel_cost = params[:fuel_cost].to_f
	@speed = params[:speed].to_f

	@time = @distance / @speed
	@cost = (@distance / @mpg) * @fuel_cost

	erb :trip

end

get '/bmi' do

	@height = params[:height].to_f
	@weight = params[:weight].to_f

	@bmi = @weight / (@height * @height)

	erb :bmi

end

get '/mortgage' do

	@loan_amount = params[:loan_amount].to_f
	@loan_time = params[:loan_time].to_f
	@annual_interest_rate = params[:annual_interest_rate].to_f

	@monthly_interest_rate = @annual_interest_rate / 12
	@number_of_payments = @loan_time * 12
	@loan_term = (1 + @monthly_interest_rate) ** @number_of_payments

	@monthly_payments = @loan_amount * (@monthly_interest_rate * @loan_term) / (@loan_term - 1)

	erb :mortgage

end

get '/burj' do

	@operator = params[:operator]

	@height = 830

	@result = case @operator
		when "bus" then @height / 10
		when "car" then @height / 4.12
		when "giraffe" then @height / 6
		when "person" then @height / 1.75

	end

	erb :burj

end
