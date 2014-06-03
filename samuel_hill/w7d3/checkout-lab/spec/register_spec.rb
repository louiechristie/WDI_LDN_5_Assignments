require_relative 'spec_helper'
require_relative '../register'
# £2, £1, 50p, 20p, 10p, 5p, 2p and 1p
describe Register do

	let(:register) { Register.new }

	describe '.new' do
		it "creates a new register object" do
			expect(register).to_not be nil
		end

		it 'has no coins' do
				expect(register.sets_of_coins.count).to eq 0
		end

		it 'has coins' do 
			expect(register.coin_types.count).to eq 8
		end

	end

	describe '#fill' do
		it "fills register with a set amount of pieces for each coin" do
			register.fill(100)
			expect(register.sets_of_coins['£2']).to eq 100
			expect(register.sets_of_coins['£1']).to eq 100
			expect(register.sets_of_coins['50p']).to eq 100
			expect(register.sets_of_coins['20p']).to eq 100
			expect(register.sets_of_coins['10p']).to eq 100
			expect(register.sets_of_coins['5p']).to eq 100
			expect(register.sets_of_coins['2p']).to eq 100
			expect(register.sets_of_coins['1p']).to eq 100
		end
	end

	describe '#calculate_total_change' do
		it "calculates the customers total change" do
			expect(register.calculate_total_change(15.36, 20)).to eq 4.64
		end
	end

	describe '#calculate_coin_change' do
		it "calculates the customers coin change" do
			expect(register.calculate_total_change(7.36, 20)).to eq 12.64
			expect(register.calculate_coin_change).to eq 2.64
		end
	end



end
