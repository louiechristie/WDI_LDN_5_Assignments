class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :manufacturer
      t.integer :cylinders
      t.string :fuel

      t.timestamps
    end
  end
end
