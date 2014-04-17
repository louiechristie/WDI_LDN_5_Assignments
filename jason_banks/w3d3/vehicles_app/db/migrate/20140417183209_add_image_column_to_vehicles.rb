class AddImageColumnToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :image, :text
  end
end
