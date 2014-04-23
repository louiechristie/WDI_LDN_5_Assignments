class CreateNames < ActiveRecord::Migration
  def change
    create_table :names do |t|
      t.string :name
      t.interger :id

      t.timestamps
    end
  end
end
