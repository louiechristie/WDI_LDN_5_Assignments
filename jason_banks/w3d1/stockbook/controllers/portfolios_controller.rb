get '/portfolios' do
  @portfolios = Portfolio.all
  erb :'portfolios/index'
end

get '/portfolios/new' do
  @categories = Category.all
  @portfolio = Portfolio.new
  erb :'portfolios/new'

end

post '/portfolios' do
  @portfolio = Portfolio.new(params[:portfolio])
  @portfolio.save

  redirect to("/portfolios")

end

get '/portfolios/:id/edit' do
  @categories = Category.all
  @portfolio = Portfolio.find(params[:id])
  erb :'portfolios/edit'

end

post '/portfolios/:id' do

  @portfolio = Portfolio.find(params[:id])
  @portfolio.update_attributes(params[:portfolio])
  redirect to("/portfolios")
end

get '/portfolios/:id/delete' do
  Portfolio.find(params[:id]).destroy
  redirect to('/portfolios')
end

get '/portfolios/:id/stocks' do
  @portfolio = Portfolio.find(params[:id])
  @stocks = Stock.selection(params[:id])

  erb :'stocks/index'
end

get '/portfolios/:id/stocks/new' do
  @portfolio = Portfolio.find(params[:id])
  erb :'stocks/price'
end

post '/portfolios/:id/stocks/new' do
  @portfolio = Portfolio.find(params[:id])
  @stock = Stock.new
  @stock.symbol = params[:stock_symbol].upcase
  @stock.name = YahooFinance::get_standard_quotes(@stock.symbol)[@stock.symbol].name
  @stock.buying_price = YahooFinance::get_standard_quotes(@stock.symbol)[@stock.symbol].lastTrade
  if @stock.buying_price <= 0
    @invalid = "#{@stock.symbol} is invalid or worthless. Please enter a different symbol."
    erb :'stocks/price'
  else
    erb :'stocks/new'
  end
end

post '/portfolios/:id/stocks' do
  @stock = Stock.new(params[:stock])
  @stock.portfolio_id = params[:id]
  @stock.save

  redirect to("/portfolios/#{@stock.portfolio_id}/stocks")
end

get '/portfolios/:id/stocks/:id/delete' do
  @stock = Stock.find(params[:id])
  portfolio_id = @stock.portfolio_id
  @stock.destroy
  redirect to("/portfolios/#{portfolio_id}/stocks")
end

get '/portfolios/:id/stocks/:id/edit' do
  @stock = Stock.find(params[:id])
  @portfolio = @stock.portfolio
  @current_price = YahooFinance::get_standard_quotes(@stock.symbol)[@stock.symbol].lastTrade
  erb :'stocks/edit'
end

post '/portfolios/:id/stocks/:id' do

  @stock = Stock.find(params[:id])
  @stock.update_attributes(params[:stock])
  @portfolio = @stock.portfolio
  redirect to("/portfolios/#{@portfolio.id}/stocks")
end









