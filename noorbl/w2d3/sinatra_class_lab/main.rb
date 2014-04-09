require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'

get '/stock' do

# @stock_name = 'APPL' #params[:stock_name].to_s
# @YahooFinance = params[:stock_value]

@last_trade = YahooFinance::get_standard_quotes('AAPL')['AAPL'].lastTrade.to_s

def get_standard_quotes(symbol)
  YahooFinance::get_standard_quotes(symbol)[symbol] rescue nil
end



  erb :stock
end
