get '/stocks' do
  @stocks = Category.all
  erb :'stocks/index'
end

get '/stocks/new' do
  @stock = Category.new
  erb :'stocks/new'
end

post '/stocks' do
 @stock = Category.new(params[:stock])
 @stock.save
 redirect to('/stocks')
end


get '/stocks/:id/edit' do
  @stock = Category.find(params[:id])
  erb :'stocks/edit'
end

post '/stocks/:id' do
  @stock = Category.find(params[:id])
  @stock.update_attributes(params[:stock])
  redirect to("/stocks")
end

get '/stocks/:id/delete' do
  Category.find(params[:id]).destroy
  redirect to('/stocks')
end