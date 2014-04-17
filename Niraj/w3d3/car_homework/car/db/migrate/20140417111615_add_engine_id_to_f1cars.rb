class AddEngineIdToF1cars < ActiveRecord::Migration
  def change
    change_column :f1cars, :engine_id, :integer
  end
end
