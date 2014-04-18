class DeliveryAddress < ActiveRecord::Base
  attr_accessible :directions, :text

  has_one :order
end
