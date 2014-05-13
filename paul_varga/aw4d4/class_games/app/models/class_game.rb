class ClassGame < ActiveRecord::Base
  attr_accessible :description, :image, :name

  validates :name, presence: true
  validates :description, presence: true
end
