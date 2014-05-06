class RecipesController < ApplicationController

	load_and_authorize_resource

	def index
		@q = Recipe.search(params[:q])
    	@recipes = @q.result(distinct: true)
	end

	def new
	end

	def create

		respond_to do |format|
      		if @recipe.save
		        format.html { redirect_to recipes_path, notice: 'Recipe was successfully created.' }
		        format.json { render json: @recipe, status: :created, location: @recipe }
     		 else
			    format.html { render action: "new" }
			    format.json { render json: @recipe.errors, status: :unprocessable_entity }
			 end
    	end
	end

	def edit
	end

	def show
	end

	def update
      	@recipe.update_attributes(params[:recipe])
      	
      	respond_to do |format|
      		if @recipe.update_attributes(params[:recipe])
		        format.html { redirect_to recipes_path, notice: 'Recipe was successfully updated.' }
		        format.json { head :no_content }
      		else
		        format.html { render action: "edit" }
		        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      		end
    	end
    end

    def destroy
	    @recipe.destroy
	    redirect_to recipes_path
	end

end
