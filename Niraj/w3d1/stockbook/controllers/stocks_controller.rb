get '/stocks' do
  @stocks = Stock.all
  erb :'stocks/index'
end

get '/stocks/new' do
  @stock = Stock.new
  @portfolios = Portfolio.all
  erb :'stocks/new'
end

post '/stocks' do
  @stock = Stock.new(params[:stock])
  @update_details_yahoo
  @stock.save

  redirect to('/stocks')
end

get '/stocks/:id/edit' do
  @stock = Stock.find(params[:id])
  @portfolios = Category.all
  erb :'stocks/edit'
end

post '/stocks/:id' do
  @stock = Stock.find(params[:id])
  @stock.update_attributes(params[:stock])
  @stock.update_details_yahoo
  @stock.save
  binding.pry
  redirect to("/stocks")
end

get '/stocks/:id/delete' do
  Stock.find(params[:id]).destroy
  redirect to('/stocks')
end