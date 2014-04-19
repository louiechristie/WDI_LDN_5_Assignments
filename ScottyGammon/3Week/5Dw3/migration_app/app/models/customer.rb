class Customer < ActiveRecord::Base
  attr_accessible :active, :credit_limit, :last_purchase, :name
end
