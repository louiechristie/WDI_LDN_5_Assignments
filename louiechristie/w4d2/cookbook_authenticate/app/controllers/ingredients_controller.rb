class IngredientsController < ApplicationController

  load_and_authorize_resource

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
   Ingredient.create(params["ingredient"])
   redirect_to(ingredients_path)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to(ingredients_path)
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    params[:product][:category_ids] ||= []
    ingredient = Ingredient.find(params[:id])
    ingredient.update_attributes(params[:ingredient])
    redirect_to(ingredients_path)
  end

end

