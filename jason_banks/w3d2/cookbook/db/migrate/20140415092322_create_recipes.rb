class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.date :published_date
      t.text :instructions

      t.timestamps
    end
  end
end
