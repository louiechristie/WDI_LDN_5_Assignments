class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :feeds_people, :name, :ingridient_id, :ingridient_ids

  belongs_to :category
  has_and_belongs_to_many :ingridients
end
