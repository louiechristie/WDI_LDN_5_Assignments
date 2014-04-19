class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(params[:category])

    redirect_to(categories_path)
  end

  def show
    find_category
  end

  def edit
    find_category
  end

  def update
    find_category.update_attributes(params[:category])
    redirect_to(categories_path)
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to(categories_path)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
