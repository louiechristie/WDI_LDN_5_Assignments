class ChangeWhereViewedToHowViewed < ActiveRecord::Migration
  def change
    rename_column :movies, :where_viewed, :how_viewed
  end
end
