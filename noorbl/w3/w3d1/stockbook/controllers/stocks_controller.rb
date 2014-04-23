
get '/portfolios/:id/stocks' do
  @portfolio = Portfolio.find(params[:id])
  erb :'stocks/index'
end


get '/portfolios/:portfolio_id/stocks/new' do
  @portfolio = Portfolio.find(params[:portfolio_id])
  @stock = Stock.new
  @stock.portfolio_id = @portfolio.id
  erb :'stocks/new'
end

post '/portfolios/:portfolio_id/stocks' do
  @portfolio = Portfolio.find(params[:portfolio_id])
  @stock = Stock.new(params[:stock])
  @stock.portfolio_id = @portfolio.id
  @stock.save
  redirect to("/portfolios/#{@portfolio.id}/stocks")
end


get '/portfolios/:portfolio_id/stocks/:id/edit' do
  @stock = Stock.find(params[:id])
  @portfolios = Portfolio.all
  erb :'stocks/edit'
end

post '/portfolios/:portfolio_id/stocks/:id' do
  @stock = Stock.find(params[:id])
  @stock.update_attributes(params[:stock])
  redirect to("/portfolios/#{@portfolio.id}/stocks")
end

get '/portfolios/:portfolio_id/stocks/:id/delete' do
  Stock.find(params[:id]).destroy
  redirect to("/portfolios/#{@portfolio.id}/stocks")
end