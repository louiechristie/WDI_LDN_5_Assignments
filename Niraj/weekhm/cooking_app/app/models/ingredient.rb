class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_id, :recipe_ids

  def name_for_select

    "#{name}"

  end


end
