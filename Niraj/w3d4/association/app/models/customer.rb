class Customer < ActiveRecord::Base
  attr_accessible :name

  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, through: :orders

  validates :name, presence: true
  validates :name, length: {in: 2..20}
  validates :name, uniqueness: true


end
