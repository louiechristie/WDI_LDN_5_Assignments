class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    params[:ingredient][:name].downcase!
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect_to(ingredients_path, notice: "#{@ingredient.name} has been successfully added.")
    else
      render action: 'new'
    end
  end

  def show
    find_ingredient
    find_recipes
  end

  def edit
    find_ingredient
  end

  def update
    find_ingredient
    params[:ingredient][:name].downcase!
    if @ingredient.update_attributes(params[:ingredient])
      redirect_to(ingredients_path, notice: "#{@ingredient.name} has been successfully updated.")
    else
      render action: 'edit'
    end
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
