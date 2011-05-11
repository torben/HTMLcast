require 'uri'
module ApplicationHelper
  def avatar_url(email)
    #default_url = "#{root_url}images/guest.png" ##{CGI.escape(default_url)}
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=mm"
  end
end
