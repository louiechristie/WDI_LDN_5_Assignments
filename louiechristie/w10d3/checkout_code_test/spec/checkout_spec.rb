require_relative 'spec_helper'
require_relative '../checkout'

describe Checkout do

  let(:checkout) {Checkout.new("FR1: BOGOF, SR1: 3@4.50")}

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
  end

end

