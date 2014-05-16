class CreateCheerups < ActiveRecord::Migration
  def change
    create_table :cheerups do |t|
      t.string :message
      t.string :image_url
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
