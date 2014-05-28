class AddImageToPlanets < ActiveRecord::Migration
  def change
    add_column :planets, :image, :string
  end
end
