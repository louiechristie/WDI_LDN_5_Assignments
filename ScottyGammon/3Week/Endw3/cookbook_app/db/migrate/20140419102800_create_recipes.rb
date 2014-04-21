class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :size
      t.integer :category_id

      t.timestamps
    end
  end
end
