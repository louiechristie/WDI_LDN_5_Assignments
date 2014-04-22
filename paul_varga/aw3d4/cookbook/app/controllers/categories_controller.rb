class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create 
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to(categories_path)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
      format.html { redirect_to @category, notice: 'Category was successfully updated.' }
      else
      format.html { render action: "edit" }
      end
    end
  end


end

