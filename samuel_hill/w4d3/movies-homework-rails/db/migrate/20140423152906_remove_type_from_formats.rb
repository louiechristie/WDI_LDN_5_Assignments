class RemoveTypeFromFormats < ActiveRecord::Migration
  def change
  	remove_column :formats, :type
  end

 
end
