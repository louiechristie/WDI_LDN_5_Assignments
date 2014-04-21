class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    find_categories
  end

  def new
    @recipe = Recipe.new
    find_categories
    find_ingredients
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to(recipes_path, notice: "#{@recipe.title} has been successfully added.")
    else
      find_categories
      find_ingredients
      render action: 'new'
    end
  end

  def show
    find_recipe
    list_ingredients
  end

  def edit
    find_recipe
    find_categories
    find_ingredients
  end

  def update
    recipe = find_recipe
    params[:recipe][:ingredient_ids] ||= []
    params[:recipe][:title].capitalize!
    if @recipe.update_attributes(params[:category])
      redirect_to(recipes_path, notice: "#{@recipe.title} has been successfully updated.")
    else
      render action: 'edit'
    end
  end

  def destroy
    Recipe.destroy(params[:id])
    redirect_to(recipes_path)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_ingredients
    @ingredients = Ingredient.all
  end

  def list_ingredients
    @ingredients = Ingredient.where(id: @recipe.ingredient_ids).order(:name)
  end

  def find_categories
    @categories = Category.find(:all, :select => "id, name")
  end

end
