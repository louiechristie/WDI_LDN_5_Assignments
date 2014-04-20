class Ingridient < ActiveRecord::Base
  attr_accessible :name, :recipe_id, :recipe_ids

  has_and_belongs_to_many :recipes
end
