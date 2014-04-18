class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.text :name
      t.float :power
      t.integer :cylinders
      t.text :fuel_type

      t.timestamps
    end
  end
end
