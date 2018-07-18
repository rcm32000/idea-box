class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def current_user?
    current_user.default?
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
