class Item < ActiveRecord::Base
  belongs_to :mytodo
  attr_accessible :name, :position

  acts_as_list scope: :mytodo
end
