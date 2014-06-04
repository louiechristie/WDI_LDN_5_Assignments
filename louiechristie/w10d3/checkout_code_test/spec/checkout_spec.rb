require_relative 'spec_helper'
require_relative '../checkout'

describe Checkout do

  let(:checkout) do
    Checkout.new("FR1: BOGOF, SR1: 3_OR_MORE_DISC0.50")
  end

  describe ".new" do
    it "creates a Checkout object" do
    end
  end

  describe "#total" do
    it "returns the total cost" do
      expect(checkout.total).to eq 0
    end
  end

  describe "#scan" do
    
    it "scans a fruit tea" do
      checkout.scan('FR1')
      expect(checkout.total).to eq 3.11
    end
    
    it "scans a strawberries" do
      checkout.scan('SR1')
      expect(checkout.total).to eq 5.00
    end
    
    it "scans a coffee" do
      checkout.scan('CF1')
      expect(checkout.total).to eq 11.23
    end

    it "scans two fruit tea BYGOF with other items" do
      checkout.scan('FR1')
      checkout.scan('SR1')
      checkout.scan('FR1')
      checkout.scan('CF1')
      expect(checkout.total).to eq 19.34
    end

    it "scans two fruit tea BYGOF" do
      checkout.scan('FR1')
      checkout.scan('FR1')
      expect(checkout.total).to eq 3.11
    end

    it "scans three strawberries get discount" do
      checkout.scan('SR1')
      checkout.scan('SR1')
      checkout.scan('FR1')
      checkout.scan('SR1')
      expect(checkout.total).to eq 16.61
    end

  end

end

