class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password_digest,  :password,:password_confirmation, :movie_ids
  has_and_belongs_to_many :movies

  
end
