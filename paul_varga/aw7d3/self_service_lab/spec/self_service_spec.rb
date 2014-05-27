#coding: utf-8

require_relative 'spec_helper'
require_relative '../self_service'

  describe Checkout do

  let(:checkout) { Checkout.new('TD Checkout') }

  describe ".new" do
    it "creates a Checkout object" do
      expect(checkout).to_not be nil
    end
  end

  describe "#name" do
    it "has a name" do
      expect(checkout.name).to eq 'TD Checkout'
    end
  end

  describe "#transaction" do 
    it "takes amount given and transaction value" do
      checkout.transaction(10, 5.30)
    end

    it "only takes positive numbers as amount given" do 
      expect(checkout.transaction(-10, 5.30)).to eq "Not a valid input"
    end

    it "only takes positive numbers as transaction value" do 
      expect(checkout.transaction(10, -5.30)).to eq "Not a valid input"
    end
 
    it "gives the correct change" do
      expect(checkout.transaction(10, 5.30)).to eq 4.70
    end

    it "knows the different currency denomiations" do 
      expect(checkout.coins).to eq [50, 20, 10, 5, 2, 1, 0.5, 0.2, 0.1, 0.05, 0.02, 0.01]
    end

    it "knows the symbol for 1p" do 
      value = 0.01
      expect(checkout.symbol(value)).to eq "1p"
    end

    it "knows the symbol for 2p" do 
      value = 0.02
      expect(checkout.symbol(value)).to eq "2p"
    end

    it "knows the symbol for 20p" do 
      value = 0.2
      expect(checkout.symbol(value)).to eq "20p"
    end

    it "knows the symbol for £1" do 
      value = 1
      expect(checkout.symbol(value)).to eq "£1"
    end

    it "knows the symbol for £2" do 
      value = 2
      expect(checkout.symbol(value)).to eq "£2"
    end

    it "translates values into coins" do
      value = 4.70
      expect(change(value)).to eq ['£2', '£2', '50p', '20p']
    end

    it "gives back the fewest coins possible" do

    end

  end


end