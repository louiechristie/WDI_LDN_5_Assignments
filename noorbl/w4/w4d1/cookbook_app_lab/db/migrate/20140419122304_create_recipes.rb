class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :serving_size
      t.integer :category_id

      t.timestamps
    end
  end
end
