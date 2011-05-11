class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.datetime :published_at
      t.integer :user_id
      t.string :ancestry
      t.integer :ancestry_depth, :default => 0
      t.timestamps
    end

    add_index :pages, :ancestry
  end

  def self.down
    remove_index :pages, :ancestry
    drop_table :pages
  end
end
