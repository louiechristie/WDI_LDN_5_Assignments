class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :role

  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :movies

  def role?(role)
    self.role.to_s == role.to_s
  end

end
