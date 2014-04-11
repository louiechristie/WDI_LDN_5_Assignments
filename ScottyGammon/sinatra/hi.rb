require 'sinatra'
require 'pry'
require 'sinatra/reloader' if development?

get '/calc' do
	@first = params[:first].to_f
	@second = params[:second].to_f
	@operator= params[:operator]
	

	@result = case @operator
	when '+' then @first + @second
	when '-' then @first - @second
	when '*' then @first * @second
	when '/' then @first / @second	
	end

	erb :calc
	
end