class ChangeStatusToStatusIdInPosts < ActiveRecord::Migration
  def self.up
    rename_column :posts, :status, :status_id
  end

  def self.down
    rename_column :posts, :status_id, :status
  end
end
