class CategoriesController < ApplicationController
def index
  @categories = Category.all
  @ingredients = Ingredient.all
end

def show
  @category = Category.find(params[:id])


end

def new
  @category = Category.new
end

def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to categories_path
end

end