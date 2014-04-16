class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :type_of_vehicle
      t.string :make
      t.string :model
      t.string :country

      t.timestamps
    end
  end
end
