class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :time
      t.integer :feeds
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
