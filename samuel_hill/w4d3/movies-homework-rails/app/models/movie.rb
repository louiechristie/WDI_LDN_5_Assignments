class Movie < ActiveRecord::Base
  attr_accessible :title, :review, :format_id

  belongs_to :format

end
