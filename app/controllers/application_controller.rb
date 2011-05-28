class ApplicationController < ActionController::Base
  before_filter :set_locale, :set_tags
  before_filter :set_pages
  before_filter :set_categories

  protect_from_forgery

  def set_locale
    I18n.locale = params[:locale]
  end

  def default_locale?
    I18n.locale == I18n.default_locale
  end

  def default_url_options
    { :locale => default_locale? ? nil : I18n.locale }
  end

  def set_tags
    @tags = Post.tag_counts_on(:tags)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  def set_pages
    @pages = Page.arrange
  end

  def set_categories
    @main_categories = Category.arrange
  end
end