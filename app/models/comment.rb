class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  has_ancestry

  validates_presence_of :name, :email, :body
end
