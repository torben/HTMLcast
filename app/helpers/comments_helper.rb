module CommentsHelper
  def comments_url_for(comment)
    eval("#{comment.commentable.class.to_s.downcase}_comments_url(comment.commentable)")
  end

  def new_comments_url_for(comment, options = {})
    eval("new_#{comment.commentable.class.to_s.downcase}_comment_url(comment.commentable, options)")
  end

  def destroy_comments_url_for(comment, options = {})
    eval("#{comment.commentable.class.to_s.downcase}_comment_url(comment.commentable, comment, options)")
  end

  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), :class => "nested_comments")
    end.join.html_safe
  end
end
