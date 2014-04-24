class IngridientsController < ApplicationController
  load_and_authorize_resource

  def index
    @ingridients = Ingridient.all
  end

  def new
    @ingridient = Ingridient.new
  end

  def create 
    @ingridient = Ingridient.new(params[:ingridient])

    respond_to do |format|
      if @ingridient.save
        format.html { redirect_to @ingridient, notice: 'Ingredient was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  def show
    @ingridient = Ingridient.find(params[:id])
  end

  def edit
    @ingridient = Ingridient.find(params[:id])
  end

  def update
    @ingridient = Ingridient.find(params[:id])

    respond_to do |format|
      if @ingridient.update_attributes(params[:ingridient])
      format.html { redirect_to @ingridient, notice: 'Ingredient was successfully updated.' }
      else
      format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @ingridient = Ingridient.find(params[:id])
    @ingridient.destroy
    redirect_to(ingridients_path)
  end

  def recipe_ingridient
    @ingridient = Ingridient.find(params)[:id]
    @recipe_ingridient = @ingridient.recipe_ids
  end

end