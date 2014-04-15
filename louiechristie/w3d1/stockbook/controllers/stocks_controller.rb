get '/stocks' do
  @stocks = Stock.all
  erb :'stocks/index'
end

get '/stocks/new' do
  @portfolios = Portfolio.all
  @stock = Stock.new
  erb :'stocks/new'
end

post '/stocks' do
  @stock = Stock.new(params[:stock])
  @stock.save

  redirect to('/stocks')
end

get '/stocks/edit/:id' do
  @stock = Stock.find(params[:id])
  @portfolios = Portfolio.all
  erb :'stocks/edit'
end

post '/stocks/:id' do
  @stock = Stock.find(params[:id])
  @stock.update_attributes(params[:stock])
  redirect to("/stocks")
end

get '/stocks/delete/:id' do
  Stock.find(params[:id]).destroy
  redirect to('/stocks')
end