class AddNameToEngine < ActiveRecord::Migration
  def change
    add_column :engines, :name, :string
  end
end
