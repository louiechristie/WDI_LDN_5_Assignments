class Ingridient < ActiveRecord::Base
  attr_accessible :name, :recipe_id, :recipe_ids

  has_and_belongs_to_many :recipes

  validates :name, presence: true;
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
end
