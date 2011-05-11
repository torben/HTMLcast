class Category < ActiveRecord::Base
  has_many :posts
  has_ancestry

  def to_param
    [id, title.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-')].join("-")
  end
end
