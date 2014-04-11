require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'YahooFinance'


get '/stock' do 

  @ticker = params[:ticker]

  if @ticker != ""
    @ticker.upcase
    @price = YahooFinance::get_standard_quotes(@ticker)[@ticker].lastTrade rescue nil
  end



  erb :stock_calc 



end