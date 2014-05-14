class Checkout

  attr_reader :price, :payment, :change, :coins

  def create_transaction(price, payment)
    @price = price.round(2)
    @payment = payment.round(2)
    @change = (payment - price).round(2)
  end




  def currency
    {'£2' => 2.00, '£1' => 1.00, '50p' => 0.5, '20p' => 0.2, '10p' => 0.1, '5p' => 0.05, '2p' => 0.02, '1p' => 0.01}
  end











  def coins
    
  end


end