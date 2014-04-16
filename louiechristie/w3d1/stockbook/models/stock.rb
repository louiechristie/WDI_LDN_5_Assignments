class Stock < DBBase

  attributes  symbol: :string,
              name: :string,
              buying_price: :decimal,
              holding: :integer,
              portfolio_id: :integer

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol']
    @name = params['name']
    @buying_price = params['buying_price']
    @holding = params['holding']
    @portfolio_id = params['portfolio_id']
    stock_quote
  end

  def portfolio
    Portfolio.find(portfolio_id)
  end

  private
  def stock_quote
    if self.symbol && self.symbol > ""
      yahoo_result = YahooFinance::get_standard_quotes(self.symbol.upcase)[self.symbol.upcase]
      @buying_price ||= yahoo_result.lastTrade
      @name = yahoo_result.name
    end
  end

end