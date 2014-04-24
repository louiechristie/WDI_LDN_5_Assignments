class CategoriesController < ApplicationController

	load_and_authorize_resource

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.create(params[:category])
		
		respond_to do |format|
      		if @category.save
		        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
		        format.json { render json: @category, status: :created, location: @category }
     		 else
			    format.html { render action: "new" }
			    format.json { render json: @category.errors, status: :unprocessable_entity }
			 end
    	end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
      	@category.update_attributes(params[:category])
      	
      	respond_to do |format|
      		if @category.update_attributes(params[:category])
		        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
		        format.json { head :no_content }
      		else
		        format.html { render action: "edit" }
		        format.json { render json: @category.errors, status: :unprocessable_entity }
      		end
    	end
    end

    def destroy
    	@category = Category.find(params[:id])
	    @category.destroy
	    redirect_to categories_path
	end

end