class RecipesController < ApplicationController

  def index
        @ingredients = Ingredient.all
      end

      def new
        @recipe = Ingredient.new

     
      end

      def create
        @ingredient = Ingredient.new(params[:ingredient])
           respond_to do |format|
          if @ingredient.save
            format.html {redirect_to @ingredient}
           else
             format.html { render action: "edit"}
           end
          end

      end

      def edit
        @ingredient = Ingredient.find(params[:id])
      end


      def update
        # raise
        @ingredient = Ingredient.find(params[:id])
          respond_to do |format|
        if @ingredient.update_attributes(params[:ingredient])
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
      else
         format.html { render action: "new" }
       end
     end
  end

      def destroy
        @ingredient = Ingredient.find(params[:id])
        @ingredient.destroy
        redirect_to recipes_path
      end

      def show
        @ingredient = Ingredient.find(params[:id])
      end




end
