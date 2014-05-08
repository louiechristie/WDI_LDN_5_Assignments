class CreateClassGames < ActiveRecord::Migration
  def change
    create_table :class_games do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
