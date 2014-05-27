class Cheerup < ActiveRecord::Base
  attr_accessible :image_url, :message, :state, :user_id
end
