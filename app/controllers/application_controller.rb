class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorized

  def current_user
    session[:name]
  end

  def logged_in?
    !!session[:name]
  end
  helper_method :logged_in?

  def authorized
    redirect_to login_path unless logged_in?
  end

end
