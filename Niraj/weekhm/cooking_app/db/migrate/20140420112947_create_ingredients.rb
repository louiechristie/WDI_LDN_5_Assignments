class CreateIngredients < ActiveRecord::Migration
  def change   
    drop_table :ingredients

    create_table :ingredients do |t|
      t.string :name

      t.timestamps
    end
  end
end
