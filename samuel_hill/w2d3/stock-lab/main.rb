require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'YahooFinance'

get '/stock' do 

	  @stock_symbol = params[:stock_symbol]
  if @stock_symbol && @stock_symbol > ""
      @stock = YahooFinance::get_standard_quotes(@stock_symbol)[@stock_symbol] rescue nil
      @name = @stock.name
      @price = @stock.lastTrade
  end

	erb :stock

end

