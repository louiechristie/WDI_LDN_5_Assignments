class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.string :unit
      t.references :recipe_id

      t.timestamps
    end
    add_index :ingredients, :recipe_id_id
  end
end
