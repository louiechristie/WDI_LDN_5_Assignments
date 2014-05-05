class Item < ActiveRecord::Base
  belongs_to :todo
  attr_accessible :name, :position
end
