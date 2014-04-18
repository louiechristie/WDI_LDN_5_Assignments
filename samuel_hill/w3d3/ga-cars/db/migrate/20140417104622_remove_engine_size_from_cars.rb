class RemoveEngineSizeFromCars < ActiveRecord::Migration
  def up
    remove_column :cars, :engine_size
  end

  def down
    add_column :cars, :engine_size, :integer
  end
end
