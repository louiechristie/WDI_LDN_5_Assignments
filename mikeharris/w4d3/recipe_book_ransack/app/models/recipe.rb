class Recipe < ActiveRecord::Base
  attr_accessible :description, :feeds, :image, :name, 
  :time, :category_id, :ingredient_ids, :recipe_image
  
  default_scope order(:name)

  mount_uploader :recipe_image, RecipeImageUploader

  belongs_to :category
  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes

  accepts_nested_attributes_for :ingredients_recipes
  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
  validates :ingredient_ids, presence: true

  

end
