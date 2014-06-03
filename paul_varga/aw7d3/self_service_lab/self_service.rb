#coding: utf-8

class Checkout
  attr_reader :name, :coins

  def initialize(name)
    @name = name
    @coins = [50, 20, 10, 5, 2, 1, 0.5, 0.2, 0.1, 0.05, 0.02, 0.01]
  end

  def transaction(amount, value)
    if amount.to_f < 0 || value.to_f < 0
      "Not a valid input"
    else 
      amount - value
    end
  end

  def symbol(value)
    pounds = [50, 20, 10, 5, 2, 1] 
    pence = [0.5, 0.2, 0.1, 0.05, 0.02, 0.01]

    if pounds.include?(value)
      "£#{value}"
    elsif pence.include?(value)
      "#{(value * 100).to_i}p"
    end
  end

  def change(value)

  end

end