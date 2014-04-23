class F1car < ActiveRecord::Base
  attr_accessible :driver, :engine, :image, :name, :year, :engine_id, :name_id


  belongs_to :engine
end
