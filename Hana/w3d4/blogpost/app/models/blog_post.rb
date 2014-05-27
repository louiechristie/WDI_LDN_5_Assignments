class BlogPost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :author, :content, :title, :category_id
end
