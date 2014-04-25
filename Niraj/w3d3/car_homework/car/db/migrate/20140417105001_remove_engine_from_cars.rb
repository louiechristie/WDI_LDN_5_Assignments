class RemoveEngineFromCars < ActiveRecord::Migration
  def up
    remove_column :f1cars, :engine
  end

  def down
    add_column :f1cars, :engine, :string
  end
end
