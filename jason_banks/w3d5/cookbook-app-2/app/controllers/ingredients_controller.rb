class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient_lowercase = params[:ingredient][:name].downcase
    ingredient = Ingredient.create(name: ingredient_lowercase)
    flash_notice("Ingredient") unless ingredient.valid?

    redirect_to(ingredients_path)
  end

  def show
    find_ingredient
  end

  def edit
    find_ingredient
  end

  def update
    ingredient = find_ingredient
    ingredient_lowercase = params[:ingredient][:name].downcase
    ingredient.update_attributes(name: ingredient_lowercase)
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

  
end
