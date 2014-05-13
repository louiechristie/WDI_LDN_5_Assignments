class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  attr_accessible :email, :name, :role, :password, :password_confirmation
  has_many :recipes
  def role?(role)
    self.role == role.to_s
  end
end
