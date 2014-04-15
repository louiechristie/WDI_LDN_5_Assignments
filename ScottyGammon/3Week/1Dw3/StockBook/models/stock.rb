class Stock < DBBase
attr_accessor :current_price, :value

	attributes 	name: :string,
				symbol: :string,
				buying_price: :decimal,
				holding: :integer,
				portfolio_id: :integer


	def self.table_name
		:stocks
	end

	def initialize(params={})
		@id = params['id']
		@symbol= params['symbol']
		@buying_price = params['buying_price']
		@holding = params['holding']
		@portfolio_id= params['portfolio_id']
		@name= params['name']
	end

	def portfolio
		Portfolio.find(portfolio_id)
	end

	def get_stock_deets
		yahoo_result = YahooFinance::get_standard_quotes(symbol)[symbol]
		if yahoo_result
			@name= yahoo_result.name
			@buying_price ||= yahoo_result.lastTrade.to_f
			@current_price = yahoo_result.lastTrade.to_f
		end
	end
end