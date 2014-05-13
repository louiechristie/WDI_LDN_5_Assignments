class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  attr_accessible :email, :name, :role, :password, :password_confirmation
  has_many :recipes
  def role?(role)
    self.role == role.to_s
  end
end
