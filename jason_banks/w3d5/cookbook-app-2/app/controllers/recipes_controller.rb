class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    find_categories
  end

  def create
    recipe = Recipe.create(params[:recipe])
    flash_notice unless recipe.valid?

    redirect_to(recipes_path)
  end

  def show
    find_recipe
  end

  def edit
    find_recipe
    find_categories
  end

  def update
    find_recipe.update_attributes(params[:recipe])
    flash_notice unless recipe.valid?

    redirect_to(recipes_path)
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to(recipes_path)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_categories
    @categories = Category.find(:all, :select => "id, name")
  end

  def flash_notice
    flash[:notice] = "Recipe not saved due to incomplete information."
  end

end
