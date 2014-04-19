class Customer < ActiveRecord::Base
  attr_accessible :name

  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, through: :orders
end
