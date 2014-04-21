class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :f1cars

  def team_for_select

    "#{name} F1"

  end


end
