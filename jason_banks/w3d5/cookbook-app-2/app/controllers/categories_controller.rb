class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(params[:category])
    flash_notice("Category") unless category.valid?

    redirect_to(categories_path)
  end

  def show
    find_category
    raise
  end

  def edit
    find_category
  end

  def update
    category = find_category
    category.update_attributes(params[:category])
    flash_notice("Category") unless category.valid?

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
