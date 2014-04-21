get '/portfolios/:id/stocks' do
  @stocks = Portfolio.find(params[:id]).stocks
  @portfolio_id = params[:id]

  erb :'stocks/index'
end

get '/portfolios/:id/stocks/new' do 
  @stock = Stock.new
  @stocks = Portfolio.find(params[:id]).stocks
  @portfolio_id = params[:id]
  @portfolios = Portfolio.all
  erb :'stocks/new'
end

post '/portfolios/:id/stocks' do
  @stock = Stock.new(params[:stock])
  @stock.buying_price
  @stock.save

  redirect to("/portfolios/#{params[:stock][:portfolio_id]}/stocks")
end

get '/portfolios/stocks/edit/:id' do
  @stock = Stock.find(params[:id])
  @portfolios = Portfolio.all

  erb :'stocks/edit'
end

post '/portfolios/stocks/:id' do
  @stock = Stock.find(params[:id])
  @stock.update_attributes(params[:stock])
  redirect to("/portfolios/#{params[:stock][:portfolio_id]}/stocks")
end

get '/portfolios/stocks/delete/:id' do
  @stock = Stock.find(params[:id])
  @stock.destroy
  redirect to("/portfolios/#{@stock.portfolio_id}/stocks")
end