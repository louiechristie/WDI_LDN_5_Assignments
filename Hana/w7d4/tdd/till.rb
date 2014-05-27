class Till
  attr_accessor :balance, :due, :two_pounds, :one_pound, :fifty_pence, :twenty_five_pence, :twenty_pence, :ten_pence, :five_pence, :two_pence, :one_pence, :total_paid,:two_pounds_change, :one_pound_change, :fifty_pence_change, :twenty_five_pence_change, :twenty_pence_change, :ten_pence_change, :five_pence_change, :two_pence_change, :one_pence_change

  def initialize(two_pounds, one_pound, fifty_pence, twenty_five_pence, twenty_pence, ten_pence, five_pence, two_pence, one_pence)

    @two_pounds = two_pounds
    @one_pound = one_pound
    @fifty_pence = fifty_pence
    @twenty_five_pence = twenty_five_pence
    @twenty_pence = twenty_pence
    @ten_pence = ten_pence
    @five_pence = five_pence
    @two_pence = two_pence
    @one_pence = one_pence

    @balance = 
     ((@two_pounds * 2)+(@one_pound * 1)+(@fifty_pence * 0.5)+(@twenty_five_pence * 0.25)+(@twenty_pence * 0.2)+(@ten_pence * 0.1)+(@five_pence * 0.05)+(@two_pence * 0.02)+(@one_pence * 0.01)).round(2)
  end

  def amount_due(amount)
    @due = amount
  end

  def amount_paid(two_pounds, one_pound, fifty_pence, twenty_five_pence, twenty_pence, ten_pence, five_pence, two_pence, one_pence)
    @total_paid = (two_pounds * 2)+(one_pound * 1)+(fifty_pence * 0.5)+(twenty_five_pence * 0.25)+(twenty_pence * 0.2)+(ten_pence * 0.1)+(five_pence * 0.05)+(two_pence * 0.02)+(one_pence * 0.01)

    @two_pounds += two_pounds
    @one_pound += one_pound
    @fifty_pence += fifty_pence
    @twenty_five_pence += twenty_five_pence
    @twenty_pence += twenty_pence
    @ten_pence += ten_pence
    @five_pence += five_pence
    @two_pence += two_pence
    @one_pence += one_pence
  end

  def calculate_change
    @two_pounds_change = 0
    @one_pound_change = 0
    @fifty_pence_change = 0
    @twenty_five_pence_change = 0
    @twenty_pence_change = 0
    @ten_pence_change = 0
    @five_pence_change = 0
    @two_pence_change = 0
    @one_pence_change = 0


    change_due = @due - @total_paid
    until change_due == 0
      if change_due >= 2
        @two_pounds_change += 1
        change_due -= 2
      elsif change_due >= 1
        @one_pound_change += 1
        change_due -= 1
      elsif change_due >= 0.5
        @fifty_pence_change += 1
        change_due -= 0.5
      elsif change_due >= 0.25
        @twenty_five_pence_change += 1
        change_due -= 0.25
      elsif change_due >= 0.2
        @twenty_pence_change += 1
        change_due -= 0.20
      elsif change_due >= 0.1
        @ten_pence_change += 1
        change_due -= 0.1
      elsif change_due >= 0.05
        @five_pence_change += 1
        change_due -= 0.05
      elsif change_due >= 0.02
        @two_pence_change += 1 
        change_due -= 0.02
      elsif change_due >= 0.01
        @one_pence_change += 1
        change_due -= 0.01
      end
    end
  end
        
end




# def type_of_money(two_pounds, one_pound, fifty_pence, twenty_five_pence, twenty_pence, ten_pence, five_pence, two_pence, one_pence)

  #   @two_pounds = two_pounds
  #   @one_pound = one_pound
  #   @fifty_pence = fifty_pence
  #   @twenty_five_pence = twenty_five_pence
  #   @twenty_pence = twenty_pence
  #   @ten_pence = ten_pence
  #   @five_pence = five_pence
  #   @two_pence = two_pence
  #   @one_pence = one_pence
  # end


    # def amount_paid
  #   @total_paid = 
  #    (@two_pounds * 2)+(@one_pound * 1)+(@fifty_pence * 0.5)+(@twenty_five_pence * 0.25)+(@twenty_pence * 0.2)+(@ten_pence * 0.1)+(@five_pence * 0.05)+(@two_pence * 0.02)+(@one_pence * 0.01)
  # end


    # def add_money(amount_to_be_added)
  #   @balance += amount_to_be_added
  # end