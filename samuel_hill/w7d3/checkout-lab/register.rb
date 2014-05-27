class Register

	attr_reader :sets_of_coins, :coin_types, :total_change, :coin_change

	def initialize
		@sets_of_coins = {}
		@coin_types = %w(£2 £1 50p 20p 10p 5p 2p 1p)
	end

	def fill(amount_of_pieces)
		@coin_types.each do |type|
			@sets_of_coins[type] = amount_of_pieces
		end
	end

	def calculate_total_change(total, payment)
		@total_change = (payment.to_f - total).round(2)
	end

	def calculate_coin_change
		@coin_change = (@total_change - ((@total_change / 5).floor * 5)).round(2)
	end

end