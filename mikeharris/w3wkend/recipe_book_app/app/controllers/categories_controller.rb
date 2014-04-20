class CategoriesController < ApplicationController 
  
  def index
    @categories = Category.all
    @recipes = Recipe.all
    redirect_to recipes_path
  end

  def show
    @category = Category.find_by_id(params[:id])
  end

  def edit 
    @category = Category.find_by_id(params[:id])
  end

  def update
    Category.find_by_id(params["id"]).update_attributes(params["category"])
    redirect_to categories_path
  end

  def create
    Category.create(params["category"])
    redirect_to categories_path
  end

  def new
    @category = Category.new
  end

  def destroy
    Category.find_by_id(params[:id]).destroy
    redirect_to categories_path
  end
end
