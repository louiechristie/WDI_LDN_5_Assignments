class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :fuel
      t.float :size

      t.timestamps
    end
  end

   
end
