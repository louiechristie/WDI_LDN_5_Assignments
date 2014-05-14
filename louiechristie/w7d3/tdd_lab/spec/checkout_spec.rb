require_relative 'spec_helper'
require_relative '../checkout'


describe Checkout do

  let(:checkout) { Checkout.new }

  describe ".new" do
    it "creates a Checkout object" do
      expect(checkout).to_not be nil
    end
  end

  describe "#create_transaction" do
    it "creates a transaction" do
      checkout.create_transaction(15.36, 20)
      expect(checkout.price).to eq 15.36
      expect(checkout.payment).to eq 20
      expect(checkout.change).to eq 4.64
    end
  end

  describe "#coins" do
    it "shows change given to customer in coins" do
      checkout.create_transaction(15.36, 20)
      expect(checkout.coins).to eq ("2x£2, 1x50p, 1x10p, and 2x2p")
    end
  end


end
