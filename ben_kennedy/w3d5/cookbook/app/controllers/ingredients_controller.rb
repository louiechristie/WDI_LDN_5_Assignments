class IngredientsController < ApplicationController
 def index
      @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params[:ingredient])
    @ingredient.save

    redirect_to(ingredients_path)
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

# def engine
#   @ingredient_id = Ingredient.find(params[:id])
#   @engine = Engine.find(@ingredient_id.engine_id)
#   @ingredients = Ingredient.all
#   render 'index'
# end

end

