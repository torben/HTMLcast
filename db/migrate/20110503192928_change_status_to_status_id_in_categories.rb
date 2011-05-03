class ChangeStatusToStatusIdInCategories < ActiveRecord::Migration
  def self.up
    rename_column :categories, :status, :status_id
  end

  def self.down
    rename_column :categories, :status_id, :status
  end
end
