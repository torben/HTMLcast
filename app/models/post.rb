class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  acts_as_taggable

  def content
    super.html_safe
  end
end
