require 'sinatra'
require 'pry'
require 'yahoofinance'
require 'sinatra/reloader' if development?

get '/stock' do
@stock_symbol = params[:stock_symbol]
@stock_price = YahooFinance::get_standard_quotes(@stock_symbol)[@stock_symbol].lastTrade
@name = YahooFinance::get_standard_quotes(@stock_symbol)[@stock_symbol].name
#@stock_price = @stock_price.lastTrade

erb :stock

end