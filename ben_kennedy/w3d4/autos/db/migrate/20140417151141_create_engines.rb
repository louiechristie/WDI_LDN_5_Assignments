class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :power
      t.string :fuel_type

      t.timestamps
    end
  end
end
