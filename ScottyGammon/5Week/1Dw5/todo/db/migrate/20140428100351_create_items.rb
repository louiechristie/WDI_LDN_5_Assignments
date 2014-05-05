class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :todo
      t.string :name
      t.integer :position

      t.timestamps
    end
    add_index :items, :todo_id
  end
end
