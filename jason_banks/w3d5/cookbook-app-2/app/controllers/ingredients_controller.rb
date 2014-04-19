class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(params[:ingredient])
    flash_notice unless ingredient.valid?

    redirect_to(ingredients_path)
  end

  def show
    find_ingredient
  end

  def edit
    find_ingredient
  end

  def update
    find_ingredient.update_attributes(params[:ingredient])
    flash_notice unless ingredient.valid?

    redirect_to(ingredients_path)
  end

  def destroy
    Ingredient.destroy(params[:id])
    redirect_to(ingredients_path)
  end

  def find_ingredient
    @ingredient = ingredient.find(params[:id])
  end

  
end
