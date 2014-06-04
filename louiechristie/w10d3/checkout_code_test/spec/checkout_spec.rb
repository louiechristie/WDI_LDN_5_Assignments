require_relative 'spec_helper'
require_relative '../checkout'

describe Checkout do

  let(:checkout) do
    Checkout.new("FR1: BOGOF, SR1: 3_OR_MORE_DISC0.50")
  end
  
  describe ".new" do
    it "creates a checkout object" do
      expect(checkout).to_not be nil
    end
  end

  describe "#total" do
    it "returns the total cost" do
      expect(checkout.total).to eq 0
    end
  
    it "if one item in basket it gives back that items price" do
      checkout.scan("FR1")
      expect(checkout.total).to eq 3.11
    end
 
    it "if three distinct items in basket it gives back total" do
      checkout.scan("FR1")
      checkout.scan("SR1")
      checkout.scan("CF1")
      expect(checkout.total).to eq 19.34
    end
 
    it "implements bogof for one item * 2 " do
      checkout.scan("FR1")
      checkout.scan("FR1")
      expect(checkout.total).to eq 3.11
    end
 
    it "implements bogof for three items  " do
      checkout.scan("FR1")
      checkout.scan("FR1")
      checkout.scan("FR1")
      expect(checkout.total).to eq 6.22
    end
 
    it "implements bogof for three items 2 lots of each  " do
      checkout.scan("FR1")
      checkout.scan("SR1")
      checkout.scan("CF1")
      checkout.scan("FR1")
      checkout.scan("SR1")
      checkout.scan("CF1")
      expect(checkout.total).to eq 35.57
    end
 
    it "implements multiple Strawberries " do
      checkout.scan("SR1")
      checkout.scan("SR1")
      checkout.scan("SR1")
      expect(checkout.total).to eq 13.50
    end
  end
 
  describe "#scan" do
      it "Basket: FR1, SR1, FR1, CF1" do
        checkout.scan("FR1")
        checkout.scan("SR1")
        checkout.scan("FR1")
        checkout.scan("CF1")
      expect(checkout.total).to eq 19.34
    end
 
    it "Basket: FR1, FR1" do
        checkout.scan("FR1")
        checkout.scan("FR1")
      expect(checkout.total).to eq 3.11
    end
 
    it "Basket: SR1, SR1, FR1, SR1" do
        checkout.scan("SR1")
        checkout.scan("SR1")
        checkout.scan("FR1")
        checkout.scan("SR1")
      expect(checkout.total).to eq 16.61
    end

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