module RecipesHelper

  def list_ingredients
    output = []
   @recipe.ingredient_ids.each do |ingredient_id|
        quantity = IngredientsRecipe.where(recipe_id: @recipe.id, ingredient_id: ingredient_id).first.quantity
        if quantity 
           output << quantity.to_s + " " + Ingredient.find(ingredient_id).name
        else 
           output << "some " + Ingredient.find(ingredient_id).name 
        end   
    end
    output = output.to_sentence
    output[0] = output[0].capitalize
    output
 
  end

  def quantity(ingredient)
    a = IngredientsRecipe.where(recipe_id: @recipe.id, ingredient_id: ingredient.id).first
    a.quantity if a
  end

  def error_msg(field)
    case field 
    when :name
      @recipe.errors[:name].first.capitalize unless @recipe.errors[:name].count == 0
    when :ingredient_ids
      if @recipe.errors[:ingredient_ids].count > 0 then 'You have to pick at least one ingredient for your recipe.' end
    else 
      ""  
    end  
  end


end
