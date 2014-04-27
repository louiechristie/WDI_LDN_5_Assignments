class AddReviewAndOwnershipToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :review, :string
    add_column :movies, :ownership, :string
  end
end
