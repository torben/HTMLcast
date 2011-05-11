class Page < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  has_ancestry :cache_depth => true

  attr_accessible :title, :content, :published_at, :user_id, :ancestry, :parent_id

  def to_param
    [id, title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-')].join("-")
  end
end
