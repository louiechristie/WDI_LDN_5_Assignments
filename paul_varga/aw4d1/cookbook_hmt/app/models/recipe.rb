class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :feeds_people, :name, :ingridient_id, :ingridient_ids, :ingridients_recipes_attributes

  belongs_to :category

  has_many :ingridients_recipes
  has_many :ingridients, through: :ingridients_recipes

  accepts_nested_attributes_for :ingridients_recipes

  validates :name, presence: true;
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
  validates :description, presence: true;
  validates :description, length: {minimum: 2}
end
