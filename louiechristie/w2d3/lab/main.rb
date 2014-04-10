require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'

get '/stock' do

@stock_name = params[:stock_name].to_s.upcase
@last_trade = YahooFinance::get_standard_quotes('AAPL')['AAPL'].lastTrade.to_s rescue nil

@last_trade = YahooFinance::get_standard_quotes(@stock_name)[@stock_name].lastTrade.to_s rescue nil

  erb :stock
end
