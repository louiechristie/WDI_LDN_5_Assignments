class RemoveImageFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :image
  end
end
