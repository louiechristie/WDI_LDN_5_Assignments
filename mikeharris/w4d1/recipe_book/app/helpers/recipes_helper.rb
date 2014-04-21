module RecipesHelper


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
