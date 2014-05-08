class CreateTenLines < ActiveRecord::Migration
  def change
    create_table :ten_lines do |t|
      t.string :name

      t.timestamps
    end
  end
end
