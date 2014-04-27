class RecipesController < ApplicationController
  load_and_authorize_resource
  # commented out methods as CanCan automatically loads the standard controllers

    
  def index
    #@recipes = Recipe.all
    @recipes = @q.result(distinct: true)
  end

  def new
    #@recipe = Recipe.new
    Ingridient.all.each do |ingridient|
      @recipe.ingridients_recipes.build(ingridient_id: ingridient.id)
    end
  end

  def create
    #@recipe = Recipe.new(params[:recipe])

    if ir = params[:recipe][:ingridients_recipes_attributes]
      ir.delete_if do |key, value|
        ir[key]['quantity'].blank?
      end
    end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else 
        Ingridient.all.each do |ingridient|
           @recipe.ingridients_recipes.build(ingridient_id: ingridient_id) unless @recipe.ingridients_recipes.map(&:ingridient_id).include?(ingridient.id)
        end
        format.html { render action: "new" }
      end
    end
  end

  def show
    #@recipe = Recipe.find(params[:id])
  end

  def edit
    #@recipe = Recipe.find(params[:id])
    Ingridient.all.each do |ingridient|
      @recipe.ingridients_recipes.build(ingridient_id: ingridient.id) unless @recipe.ingridients.include?(ingridient)
    end
  end

  def update
    #@recipe = Recipe.find(params[:id])

    if ir = params[:recipe][:ingridients_recipes_attributes]
      ir.keys.each do |key|
        ir[key]['_destroy'] = true if ir[key]['quantity'].blank?
      end
    end

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
      format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
      else
        Ingridient.all.each do |ingridient|
          @recipe.ingridients_recipes.build(ingridient_id: ingridient.id) unless @recipe.ingridients.include?(ingridient)
        end
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    #@recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(recipes_path)
  end


end