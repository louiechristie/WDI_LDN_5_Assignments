get '/portfolios' do
   @portfolios = Portfolio.all
   erb :'portfolios/index'
end

get '/portfolios/new' do
  @portfolio = Portfolio.new
  @categories = Category.all  
  erb :"portfolios/new"
end

post '/portfolios' do
  @portfolio = Portfolio.new(params[:portfolio])
  @portfolio.save

  redirect to('/portfolios')
end

get '/portfolios/:id/edit' do
  @portfolio = Portfolio.find(params[:id])
  @categories = Category.all
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

  @stocks = @portfolio.stocks
  erb :'stocks/index'
end

get '/portfolio/:id/stocks/new' do
  @portfolio = Portfolio.find(params[:id])
  erb :'stocks/new'
end

post '/portfolios/:id/stock/buy_new' do
  @stock = Stock.new(params[:stock])
  @stock.save
  id = @stock.portfolio_id
  redirect to("/portfolios/#{id}/stocks")  
end

get '/portfolios/:portfolio_id/stocks/:stock_id' do
  
  id = params[:portfolio_id]
  Stock.find(params[:stock_id]).destroy

  redirect to("/portfolios/#{id}/stocks")  
end

post '/portfolios/:portfolio_id/stocks/:stock_id' do

  @direction = params[:direction]
  @amount = params[:amount]
  @portfolio_id = params[:portfolio_id]
  @stock = Stock.find(params[:stock_id])
  
  if @direction == 'buy'
    @stock.holding = @stock.holding.to_i + @amount.to_i
  elsif @stock.holding.to_i >= @amount.to_i  
      @stock.holding = @stock.holding.to_i - @amount.to_i
  end 
  @stock.save
  
  redirect to("/portfolios/#{@portfolio_id}/stocks")

end
