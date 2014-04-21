class IngredientsController < ApplicationController
 def index
      @ingredients = Ingredient.all
  end

  def new
    if params[:ingredient] && params[:ingredient][:recipe_id]
      @recipe = Recipe.find(params[:ingredient][:recipe_id])
    else 
    @recipe = Recipe.last
    end
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params[:ingredient])
    @ingredient.save
    redirect_to(recipe_path(@ingredient.recipe_id))
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

def update
  @ingredient = Ingredient.find(params[:id])
  @ingredient.update_attributes(params[:ingredient])
  @ingredient.save
  redirect_to(ingredients_path)

end

def destroy
  @ingredient = Ingredient.find(params[:id])
  @ingredient.destroy
  redirect_to(ingredients_path)    
end


end

