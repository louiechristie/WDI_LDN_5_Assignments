class CreateF1cars < ActiveRecord::Migration
  def change
    create_table :f1cars do |t|
      t.string :name
      t.string :driver
      t.string :engine
      t.integer :year
      t.text :image

      t.timestamps
    end
  end
end
