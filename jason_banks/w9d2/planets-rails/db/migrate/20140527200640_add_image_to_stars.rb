class AddImageToStars < ActiveRecord::Migration
  def change
    add_column :stars, :image, :string
  end
end
