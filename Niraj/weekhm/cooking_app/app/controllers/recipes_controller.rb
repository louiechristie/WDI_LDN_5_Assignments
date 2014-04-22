class RecipesController < ApplicationController
  load_and_authorize_resource
  def index
        @recipes = Recipe.all
      end

      def new
        @recipe = Recipe.new

    
      end

      def create
        @recipe = Recipe.new(params[:recipe])
           respond_to do |format|
          if @recipe.save
            format.html {redirect_to @recipe}
           else
             format.html { render action: "edit"}
           end
          end

      end

      def edit
        @recipe = Recipe.find(params[:id])
        
        authorize! :edit, @recipe
      end


      def update
        # raise
        @recipe = Recipe.find(params[:id])
          respond_to do |format|
        if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Ingredient was successfully updated.' }
      else
         format.html { render action: "new" }
       end
     end
  end

      def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to recipes_path
      end

      def show
        @recipe = Recipe.find(params[:id])
      end




end
