get '/categories' do
  @categories = Category.all
  erb :'categories/index'
end

get '/categories/new' do
  @category = Category.new
  erb :'categories/new'
end

post '/categories' do
  @category = Category.new(params[:category])
  @category.save

  redirect to('/categories')
end

get '/categories/edit/:id' do
  @category = Category.find(params[:id])
  erb :'categories/edit'
end

post '/categories/:id' do
  @category = Category.find(params[:id])
  @category.update_attributes(params[:category])
  redirect to("/categories")
end

get '/categories/delete/:id' do
  Category.find(params[:id]).destroy
  redirect to('/categories')
end