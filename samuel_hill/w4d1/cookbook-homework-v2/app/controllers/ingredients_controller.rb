class IngredientsController < ApplicationController

	load_and_authorize_resource

	def index
			@ingredients = Ingredient.all
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.create(params[:ingredient])
		
		respond_to do |format|
      		if @ingredient.save
		        format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully created.' }
		        format.json { render json: @ingredient, status: :created, location: @ingredient }
     		 else
			    format.html { render action: "new" }
			    format.json { render json: @ingredient.errors, status: :unprocessable_entity }
			 end
    	end
	end

	def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def update
		@ingredient = Ingredient.find(params[:id])
      	@ingredient.update_attributes(params[:ingredient])
      	
      	respond_to do |format|
      		if @ingredient.update_attributes(params[:ingredient])
		        format.html { redirect_to ingredients_path, notice: 'Ingredient was successfully updated.' }
		        format.json { head :no_content }
      		else
		        format.html { render action: "edit" }
		        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      		end
    	end
    end

    def destroy
    	@ingredient = Ingredient.find(params[:id])
	    @ingredient.destroy
	    redirect_to ingredients_path
	end

end