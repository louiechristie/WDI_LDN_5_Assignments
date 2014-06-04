class Checkout

  require 'pry'

  attr_accessor :basket, :offers, :prices
  attr_writer :total    #reader method defined below

  def initialize(pricing_rules)
    @total = 0
    @basket = {}
    @offers = {}
    @prices = { FR1: 3.11, SR1: 5, CF1: 11.23 }

    rules = pricing_rules.split(', ')

    rules.each do |rule|
      item = rule.split(": ").first
      offer = rule.split(": ").last
      
      case offer.split(" ").first
        when "BOGOF"
          @offers[item] = "BOGOFF"
        when "3_OR_MORE_DISC0.50"
          @offers[item] = "3_OR_MORE_DISC0.50"
      end
        
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

    case item
      when "FR1"
        calculate_BOGOFF_total(item, quantity)
      when "SR1"
        return quantity*5.00
      when "CF1"
        return quantity*11.23
      end

  end

  def calculate_BOGOFF_total(item, quantity)
    if @offers[item] == "BOGOFF"
          return ((quantity / 2).floor*3.11 + (quantity % 2)*3.11)
        else
          return quantity*3.11
        end
  end

end