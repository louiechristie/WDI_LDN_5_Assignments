class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :profile_pic_url
      t.string :location
      t.string :username
      t.string :role
      t.text :tagline
      t.string :cover_image_url

      t.timestamps
    end
  end
end
