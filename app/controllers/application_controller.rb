class ApplicationController < ActionController::Base
  before_filter :set_locale

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

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
end
