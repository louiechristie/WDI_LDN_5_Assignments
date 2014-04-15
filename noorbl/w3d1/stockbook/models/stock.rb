class Stock < DBBase

  attributes name: :string,
          symbol: :string, 
          buying_price: :decimal,
          holding: :integer,
          portfolio_id: :integer

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @symbol = params['symbol']
    @holding = params['holding']
    @portfolio_id = params['portfolio_id']
  end

  def portfolio
    Portfolio.find(portfolio_id)
  end

end