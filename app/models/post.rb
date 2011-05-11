class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  has_many :comments, :as => :commentable

  before_create :set_permalink

  acts_as_taggable

  def content
    super.html_safe
  end

  def to_param
    [id, permalink].join('-')
  end

  protected

  def set_permalink
    self.permalink = title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-') if title
  end
end
