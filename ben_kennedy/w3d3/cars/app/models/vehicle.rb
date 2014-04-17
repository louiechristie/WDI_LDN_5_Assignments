class Vehicle < ActiveRecord::Base
  attr_accessible :description, :distance, :image, :mileage, :name, :price, :year
end
