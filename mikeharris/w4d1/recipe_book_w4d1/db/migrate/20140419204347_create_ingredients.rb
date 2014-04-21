class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :unit
      t.integer :calories
      t.string :image

      t.timestamps
    end
  end
end
