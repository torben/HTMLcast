class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  def content
    super.html_safe
  end
end
