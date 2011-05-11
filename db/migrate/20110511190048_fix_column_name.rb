class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :posts, :url_name, :permalink
  end

  def self.down
    rename_column :posts, :permalink, :url_name
  end
end
