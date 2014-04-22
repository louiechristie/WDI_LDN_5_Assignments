class User < ActiveRecord::Base
  has_secure_password 

  attr_accessible :email, :password, :password_confirmation 

  validates :email, presence: true
  validates :email, uniqueness: true

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end 

end
