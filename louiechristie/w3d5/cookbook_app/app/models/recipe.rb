class Recipe < ActiveRecord::Base
  attr_accessible :name, :category_id, :feeds
  belongs_to :category
end
