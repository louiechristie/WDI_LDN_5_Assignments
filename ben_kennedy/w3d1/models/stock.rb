class Stock < DBBase
  attributes name: :string, symbol: :text, portfolio_id: :integer, holding: :integer, buying_price: :integer

  def self.table_name
    :stocks
  end

  def initialize(params = { }) 
    @id = params['id']
    @symbol = params['symbol']
    @name = YahooFinance::get_standard_quotes(@symbol)[@symbol].name if @symbol
    @portfolio_id = params['portfolio_id']
    @holding = params['holding']
  end

  def portfolio
    Portfolio.find(symbol)
  end

  def buying_price
    @buying_price = YahooFinance::get_standard_quotes(@symbol)[@symbol].lastTrade
  end


end