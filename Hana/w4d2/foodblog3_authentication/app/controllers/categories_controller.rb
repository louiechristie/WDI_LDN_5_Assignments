class CategoriesController < ApplicationController
load_and_authorize_resource

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

def create
  Category.create(params[:category])
  redirect_to(root_path)
end

def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to root_path
end

end