class Order < ActiveRecord::Base
  attr_accessible :customer_id, :value

  belongs_to :customer 
  belongs_to :delivery_address
end
