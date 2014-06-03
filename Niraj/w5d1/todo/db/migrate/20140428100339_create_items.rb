class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :mytodo
      t.integer :position

      t.timestamps
    end
    add_index :items, :mytodo_id
  end
end
