class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.integer :cylinders

      t.timestamps
    end
  end
end
