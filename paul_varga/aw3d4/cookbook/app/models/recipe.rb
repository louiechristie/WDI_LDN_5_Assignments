class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :feeds_people, :name

  belongs_to :category
end
