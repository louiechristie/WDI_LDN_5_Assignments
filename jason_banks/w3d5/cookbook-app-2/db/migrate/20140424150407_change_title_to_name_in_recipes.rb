class ChangeTitleToNameInRecipes < ActiveRecord::Migration
  def change
    rename_column :recipes, :title, :name
  end

end
