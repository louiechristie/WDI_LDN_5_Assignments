class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :fuel_type
      t.float :size
      t.string :model

      t.timestamps
    end
  end
end
