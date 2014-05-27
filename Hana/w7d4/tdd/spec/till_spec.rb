require_relative "spec_helper"
require_relative "../till"

describe Till do

  let(:till) {Till.new(2,5,5,5,5,5,5,10,10)}

  describe ".new" do
    it "creates a till" do
      expect(till.balance).to_not be nil
      expect(till.balance).to be 14.8
    end
  end


  describe "#amount_due" do
    it "receives the customer's bill total" do
      till.amount_due(4.15)
      expect(till.due).to be 4.15
    end
  end

  describe "#amount_paid" do
    it "shows the total amount customer paid" do
      till.amount_paid(2,0,1,0,0,0,0,0,0)
      expect(till.two_pounds).to eq 4
      expect(till.twenty_pence).to eq 5
      expect(till.total_paid).to eq 4.5
    end
  end




  describe ".calculate_change" do
    it "calculates change using largest notes and coins first" do
      till.amount_paid(2,0,1,0,0,0,0,0,0)
      till.calculate_change
      expect(till.two_pounds_change).to eq 5
      expect(till.fifty_pence_change).to eq 1
      expect(till.twenty_pence_change).to eq 1
      expect(till.ten_pence_change).to eq 1
    end
end
end

