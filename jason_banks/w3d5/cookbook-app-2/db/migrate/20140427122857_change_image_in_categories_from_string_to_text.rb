class ChangeImageInCategoriesFromStringToText < ActiveRecord::Migration
  def change
    change_column :categories, :image, :text
  end
end
