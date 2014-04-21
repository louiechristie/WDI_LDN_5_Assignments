class BlogPost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :content, :author, :title, :category_id
end
