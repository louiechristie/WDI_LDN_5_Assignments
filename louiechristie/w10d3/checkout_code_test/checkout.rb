class Checkout

  attr_accessor :total

  def initialize(pricing_rules)
    @total = 0

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
    case item
    when "FR1" 
      @total += 3.11
    when "SR1"
      @total += 5.00
    when "CF1"
      @total += 11.23
    end
  end

end