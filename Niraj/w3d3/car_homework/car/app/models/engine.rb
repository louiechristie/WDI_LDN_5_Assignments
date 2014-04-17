class Engine < ActiveRecord::Base
  attr_accessible :name

  has_many :f1cars

  def name_for_select

    "#{name} petrol engine"

  end



end
