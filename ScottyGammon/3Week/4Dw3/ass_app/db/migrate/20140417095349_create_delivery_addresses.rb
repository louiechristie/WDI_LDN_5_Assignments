class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
      t.string :directions
      t.string :text

      t.timestamps
    end
  end
end
