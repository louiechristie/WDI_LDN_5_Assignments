class Checkout

  require 'pry'

  attr_accessor :basket, :offers, :prices
  attr_writer :total    #reader method defined below

  def initialize(pricing_rules)
    @total = 0
    @basket = {}
    @offers = {}
    @prices = { "FR1" => 3.11, "SR1" => 5, "CF1" => 11.23 }

    rules = pricing_rules.split(', ')

    rules.each do |rule|
      item = rule.split(": ").first
      offer = rule.split(": ").last
      @offers[item] = offer    
    end
  end

  def scan(item)
    if @basket[item] != nil
      @basket[item] += 1
    else
      @basket[item] = 1
    end
  end

  def total
    @basket.each do |item, quantity|
      @total += calculate_item_total(item, quantity)
    end
    return @total
  end

  def calculate_item_total(item, quantity)

    case offers[item] 
    when "BOGOF"
      return calculate_BOGOFF_total(item, quantity)
    else
      return quantity*prices[item]
    end

  end

  def calculate_BOGOFF_total(item, quantity)
      (quantity / 2).floor*prices[item] + (quantity % 2)*prices[item]
  end

  def calculate_discount_total(item, quantity)

  end

end