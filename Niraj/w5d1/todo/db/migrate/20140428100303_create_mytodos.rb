class CreateMytodos < ActiveRecord::Migration
  def change
    create_table :mytodos do |t|
      t.string :name

      t.timestamps
    end
  end
end
