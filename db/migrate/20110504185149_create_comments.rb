class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :website
      t.string :commentable_type
      t.string :commentable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
