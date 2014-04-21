class BlogPost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :author, :conten, :title, :category_id
end
