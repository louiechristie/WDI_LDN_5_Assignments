class IngridientsController < ApplicationController

  def index
    @ingridients = Ingridient.all
  end

  def new
    @ingridient = Ingridient.new
  end

  def create
    @ingridient = Ingridient.create(params[:ingridient])
    redirect_to(ingridients_path)
  end

  def show
    @ingridient = Ingridient.find(params[:id])
  end

  def edit
    @ingridient = Ingridient.find(params[:id])
  end

  def update
    @ingridient = Ingridient.find(params[:id])
    @ingridient.update_attributes(params[:ingridient])
    redirect_to(ingridients_path)
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