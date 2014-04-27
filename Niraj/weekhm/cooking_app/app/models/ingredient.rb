class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_id, :recipe_ids, :ingredients_recipes

    validates :name, presence: true


    has_and_belongs_to_many :recipes


  def name_for_select

    "#{name}"

  end


end
