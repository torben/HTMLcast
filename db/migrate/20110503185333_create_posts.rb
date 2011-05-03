class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :content
      t.string :url_name
      t.integer :status
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
