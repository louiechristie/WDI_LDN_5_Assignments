class Checkout

  require 'pry'

  attr_writer :total, :basket


  def initialize(pricing_rules)
    @total = 0
    @basket = {}

    rules = pricing_rules.split(', ')

    rules.each do |rule|
      item = rule.split(": ").first
      offer = rule.split(": ").last
      
      case offer.split(" ").first
        when "BOGOF"

        when "3_OR_MORE"
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
    @basket.each do |key, value|
      case key
      when "FR1"
        @total += value*3.11
      when "SR1"
        @total += value*5.00
      when "CF1"
        @total += value*11.23
      end
    end
    return @total
  end

end