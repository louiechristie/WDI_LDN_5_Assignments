class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password_digest,  :password,:password_confirmation

  validate :email, prescence: true
  validate :email, uniqueness: true

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
