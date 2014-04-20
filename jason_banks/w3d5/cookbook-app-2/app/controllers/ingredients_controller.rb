class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    params[:ingredient][:name].downcase!
    ingredient = Ingredient.create(params[:ingredient])
    flash_notice("Ingredient") unless ingredient.valid?

    redirect_to(ingredients_path)
  end

  def show
    find_ingredient
    find_recipes
  end

  def edit
    find_ingredient
  end

  def update
    ingredient = find_ingredient
    params[:ingredient][:name].downcase!
    ingredient.update_attributes(params[:ingredient])
    flash_notice("Ingredient") unless ingredient.valid?

    redirect_to(ingredients_path)
  end

  def destroy
    Ingredient.destroy(params[:id])
    redirect_to(ingredients_path)
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def find_recipes
    @recipes = Recipe.where(id: @ingredient.recipe_ids).order(:title)
  end

  
end
