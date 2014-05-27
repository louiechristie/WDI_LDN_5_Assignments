class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
