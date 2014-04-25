class Recipe < ActiveRecord::Base
  attr_accessible :name, :category_id, :feeds
  belongs_to :category
  has_and_belongs_to_many :ingredients

end
