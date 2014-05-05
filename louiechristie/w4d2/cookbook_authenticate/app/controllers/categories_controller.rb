class CategoriesController < ApplicationController

  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to(categories_path)
  end

  def edit
    @category = Category.find(params[:id])
    
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
    redirect_to @category, notice: 'Category was successfully updated.'
    else
      render action: "edit"
    end
  end
end

