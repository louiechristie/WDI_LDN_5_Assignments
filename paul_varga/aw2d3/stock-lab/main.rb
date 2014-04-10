require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'yahoofinance'


get '/stock' do
  @ticker = params[:ticker].to_s.upcase
  if @ticker && @ticker > ""
      @stock = YahooFinance::get_standard_quotes(@ticker)[@ticker] rescue nil
      @name = @stock.name
      @price = @stock.lastTrade
  end

  erb :stock
end