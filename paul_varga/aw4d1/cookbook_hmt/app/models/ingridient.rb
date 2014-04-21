class Ingridient < ActiveRecord::Base
  attr_accessible :name, :recipe_id, :recipe_ids

  has_many :ingridients_recipes
  has_many :recipes, through: :ingridients_recipes

  validates :name, presence: true;
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
end
