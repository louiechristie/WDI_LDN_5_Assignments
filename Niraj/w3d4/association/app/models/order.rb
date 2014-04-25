class Order < ActiveRecord::Base
  attr_accessible :customer_id, :value
  attr_accessor :card_number, :payment_type

  belongs_to :customer 
  belongs_to :delivery_address

  validates :value, numericality: {only_integer: true}, on: :create
  validates :card_number, presence: true

  validate :active_customer, on: :create

  def paid_with_card?
    payment_type == "card" 
  end

  def active_customer
    errors.add(:customer_id, 'is not active') unless customer.active?
  end

end
