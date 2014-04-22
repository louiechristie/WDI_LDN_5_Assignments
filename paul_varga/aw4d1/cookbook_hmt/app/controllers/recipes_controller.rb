class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    # Ingridient.all.each do |ingridient|
    #   @recipe.ingridients_recipes.build(ingridient_id: ingridient_id)
    # end
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    # if ir = params[:recipe][:ingridients_recipes_attributes]
    #   ir.delete_if do |key, value|
    #     ir[key]['quantity'].blank?
    #   end
    # end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else 
      #   Ingridient.all.each do |ingridient|
      #      @recipe.ingridients_recipes.build(ingridient_id: ingridient_id) unless @recipe.ingridients_recipes.map(&:ingridient_id).include?(ingridient.id)
      #   end
        format.html { render action: "new" }
      end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    #params[:recipe][:ingridient_ids] ||= [] 
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
      format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
      else
      format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(recipes_path)
  end


end