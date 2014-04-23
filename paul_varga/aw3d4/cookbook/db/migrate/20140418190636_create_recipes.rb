class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :feeds_people
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
