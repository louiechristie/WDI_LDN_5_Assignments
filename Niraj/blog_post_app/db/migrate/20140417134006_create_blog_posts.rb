class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :author
      t.text :conten
      t.references :category

      t.timestamps
    end
    add_index :blog_posts, :category_id
  end
end
