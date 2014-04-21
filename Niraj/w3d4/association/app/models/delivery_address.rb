class DeliveryAddress < ActiveRecord::Base
  attr_accessible :directions

  has_one :order
end
