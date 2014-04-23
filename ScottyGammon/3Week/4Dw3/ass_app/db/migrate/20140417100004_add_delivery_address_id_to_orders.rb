class AddDeliveryAddressIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :deliver_address_id, :integer
  end
end
