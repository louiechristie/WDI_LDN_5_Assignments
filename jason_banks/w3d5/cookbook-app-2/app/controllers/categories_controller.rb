class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    params[:category][:name].capitalize!
    category = Category.create(params[:category])
    flash_notice("Category") unless category.valid?

    redirect_to(categories_path)
  end

  def show
    find_category
    find_recipes
  end

  def edit
    find_category
  end

  def update
    category = find_category
    params[:category][:name].capitalize!
    category.update_attributes(params[:category])
    flash_notice("Category") unless category.valid?

    redirect_to(categories_path)
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to(categories_path)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def find_recipes
    @recipes = Recipe.where(id: @category.recipe_ids)
  end


end
