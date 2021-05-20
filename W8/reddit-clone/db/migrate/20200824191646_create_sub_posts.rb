class CreateSubPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_posts do |t|
      t.integer :sub_id
      t.integer :post_id

      t.timestamps
    end
    add_index :sub_posts, :sub_id
    add_index :sub_posts, :post_id
  end
end