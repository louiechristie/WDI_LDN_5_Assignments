class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :username, :password, :password_confirmation, :role

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :recipes

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
