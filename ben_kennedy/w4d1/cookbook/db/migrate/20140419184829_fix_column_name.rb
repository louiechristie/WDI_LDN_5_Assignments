class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :recipes, :category_id_id, :category_id
  end
end
