class User < ActiveRecord::Base
  attr_accessible :cover_image_url, :email, :location, :profile_pic_url, :role, :tagline, :username
end
