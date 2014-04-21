class IngredientsController < ApplicationController 

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def edit 
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def update
    Ingredient.find_by_id(params["id"]).update_attributes(params["ingredient"])
    redirect_to ingredients_path
  end

  def create
    Ingredient.create(params["ingredient"])
    redirect_to ingredients_path
  end

  def new
    @ingredient = Ingredient.new
  end

  def destroy
    Ingredient.find_by_id(params[:id]).destroy
    redirect_to ingredients_path
  end

end

