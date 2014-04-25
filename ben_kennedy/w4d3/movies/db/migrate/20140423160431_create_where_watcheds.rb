class CreateWhereWatcheds < ActiveRecord::Migration
  def change
    create_table :where_watcheds do |t|
      t.string :location

      t.timestamps
    end
  end
end
