def editclass RecipesController < ApplicationController 

  def index
    @categories = Category.all
    # @recipes = Recipe.all

    @q = Recipe.search(params[:q])
    @recipes = @q.result(distinct: true)
    
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def edit 
    authorize! :edit, @recipe
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    to_add = params["recipe"]
    to_add["ingredient_ids"] = params["ingredient_ids"]
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.update_attributes(to_add)

    quantity_to_add = params["quantity"]
    

    @recipe.ingredient_ids.each do |id|
      i = IngredientsRecipe.where(recipe_id: @recipe.id, ingredient_id: id).first
      i.quantity = quantity_to_add[id.to_s]
      i.save
    end
    
    @ingredients = Ingredient.all
        
      if  @recipe.errors.count == 0
        
        redirect_to recipe_path(@recipe)  

      else

        render action: "edit" 
              
      end
   
  end

  def create
    @recipe = Recipe.create(params["recipe"])
    @recipe.ingredient_ids = params["ingredient_ids"]
    @ingredients = Ingredient.all
      if @recipe.save
        redirect_to recipe_path(@recipe) 
      else
        render action: "new" 

      end
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def destroy
    authorize! :destroy, @recipe
    Recipe.find_by_id(params[:id]).destroy
    redirect_to recipes_path
  end

end

