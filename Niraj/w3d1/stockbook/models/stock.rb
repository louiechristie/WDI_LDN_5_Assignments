# class Stock < DBBase


# attributes symbol: :string,
#      name: :string,
#      buying_price: :decimal,
#      holding: :integer,
#      portfolio_id: :integer

#     def self.table_name
#       :stocks
#     end

#     def initialize(params={})
#       @id = params['id']
#       @symbol = params['symbol']
#       @buying_price = params['buying_price']
#       @holding = params['holding']
#       @portfolio_id = params['portfolio_id']
      
#     end

#     def update_details_yahoo
#       stock_quote
#     end

#       def portfolio
#     Portfolio.find(portfolio_id)
#   end

# private
#   def stock_quote

#     if self.symbol && self.symbol > ""
#         yahoo_result = YahooFinance::get_standard_quotes(self.symbol)[self.symbol]
#       @buying_price ||= yahoo_result.lastTrade
#       @name = yahoo_result.name
#     end
#   end
# end

class Stock < DBBase

  attributes symbol: :string, name: :string, buying_price: :decimal, holding: :integer, portfolio_id: :integer
  attr_reader :value

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol'].to_s.upcase
    @name = params['name']
    @buying_price = params['buying_price']
    @holding = params['holding']
    @portfolio_id = params['portfolio_id']
    
  end

  def portfolio
    Portfolio.find(portfolio_id)
  end

    def update_details_yahoo
     stock_quote
     end

  private
  def stock_quote
    if self.symbol && self.symbol > ""
      yahoo_result = YahooFinance::get_standard_quotes(self.symbol)[self.symbol]
      @buying_price ||= yahoo_result.lastTrade
      @name = yahoo_result.name
    end
  end

  def quote_value
    if self.symbol && self.symbol > ""
    yahoo_result = YahooFinance::get_standard_quotes(self.symbol)[self.symbol]
    price = yahoo_result.lastTrade
    @value = price * @holding
    end
  end


end
