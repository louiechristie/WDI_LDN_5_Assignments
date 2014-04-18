class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.boolean :active
      t.datetime :last_purchase
      t.decimal :credit_limit

      t.timestamps
    end
  end
end
