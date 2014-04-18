class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.integer :power
      t.string :cylinders
      t.string :fuel_type

      t.timestamps
    end
  end
end
