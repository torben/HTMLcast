class AddAncestryToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
  end

  def self.down
    drop_index :categories, :ancestry
    remove_column :categories, :ancestry
  end
end
