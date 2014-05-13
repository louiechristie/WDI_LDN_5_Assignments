class AddDescriptionAndImageToTenLine < ActiveRecord::Migration
  def change
    add_column :ten_lines, :description, :text
    add_column :ten_lines, :image, :string
  end
end
