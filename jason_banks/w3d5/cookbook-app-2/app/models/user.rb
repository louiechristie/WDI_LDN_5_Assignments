class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :role

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :recipes

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
