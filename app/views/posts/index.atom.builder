atom_feed do |feed|
  feed.title t(:'post.feed_title')
  
  if @posts.nil?
    feed.updated @posts.first.updated_at 
  end

  for post in @posts
    feed.entry(post) do |entry|
      entry.title post.title
      entry.content(strip_tags post.content.html_safe)
    end
  end
end