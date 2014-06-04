class Checkout

  require 'pry'

  attr_accessor :basket, :offers, :prices
  attr_writer :total    #reader method defined below

  def initialize(pricing_rules)
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
    @basket[item] == nil ? @basket[item] = 1 : @basket[item] += 1
  end

  def total
    total = 0

    @basket.each do |item, quantity|
      total += calculate_item_total(item, quantity)
    end
    
    return total
  end

  def calculate_item_total(item, quantity)
    case offers[item] 
    when "BOGOF"
      return calculate_BOGOFF_total(item, quantity)
    when "3_OR_MORE_DISC0.50"
      return calculate_3_or_more_disc_50_total(item, quantity)
    else
      return quantity*@prices[item]
    end
  end

  def calculate_BOGOFF_total(item, quantity)
    (quantity / 2).floor*@prices[item] + (quantity % 2)*@prices[item]
  end

  def calculate_3_or_more_disc_50_total(item, quantity)
    quantity >= 3 ? quantity*(@prices[item]-0.50) : quantity*@prices[item]
  end

end